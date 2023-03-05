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

def minimum_window_substring(S, T):
    # YOUR WORK HERE
    pass


# Problem 2:  Dungeon Escape
#
#             Given a matrix of integers that represents rooms in a dungeon,
#             determine the minimum amount of health a adventurer must start with
#             in order to escape the dungeon
#
#             The adventurer starts at the upper left corner of the matrix, and
#             the exit is located at the bottom right corner.
#
#             The adventurer must leave the dungeon before sundown, so in the
#             interest of time, this brave adventurer decides to only travel
#             downwards and to the right
#
#             Negative integers represent rooms with monsters, so the adventurer
#             would lose health when going though these rooms. 0s represent empty
#             rooms, and positive integers represent rooms that contain health
#             pots that will increase the adventurer's health
#
#
#  Input:     dungeon {Integer[][]}
#  Output:    {Integer}
#
#
# Example:
#  Input:    [[ -2, -5, 10],
#             [ -3,-10, 30],
#             [  3,  1, -5]]
#
#  Output:   7 (The steps to do this would be down, down, right, right)
#
#
#    Note:   The initial health should be represented by a positve integers
#            If the health ever drops to zero or a negative integer, the
#            adventurer dies.
#            Every room will contain an integer. It will either be empty (0),
#            contain a monster (negative), or contain a health pot (positive).
#            You could create every single possible path, but there is of course
#            a dynamic programming approach to not go with this route.
#
#

# Time Complexity:
# Auxiliary Space Complexity:

def dungeon_escape(dungeon):
    # YOUR WORK HERE
    pass

#############################################
########  DO NOT TOUCH TEST BELOW!!!  #######
#############################################
from math import inf

def expect(count, name, test):
    if (count == None or not isinstance(count, list) or len(count) != 2):
        count = [0, 0]
    else:
        count[1] += 1

    result = 'false'
    errMsg = None
    try:
        if test():
            result = ' true'
            count[0] += 1
    except Exception as err:
        errMsg = str(err)

    print('  ' + (str(count[1]) + ')   ') + result + ' : ' + name)
    if errMsg != None:
        print('       ' + errMsg + '\n')

def lists_equal(lst1, lst2):
    if len(lst1) != len(lst2):
        return False
    for i in range(0, len(lst1)):
        if lst1[i] != lst2[i]:
            return False
    return True

print('Minimum Window Substring Tests')
test_count = [0, 0]


def test():
    example = minimum_window_substring("ADOBECODEBANC", "ABC")
    return example == "BANC"


expect(test_count, 'should work on first example case', test)


def test():
    example = minimum_window_substring("HELLO WORLD", "FOO")
    return example == ""


expect(test_count, 'should work on second example case', test)

print('PASSED: ' + str(test_count[0]) + ' / ' + str(test_count[1]) + '\n\n')

print("\nEscape Dungeon tests")
test_count = [0, 0]

def test():
    dungeon = [[-2, -5, 10],
               [-3, -10, 30],
               [3, 1, -5]]

    example = dungeon_escape(dungeon)
    return example == 7

expect(test_count, "should work for first example case", test)

def test():
    dungeon = [[5, 1, 10],
               [10, 312, 30],
               [3, 1, 7]]

    example = dungeon_escape(dungeon)
    return example == 1

expect(test_count, "should work for dungeon filled solely with health potions", test)

def test():
    dungeon = [[0, 0, 0],
               [0, 0, 0],
               [0, 0, 0]]

    example = dungeon_escape(dungeon)
    return example == 1

expect(test_count, "should work for an empty dungeon", test)

def test():
    dungeon = [[-3, -6, -13],
               [-12, -1, -7],
               [-5, -11, -2]]

    example = dungeon_escape(dungeon)
    return example == 20

expect(test_count, "should work for a dungeon filled only with monsters", test)

def test():
    dungeon = [[-2, 5]]
    example = dungeon_escape(dungeon)
    return example == 3

expect(test_count, "should work for a two-room dungeon starting with a monster", test)

def test():
    dungeon = [[-13, 5]]
    example = dungeon_escape(dungeon)
    return example == 14

expect(test_count, "should work for a two-room dungeon starting with a strong monster", test)

def test():
    dungeon = [[5, -2]]
    example = dungeon_escape(dungeon)
    return example == 1

expect(test_count, "should work for a two-room dungeon starting with a health pot", test)

def test():
    dungeon = [[5, -8]]
    example = dungeon_escape(dungeon)
    return example == 4

expect(test_count, "should work for a two-room dungeon ending in a strong monster", test)

def test():
    dungeon = [[-14]]
    example = dungeon_escape(dungeon)
    return example == 15

expect(test_count, "should work a dungeon with only a monster", test)

def test():
    dungeon = [[6]]
    example = dungeon_escape(dungeon)
    return example == 1

expect(test_count, "should work a dungeon with only a health pot", test)

def test():
    dungeon = [[0]]
    example = dungeon_escape(dungeon)
    return example == 1

expect(test_count, "should work a dungeon with a single empty room", test)

print("\nPASSED: " + str(test_count[0]) + '/' + str(test_count[1]))
