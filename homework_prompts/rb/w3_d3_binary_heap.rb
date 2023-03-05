#  Homework - Heap
#
#  Prompt: Create a Heap class/constructor
#
#  The Heap will take in the following input:
#
#                type: argument should be either 'min' or 'max'. This will
#                      dictate whether the heap will be a minheap or maxheap.
#                      The comparator method will be affected by this
#                      argument. See method description below
#
#  The Heap will have the following property:
#
#             storage: array
#
#                type: property that will be either 'min' or 'max'. This will
#                      be dictated by
#
#  The Heap will have the following methods:
#
#             compare: takes in two arguments (a and b). Depending on the heap
#                      type (minheap or maxheap), the comparator will behave
#                      differently. If the heap is a minheap, then the compare
#                      function will return true if a is less than b, false
#                      otherwise. If the heap is a maxheap, then the compare
#                      function will return true if a is greater than b, false
#                      otherwise.
#
#                swap: takes in two indexes and swaps the elements at the two
#                      indexes in the storage array
#
#                peak: returns the peak element of the storage array. This
#                      will be the most minimum and maximum element for a
#                      minheap and maxheap respectively
#
#                size: returns the number of elements in the heap
#
#              insert: inserts a value into the heap. Should begin by pushing
#                      the value onto the end of the array, and then calling
#                      the bubbleUp method from the last index of the array
#
#           bubble_up: takes in an index, and considers the element at that
#                      index to be a child. Continues to swap that child with
#                      its parent value if the heap comparator condition is
#                      not fulfilled
#
#         remove_peak: removes the peak element from the heap and returns it.
#                      Should begin by swapping the 0th-index element with the
#                      last element in the storage array. Uses bubbleDown
#                      method from the 0th index
#
#         bubble_down: takes in an index, and considers the element at this
#                      index to be the parent. Continues to swap this parent
#                      element with its children if the heap comparator
#                      condition is not fulfilled
#
#              remove: takes in a value and (if it exists in the heap),
#                      removes that value from the heap data structure and
#                      returns it. Should rearrange the rest of the heap to
#                      ensure the heap comparator conditions are fulfilled
#                      for all of its elements
#
#
#
#  Input:  N/A
#  Output: A Heap instance
#
#

class Heap
  attr_accessor :storage, :type

  def initialize(type='min')
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def compare(a, b)
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def swap(index1, index2)
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def peak()
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def size()
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def insert(value)
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def bubble_up(index)
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def remove_peak()
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def bubble_down(index)
    #YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def remove(value)
    #YOUR WORK HERE
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





puts 'Heap Tests'
test_count = [0, 0]

def test()
  work = Heap.new()
  return work.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  work = Heap.new()
  work.instance_variable_defined?(:@storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has storage property', test)

def test()
  work = Heap.new()
  work.instance_variable_defined?(:@type)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has type property', test)

def test()
  work = Heap.new()
  return work.storage.kind_of?(Array)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default storage set to an array', test)

def test()
  work = Heap.new()
  return work.type == 'min'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default type property is set to \'min\'', test)

def test()
  work = Heap.new('max')
  return work.type == 'max'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default type property can be set to \'max\'', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap compare method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:compare)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has compare method', test)

def test()
  work = Heap.new('min')
  work.storage.push(1)
  work.storage.push(10)
  return work.compare(0, 1) == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns true for minheap if element at first argument index is less than element at second argument index', test)

def test()
  work = Heap.new('min')
  work.storage.push(10)
  work.storage.push(1)
  return work.compare(0, 1) == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns false for minheap if element at first argument index is greater than element at second argument index', test)

def test()
  work = Heap.new('max')
  work.storage.push(10)
  work.storage.push(1)
  return work.compare(0, 1) == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns true for maxheap if element at first argument index is greater than element at second argument index', test)

def test()
  work = Heap.new('max')
  work.storage.push(1)
  work.storage.push(10)
  return work.compare(0, 1) == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns false for maxheap if element at first argument index is less than element at second argument index', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap swap method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:swap)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has swap method', test)

def test()
  work = Heap.new()
  work.storage.push(1)
  work.storage.push(5)
  work.storage.push(10)
  work.swap(0, 2)
  return work.storage[0] == 10 && work.storage[2] == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to swap the locations of two elements given two indices', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap peak method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:peak)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has peak method', test)

def test()
  work = Heap.new()
  work.storage.push(1)
  work.storage.push(5)
  work.storage.push(10)
  return work.peak() == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return the 0th element of the storage array', test)

def test()
  work = Heap.new('min')
  work.insert(2)
  work.insert(5)
  work.insert(10)
  work.insert(1)
  return work.peak() == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'upon building out your insert method, should return the smallest element for a minheap', test)

