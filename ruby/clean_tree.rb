class Tree
	attr_accessor :children, :node_name, :level

	def initialize(name, children={}, level=0)
		@node_name = name
		@level = level
		@children = build_children(children)
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block }
	end

	def visit(&block)
		block.call self
	end

	def build_children(initial)
		initial.map { |(k, v)| Tree.new(k, v, @level + 1) }
	end
end

ruby_tree = Tree.new(:root, {
	:grandpa => {
		:dad => {
			:child1 => {},
			:child2 => {}
		},
		:uncle => {
			:child3 => {},
			:child4 => {}
		}
	}
})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name }
puts

puts 'visiting entire tree'
ruby_tree.visit_all {|node| puts("  " * node.level + node.node_name.to_s) }

