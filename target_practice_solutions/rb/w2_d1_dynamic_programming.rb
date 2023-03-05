# Target Practice - Dynamic Programming pt. 2
#
# Minimum Window Substring (Sliding Window)
#
# Given a string, and a set of characters
# return the substring representing the SMALLEST
# window containing those characters.
#
# The characters needn't appear in the order in which they are given.
#
# If not all the characters are present in the string, return the empty string.
#
#
# Input: str   (String)
#        chars (String)
#
# Output: {String}
#
#
# Example:
#  Input: "ADOBECODEBANC", "ABC"
#  Output: "BANC"
#
#  Input: "HELLO WORLD", "FOO"
#  Output: ""
#
#
# Explanation:
#
# Though there are many substrings containing all the characters
# "BANC" is the shortest.
#
# Assume that there won't be repeated characters in the second string input.
#
# Ignore capitalization.
# (though taking it into account doesn't change the solution much)
#
# But as extra credit, how would you handle repeats?
# Meaning if you were given two "A" characters, a valid window MUST
# contain two "A"s

def minimum_window_substring(string, target)
  infinity = 1.0/0
  result = [0, infinity]

  counts = {}
  missing_characters = target.length

  # Create counts dictionary
  target.each_char { |c|
    counts[c] = 0
  }

  slow = 0

  string.split("").each_index { |fast|
    if counts.key?(string[fast])
      if counts[string[fast]] == 0
        missing_characters -= 1
      end
      counts[string[fast]] += 1
    end


    while (missing_characters == 0)
      if (fast - slow) < result[1] - result[0]
        result[0] = slow
        result[1] = fast
      end
      if counts.key?(string[slow])
        counts[string[slow]] -= 1
        if (counts[string[slow]] == 0)
          missing_characters += 1
        end
      end
      slow += 1
    end
  }
  if result[1] == infinity
    return ""
  end
  string[result[0], result[1]]

end




#  Problem 2: Dungeon Escape
#
#  Given a matrix of integers that represents rooms in a dungeon,
#  determine the minimum amount of health a adventurer must start with
#  in order to escape the dungeon
#
#  The adventurer starts at the upper left corner of the matrix, and
#  the exit is located at the bottom right corner.
#
#  The adventurer must leave the dungeon before sundown, so in the
#  interest of time, this brave adventurer decides to only travel
#  downwards and to the right
#
#  Negative integers represent rooms with monsters, so the adventurer
#  would lose health when going though these rooms. 0s represent empty
#  rooms, and positive integers represent rooms that contain health
#  pots that will increase the adventurer's health
#
#
#  Input:  dungeon {Integer[][]}
#  Output: {Integer}
#
#
# Example:
#  Input:  [[ -2, -5, 10],
#           [ -3,-10, 30],
#           [  3,  1, -5]]
#
#  Output: 7 (The steps to do this would be down, down, right, right)
#
#
#    Note: The initial health should be represented by a positve integers
#          If the health ever drops to zero or a negative integer, the
#          adventurer dies.
#          Every room will contain an integer. It will either be empty (0),
#          contain a monster (negative), or contain a health pot (positive).
#          You could create every single possible path, but there is of course
#          a dynamic programming approach to not go with this route.
#
#

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(1)


def dungeon_escape(dungeon)
  yBound = dungeon.length
  xBound = dungeon[0].length

  # bottom right corner
  dungeon[yBound - 1][xBound - 1] = [1 - dungeon[yBound - 1][xBound - 1], 1].max

  # bottom row
  (xBound - 2).step(0, -1) do |x|
    dungeon[yBound - 1][x] = [dungeon[yBound - 1][x + 1] - dungeon[yBound - 1][x], 1].max
  end

  # right column
  (yBound - 2).step(0, -1) do |y|
    dungeon[y][xBound - 1] = [dungeon[y + 1][xBound - 1] - dungeon[y][xBound - 1], 1].max
  end

  (yBound - 2).step(0, -1) do |y|
    (xBound - 2).step(0, -1) do |x|
      from_right = [dungeon[y][x + 1] - dungeon[y][x], 1].max
      from_below = [dungeon[y + 1][x] - dungeon[y][x], 1].max
      dungeon[y][x] = [from_right, from_below].min
    end
  end
  dungeon[0][0]
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




puts 'Minimum Window Substring'
test_count = [0, 0]

def test()
  example = minimum_window_substring("ADOBECODEBANC", "ABC")
  return example == "BANC"
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on first example input', test)

def test()
  example = minimum_window_substring("HELLO WORLD", "FOO")
  return example == ""
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work on second example input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts "\nEscape Dungeon Tests"
test_count = [0, 0]

def test()
  dungeon = [[-2, -5, 10],
             [-3, -10, 30],
             [3, 1, -5]]
  example = dungeon_escape(dungeon)
  return example == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for first example case", test)

def test()
  dungeon = [[5, 1, 10],
             [10, 312, 30],
             [3, 1, 7]]

  example = dungeon_escape(dungeon)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for dungeon filled solely with health potions", test)


def test()
  dungeon = [[0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]]
  example = dungeon_escape(dungeon)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for an empty dungeon", test)

def test()
  dungeon = [[-3, -6, -13],
             [-12, -1, -7],
             [-5, -11, -2]]
  example = dungeon_escape(dungeon)
  return example == 20
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for a dungeon filled only with monsters", test)


def test()
  dungeon = [[-2, 5]]
  example = dungeon_escape(dungeon)
  return example == 3
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for a two-room dungeon starting with a monster", test)


def test()
  dungeon = [[-13, 5]]
  example = dungeon_escape(dungeon)
  return example == 14
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for a two-room dungeon starting with a strong monster", test)


def test()
  dungeon = [[5, -2]]
  example = dungeon_escape(dungeon)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for a two-room dungeon starting with a health pot", test)


def test()
  dungeon = [[5, -8]]
  example = dungeon_escape(dungeon)
  return example == 4
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for a two-room dungeon ending in a strong monster", test)


def test()
  dungeon = [[-14]]
  example = dungeon_escape(dungeon)
  return example == 15
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work a dungeon with only a monster", test)


def test()
  dungeon = [[6]]
  example = dungeon_escape(dungeon)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work a dungeon with only a health pot", test)

def test()
  dungeon = [[0]]
  example = dungeon_escape(dungeon)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work a dungeon with a single empty room", test)


puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
