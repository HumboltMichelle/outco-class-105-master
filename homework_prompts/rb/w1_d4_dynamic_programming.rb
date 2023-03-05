#  Homework - Dynamic Programming: Moving Window
#
#  Problem 1: Max Consecutive Sum
#
#  Prompt:    Given an array of integers find the sum of consecutive values in the
#             array that produces the maximum value.
#
#  Input:     Unsorted array of positive and negative integers
#  Output:    Integer (max consecutive sum)
#
#  Example:   input = [6, -1, 3, 5, -10]
#             output = 13 (6 + -1 + 3 + 5 = 13)
#


# Time Complexity:
# Auxiliary Space Complexity:
# Max Consecutive Sum
def max_consecutive_sum(arr)
  #YOUR WORK HERE
end


#  Problem 2: Bit Flip
#
#  Given an array of binary values (0 and 1) and N number of flips (convert a
#  0 to a 1), determine the maximum number of consecutive 1's that can be made.
#
#  Input: An Array of 1's and 0's, and an Integer N denoting the number of flips
#  Output: Integer
#
#  Example: bit_flip([0,1,1,1,0,1,0,1,0,0], 2)
#  Result: 7
#

# Time Complexity:
# Auxiliary Space Complexity:
def bit_flip(arr, n)
  #YOUR WORK HERE
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





puts 'max_consecutive_sum Tests'
test_count = [0, 0]

def test()
  example = max_consecutive_sum([6,-1,3,5,-10])
  return example == 13
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on example input', test)

def test()
  example = max_consecutive_sum([5])
  return example == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on single-element input', test)

def test()
  example = max_consecutive_sum([])
  return example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 0 for empty input', test)

def test()
  example = max_consecutive_sum([-1,1,-3,4,-1,2,1,-5,4])
  return example == 6
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on longer input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts 'Bit Flip Tests'
test_count = [0, 0]

def test()
  example = bit_flip([0,1,1,1,0,1,0,1,0,0], 2)
  return example == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should handle example case', test)

def test()
  example = bit_flip([0], 1)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should handle smaller edge case where flip is allowed', test)

def test()
  example = bit_flip([0], 0)
  return example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should handle smaller edge case where flip is not allowed', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
