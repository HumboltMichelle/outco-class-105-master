#  Target Practice - BST Traversals
#
#  Instructions: One of the most fundamental components of working with trees
#                and graphs is traversals.  We will focus primarily on this
#                piece to build your foundation of these data structures.
#

#
# First we need a binary search tree.  Use an existing binary search tree class
# that you have built.
#


# DO NOT EDIT
# Node class for a binary tree node
class TreeNode
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  attr_accessor :value
  attr_accessor :left
  attr_accessor :right
end


# DO NOT EDIT
# generate tree from array
def deserialize(arr)
  if arr.length == 0
    return nil
  end
  root = TreeNode.new(arr[0])
  queue = [root]
  i = 1
  while i < arr.length
    current = queue.shift()
    if arr[i] != nil
      current.left = TreeNode.new(arr[i])
      queue.push(current.left)
    end
    if arr[i + 1] != nil && i + 1 < arr.length
      current.right = TreeNode.new(arr[i + 1])
      queue.push(current.right)
    end
    i += 2
  end
  return root
end

#
# Deserialize operates by building out the tree in a breadth-first
# manner. One only needs to build down to the lowest row where there
# exists nodes. For example, in this tree,
#
#          1
#            \
#              3
#   				  /
#   				 2
#
# The array that you would pass in to the deserialize function would
# be [1,nil,3,2,nil]. The first nil represents the left child of
# the 1 node, and the second nil represents the right child of the 3 node.
#
#  1. Here, we have built out the following tree using deserialize:
#
#              4
#            /   \
#          2       5
#        /   \       \
#      1       3       7
#                    /   \
#                  6      8
#

# DO NOT EDIT
arr = [4, 2, 5, 1, 3, nil, 7, nil, nil, nil, nil, 6, 8]

sample_tree = deserialize(arr)


#
#  2. Given the example output binary search tree from Problem 1, what would the
#     order of values printed be if we used:
#
#     a. BREADTH FIRST traversal:
#     b. PRE-ORDER DEPTH first traversal:
#     c. IN-ORDER DEPTH first traversal:
#     d. POST-ORDER DEPTH first traversal:


#
#  3a. Using a queue, and while loop write a function that takes in a binary
#      search tree and outputs an array of values ordered by BREADTH FIRST
#      traversal.
#
#  Input: node {TreeNode}
#  Output: {Array}
#
#  NOTE: You may use an array or linked list for your queue.
#
#  NOTE: Confirm with your answer from problem 2a.
#

def bfs(node)
  # YOUR WORK HERE
end

#
#  3b. Using recursion, write a function that takes in a binary search tree and
#      outputs an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
#
#      Input: node {TreeNode}
#      Output: {Array}
#
#      NOTE: Confirm with your answer from problem 2b.
#

def dfs_pre(node)
  # YOUR WORK HERE
end

#
#  3c. Using recursion, write a function that takes in a binary search tree and
#      outputs an array of values ordered by IN-ORDER DEPTH FIRST traversal.
#
#      Input: node {TreeNode}
#      Output: {Array}
#
#      NOTE: Confirm with your answer from problem 2c.
#

def dfs_in(node)
  # YOUR WORK HERE
end

#
#  3d. Using recursion, write a function that takes in a binary search tree and
#      outputs an array of values ordered by POST-ORDER DEPTH FIRST traversal.
#
#      Input: node {TreeNode}
#      Output: {Array}
#
#      NOTE: Confirm with your answer from problem 2d.
#

def dfs_post(node)
  # YOUR WORK HERE
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
  err_msg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    err_msg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if err_msg != nil
    puts'       ' + err_msg + '\n'
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


# generate test tree for the rest of the tests
test_tree = TreeNode.new(4)
test_tree.left = TreeNode.new(2)
test_tree.left.left = TreeNode.new(1)
test_tree.left.right = TreeNode.new(3)
test_tree.right = TreeNode.new(5)
test_tree.right.right = TreeNode.new(7)
test_tree.right.right.left = TreeNode.new(6)
test_tree.right.right.right = TreeNode.new(8)
$test_tree = test_tree
$sample_tree = sample_tree


puts 'Problem 1 tests'
test_count = [0, 0]

def test()
  return $sample_tree != nil && $sample_tree.value == 4 && $sample_tree.left.value == 2 && $sample_tree.left.left.value == 1 && $sample_tree.left.right.value == 3 && $sample_tree.right.value == 5 && $sample_tree.right.right.value == 7 && $sample_tree.right.right.left.value == 6 && $sample_tree.right.right.right.value == 8
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to build tree as indicated in diagram', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'breadth first search tests'
test_count = [0, 0]

def test()
  results = bfs($test_tree)
  return results != nil && arrays_equal(results, [4,2,5,1,3,7,6,8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to return values of BST in breadth first manner - [4,2,5,1,3,7,6,8]', test)

def test()
  results = bfs(deserialize([]))
  return results != nil && arrays_equal(results, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty erray for an empty BST', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'pre-order depth first search tests'
test_count = [0, 0]

def test()
  results = dfs_pre($test_tree)
  return results != nil && arrays_equal(results, [4,2,1,3,5,7,6,8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to return values of BST in pre-order depth first manner - [4,2,1,3,5,7,6,8]', test)

def test()
  results = dfs_pre(deserialize([]))
  return results != nil && arrays_equal(results, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty erray for an empty BST', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'dfs_in tests'
test_count = [0, 0]

def test()
  results = dfs_in($test_tree)
  return results != nil && arrays_equal(results, [1,2,3,4,5,6,7,8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to return values of BST in in-order depth first manner - [4,2,1,3,5,7,6,8]', test)

def test()
  results = dfs_in(deserialize([]))
  return results != nil && arrays_equal(results, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty erray for an empty BST', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'dfs_post tests'
test_count = [0, 0]

def test()
  results = dfs_post($test_tree)
  return results != nil && arrays_equal(results, [1,3,2,6,8,7,5,4])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to return values of BST in post-order depth first manner - [4,2,1,3,5,7,6,8]', test)

def test()
  results = dfs_post(deserialize([]))
  return results != nil && arrays_equal(results, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty erray for an empty BST', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
