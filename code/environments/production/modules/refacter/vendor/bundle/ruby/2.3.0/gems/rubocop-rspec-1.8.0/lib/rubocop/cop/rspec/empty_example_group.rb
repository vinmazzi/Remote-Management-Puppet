# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks if an example group does not include any tests.
      #
      # This cop is configurable using the `CustomIncludeMethods` option
      #
      # @example usage
      #
      #   # bad
      #   describe Bacon do
      #     let(:bacon)      { Bacon.new(chunkiness) }
      #     let(:chunkiness) { false                 }
      #
      #     context 'extra chunky' do   # flagged by rubocop
      #       let(:chunkiness) { true }
      #     end
      #
      #     it 'is chunky' do
      #       expect(bacon.chunky?).to be_truthy
      #     end
      #   end
      #
      #   # good
      #   describe Bacon do
      #     let(:bacon)      { Bacon.new(chunkiness) }
      #     let(:chunkiness) { false                 }
      #
      #     it 'is chunky' do
      #       expect(bacon.chunky?).to be_truthy
      #     end
      #   end
      #
      # @example configuration
      #
      #   # .rubocop.yml
      #   RSpec/EmptyExampleGroup:
      #     CustomIncludeMethods:
      #     - include_tests
      #
      #   # spec_helper.rb
      #   RSpec.configure do |config|
      #     config.alias_it_behaves_like_to(:include_tests)
      #   end
      #
      #   # bacon_spec.rb
      #   describe Bacon do
      #     let(:bacon)      { Bacon.new(chunkiness) }
      #     let(:chunkiness) { false                 }
      #
      #     context 'extra chunky' do   # not flagged by rubocop
      #       let(:chunkiness) { true }
      #
      #       include_tests 'shared tests'
      #     end
      #   end
      #
      class EmptyExampleGroup < Cop
        include RuboCop::RSpec::SpecOnly,
                RuboCop::RSpec::Language,
                RuboCop::RSpec::Language::NodePattern

        MSG = 'Empty example group detected.'.freeze

        def_node_search :contains_example?, <<-PATTERN
          {
            (send _ {
              #{Examples::ALL.to_node_pattern}
              :it_behaves_like
              :it_should_behave_like
              :include_context
              :include_examples
            } ...)
            (send _ #custom_include? ...)
          }
        PATTERN

        def on_block(node)
          return unless example_group?(node) && !contains_example?(node)

          add_offense(node.children.first, :expression)
        end

        private

        def custom_include?(method_name)
          custom_include_methods.include?(method_name)
        end

        def custom_include_methods
          cop_config
            .fetch('CustomIncludeMethods', [])
            .map(&:to_sym)
        end
      end
    end
  end
end
