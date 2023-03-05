#    Homework - Dynamic Programming: Memoization & Tabulation
#
#
#    Instructions: Dynammic programming takes a lot of practice to recognize as
#                  well as develop algorithms. Thus we will be working on a few
#                  different problems using dynammic programming.
#
#                  As a reminder, here are the two dynamic programing approaches:
#
#        			(1) Overlapping subproblems - Memoization
#        				  Recursion sometimes call subproblems repeatedly. These repeated
#                  calls lead to inefficient computations and an exponential time
#                  complexity.
#
#        			(2) Optimal substructure - Tabulation
#        					The solution of a larger problem can be solved using
#        					solutions of its subproblems.
#
#
#

#
#  1a. What are the two main requirements that determine whether a problem can
#      be solved using dynamic programming? Explain what they mean.
#

# 1) Optimal substructure
#    Recursion sometimes call subproblems repeatedly. These repeated calls lead
#    to inefficient computations and an exponential time complexity.
#
# 2) Overlapping subproblems
#    The most optimal solution of a larger problem can be solved using optimal
#    solutions of its subproblems. "optimal" solution means the most accurate or
#    best solution.

#
#  1b. What is the top down approach to dynammic programming called?
#

# Memoization

#
#  1c. What is the bottom up approach to dynammic programming called?
#

# Tabulation



#  Problem 2: Lattice Paths (Dynamic Programming Approach)
#
#  Prompt:    Count the number of unique paths to travel from the top left
#             to the bottom right of a lattice of squares.
#
#  Input:     An interger N (which is the size of the lattice)
#  Output:    An interger (which represents the number of unique paths)
#
#  Example:   input: 2
#
#             (2 x 2 lattice of squares)
#              __ __
#             |__|__|
#             |__|__|
#
#             output: 6 (number of unique paths from top left corner to bottom
#                     right)
#
#  Notes:     What is the time and auxilliary space complexity of your solution?
#
#             When moving through the lattice, you can only move either down or
#             to the right.
#
#             You did this problem before with recursion. Try implementing it
#             now with dynamic programming!
#
#  Resources:
#    1: https://projecteuler.net/problem=15
#    2: https://en.wikipedia.org/wiki/Lattice_path
#
#


# Time Complexity: O(N)
# Auxiliary Space Complexity: O(N)
# Lattice Paths
def lattice_paths(m, n)
  cache = [1]
  larger = [m, n].max
  smaller = [m,n].min
  while cache.length <= larger
    for i in 1...cache.length
      cache[i] += cache[i - 1]
    end
    cache.push(2 * cache[cache.length - 1])
  end
  cache[smaller]
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


puts 'Lattice Paths Tests'
test_count = [0, 0]

def test()
  example = lattice_paths(2, 3)
  return example == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work for a 2 x 3 lattice', test)

def test()
  example = lattice_paths(3, 2)
  return example == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return the same for a 3 x 2 lattice', test)

def test()
  example = lattice_paths(0, 0)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 1 for a 0 x 0 lattice', test)

def test()
  example = lattice_paths(20, 15)
  return example == 3247943160
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work for a 20 x 15 lattice (large input)', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
