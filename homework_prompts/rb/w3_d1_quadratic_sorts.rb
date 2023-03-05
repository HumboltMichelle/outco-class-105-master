# Homework - Quadratic Sorts
#
# Problem 1: Insertion Sort
#
# Prompt:    Given an unsorted Array of integers, return the Array
#            sorted using insertion sort.
#
#            What are the time and auxilliary space complexity?
#
# Input:     An unsorted Array of integers
# Output:    A sorted Array of integers
#
# Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
#
#
#
# Problem 2: Selection Sort
#
# Prompt:    Given an unsorted Array of integers, return the Array
#            sorted using selection sort.
#
#            What are the time and auxilliary space complexity?
#
# Input:     An unsorted Array of integers
# Output:    A sorted Array of integers
#
# Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
#
#
#
# Problem 3: Bubble Sort
#
# Prompt:    Given an unsorted Array of integers, return the Array
#            sorted using bubble sort.
#
#            What are the time and auxilliary space complexity?
#
# Input:     An unsorted Array of integers
# Output:    A sorted Array of integers
#
# Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
#


# Time Complexity:
# Auxiliary Space Complexity:
def insertion_sort(input)
  # YOUR WORK HERE
end


# Time Complexity:
# Auxiliary Space Complexity:
def selection_sort(input)
  # YOUR WORK HERE
end


# Time Complexity:
# Auxiliary Space Complexity:
def bubble_sort(input)
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





puts 'Insertion Sort Tests'
test_count = [0, 0]

def test()
  example = insertion_sort([3,9,1,4,7])
  return arrays_equal(example, [1,3,4,7,9])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort example input', test)

def test()
  example = insertion_sort([])
  return arrays_equal(example, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return empty array for empty input', test)

def test()
  example = insertion_sort([10])
  return arrays_equal(example, [10])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort single-element input', test)

def test()
  work = []
  for i in 0..999
    work.push(Random.rand(1000))
  end
  example = insertion_sort(work)
  return example.length == 1000 && is_sorted(example)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort moderate-sized input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Selection Sort Tests'
test_count = [0, 0]

def test()
  example = selection_sort([3,9,1,4,7])
  return arrays_equal(example, [1,3,4,7,9])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort example input', test)

def test()
  example = selection_sort([])
  return arrays_equal(example, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return empty array for empty input', test)

def test()
  example = selection_sort([10])
  return arrays_equal(example, [10])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort single-element input', test)

def test()
  work = []
  for i in 0..999
    work.push(Random.rand(1000))
  end
  example = selection_sort(work)
  return example.length == 1000 && is_sorted(example)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort moderate-sized input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Bubble Sort Tests'
test_count = [0, 0]

def test()
  example = bubble_sort([3,9,1,4,7])
  return arrays_equal(example, [1,3,4,7,9])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort example input', test)

def test()
  example = bubble_sort([])
  return arrays_equal(example, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return empty array for empty input', test)

def test()
  example = bubble_sort([10])
  return arrays_equal(example, [10])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort single-element input', test)

def test()
  work = []
  for i in 0..999
    work.push(Random.rand(1000))
  end
  example = bubble_sort(work)
  return example.length == 1000 && is_sorted(example)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort moderate-sized input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
