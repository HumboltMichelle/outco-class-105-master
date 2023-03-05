#  Homework - Quasilinear Sorts
#
#  Problem 1: Mergesort
#
#  Prompt:    Given an unsorted array of integers, return the array
#             sorted using mergesort.
#
#             What are the time and auxilliary space complexity?
#
#  Input:     An unsorted array of integers
#  Output:    A sorted array of integers
#
#  Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
#

# Time Complexity: O(Nlog(N))
# Auxiliary Space Complexity: O(Nlog(N))
def mergesort(input)
  divide = lambda do |arr|
    return arr if arr.size < 2

    mid = arr.length / 2
    arr1 = arr[0...mid]
    arr2 = arr[mid..-1]

    sorted_arr1 = divide.call(arr1)
    sorted_arr2 = divide.call(arr2)

    result = []
    total_elements = sorted_arr1.size + sorted_arr2.size
    i = 0
    j = 0
    while result.size < total_elements
      if j >= sorted_arr2.size || (i < sorted_arr1.size && sorted_arr1[i] < sorted_arr2[j])
        result.push(sorted_arr1[i])
        i += 1
      else
        result.push(sorted_arr2[j])
        j += 1
      end
    end
    return result
  end

  divide.call(input)
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



puts 'Merge Sort Tests'
test_count = [0, 0]

def test()
  example = mergesort([3,9,1,4,7])
  return arrays_equal(example, [1,3,4,7,9])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort example input', test)

def test()
  example = mergesort([])
  return arrays_equal(example, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return empty array for empty input', test)

def test()
  example = mergesort([10])
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
  example = mergesort(work)
  return example.length == 1000 && is_sorted(example)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort moderate-sized input', test)

def test()
  work = []
  for i in 0..999999
    work.push(Random.rand(1000000))
  end
  example = mergesort(work)
  return example.length == 1000000 && is_sorted(example)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should sort large input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
