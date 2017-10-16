# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks the arguments passed to `before`, `around`, and `after`.
      #
      # This cop checks for consistent style when specifying RSpec
      # hooks which run for each example. There are three supported
      # styles: "implicit", "each", and "example." All styles have
      # the same behavior.
      #
      # @example when configuration is `EnforcedStyle: implicit`
      #   # bad
      #   before(:each) do
      #     ...
      #   end
      #
      #   # bad
      #   before(:example) do
      #     ...
      #   end
      #
      #   # good
      #   before do
      #     ...
      #   end
      #
      # @example when configuration is `EnforcedStyle: each`
      #   # bad
      #   before(:example) do
      #     ...
      #   end
      #
      #   # good
      #   before do
      #     ...
      #   end
      #
      #   # good
      #   before(:each) do
      #     ...
      #   end
      #
      # @example when configuration is `EnforcedStyle: example`
      #   # bad
      #   before(:each) do
      #     ...
      #   end
      #
      #   # bad
      #   before do
      #     ...
      #   end
      #
      #   # good
      #   before(:example) do
      #     ...
      #   end
      class HookArgument < RuboCop::Cop::Cop
        include RuboCop::RSpec::Language,
                RuboCop::RSpec::SpecOnly,
                ConfigurableEnforcedStyle

        IMPLICIT_MSG = 'Omit the default `%p` argument for RSpec hooks.'.freeze
        EXPLICIT_MSG = 'Use `%p` for RSpec hooks.'.freeze

        HOOKS = "{#{Hooks::ALL.to_node_pattern}}".freeze

        def_node_matcher :scoped_hook, <<-PATTERN
        (block $(send nil #{HOOKS} (sym ${:each :example})) ...)
        PATTERN

        def_node_matcher :unscoped_hook, "(block $(send nil #{HOOKS}) ...)"

        def on_block(node)
          hook(node) do |method_send, scope_name|
            return correct_style_detected if scope_name.equal?(style)
            return check_implicit(method_send) unless scope_name

            style_detected(scope_name)
            add_offense(method_send, :expression, explicit_message(scope_name))
          end
        end

        def autocorrect(node)
          scope = "(#{style.inspect})" unless implicit_style?
          hook  = "#{node.method_name}#{scope}"

          lambda do |corrector|
            corrector.replace(node.loc.expression, hook)
          end
        end

        private

        def check_implicit(method_send)
          style_detected(:implicit)
          return if implicit_style?

          add_offense(method_send, :selector, format(EXPLICIT_MSG, style))
        end

        def explicit_message(scope)
          if implicit_style?
            format(IMPLICIT_MSG, scope)
          else
            format(EXPLICIT_MSG, style)
          end
        end

        def implicit_style?
          style.equal?(:implicit)
        end

        def hook(node, &block)
          scoped_hook(node, &block) || unscoped_hook(node, &block)
        end
      end
    end
  end
end
