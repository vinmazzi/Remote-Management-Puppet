require 'spec_helper'
require 'puppet/pops'
require 'puppet_spec/compiler'
require 'puppet/pops/types/ruby_generator'

def root_binding
  return binding
end

module Puppet::Pops
module Types
describe 'Puppet Ruby Generator' do
  include PuppetSpec::Compiler

  let!(:parser) { TypeParser.singleton }
  let(:generator) { RubyGenerator.new }

  context 'when generating from Object types' do
    def source
      <<-CODE
        type MyModule::FirstGenerated = Object[{
          attributes => {
            name => String,
            age  => { type => Integer, value => 30 },
            what => { type => String, value => 'what is this', kind => constant }
          }
        }]
        type MyModule::SecondGenerated = Object[{
          parent => MyModule::FirstGenerated,
          attributes => {
            address => String,
            zipcode => String,
            email => String,
            another => { type => Optional[MyModule::FirstGenerated], value => undef },
            number => Integer
          }
        }]
      CODE
    end

    context 'when generating anonymous classes' do

      scope = nil

      let(:first_type) { parser.parse('MyModule::FirstGenerated', scope) }
      let(:second_type) { parser.parse('MyModule::SecondGenerated', scope) }
      let(:first) { generator.create_class(first_type) }
      let(:second) { generator.create_class(second_type) }

      before(:each) do
        eval_and_collect_notices(source) do |topscope, catalog|
          scope = topscope
        end
      end

      after(:each) { typeset = nil }

      context 'the generated class' do
        it 'inherits the PuppetObject module' do
          expect(first < PuppetObject).to be_truthy
        end

        it 'is the superclass of a generated subclass' do
          expect(second < first).to be_truthy
        end
      end

      context 'the #create class method' do
        it 'has an arity that reflects optional arguments' do
          expect(first.method(:create).arity).to eql(-2)
          expect(second.method(:create).arity).to eql(-6)
        end

        it 'creates an instance of the class' do
          inst = first.create('Bob Builder', 52)
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'will perform type assertion of the arguments' do
          expect { first.create('Bob Builder', '52') }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got String')
          )
        end

        it 'will not accept nil as given value for an optional parameter that does not accept nil' do
          expect { first.create('Bob Builder', nil) }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got Undef')
          )
        end

        it 'reorders parameters to but the optional parameters last' do
          inst = second.create('Bob Builder', '42 Cool Street', '12345', 'bob@example.com', 23)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.address).to eq('42 Cool Street')
          expect(inst.zipcode).to eq('12345')
          expect(inst.email).to eq('bob@example.com')
          expect(inst.number).to eq(23)
          expect(inst.what).to eql('what is this')
          expect(inst.age).to eql(30)
          expect(inst.another).to be_nil
        end
      end

      context 'the #from_hash class method' do
        it 'has an arity of one' do
          expect(first.method(:from_hash).arity).to eql(1)
          expect(second.method(:from_hash).arity).to eql(1)
        end

        it 'creates an instance of the class' do
          inst = first.from_hash('name' => 'Bob Builder', 'age' => 52)
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'accepts an initializer where optional keys are missing' do
          inst = first.from_hash('name' => 'Bob Builder')
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(30)
        end

        it 'does not accept an initializer where optional values are nil and type does not accept nil' do
          expect { first.from_hash('name' => 'Bob Builder', 'age' => nil) }.to(
            raise_error(TypeAssertionError,
              "MyModule::FirstGenerated initializer has wrong type, entry 'age' expects an Integer value, got Undef")
          )
        end
      end

      context 'creates an instance' do
        it 'that the TypeCalculator infers to the Object type' do
          expect(TypeCalculator.infer(first.from_hash('name' => 'Bob Builder'))).to eq(first_type)
        end
      end
    end

    context 'when generating static code' do
      module_def = nil

      before(:each) do
        # Ideally, this would be in a before(:all) but that is impossible since lots of Puppet
        # environment specific settings are configured by the spec_helper in before(:each)
        if module_def.nil?
          first_type = nil
          second_type = nil
          eval_and_collect_notices(source) do |scope, catalog|
            first_type = parser.parse('MyModule::FirstGenerated', scope)
            second_type = parser.parse('MyModule::SecondGenerated', scope)

            loader = Loaders.find_loader(nil)
            Loaders.implementation_registry.register_type_mapping(
              PRuntimeType.new(:ruby, [/^PuppetSpec::RubyGenerator::(\w+)$/, 'MyModule::\1']),
              [/^MyModule::(\w+)$/, 'PuppetSpec::RubyGenerator::\1'], loader)

            module_def = generator.module_definition([first_type, second_type], 'Generated stuff')
          end
          Loaders.clear
          Puppet[:code] = nil

          # Create the actual classes in the PuppetSpec::RubyGenerator module
          Puppet.override(:loaders => Puppet::Pops::Loaders.new(Puppet::Node::Environment.create(:testing, []))) do
            eval(module_def, root_binding)
          end
        end
      end

      after(:all) do
        # Don't want generated module to leak outside this test
        PuppetSpec.send(:remove_const, :RubyGenerator)
      end

      it 'the #_ptype class method returns a resolved Type' do
        first_type = PuppetSpec::RubyGenerator::FirstGenerated._ptype
        expect(first_type).to be_a(PObjectType)
        second_type = PuppetSpec::RubyGenerator::SecondGenerated._ptype
        expect(second_type).to be_a(PObjectType)
        expect(second_type.parent).to eql(first_type)
      end

      it 'the #_plocation class method returns a file URI' do
        loc = PuppetSpec::RubyGenerator::SecondGenerated._plocation
        expect(loc).to be_a(URI)
        expect(loc.to_s).to match(/^file:\/.*ruby_generator_spec.rb\?line=\d+$/)
      end

      context 'the #create class method' do
        it 'has an arity that reflects optional arguments' do
          expect(PuppetSpec::RubyGenerator::FirstGenerated.method(:create).arity).to eql(-2)
          expect(PuppetSpec::RubyGenerator::SecondGenerated.method(:create).arity).to eql(-6)
        end

        it 'creates an instance of the class' do
          inst = PuppetSpec::RubyGenerator::FirstGenerated.create('Bob Builder', 52)
          expect(inst).to be_a(PuppetSpec::RubyGenerator::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'will perform type assertion of the arguments' do
          expect { PuppetSpec::RubyGenerator::FirstGenerated.create('Bob Builder', '52') }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got String')
          )
        end

        it 'will not accept nil as given value for an optional parameter that does not accept nil' do
          expect { PuppetSpec::RubyGenerator::FirstGenerated.create('Bob Builder', nil) }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got Undef')
          )
        end

        it 'reorders parameters to but the optional parameters last' do
          inst = PuppetSpec::RubyGenerator::SecondGenerated.create('Bob Builder', '42 Cool Street', '12345', 'bob@example.com', 23)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.address).to eq('42 Cool Street')
          expect(inst.zipcode).to eq('12345')
          expect(inst.email).to eq('bob@example.com')
          expect(inst.number).to eq(23)
          expect(inst.what).to eql('what is this')
          expect(inst.age).to eql(30)
          expect(inst.another).to be_nil
        end
      end

      context 'the #from_hash class method' do
        it 'has an arity of one' do
          expect(PuppetSpec::RubyGenerator::FirstGenerated.method(:from_hash).arity).to eql(1)
          expect(PuppetSpec::RubyGenerator::SecondGenerated.method(:from_hash).arity).to eql(1)
        end

        it 'creates an instance of the class' do
          inst = PuppetSpec::RubyGenerator::FirstGenerated.from_hash('name' => 'Bob Builder', 'age' => 52)
          expect(inst).to be_a(PuppetSpec::RubyGenerator::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'accepts an initializer where optional keys are missing' do
          inst = PuppetSpec::RubyGenerator::FirstGenerated.from_hash('name' => 'Bob Builder')
          expect(inst).to be_a(PuppetSpec::RubyGenerator::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(30)
        end

        it 'does not accept an initializer where optional values are nil and type does not accept nil' do
          expect { PuppetSpec::RubyGenerator::FirstGenerated.from_hash('name' => 'Bob Builder', 'age' => nil) }.to(
            raise_error(TypeAssertionError,
              "MyModule::FirstGenerated initializer has wrong type, entry 'age' expects an Integer value, got Undef")
          )
        end
      end
    end
  end

  context 'when generating from TypeSets' do
    def source
      <<-CODE
        type MyModule = TypeSet[{
          pcore_version => '1.0.0',
          version => '1.0.0',
          types   => {
            MyInteger => Integer,
            FirstGenerated => Object[{
              attributes => {
                name => String,
                age  => { type => Integer, value => 30 },
                what => { type => String, value => 'what is this', kind => constant }
              }
            }],
            SecondGenerated => Object[{
              parent => FirstGenerated,
              attributes => {
                address => String,
                zipcode => String,
                email => String,
                another => { type => Optional[FirstGenerated], value => undef },
                number => MyInteger
              }
            }]
          },
        }]

        type OtherModule = TypeSet[{
          pcore_version => '1.0.0',
          version => '1.0.0',
          types   => {
            MyFloat => Float,
            ThirdGenerated => Object[{
              attributes => {
                first => My::FirstGenerated
              }
            }],
            FourthGenerated => Object[{
              parent => My::SecondGenerated,
              attributes => {
                complex => { type => Optional[ThirdGenerated], value => undef },
                n1 => My::MyInteger,
                n2 => MyFloat
              }
            }]
          },
          references => {
            My => { name => 'MyModule', version_range => '1.x' }
          }
        }]
      CODE
    end

    context 'when generating anonymous classes' do

      typeset = nil

      let(:first_type) { typeset['My::FirstGenerated'] }
      let(:second_type) { typeset['My::SecondGenerated'] }
      let(:third_type) { typeset['ThirdGenerated'] }
      let(:fourth_type) { typeset['FourthGenerated'] }
      let(:first) { generator.create_class(first_type) }
      let(:second) { generator.create_class(second_type) }
      let(:third) { generator.create_class(third_type) }
      let(:fourth) { generator.create_class(fourth_type) }

      before(:each) do
        eval_and_collect_notices(source) do |scope, catalog|
          typeset = parser.parse('OtherModule', scope)
        end
      end

      after(:each) { typeset = nil }

      context 'the typeset' do
        it 'produces expected string representation' do
          typeset.to_s == "TypeSet[{"+
            "pcore_version => '1.0.0', "+
            "name_authority => 'http://puppet.com/2016.1/runtime', "+
            "name => 'OtherModule', "+
            "version => '1.0.0', "+
            "types => {"+
            "MyFloat => Float, "+
            "ThirdGenerated => Object[{"+
            "attributes => {"+
            "'first' => MyModule::FirstGenerated}}], "+
            "FourthGenerated => Object[{"+
            "parent => MyModule::SecondGenerated, "+
            "attributes => {"+
            "'complex' => {"+
            "type => Optional[ThirdGenerated], "+
            "value => ?}, "+
            "'n1' => MyModule::MyInteger, "+
            "'n2' => MyFloat}}]}, "+
            "references => [{"+
            "'name' => 'MyModule', "+
            "'alias' => 'My', "+
            "'version_range' => '1.x'}]}]"
        end
      end

      context 'the generated class' do
        it 'inherits the PuppetObject module' do
          expect(first < PuppetObject).to be_truthy
        end

        it 'is the superclass of a generated subclass' do
          expect(second < first).to be_truthy
        end
      end

      context 'the #create class method' do
        it 'has an arity that reflects optional arguments' do
          expect(first.method(:create).arity).to eql(-2)
          expect(second.method(:create).arity).to eql(-6)
          expect(third.method(:create).arity).to eql(1)
          expect(fourth.method(:create).arity).to eql(-8)
        end

        it 'creates an instance of the class' do
          inst = first.create('Bob Builder', 52)
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'will perform type assertion of the arguments' do
          expect { first.create('Bob Builder', '52') }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got String')
          )
        end

        it 'will not accept nil as given value for an optional parameter that does not accept nil' do
          expect { first.create('Bob Builder', nil) }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got Undef')
          )
        end

        it 'reorders parameters to but the optional parameters last' do
          inst = second.create('Bob Builder', '42 Cool Street', '12345', 'bob@example.com', 23)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.address).to eq('42 Cool Street')
          expect(inst.zipcode).to eq('12345')
          expect(inst.email).to eq('bob@example.com')
          expect(inst.number).to eq(23)
          expect(inst.what).to eql('what is this')
          expect(inst.age).to eql(30)
          expect(inst.another).to be_nil
        end
      end

      context 'the #from_hash class method' do
        it 'has an arity of one' do
          expect(first.method(:from_hash).arity).to eql(1)
          expect(second.method(:from_hash).arity).to eql(1)
        end

        it 'creates an instance of the class' do
          inst = first.from_hash('name' => 'Bob Builder', 'age' => 52)
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'accepts an initializer where optional keys are missing' do
          inst = first.from_hash('name' => 'Bob Builder')
          expect(inst).to be_a(first)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(30)
        end

        it 'does not accept an initializer where optional values are nil and type does not accept nil' do
          expect { first.from_hash('name' => 'Bob Builder', 'age' => nil) }.to(
            raise_error(TypeAssertionError,
              "MyModule::FirstGenerated initializer has wrong type, entry 'age' expects an Integer value, got Undef")
          )
        end
      end

      context 'creates an instance' do
        it 'that the TypeCalculator infers to the Object type' do
          expect(TypeCalculator.infer(first.from_hash('name' => 'Bob Builder'))).to eq(first_type)
        end
      end
    end

    context 'when generating static code' do
      module_def = nil
      module_def2 = nil

      before(:each) do
        # Ideally, this would be in a before(:all) but that is impossible since lots of Puppet
        # environment specific settings are configured by the spec_helper in before(:each)
        if module_def.nil?
          typeset = nil
          eval_and_collect_notices(source) do |scope, catalog|
            typeset1 = parser.parse('MyModule', scope)
            typeset2 = parser.parse('OtherModule', scope)

            loader = Loaders.find_loader(nil)
            Loaders.implementation_registry.register_type_mapping(
              PRuntimeType.new(:ruby, [/^PuppetSpec::RubyGenerator::My::(\w+)$/, 'MyModule::\1']),
              [/^MyModule::(\w+)$/, 'PuppetSpec::RubyGenerator::My::\1'], loader)

            Loaders.implementation_registry.register_type_mapping(
              PRuntimeType.new(:ruby, [/^PuppetSpec::RubyGenerator::Other::(\w+)$/, 'OtherModule::\1']),
              [/^OtherModule::(\w+)$/, 'PuppetSpec::RubyGenerator::Other::\1'], loader)

            module_def = generator.module_definition_from_typeset(typeset1)
            module_def2 = generator.module_definition_from_typeset(typeset2)
          end
          Loaders.clear
          Puppet[:code] = nil

          # Create the actual classes in the PuppetSpec::RubyGenerator module
          Puppet.override(:loaders => Puppet::Pops::Loaders.new(Puppet::Node::Environment.create(:testing, []))) do
            eval(module_def, root_binding)
            eval(module_def2, root_binding)
          end
        end
      end

      after(:all) do
        # Don't want generated module to leak outside this test
        PuppetSpec.send(:remove_const, :RubyGenerator)
      end

      it 'the #_ptype class method returns a resolved Type' do
        first_type = PuppetSpec::RubyGenerator::My::FirstGenerated._ptype
        expect(first_type).to be_a(PObjectType)
        second_type = PuppetSpec::RubyGenerator::My::SecondGenerated._ptype
        expect(second_type).to be_a(PObjectType)
        expect(second_type.parent).to eql(first_type)
      end

      it 'the #_plocation class method returns a file URI' do
        loc = PuppetSpec::RubyGenerator::My::SecondGenerated._plocation
        expect(loc).to be_a(URI)
        expect(loc.to_s).to match(/^file:\/.*ruby_generator_spec.rb\?line=\d+$/)
      end

      context 'the #create class method' do
        it 'has an arity that reflects optional arguments' do
          expect(PuppetSpec::RubyGenerator::My::FirstGenerated.method(:create).arity).to eql(-2)
          expect(PuppetSpec::RubyGenerator::My::SecondGenerated.method(:create).arity).to eql(-6)
        end

        it 'creates an instance of the class' do
          inst = PuppetSpec::RubyGenerator::My::FirstGenerated.create('Bob Builder', 52)
          expect(inst).to be_a(PuppetSpec::RubyGenerator::My::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'will perform type assertion of the arguments' do
          expect { PuppetSpec::RubyGenerator::My::FirstGenerated.create('Bob Builder', '52') }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got String')
          )
        end

        it 'will not accept nil as given value for an optional parameter that does not accept nil' do
          expect { PuppetSpec::RubyGenerator::My::FirstGenerated.create('Bob Builder', nil) }.to(
            raise_error(TypeAssertionError,
              'MyModule::FirstGenerated[age] has wrong type, expects an Integer value, got Undef')
          )
        end

        it 'reorders parameters to but the optional parameters last' do
          inst = PuppetSpec::RubyGenerator::My::SecondGenerated.create('Bob Builder', '42 Cool Street', '12345', 'bob@example.com', 23)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.address).to eq('42 Cool Street')
          expect(inst.zipcode).to eq('12345')
          expect(inst.email).to eq('bob@example.com')
          expect(inst.number).to eq(23)
          expect(inst.what).to eql('what is this')
          expect(inst.age).to eql(30)
          expect(inst.another).to be_nil
        end
      end

      context 'the #from_hash class method' do
        it 'has an arity of one' do
          expect(PuppetSpec::RubyGenerator::My::FirstGenerated.method(:from_hash).arity).to eql(1)
          expect(PuppetSpec::RubyGenerator::My::SecondGenerated.method(:from_hash).arity).to eql(1)
        end

        it 'creates an instance of the class' do
          inst = PuppetSpec::RubyGenerator::My::FirstGenerated.from_hash('name' => 'Bob Builder', 'age' => 52)
          expect(inst).to be_a(PuppetSpec::RubyGenerator::My::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(52)
        end

        it 'accepts an initializer where optional keys are missing' do
          inst = PuppetSpec::RubyGenerator::My::FirstGenerated.from_hash('name' => 'Bob Builder')
          expect(inst).to be_a(PuppetSpec::RubyGenerator::My::FirstGenerated)
          expect(inst.name).to eq('Bob Builder')
          expect(inst.age).to eq(30)
        end

        it 'does not accept an initializer where optional values are nil and type does not accept nil' do
          expect { PuppetSpec::RubyGenerator::My::FirstGenerated.from_hash('name' => 'Bob Builder', 'age' => nil) }.to(
            raise_error(TypeAssertionError,
              "MyModule::FirstGenerated initializer has wrong type, entry 'age' expects an Integer value, got Undef")
          )
        end
      end
    end
  end
end
end
end
