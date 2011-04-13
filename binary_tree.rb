class BinaryTree
	attr_reader :root
	def initialize
    @offenders = Array.new
		@root = Node.new(nil, nil)
	end

	def populate(array_of_values)
		if @root.value == nil
			@root = Node.new(array_of_values.shift, nil)
		end

		(0...array_length).each do |array_index|
			insert(array_of_values.value_at(array_index))
		end
	end

	def insert(new_node_value)
    if @root.value.nil?
      @root = Node.new(new_node_value, nil)
    else
      find_parent_node(new_node_value, @root)
    end
  end

  def contains?(node_value)
    node = search(node_value, @root)
    !node.nil?
  end

  def print(node)
    if !node.value.nil?
      puts node.value
      print(node.right_child)
      print(node.left_child)
    end
  end

  def delete(node_value)
    if contains?(node_value)
      node = search(node_value, @root)
      if node.weight > 1
        node.weight -= 1
      else
        merge_trees(node)
      end
    end
  end

  def delete_offender(node_value)
    node = search(node_value, @root)
    merge_trees(node)
  end

  def remove_offenders
    find_offenders(@root)
    @offenders.each do |offender|
      delete_offender(offender)
    end
  end

  def find_offenders(node)
    if !node.value.nil?
      @offenders << node.value if node.weight >= 3
      find_offenders(node.left_child)
      find_offenders(node.right_child)
    end
  end

  def insert_tree(node_of_existing_tree)
    if !node_of_existing_tree.value.nil?
      insert(node_of_existing_tree.value)
      insert_tree(node_of_existing_tree.left_child)
      insert_tree(node_of_existing_tree.right_child)
    end
  end


  def search(value, current_node)
    return nil if current_node.value.nil?
    if value < current_node.value
      search(value, current_node.left_child) 
    elsif value > current_node.value
      search(value, current_node.right_child)
    else
      return current_node
    end
  end

private

  def merge_trees(node)
    @root = Node.new(nil, nil) if node == @root
    node.value = nil
    insert_tree(node.right_child)
    insert_tree(node.left_child)
  end

	def find_parent_node(child_node_value, potential_parent_node)
    if child_node_value > potential_parent_node.value
      if potential_parent_node.right_child.value.nil?
        potential_parent_node.right_child = Node.new(child_node_value, potential_parent_node)
      else
        find_parent_node(child_node_value, potential_parent_node.right_child)
      end
    elsif child_node_value < potential_parent_node.value
      if potential_parent_node.left_child.value.nil?
        potential_parent_node.left_child = Node.new(child_node_value, potential_parent_node)
      else
        find_parent_node(child_node_value, potential_parent_node.left_child)
      end
    else
      potential_parent_node.weight += 1
    end
  end
end

class Node
	  attr_accessor :value, :weight, :parent, :left_child, :right_child
	def initialize(value, parent_node)
		@value = value
    @weight = 1
    @parent = parent_node
		if @value != nil
			@left_child = Node.new(nil, self)
			@right_child = Node.new(nil, self)
			@children = [@left_child, @right_child]
		end
	end

end
