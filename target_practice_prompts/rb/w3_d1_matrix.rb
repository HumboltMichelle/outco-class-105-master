#  Target Practice - Matrix
#
#  Problem 1:  Robot Paths
#
#  Prompt:   Given a matrix of zeroes, determine how many unique paths exist
#            from the top left corner to the bottom right corner
#
#  Input:    An Array of Array of Integers (matrix)
#  Output:   Integer
#
#  Example:  matrix = [[0,0,0,0],
#                      [0,0,0,0],
#                      [0,0,0,0]]
#
#            robotPaths(matrix) = 38
#
#
#            matrix = [[0,0,0],
#                      [0,0,0]]
#
#            robotPaths(matrix) = 4
#
#  Note:     From any point, you can travel in the four cardinal directions
#            (north, south, east, west). A path is valid as long as it travels
#            from the top left corner to the bottom right corner, does not go
#            off of the matrix, and does not travel back on itself

def robot_paths(matrix)
  # YOUR WORK HERE
end


# Problem # 2: Matrix spiral
#
# Given an (MxN) matrix of integers, return an array in spiral order.
#
# Input:  matrix {Integer[][]}
# Output: {Integer}
#
#
# Example:
# Input:  [[ 1, 2, 3],
#          [ 4, 5, 6],
#          [ 7, 8, 9]]
# Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
#
#

# Time Complexity:
# Auxiliary Space Complexity:



def matrix_spiral(input)
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


puts 'Robot Path Tests'
test_count = [0, 0]

def test()
  input = [[0,0,0,0],
          [0,0,0,0],
          [0,0,0,0]]
  example = robot_paths(input)
  return example == 38
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on first example input', test)

def test()
  input = [[0,0,0],
          [0,0,0]]
  example = robot_paths(input)
  return example == 4
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on second example input', test)

def test()
  input = [[0]]
  example = robot_paths(input)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on single-element input', test)

def test()
  input = [[0,0,0,0,0,0]]
  example = robot_paths(input)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on single-row input', test)

def test()
  input = [[0],
           [0],
           [0],
           [0],
           [0]]
  example = robot_paths(input)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on single-column input', test)

def test()
  input = [[0,0,0,0,0,0],
           [0,0,0,0,0,0],
           [0,0,0,0,0,0],
           [0,0,0,0,0,0],
           [0,0,0,0,0,0]]
  example = robot_paths(input)
  return example == 79384
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on a 5 x 6 matrix input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nMatrix Spiral"
test_count = [0, 0]

def test()
  matrix = [[]]
  example = matrix_spiral(matrix)
  return example == []
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on empty matrix input", test)

def test()
  matrix = [[1]]
  example = matrix_spiral(matrix)
  return example == [1]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on single element matrix input", test)


def test()
  matrix =  [[1],
             [2],
             [3],
             [4],
             [5]]
  example = matrix_spiral(matrix)
  return example == [1, 2, 3, 4, 5]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on single column matrix input", test)

def test()
  matrix = [[1, 2],
            [4, 3]]
  example = matrix_spiral(matrix)
  return example == [1, 2, 3, 4]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on square matrix input", test)


def test()
  matrix = [[1, 2, 3, 4]]
  example = matrix_spiral(matrix)
  return example == [1, 2, 3, 4]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on single row matrix input", test)


def test()
  matrix = [[ 1,  2,  3],
            [ 4,  5,  6],
            [ 7,  8,  9],
            [10, 11, 12],
            [13, 14, 15]]
  example = matrix_spiral(matrix)
  return example == [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on 3 x 5 matrix input", test)


def test()
  matrix =  [[  1,  2,  3,  4, 5],
             [ 12, 13, 14, 15, 6],
             [ 11, 10,  9,  8, 7]]
  example = matrix_spiral(matrix)
  return example == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work on 5 x 3 matrix input", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
