#  Target Practice - Linked List
#
#  Using the LinkedList class from your homework, add the
#                following methods to your LinkedList.
#

# DO NOT EDIT
# Node class for a linked list node
class ListNode
  def initialize(value = nil)
    @value = value
    @next = nil
  end

  attr_accessor :value
  attr_accessor :next
end

# DO NOT EDIT
# Generate a linked list from an array
def generate_list(arr)
  if arr.length == 0
    return nil
  end
  head = ListNode.new(arr[0])
  current = head
  for i in 1..arr.length - 1
    current.next = ListNode.new(arr[i])
    current = current.next
  end
  return head
end


# 1a. Create a method which prints the value of each node until the tail
#
# Input: node {ListNode}
# Output: {Nil}
#
# Example: (1) --> (5) --> (7) --> (10)
#
#          1
#          5
#          7
#          10
#

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(1)
def print_forward(head)
  current = head
  while current != nil
    puts(current.value)
    current = current.next
  end
end


# 1b. Prints the value of each node backwards from the tail to the input node
# using recursion.
#
# Input: node {ListNode}
# Output: {Nil}
#
# Example: (1) --> (5) --> (7) --> (10)
#
#          10
#          7
#          5
#          1
#

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(N)
def print_backward(head)
  traverse = lambda do |current_node|
    if current_node == nil
      return
    end

    traverse.call(current_node.next)

    puts current_node.value
  end
  traverse.call(head)
end


# 1c. Given a node in a linked list, reverse the order of the nodes in that
# list.
#
# Input: node {ListNode}
# Output: {ListNode}
#
# Example: (1) --> (5) --> (7) --> (10)
#
#          (10) --> (7) --> (5) --> (1)
#

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(1)
def reverse(node)
  return node if node == nil
  prev = nil
  current = node
  while current != nil
    next_node = current.next
    current.next = prev
    prev, current = current, next_node
  end
  return prev
end


# 1d. Create a method which swaps the first occurance of the locations of two
#     nodes in the linked list.
#
# Input: head {ListNode}
# Input: a {Integer}
# Input: b {Integer}
# Output: {ListNode}
#
# Example:
# head = generate_list([1, 5, 7, 10])
# head = swap(head, 5, 10)
#
#          (1) --> (5) --> (7) --> (10)
#          Head
#
#          (1) --> (10) --> (7) --> (5)
#          Head
#

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(1)
def swap(head, a, b)
  return head if head == nil || a == b

  def locate(node, target)
    prev = nil
    current = node
    while current != nil
      if current && current.value == target
        return [prev, current]
      end
      prev = current
      current = current.next
    end
    return [nil, nil]
  end

  prev1, current1 = locate(head, a)
  prev2, current2 = locate(head, b)
  if !current1 || !current2
    return head
  end
  if prev1
    prev1.next = current2
  end
  if prev2
    prev2.next = current1
  end
  current1.next, current2.next = current2.next, current1.next
  if prev1 == nil
    return current2
  end
  if prev2 == nil
    return current1
  end
  return head
end



# Extra Credit 1:
#
# Given an input of a ListNode, return true if the ListNode is in a circular
# linked list, and false if the linked list that terminates.
#

# setup of node in a circular linked list
circular_node = ListNode.new(rand(10000))
current_node = circular_node
circle_size = rand(10000-100) + 100

# circular linked list circular_node
for i in 0..circle_size-1
  current_node.next = ListNode.new(rand(10000))
  current_node = current_node.next
  if i == circle_size - 1
    current_node.next = circular_node
  end
end

# setup of a node in a linked list that terminates
terminal_node = ListNode.new(rand(10000))
current_node = terminal_node
circle_size = rand(10000-100) + 100

# circular linked list terminal_node
for i in 0..circle_size-1
  current_node.next = ListNode.new(rand(10000))
  current_node = current_node.next
end


# For your input, use circular_node as a node in a circular linked list and
# terminal_node as a node in a terminating linked list
def is_circular?(node)
  tortoise = node
  hare = node

  while hare != nil && hare.next != nil
    hare = hare.next.next
    tortoise = tortoise.next
    if tortoise == hare
      return true
    end
  end
  return false
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

