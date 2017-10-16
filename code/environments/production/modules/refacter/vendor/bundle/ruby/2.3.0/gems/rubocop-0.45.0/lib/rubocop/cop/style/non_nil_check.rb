# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for non-nil checks, which are usually redundant.
      #
      # @example
      #
      #  # bad
      #  if x != nil
      #
      #  # good (when not allowing semantic changes)
      #  # bad (when allowing semantic changes)
      #  if !x.nil?
      #
      #  # good (when allowing semantic changes)
      #  if x
      #
      # Non-nil checks are allowed if they are the final nodes of predicate.
      #
      #  # good
      #  def signed_in?
      #    !current_user.nil?
      #  end
      class NonNilCheck < Cop
        include OnMethodDef
        include IfNode

        NIL_NODE = s(:nil)

        def on_send(node)
          return if ignored_node?(node)
          receiver, method, args = *node

          if not_equal_to_nil?(method, args)
            add_offense(node, :selector)
          elsif include_semantic_changes? &&
                (not_and_nil_check?(method, receiver) ||
                 unless_and_nil_check?(node, method))
            add_offense(node, :expression)
          end
        end

        private

        def not_equal_to_nil?(method, args)
          method == :!= && args == NIL_NODE
        end

        def not_and_nil_check?(method, receiver)
          method == :! && nil_check?(receiver)
        end

        def unless_and_nil_check?(send_node, method)
          return unless method == :nil?

          parent = send_node.parent
          parent && parent.if_type? && !ternary?(parent) &&
            parent.loc.keyword.is?('unless')
        end

        def message(node)
          _receiver, method, _args = *node
          if method == :!=
            'Prefer `!expression.nil?` over `expression != nil`.'
          else
            'Explicit non-nil checks are usually redundant.'
          end
        end

        def include_semantic_changes?
          cop_config['IncludeSemanticChanges']
        end

        def on_method_def(_node, name, _args, body)
          # only predicate methods are handled differently
          return unless name.to_s.end_with?('?') && body

          if body.begin_type?
            ignore_node(body.children.last)
          else
            ignore_node(body)
          end
        end

        def nil_check?(node)
          return false unless node && node.send_type?

          _receiver, method, *_args = *node
          method == :nil?
        end

        def autocorrect(node)
          receiver, method, _args = *node

          if method == :!=
            autocorrect_comparison(node)
          elsif method == :!
            autocorrect_non_nil(node, receiver)
          elsif method == :nil?
            autocorrect_unless_nil(node, receiver)
          end
        end

        def autocorrect_comparison(node)
          expr = node.source

          new_code =
            if include_semantic_changes?
              expr.sub(/\s*!=\s*nil/, '')
            else
              expr.sub(/^(\S*)\s*!=\s*nil/, '!\1.nil?')
            end

          return if expr == new_code

          lambda do |corrector|
            corrector.replace(node.source_range, new_code)
          end
        end

        def autocorrect_non_nil(node, inner_node)
          lambda do |corrector|
            receiver, _method, _args = *inner_node
            if receiver
              corrector.replace(node.source_range, receiver.source)
            else
              corrector.replace(node.source_range, 'self')
            end
          end
        end

        def autocorrect_unless_nil(node, receiver)
          lambda do |corrector|
            corrector.replace(node.parent.loc.keyword, 'if')
            corrector.replace(node.source_range, receiver.source)
          end
        end
      end
    end
  end
end
