class BinaryTree
	attr_reader :root
	def initialize
		@root = Node.new(nil)
	end

	def populate(array_of_values)
		if @root.value == nil
			@root = Node.new(array_of_values.shift)
		end

		(0...array_length).each do |array_index|
			insert(array_of_values.value_at(array_index))
		end
	end

	def insert(node_value)
		new_node = Node.new(node_value)
		if @root.value == nil
			@root = new_node
		else
			find_position(new_node, @root)
		end
	end

  def find(node_value)

  end

private

	def find_position(child_node, potential_parent_node)
		if child_node.value > potential_parent_node.value
			if potential_parent_node.right_child.value == nil
				potential_parent_node.right_child = child_node
			else
				find_position(child_node, potential_parent_node.right_child)
			end
		elsif child_node.value < potential_parent_node.value	
			if potential_parent_node.left_child.value == nil
				potential_parent_node.left_child = child_node
			else
				find_position(child_node, potential_parent_node.left_child)
			end
    else
      potential_parent_node.weight += 1
		end
	end
end

class Node
	attr_reader :value, :left_child, :right_child
  attr_accessor :weight

	def initialize(value)
		@value = value
    @weight = 1
		if @value != nil
			@left_child = Node.new(nil)
			@right_child = Node.new(nil)
			@children = [@left_child, @right_child]
		end
	end

	def right_child=(node)
		@right_child = node
	end

	def left_child=(node)
		@left_child = node
	end
end
