#  Target Practice - Recursion
#
#  Problem 1: Power Set - Helper Method Recursion
#
#  Prompt:   Given a set S, return the powerset P(S), which is
#           a set of all subsets of S.
#
#  Input:    A String
#  Output:   An Array of String representing the power set of the input
#
#  Example:  S = "abc", P(S) = ['', 'a', 'b','c','ab','ac','bc','abc']
#
#
#  Note:     The input string will not contain duplicate characters
#           The letters in the subset string must be in the same order
#           as the original input.
#  Hints:
#
#  From Cracking the Coding Interview, by Gayle Laakmann McDowell. 8.4: Powerset
#
#  #273. How can you build all subsets of {a , b, c} from the subsets of {a , b}?
#
#  #290. Anything that is a subset of {a , b} is also a subset of {a , b , c}. Which sets are
#  subsets of {a , b , c} but not {a , b}?
#
#  #338. Subsets that contain c will be subsets {a , b , c} but not {a , b}. Can you build these
#  subsets from the subsets of (a , b}?
#
#  #354. You can build the remaining subsets by adding c to all the subsets of {a , b).
#
#  #373. You can also do this by mapping each subset to a binary number. The i th bit could
#  represent a "boolean" flag for whether an element is in the set.

def powerset(input)
    results = []

    traverse = lambda do |build, depth|
        if(depth == input.length)
          results.push(build)
          return
        end

        traverse.call(build, depth+1)
        traverse.call(build + input[depth], depth+1)
    end

    traverse.call("", 0)
    return results
end


#  Problem 2: Lattice Paths - Pure Recursion
#
#  Prompt:  Count the number of unique paths to travel from the top left
#           corder to the bottom right corner of a lattice of M x N squares.
#
#           When moving through the lattice, one can only travel to the
#           adjacent corner on the right or down.
#
#  Input:   m {Integer} - rows of squares
#  Input:   n {Integer} - column of squares
#  Output:  {Integer}
#
#  Example: input: (2, 3)
#
#           (2 x 3 lattice of squares)
#            __ __ __
#           |__|__|__|
#           |__|__|__|
#
#           output: 10 (number of unique paths from top left corner to bottom right)
#
#  Resource: https://projecteuler.net/problem=15
#

# Time Complexity: O(2^(M+N))
# Auxiliary Space Complexity: O(M+N)
def lattice_paths(m, n)
  return 1 if m == 0 && n == 0
  return 0 if m < 0 || n < 0
  return lattice_paths(m - 1, n) + lattice_paths(m, n - 1)
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

# code for checking if arrays contain the same elements
# (do not need to be in the same order)
def arrays_matching(arr1, arr2)
  if arr1.length != arr2.length
    return false
  else
    lib = {}
    for i in 0..arr1.length-1
      lib[arr1[i]] = true
    end
    for j in 0..arr2.length-1
      if lib[arr2[j]] == nil
        return false
      end
    end
    return true
  end
end

puts 'Example Ruby Tests'
test_count = [0, 0]

def test()
  example = powerset('abc')
  return arrays_matching(example, ['','a','b','c','ab','bc','ac','abc'])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on example input', test)

def test()
  example = powerset('')
  return arrays_matching(example, [''])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on empty input', test)

def test()
  example = powerset('ab')
  return arrays_matching(example, ['','a','b','ab'])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on two-letter input', test)

def test()
  example = powerset('abcdefg')
  return arrays_matching(example, [ '','g','f','fg','e','eg','ef','efg','d',
    'dg','df','dfg','de','deg','def','defg','c','cg','cf','cfg','ce','ceg',
    'cef','cefg','cd','cdg','cdf','cdfg','cde','cdeg','cdef','cdefg','b','bg',
    'bf','bfg','be','beg','bef','befg','bd','bdg','bdf','bdfg','bde','bdeg',
    'bdef','bdefg','bc','bcg','bcf','bcfg','bce','bceg','bcef','bcefg','bcd',
    'bcdg','bcdf','bcdfg','bcde','bcdeg','bcdef','bcdefg','a','ag','af','afg',
    'ae','aeg','aef','aefg','ad','adg','adf','adfg','ade','adeg','adef',
    'adefg','ac','acg','acf','acfg','ace','aceg','acef','acefg','acd','acdg',
    'acdf','acdfg','acde','acdeg','acdef','acdefg','ab','abg','abf','abfg',
    'abe','abeg','abef','abefg','abd','abdg','abdf','abdfg','abde','abdeg',
    'abdef','abdefg','abc','abcg','abcf','abcfg','abce','abceg','abcef',
    'abcefg','abcd','abcdg','abcdf','abcdfg','abcde','abcdeg','abcdef','abcdefg' ])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on longer input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Lattice Paths Tests'
test_count = [0, 0]

def test()
  example = lattice_paths(2, 3)
  return example == 10
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on example case', test)

def test()
  example = lattice_paths(0, 0)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 1 for 0 x 0 lattice', test)

def test()
  example = lattice_paths(11, 13)
  return example == 2496144
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 2496144 for 13 x 11 lattice', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
