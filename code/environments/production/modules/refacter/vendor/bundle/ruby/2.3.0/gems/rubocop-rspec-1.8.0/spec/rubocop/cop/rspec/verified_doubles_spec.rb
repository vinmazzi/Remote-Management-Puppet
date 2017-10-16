describe RuboCop::Cop::RSpec::VerifiedDoubles, :config do
  subject(:cop) { described_class.new(config) }

  it 'finds a `double` instead of an `instance_double`' do
    expect_violation(<<-RUBY)
      it do
        foo = double("Widget")
              ^^^^^^^^^^^^^^^^ Prefer using verifying doubles over normal doubles.
      end
    RUBY
  end

  context 'when configuration does not specify IgnoreSymbolicNames' do
    let(:cop_config) { Hash.new }

    it 'find doubles whose name is a symbol' do
      expect_violation(<<-RUBY)
        it do
          foo = double(:widget)
                ^^^^^^^^^^^^^^^ Prefer using verifying doubles over normal doubles.
        end
      RUBY
    end

    it 'finds a `spy` instead of an `instance_spy`' do
      expect_violation(<<-RUBY)
        it do
          foo = spy("Widget")
                ^^^^^^^^^^^^^ Prefer using verifying doubles over normal doubles.
        end
      RUBY
    end
  end

  context 'when configured to ignore symbolic names' do
    let(:cop_config) { { 'IgnoreSymbolicNames' => true } }

    it 'ignores doubles whose name is a symbol' do
      expect_no_violations(<<-RUBY)
        it do
          foo = double(:widget)
        end
      RUBY
    end

    it 'still flags doubles whose name is a string' do
      expect_violation(<<-RUBY)
        it do
          foo = double("widget")
                ^^^^^^^^^^^^^^^^ Prefer using verifying doubles over normal doubles.
        end
      RUBY
    end
  end

  it 'ignores doubles without a name' do
    expect_no_violations(<<-RUBY)
      it do
        foo = double
      end
    RUBY
  end

  it 'ignores instance_doubles' do
    expect_no_violations(<<-RUBY)
      it do
        foo = instance_double("Foo")
      end
    RUBY
  end
end
