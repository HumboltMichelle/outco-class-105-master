# Homework - Helper Method Recursion
#
# Solve the following problems using helper method recursion.
#


# 1a. What is the term when the recursive call invokes itself more than once?
#


# 1b. List the steps involved to build a Helper Method Recursion algorithm.
#


# 1c. Should the recursive case or base case typically be tackled first?
#
#


# 2a. Print each item in an array in order using Helper Method Recursion
#
# Input: {Array}
# Output: {Nil}
#
# Example: print_array([1,2,3]) =>
#           1
#           2
#           3
#
def print_array(arr)
  # YOUR WORK HERE
end


# 2b. Print each item in an array backwards
#
# Input:   arr {Array}
# Output:  {Nil}
#
# Example: print_reverse([1,2,3]) =>
#          3
#          2
#          1
#
def print_reverse(arr)
  # YOUR WORK HERE
end


# 2c. Reverse a starting
#
# Input:    str {String}
# Output:   {String}
#
# Example: reverse_string('hello') => 'olleh'
#
def reverse_string(str)
  # YOUR WORK HERE
end


# 2d. Given a list of integers, create a list of two-item lists
#
# Input:    {Array}
# Output:   {Array}
#
# Example: list_pairs([1, 2, 3, 4, 5, 6]) => [[1,2], [3,4], [5,6]]
# Example: list_pairs([1, 2, 3, 4, 5]) => [[1,2], [3,4], [5, None]]
def array_pairs(arr)
  # YOUR WORK HERE
end


# 2e. Flatten a nested array using Helper Method of Recursion
#
# Input:    {Array}
# Output:   {Array)
#
# Example: flatten([1, [2, 3, [4]], 5, [[6]]]) => [1, 2, 3, 4, 5, 6]
def flatten(arr)
  # YOUR WORK HERE
end


#
# 2f. Given a base and an exponent, create a function to find the power using
#     Helper Method Recursion
#
# Input:    Two Integers, base and exponent
# Output:   Integer
#
# Example: power(3, 4) => 81
#
def power(base, exponent)
  # YOUR WORK HERE
end


#
# 2g. Merge two sorted arrays using the Helper Method Recursion
#
# Input:    Two Arrays, both sorted
# Output:    Array, sorted
#
# Example: merge([1, 4, 7], [2, 3, 6, 9]) => [1, 2, 3, 4, 6, 7, 9]
#
def merge(arr1, arr2)
  # YOUR WORK HERE
end




#############################################################
################  DO NOT TOUCH TEST BELOW!!!  ###############
#############################################################

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



puts 'print_array tests'
test_count = [0, 0]

def test()
  c = Capture.capture do
    print_array([1,2,3])
  end
  return c.stdout.length == 6 && c.stdout[0] == '1' && c.stdout[2] == '2' && c.stdout[4] == '3'
end
expect(test_count, 'should print elements of list forward', test)

def test()
  c = Capture.capture do
    results = print_array([])
  end
  return c.stdout.length == 0
end
expect(test_count, 'does not print for an empty input list', test)

def test()
  c = Capture.capture do
    results = print_array([5])
  end
  return c.stdout.length == 2 && c.stdout[0] == '5'