def test()
  work = Heap.new('max')
  work.insert(2)
  work.insert(5)
  work.insert(10)
  work.insert(1)
  return work.peak() == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'upon building out your insert method, should return the largest element for a maxheap', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap size method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:size)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has size method', test)

def test()
  work = Heap.new()
  work.storage.push(1)
  work.storage.push(5)
  work.storage.push(10)
  return work.size() == 3
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns number of elements in the storage array', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap insert method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:insert)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has insert method', test)

def test()
  work = Heap.new()
  work.insert(5)
  return work.storage[0] == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to insert a single element', test)

def test()
  work = Heap.new()
  work.insert(5)
  return work.storage[0] == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to insert a single element', test)

def test()
  work = Heap.new('min')
  work.insert(5)
  work.insert(10)
  work.insert(7)
  work.insert(1)
  work.insert(8)
  work.insert(6)
  return work.peak() == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to insert multiple elements into a minheap and have peak element be smallest element', test)

def test()
  work = Heap.new('max')
  work.insert(5)
  work.insert(10)
  work.insert(7)
  work.insert(1)
  work.insert(8)
  work.insert(6)
  return work.peak() == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to insert multiple elements into a maxheap and have peak element be largest element', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap bubble_up method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:bubble_up)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has bubble_up method', test)

def test()
  work = Heap.new('min')
  work.storage = [2,4,7,6,9,10,8,1]
  work.bubble_up(7)
  return arrays_equal([1,2,7,4,9,10,8,6], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to \'bubble up\' an element if its minheap condition is not fulfilled', test)

def test()
  work = Heap.new('max')
  work.storage = [9,8,6,7,3,5,2,10]
  work.bubble_up(7)
  return arrays_equal([10,9,6,8,3,5,2,7], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to \'bubble up\' an element if its maxheap condition is not fulfilled', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  work.bubble_up(7)
  return arrays_equal([1,2,7,4,9,10,8,6], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should not perform bubbling up if minheap conditions are fulfilled', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  work.bubble_up(7)
  return arrays_equal([10,9,6,8,3,5,2,7], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should not perform bubbling up if maxheap conditions are fulfilled', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap remove_peak method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:remove_peak)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove_peak method', test)

def test()
  work = Heap.new()
  work.insert(5)
  work.remove_peak()
  return work.storage.length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to remove a single element', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  example = work.remove_peak()
  return example == 1 && arrays_equal([2,4,7,6,9,10,8], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to remove and return peak element for a minheap and rearrange minheap accordingly', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  example = work.remove_peak()
  return example == 10 && arrays_equal([9,8,6,7,3,5,2], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to remove and return peak element for a maxheap and rearrange maxheap accordingly', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap bubble_down method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:bubble_down)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has bubble_down method', test)

def test()
  work = Heap.new('min')
  work.storage = [10,1,2,6,4,9,8,7]
  work.bubble_down(0)
  return arrays_equal([1,4,2,6,10,9,8,7], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to \'bubble down\' an element if its minheap condition is not fulfilled', test)

def test()
  work = Heap.new('max')
  work.storage = [2,10,9,5,8,3,6,7]
  work.bubble_down(0)
  return arrays_equal([10,8,9,5,2,3,6,7], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to \'bubble down\' an element if its maxheap condition is not fulfilled', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  work.bubble_down(0)
  return arrays_equal([1,2,7,4,9,10,8,6], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should not perform bubbling down if minheap conditions are fulfilled', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  work.bubble_down(0)
  return arrays_equal([10,9,6,8,3,5,2,7], work.storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should not perform bubbling down if maxheap conditions are fulfilled', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Heap remove method'
test_count = [0, 0]

def test()
  work = Heap.new()
  work.respond_to?(:remove)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove method', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  example = work.remove(10)
  return example == 10 && arrays_equal(work.storage, [1,2,6,4,9,7,8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to remove specified value from minheap', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  example = work.remove(6)
  return example == 6 && arrays_equal(work.storage, [10,9,7,8,3,5,2])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to remove specified value from maxheap', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  example = work.remove(6)
  return example == 6 && arrays_equal(work.storage, [1,2,7,4,9,10,8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to remove last value from minheap', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  example = work.remove(7)
  return example == 7 && arrays_equal(work.storage, [10,9,6,8,3,5,2])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to remove last value from maxheap', test)

def test()
  work = Heap.new('min')
  work.storage = [1,2,7,4,9,10,8,6]
  work.remove(3)
  return arrays_equal(work.storage, [1,2,7,4,9,10,8,6])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove anything from minheap if value does not exist', test)

def test()
  work = Heap.new('max')
  work.storage = [10,9,6,8,3,5,2,7]
  work.remove(4)
  return arrays_equal(work.storage, [10,9,6,8,3,5,2,7])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove anything from maxheap if value does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
