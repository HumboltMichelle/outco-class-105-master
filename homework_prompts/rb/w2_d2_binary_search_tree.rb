#  Homework - Binary Search Tree
#
#  Problem 1: Node class
#
#  Prompt:    Create a Node class
#             The Node class should contain the following instance variables:
#
#                    value:  integer value
#               left_child:  pointer to another node (initially None)
#              right_child:  pointer to another node (initially None)
#
#                 Example:   sample1 = Node()
#                            sample1.value         // None
#                            sample1.left_child    // None
#                            sample1.right_child   // None
#
#                 Example:   sample2 = Node(1)
#                            sample2.value         // None
#                            sample2.left_child    // None
#                            sample2.right_child   // None
#
#
#  Problem 2: BinarySearchTree class.
#
#  Prompt:    Create a BinarySearchTree class
#
#             The BinarySearchTree class should contain the following instance
#             variables:
#
#                    root:   A pointer to the root node (initially null)
#                    size:   The number of nodes in the BinarySearchTree
#
#             The BinarySearchTree class should also contain the following
#             methods:
#
#                  insert:   A method that takes takes an integer value, and
#                            creates a node with the given input.  The method
#                            will then find the correct place to add the new
#                            node. Values larger than the current node node go
#                            to the right, and smaller values go to the left.
#
#                            Input:     value
#                            Output:    None
#
#                  search:   A method that searches if a value exists with a
#                            exists within the tree and returns true if found.
#
#                            Input:     value
#                            Output:    None
#
#
#             What are the time and auxilliary space complexities of the
#             various methods?
#


class Node
  def initialize(value = nil)
    # YOUR WORK HERE
  end
  # YOUR WORK HERE
end

class BinarySearchTree
  def initialize
    # YOUR WORK HERE
  end


  # Time Complexity:
  # Auxiliary Space Complexity:
  def insert(value)
    # YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def search(value)
    # YOUR WORK HERE
  end

end


############################################################
###############  DO NOT TOUCH TEST BELOW!!!  ###############
############################################################

# custom expect function to handle tests
# List count : keeps track out how many tests pass and how many total
#   in the form of a two item array i.e., [0, 0]
# String name : describes the test
# Function test : performs a set of operations and returns a boolean
#   indicating if test passed
def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  errMsg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    errMsg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if errMsg != nil
    puts'       ' + errMsg + '\n'
  end
end

# code for capturing puts output
require 'stringio'
require 'ostruct'

class Capture

  def self.capture &block

    # redirect output to StringIO objects
    stdout = StringIO.new
    $stdout = stdout

    result = block.call

    # restore normal output
    $stdout = STDOUT

    OpenStruct.new result: result, stdout: stdout.string
  end
end

# code for checking if lists are equal
def arrays_equal(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  for i in 0..arr1.length-1
    if arr1[i] != arr2[i]
      return false
    end
  end
  return true
end

# code for checking if array is sorted (linear runtime)
def is_sorted(input)
  if (input.length < 2)
    return true
  end
  for i in 1..input.length - 1
    if (input[i-1] > input[i])
      return false
    end
  end
  return true
end





puts 'Node Class'
test_count = [0, 0]

def test()
  node = Node.new()
  return node.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  node = Node.new()
  node.instance_variable_defined?(:@value)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has value property', test)

def test()
  node = Node.new()
  node.instance_variable_defined?(:@left_child)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has left_child property', test)

def test()
  node = Node.new()
  node.instance_variable_defined?(:@right_child)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has right_child property', test)

def test()
  node = Node.new()
  return node.instance_variable_defined?(:@value) && node.value == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has default value set to nil', test)

def test()
  node = Node.new(5)
  return node.instance_variable_defined?(:@value) && node.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to assign a value upon instantiation', test)

def test()
  node = Node.new()
  if node.instance_variable_defined?(:@value)
    node.value = 5
  end
  return node.instance_variable_defined?(:@value) && node.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to reassign a value', test)

def test()
  node1 = Node.new(5)
  node2 = Node.new(10)
  if node1.instance_variable_defined?(:@left_child)
    node1.left_child = node2
  end
  return node1.instance_variable_defined?(:@left_child) && node1.left_child.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to point to left child node', test)

def test()
  node1 = Node.new(5)
  node2 = Node.new(10)
  if node1.instance_variable_defined?(:@right_child)
    node1.right_child = node2
  end
  return node1.instance_variable_defined?(:@right_child) && node1.right_child.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to point to right child node', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Binary Search Tree Class'
test_count = [0, 0]

def test()
  bst = BinarySearchTree.new()
  return bst.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  bst = BinarySearchTree.new()
  bst.instance_variable_defined?(:@root)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has root property', test)

def test()
  bst = BinarySearchTree.new()
  bst.instance_variable_defined?(:@size)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has size property', test)

def test()
  bst = BinarySearchTree.new()
  return bst.instance_variable_defined?(:@root) && bst.root == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default root set to nil', test)

def test()
  bst = BinarySearchTree.new()
  return bst.instance_variable_defined?(:@size) && bst.size == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default root set to 0', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'BinarySearchTree Insert Method'
test_count = [0, 0]

def test()
  bst = BinarySearchTree.new()
  bst.respond_to?(:insert)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has insert method', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  return bst.instance_variable_defined?(:@size) && bst.instance_variable_defined?(:@root) && bst.size == 1 && bst.root.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a node into empty binary search tree', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(3)
  return bst.instance_variable_defined?(:@size) && bst.instance_variable_defined?(:@root) && bst.size == 2 && bst.root.value == 5 && bst.root.left_child.value == 3
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert node to left of root node', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(3)
  bst.insert(4)
  return bst.instance_variable_defined?(:@size) && bst.instance_variable_defined?(:@root) && bst.size == 3 && bst.root.value == 5 && bst.root.left_child.value == 3 &&
    bst.root.left_child.right_child.value == 4
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert node to right of node left of root node', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(8)
  return bst.instance_variable_defined?(:@size) && bst.instance_variable_defined?(:@root) && bst.size == 2 && bst.root.value == 5 && bst.root.right_child.value == 8
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert node to right of root node', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(8)
  bst.insert(7)
  return bst.instance_variable_defined?(:@size) && bst.instance_variable_defined?(:@root) && bst.size == 3 && bst.root.value == 5 && bst.root.right_child.value == 8 &&
    bst.root.right_child.left_child.value == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert node to left of node right of root node', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'BinarySearchTree Search Method'
test_count = [0, 0]

def test()
  bst = BinarySearchTree.new()
  bst.respond_to?(:search)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has search method', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(3)
  bst.insert(8)
  bst.insert(4)
  bst.insert(7)
  return bst.search(4) == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns true when element exists in binary search tree', test)

def test()
  bst = BinarySearchTree.new()
  bst.insert(5)
  bst.insert(3)
  bst.insert(8)
  bst.insert(4)
  bst.insert(7)
  return bst.search(10) == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns false when element does not exist in binary search tree', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
