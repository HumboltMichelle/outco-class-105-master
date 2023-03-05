#  Homework - Linked List
#
#  Problem 1: Node class
#
#  Prompt:    Create a Node class
#             The Node class should contain the following properties:
#
#                 value:   integer value (default nil)
#                  next:   pointer to another node (default nil)
#
#               Example:   input: let sample1 = new Node(1)
#                          sample1.value     // 1
#                          sample1.next      // nil
#
#               Example:   input: let sample2 = new Node()
#                          sample2.value     // nil
#                          sample2.next      // nil
#
#
#  Problem 2:  LinkedList class
#
#  Prompt:     Create a LinkedList class
#              The LinkedList class should contain the following properties:
#
#                length:   The number of nodes in the linked list
#                  head:   A pointer to the head node
#                  tail:   A pointer to the tail node
#
#              The LinkedList class should also contain the following methods:
#
#                append:   A method that appends a value to the end of the
#                          LinkedList.
#
#                          Input:     value
#                          Output:    nil
#
#                insert:   A method that inserts an integer value at a set
#                          index in the LinkedList (assume head index is 0).
#
#                          Input:     value, index
#                          Output:    nil
#
#                remove:   A method that removes a node at a specified index.
#
#                          Input:     index
#                          Output:    nil
#
#              contains:   A method that checks to see if a value is contained
#                          in the list.
#
#                          Input:     value
#                          Output:    Boolean
#
#    What are the time and auxiliary space complexity of the various
#    methods?
#


class Node
end

class LinkedList
  def initialize
  end



  # Time Complexity:
  # Auxiliary Space Complexity:
  def append(value)
  end


  # Time Complexity:
  # Auxiliary Space Complexity:
  def insert(value, index)
  end


  # Time Complexity:
  # Auxiliary Space Complexity:
  def remove(index)
  end


  # Time Complexity:
  # Auxiliary Space Complexity:
  def contains(value)
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
  rescue NameError => err
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
  node.instance_variable_defined?(:@next)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has next property', test)

def test()
  node = Node.new()
  return node.value == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has default value set to nil', test)

def test()
  node = Node.new(5)
  return node.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to assign a value upon instantiation', test)

def test()
  node = Node.new()
  node.value = 5
  return node.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to reassign a value', test)

def test()
  node1 = Node.new(5)
  node2 = Node.new(10)
  node1.next = node2
  return node1.next.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to point to another node', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'LinkedList Class'
test_count = [0, 0]

def test()
  linked_list = LinkedList.new()
  return linked_list.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@head)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has head property', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@tail)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has tail property', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@length)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has length property', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@length)
  return linked_list.head == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default head set to nil', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@length)
  return linked_list.tail == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default tail set to nil', test)

def test()
  linked_list = LinkedList.new()
  linked_list.instance_variable_defined?(:@length)
  return linked_list.length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default length set to 0', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'LinkedList Insert Method'
test_count = [0, 0]

def test()
  linked_list = LinkedList.new()
  linked_list.respond_to?(:insert)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has insert method', test)

def test()
  linked_list = LinkedList.new()
  linked_list.insert(5, 0)
  return linked_list.length == 1 && linked_list.head.value == 5 && linked_list.tail.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a node into empty linked list', test)

def test()
  linked_list = LinkedList.new()
  linked_list.insert(5, 0)
  linked_list.insert(10, 1)
  return linked_list.length == 2 && linked_list.head.value == 5 && linked_list.tail.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a node after another node', test)

def test()
  linked_list = LinkedList.new()
  linked_list.insert(5, 0)
  linked_list.insert(10, 0)
  return linked_list.length == 2 && linked_list.head.value == 10 && linked_list.tail.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a node before another node', test)

def test()
  linked_list = LinkedList.new()
  linked_list.insert(5, 0)
  linked_list.insert(10, 1)
  linked_list.insert(7, 1)
  return linked_list.length == 3 && linked_list.head.value == 5 && linked_list.tail.value == 10 && linked_list.head.next.value == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a node in between two nodes', test)

def test()
  linked_list = LinkedList.new()
  linked_list.insert(5, -1)
  linked_list.insert(10, 3)
  return linked_list.length == 0 && linked_list.head == nil && linked_list.tail == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not insert a node if index is out of bounds', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'LinkedList Append Method'
test_count = [0, 0]

def test()
  linked_list = LinkedList.new()
  linked_list.respond_to?(:append)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has append method', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  return linked_list.length == 1 && linked_list.head.value == 5 && linked_list.tail.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to append a node into an empty linked list', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  return linked_list.length == 2 && linked_list.head.value == 5 && linked_list.tail.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to append a second node into linked list', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.append(15)
  return linked_list.length == 3 && linked_list.head.value == 5 && linked_list.tail.value == 15
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to append a third node into linked list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'LinkedList Remove Method'
test_count = [0, 0]

def test()
  linked_list = LinkedList.new()
  linked_list.respond_to?(:remove)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove method', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.remove(0)
  return linked_list.length == 1 && linked_list.head.value == 10 && linked_list.tail.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove a node from the head', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.remove(1)
  return linked_list.length == 1 && linked_list.head.value == 5 && linked_list.tail.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove a node from the tail', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.append(15)
  linked_list.remove(1)
  return linked_list.length == 2 && linked_list.head.value == 5 && linked_list.tail.value == 15
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove a node in between two nodes', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.remove(0)
  return linked_list.length == 0 && linked_list.head == nil && linked_list.tail == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove the only node in a linked list', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.remove(-1)
  linked_list.remove(2)
  return linked_list.length == 1 && linked_list.head.value == 5 && linked_list.tail.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove a node when the index is out of bounds', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'LinkedList Contains Method'
test_count = [0, 0]

def test()
  linked_list = LinkedList.new()
  linked_list.respond_to?(:contains)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has contains method', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.append(15)
  return linked_list.contains(15) == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns true if linked list contains value', test)

def test()
  linked_list = LinkedList.new()
  linked_list.append(5)
  linked_list.append(10)
  linked_list.append(15)
  return linked_list.contains(8) == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns false if linked list contains value', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
