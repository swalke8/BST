require 'binary_tree'

describe BinaryTree do
	before(:each) do
		@tree = BinaryTree.new
	end

	it "should create an empty binary tree" do
		@tree.root.value.should == nil
	end

	it "should insert a new Node, which becomes the root node and has a value of 1" do
		@tree.insert(1)
		@tree.root.value.should == 1
	end

	it "should create a root with a right child node of value 3" do
		@tree.insert(1)
		@tree.insert(3)
		@tree.root.right_child.value.should == 3
	end

  it "should add to a node's weight" do
      @tree.insert(1)
      @tree.root.weight.should == 1
      @tree.insert(1)
      @tree.root.weight.should == 2
  end

 end
