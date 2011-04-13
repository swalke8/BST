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

  it "should check to see if a node exists" do
    @tree.contains?(1).should == false
    @tree.insert(1)
    @tree.contains?(1).should == true
  end

  it "should have a parent" do
    @tree.insert(1)
    @tree.insert(2)
    @tree.root.right_child.parent.should == @tree.root
  end

  it "should delete a node" do
    @tree.insert(7)
    @tree.insert(8)
    @tree.insert(5)
    @tree.insert(6)
    @tree.insert(2)
    @tree.delete(5)
    @tree.contains?(2).should == true
    @tree.contains?(6).should == true
    @tree.contains?(5).should == false
    @tree.insert(2)
    @tree.search(2, @tree.root).weight.should == 2
    @tree.delete(2)
    @tree.search(2, @tree.root).weight.should == 1
    @tree.delete(7)
    @tree.contains?(8).should == true
  end

  it "should find nodes with a weight of 3 or more and delete them" do
    @tree.insert(5)
    @tree.insert(2)
    @tree.insert(7)
    @tree.insert(7)
    @tree.insert(7)
    @tree.remove_offenders
    @tree.contains?(7).should == false
    @tree.contains?(5).should == true
    @tree.contains?(2).should == true
  end
end
