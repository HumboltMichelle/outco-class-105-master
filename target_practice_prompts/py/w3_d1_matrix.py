#
# Target Practice - Matrices
#
#
# Problem 1:  Robot Paths
#
# Prompt:   Given a matrix of zeroes, determine how many unique paths exist
#           from the top left corner to the bottom right corner
#
# Input:    An Array of Array of Integers (matrix)
# Output:   Integer
#
# Example:  matrix = [[0,0,0,0],
#                     [0,0,0,0],
#                     [0,0,0,0]]
#
#           robotPaths(matrix) = 38
#
#
#           matrix = [[0,0,0],
#                     [0,0,0]]
#
#           robotPaths(matrix) = 4

# Note:     From any point, you can travel in the four cardinal directions
#           (north, south, east, west). A path is valid as long as it travels
#           from the top left corner to the bottom right corner, does not go
#           off of the matrix, and does not travel back on itself


def robot_paths(matrix):
    pass


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

def matrix_spiral(input):
    pass

#############################################
########  DO NOT TOUCH TEST BELOW!!!  #######
#############################################

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

print('Robot Paths Tests')
test_count = [0, 0]


def test():
    matrix = [[0, 0, 0, 0],
              [0, 0, 0, 0],
              [0, 0, 0, 0]]
    example = robot_paths(matrix)
    return example == 38


expect(test_count, 'should work on first example input', test)


def test():
    matrix = [[0, 0, 0],
              [0, 0, 0]]
    example = robot_paths(matrix)
    return example == 4


expect(test_count, 'should work on second example input', test)


def test():
    matrix = [[0]]
    example = robot_paths(matrix)
    return example == 1


expect(test_count, 'should work on single-element input', test)


def test():
    matrix = [[0, 0, 0, 0, 0, 0]]
    example = robot_paths(matrix)
    return example == 1


expect(test_count, 'should work on single-row input', test)


def test():
    matrix = [[0],
              [0],
              [0],
              [0],
              [0]]
    example = robot_paths(matrix)
    return example == 1


expect(test_count, 'should work on a 5 x 8 matrix input', test)


def test():
    matrix = [[0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0, 0]]
    print("  Please be patient, test 6 may take longer to run")
    example = robot_paths(matrix)
    return example == 7110272


print('PASSED: ' + str(test_count[0]) + ' / ' + str(test_count[1]) + '\n\n')

print("\nMatrix Spiral")
test_count = [0, 0]


def test():
    matrix = [[]]
    example = matrix_spiral(matrix)
    return example == []


expect(test_count, 'should work on empty matrix input', test)


def test():
    matrix = [[1]]
    example = matrix_spiral(matrix)
    return example == [1]


expect(test_count, "should work on single element matrix input", test)


def test():
    matrix = [[1],
              [2],
              [3],
              [4],
              [5]]
    example = matrix_spiral(matrix)
    return example == [1, 2, 3, 4, 5]


expect(test_count, "should work on single column matrix input", test)


def test():
    matrix = [[1, 2],
              [4, 3]]
    example = matrix_spiral(matrix)
    return example == [1, 2, 3, 4]


expect(test_count, "should work on square matrix input", test)


def test():
    matrix = [[1, 2, 3, 4]]
    example = matrix_spiral(matrix)
    return example == [1, 2, 3, 4]


expect(test_count, "should work on single row matrix input", test)


def test():
    matrix = [[ 1,  2,  3],
              [ 4,  5,  6],
              [ 7,  8,  9],
              [10, 11, 12],
              [13, 14, 15]]
    example = matrix_spiral(matrix)
    return example == [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]


expect(test_count, "should work on 3 x 5 matrix input", test)


def test():
    matrix = [[  1,  2,  3,  4, 5],
              [ 12, 13, 14, 15, 6],
              [ 11, 10,  9,  8, 7]]
    example = matrix_spiral(matrix)
    return example == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]


expect(test_count, "should work on 5 x 3 matrix input", test)

print('PASSED: ' + str(test_count[0]) + ' / ' + str(test_count[1]) + '\n\n')