end
expect(test_count, 'does not print for an empty input list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

puts 'print_reverse tests'
test_count = [0, 0]

def test()
  c = Capture.capture do
    print_reverse([1,2,3])
  end
  return c.stdout.length == 6 && c.stdout[0] == '3' && c.stdout[2] == '2' && c.stdout[4] == '1'
end
expect(test_count, 'should print elements of list forward', test)

def test()
  c = Capture.capture do
    results = print_reverse([])
  end
  return c.stdout.length == 0
end
expect(test_count, 'does not print for an empty input list', test)

def test()
  c = Capture.capture do
    results = print_reverse([5])
  end
  return c.stdout.length == 2 && c.stdout[0] == '5'
end
expect(test_count, 'does not print for an empty input list', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'reverse_string tests'
test_count = [0, 0]

def test()
  results = reverse_string('hello')
  return results == 'olleh'
end
expect(test_count, 'able to reverse string \'hello\'', test)

def test()
  results = reverse_string('')
  return results == ''
end
expect(test_count, 'able to return an empty string for empty string input', test)

def test()
  results = reverse_string('b')
  return results == 'b'
end
expect(test_count, 'able to return the same character for a single-character input string', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'array_pairs tests'
test_count = [0, 0]

def test()
  results = array_pairs([1,2,3,4,5,6])
  return results != nil && results.length == 3 && results[0][0] == 1 && results[0][1] == 2 && results[1][0] == 3 && results[1][1] == 4 && results[2][0] == 5 && results[2][1] == 6
end
expect(test_count, 'should return [[1,2],[3,4],[5,6]] output for [1,2,3,4,5,6] input', test)

def test()
  results = array_pairs([1,2,3,4,5])
  return results != nil && results.length == 3 && results[0][0] == 1 && results[0][1] == 2 && results[1][0] == 3 && results[1][1] == 4 && results[2][0] == 5 && results[2][1] == nil
end
expect(test_count, 'should return [[1,2],[3,4],[5,nil]] output for [1,2,3,4,5] input', test)

def test()
  results = array_pairs([])
  return results != nil && results.length == 0
end
expect(test_count, 'should return [] output for [] input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'flatten tests'
test_count = [0, 0]

def test()
  results = flatten([1, [2, 3, [4]], 5, [[6]]])
  return results != nil && results.length == 6 && results[0] == 1 && results[1] == 2 && results[2] == 3 && results[3] == 4 && results[4] == 5 && results[5] == 6
end
expect(test_count, 'should return [1,2,3,4,5,6] output for [1, [2, 3, [4]], 5, [[6]]] input', test)

def test()
  results = flatten([])
  return results != nil && results.length == 0
end
expect(test_count, 'should return [] output for [] input', test)

def test()
  results = flatten([1, [2, 3, [4], []], [], 5, [[], [6]]])
  return results != nil && results.length == 6 && results[0] == 1 && results[1] == 2 && results[2] == 3 && results[3] == 4 && results[4] == 5 && results[5] == 6
end
expect(test_count, 'should return [1,2,3,4,5,6] output for [1, [2, 3, [4], []], [], 5, [[], [6]]] input (note the empty arrays)', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'power tests'
test_count = [0, 0]

def test()
  results = power(3, 4)
  return results == 81
end
expect(test_count, 'should return 81 for 3 to the 4th power', test)

def test()
  results = power(5, 0)
  return results == 1
end
expect(test_count, 'should return 1 for 5 to the 0th power', test)

def test()
  results = power(1, 100)
  return results == 1
end
expect(test_count, 'should return 1 for 1 to the 100th power', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'merge tests'
test_count = [0, 0]

def test()
  results = merge([1,4,7], [2,3,6,9])
  return results != nil && results.length == 7 && results[0] == 1 && results[1] == 2 && results[2] == 3 && results[3] == 4 && results[4] == 6 && results[5] == 7 && results[6] == 9
end
expect(test_count, 'should return [1, 2, 3, 4, 6, 7, 9] when merging [1, 4, 7] and [2, 3, 6, 9]', test)

def test()
  results = merge([], [2,3,6,9])
  return results != nil && results.length == 4 && results[0] == 2 && results[1] == 3 && results[2] == 6 && results[3] == 9
end
expect(test_count, 'should handle inputs when left argument is empty array', test)

def test()
  results = merge([1,4,7], [])
  return results != nil && results.length == 3 && results[0] == 1 && results[1] == 4 && results[2] == 7
end
expect(test_count, 'should handle inputs when right argument is empty array', test)

def test()
  results = merge([], [])
  return results != nil && results.length == 0
end
expect(test_count, 'should handle two empty arrays as inputs', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