# #use this code to capture puts output
# c = Capture.capture do
#   # PERFORM OPERATIONS IN HERE
# end

# puts c.stdout
def str_to_array(input)
  input = input.split('\n')
  return input[:input.length-1]
end

@circular_node = circular_node
@terminal_node = terminal_node

puts 'linked_list instantiation tests'
test_count = [0, 0]

def test()
  test = generate_list([1,5,7,10])
  return test != nil && test.value == 1 && test.next.next.next.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to create a linked_list instance', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'print_forward tests'
test_count = [0, 0]
def test()
  c = Capture.capture do
    test = generate_list([1,5,7,10])
    print_forward(test)
  end
  return c.stdout.length == 9 && c.stdout[0] == '1' && c.stdout[2] == '5' && c.stdout[4] == '7' && c.stdout[6..7] == '10'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to print elements of [1,5,7,10] linked list]', test)

def test()
  c = Capture.capture do
    test = generate_list([1])
    print_forward(test)
  end
  return c.stdout.length == 2 && c.stdout[0] == '1'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to print forward with a single element', test)

def test()
  c = Capture.capture do
    test = generate_list([])
    print_forward(test)
  end
  return c.stdout.length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should print nothing for empty linked list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'print_backward tests'
test_count = [0, 0]

def test()
  c = Capture.capture do
    test = generate_list([1,5,7,10])
    print_backward(test)
  end
  return c.stdout.length == 9 && c.stdout[0..1] == '10' && c.stdout[3] == '7' && c.stdout[5] == '5' && c.stdout[7] == '1'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to print elements of [1,5,7,10] linked list]', test)

def test()
  c = Capture.capture do
    test = generate_list([1])
    print_backward(test)
  end
  return c.stdout.length == 2 && c.stdout[0] == '1'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to print forward with a single element', test)

def test()
  c = Capture.capture do
    test = generate_list([])
    print_backward(test)
  end
  return c.stdout.length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should print nothing for empty linked list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'reverse tests'
test_count = [0, 0]

def test()
  test = generate_list([1,5,7,10])
  test = reverse(test)
  return test.value == 10 && test.next.next.next.value == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to reverse 1 --> 5 --> 7 --> 10 ', test)

def test()
  test = generate_list([1])
  test = reverse(test)
  return test.value == 1 && test.next == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to handle single element linked lists', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'swap tests'
test_count = [0, 0]

def test()
  test = generate_list([1,5,7,10])
  test = swap(test, 1, 5)
  return test.value == 5 && test.next.value == 1 && test.next.next.value == 7 && test.next.next.next.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to swap 1 and 5 to change [1,5,7,10] linked list to look like [5,1,7,10]', test)

def test()
  test = generate_list([1,5,7,10])
  test = swap(test, 1, 7)
  return test.value == 7 && test.next.value == 5 && test.next.next.value == 1 && test.next.next.next.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to swap 1 and 7 to change [1,5,7,10] linked list to look like [7,5,1,10]', test)

def test()
  test = generate_list([1,5,7,10])
  test = swap(test, 1, 10)
  return test.value == 10 && test.next.value == 5 && test.next.next.value == 7 && test.next.next.next.value == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to swap 1 and 10 to change [1,5,7,10] linked list to look like [10,5,7,1]', test)

def test()
  test = generate_list([1,5,7,10])
  test = swap(test, 5, 10)
  return test.value == 1 && test.next.value == 10 && test.next.next.value == 7 && test.next.next.next.value == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to swap 5 and 10 to change [1,5,7,10] linked list to look like [1,10,7,5]', test)

def test()
  test = generate_list([1,5,7,10])
  test = swap(test, 5, 11)
  return test.value == 1 && test.next.value == 5 && test.next.next.value == 7 && test.next.next.next.value == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should not perform any swap when trying to swap value that does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'is_circular tests'
test_count = [0, 0]

def test()
  results = is_circular?(@circular_node)
  return results
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return true for circular linked list', test)

def test()
  results = is_circular?(@terminal_node)
  return !results
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return false for terminal linked list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
