# frozen_string_literal: true

RSpec.describe RuboCop::RSpec::SpecOnly do
  subject(:cop) { fake_cop.new(config) }

  let(:config) do
    rubocop_config =
      {
        'AllCops' => {
          'RSpec' => {
            'Patterns' => rspec_patterns
          }
        },
        'RSpec/FakeCop' => {
          'Exclude' => %w(bar_spec.rb)
        }
      }

    RuboCop::Config.new(rubocop_config, 'fake_cop_config.yml')
  end

  let(:fake_cop) do
    Class.new(RuboCop::Cop::Cop) do
      include RuboCop::RSpec::SpecOnly

      def self.name
        'RuboCop::RSpec::FakeCop'
      end

      def on_send(node)
        add_offense(node, :expression, 'I flag everything')
      end
    end
  end

  let(:rspec_patterns) { ['_spec.rb$', '(?:^|/)spec/'] }

  context 'when the source path ends with `_spec.rb`' do
    it 'registers an offense' do
      expect_violation(<<-RUBY, filename: 'foo_spec.rb')
        foo(1)
        ^^^^^^ I flag everything
      RUBY
    end

    it 'ignores the file if it is ignored' do
      expect_no_violations(<<-RUBY, filename: 'bar_spec.rb')
        foo(1)
      RUBY
    end
  end

  context 'when the source path contains `/spec/`' do
    it 'registers an offense' do
      expect_violation(<<-RUBY, filename: '/spec/support/thing.rb')
        foo(1)
        ^^^^^^ I flag everything
      RUBY
    end
  end

  context 'when the source path starts with `spec/`' do
    it 'registers an offense' do
      expect_violation(<<-RUBY, filename: 'spec/support/thing.rb')
        foo(1)
        ^^^^^^ I flag everything
      RUBY
    end
  end

  context 'when the file is a source file without "spec" in the name' do
    it 'ignores the source when the path is not a spec file' do
      expect_no_violations(<<-RUBY, filename: 'foo.rb')
        foo(1)
      RUBY
    end

    it 'ignores the source when the path is not a specified pattern' do
      expect_no_violations(<<-RUBY, filename: 'foo_test.rb')
        foo(1)
      RUBY
    end
  end

  context 'when custom patterns are specified' do
    let(:rspec_patterns) do
      ['_test\.rb$']
    end

    it 'registers offenses when the path matches a custom specified pattern' do
      expect_violation(<<-RUBY, filename: 'foo_test.rb')
        foo(1)
        ^^^^^^ I flag everything
      RUBY
    end
  end
end
