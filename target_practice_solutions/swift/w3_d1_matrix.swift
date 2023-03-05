/*
* Target Practice - Matrix
*
*  Problem 1:  Robot Paths
*
*  Prompt:   Given a matrix of zeroes, determine how many unique paths exist
*            from the top left corner to the bottom right corner
*
*  Input:    An Array of Array of Integers (matrix)
*  Output:   Integer
*
*  Example:  matrix = [[0,0,0,0],
*                      [0,0,0,0],
*                      [0,0,0,0]]
*
*            robotPaths(matrix) = 38
*
*
*            matrix = [[0,0,0],
*                      [0,0,0]]
*
*            robotPaths(matrix) = 4
*
*  Note:     From any point, you can travel in the four cardinal directions
*            (north, south, east, west). A path is valid as long as it travels
*            from the top left corner to the bottom right corner, does not go
*            off of the matrix, and does not travel back on itself
*/


func robotPaths(_ matrix: inout [[Int]]) -> Int {
  func traverse(_ x: Int, _ y: Int) -> Int {
    if(x < 0 || y < 0 || x >= matrix[0].count || y >= matrix.count) {
      return 0
    } else if (matrix[y][x] == 1) {
      return 0
    } else if (x == matrix[0].count - 1 && y == matrix.count - 1) {
      return 1
    }

    matrix[y][x] = 1
    var sum = 0
    sum += traverse(x + 1, y)
    sum += traverse(x - 1, y)
    sum += traverse(x, y + 1)
    sum += traverse(x, y - 1)
    matrix[y][x] = 0
    return sum
  }
  return traverse(0, 0)
}


/*
 *  Problem 2: Matrix Spiral
 *
 *  Prompt: Given an (MxN) matrix of integers, return an array in spiral order.
 *
 *
 *  Input:  matrix {Integer[][]}
 *  Output: {Integer}
 *
 *
 * Example:  Input:  [[ 1, 2, 3],
 *                    [ 4, 5, 6],
 *                    [ 7, 8, 9]]
 *
 *  Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
 *
 */


// Time Complexity: O(MN)
// Auxiliary Space Complexity: O(MN)




func matrix_spiral(_ matrix: [[Int]]) -> [Int] {
  if(matrix.count == 0) {return [] }
  var yMin: Int = 0
  var xMin: Int = 0
  var yMax: Int = matrix.count - 1
  var xMax: Int = matrix[0].count - 1
  var results: [Int] = []

  while (xMin <= xMax && yMin <= yMax) {

      for i in stride(from: xMin, through: xMax, by: 1) {
          results.append(matrix[yMin][i])
      }

      yMin += 1
      for i in stride(from: yMin, through: yMax, by: 1) {
          results.append(matrix[i][xMax])
      }
      xMax -= 1
      if(yMin <= yMax){
          for i in stride(from: xMax, through: xMin, by: -1) {
              results.append(matrix[yMax][i])
          }
          yMax -= 1
      }
      if(xMin <= xMax){
          for i in stride(from: yMax, through: yMin, by: -1) {
              results.append(matrix[i][xMin])
          }
          xMin += 1
      }
  }
  return results

}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


// custom assert function to handle tests
// input: count {Array} - keeps track out how many tests pass and how many total
//        in the form of a two item array i.e., [0, 0]
// input: name {String} - describes the test
// input: test {Function} - performs a set of operations and returns a boolean
//        indicating if test passed
// output: {Void}
func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}

print("Robot Paths Tests")
var testCount: [Int] = [0, 0]

assert(&testCount, "should work on first example input", {
  var test: [[Int]] = [[0,0,0,0],
                       [0,0,0,0],
                       [0,0,0,0]]
  let example: Int = robotPaths(&test)
  return example == 38
})

assert(&testCount, "should work on second example input", {
  var test: [[Int]] = [[0,0,0],
                       [0,0,0]]
  let example: Int = robotPaths(&test)
  return example == 4
})

assert(&testCount, "should work on single-element input", {
  var test: [[Int]] = [[0]]
  let example: Int = robotPaths(&test)
  return example == 1
})

assert(&testCount, "should work on single-row input", {
  var test: [[Int]] = [[0,0,0,0,0,0]]
  let example: Int = robotPaths(&test)
  return example == 1
})

assert(&testCount, "should work on single-column input", {
  var test: [[Int]] = [[0],
                       [0],
                       [0],
                       [0],
                       [0]]
  let example: Int = robotPaths(&test)
  return example == 1
})

assert(&testCount, "should work on larger 5x6 matrix input", {
  var test: [[Int]] = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],]
  let example: Int = robotPaths(&test)
  return example == 79384
})

print("PASSED: ", testCount[0], "/", testCount[1], "\n\n")


print("Matrix Spiral Tests")
testCount = [0, 0]


assert(&testCount, "should work for empty matrix input", {
  let test: [[Int]] = [[]]
  let example: [Int] = matrix_spiral(test)
  return example == []
})

assert(&testCount, "should work for single element matrix input", {
  let test: [[Int]] = [[1]]
  let example: [Int] = matrix_spiral(test)
  return example == [1]
})

assert(&testCount, "should work for single column matrix input", {
  let test: [[Int]] = [[1],
                       [2],
                       [3],
                       [4]]
  let example: [Int] = matrix_spiral(test)
  return example == [1, 2, 3, 4]
})

assert(&testCount, "should work for square matrix input", {
  let test: [[Int]] = [[1, 2], [4, 3]]
  let example: [Int] = matrix_spiral(test)
  return example == [1, 2, 3, 4]
})

assert(&testCount, "should work for single row matrix input", {
  let test: [[Int]] = [[1, 2, 3, 4]]
  let example: [Int] = matrix_spiral(test)
  return example == [1, 2, 3, 4]
})

assert(&testCount, "should work for 3 x 5 matrix input", {
  let test: [[Int]] = [[ 1,  2,  3],
                       [ 4,  5,  6],
                       [ 7,  8,  9],
                       [10, 11, 12],
                       [13, 14, 15]]
  let example: [Int] = matrix_spiral(test)
  return example == [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]
})

assert(&testCount, "should work for 5 x 3 matrix input", {
  let test: [[Int]] = [[  1,  2,  3,  4, 5],
                       [ 12, 13, 14, 15, 6],
                       [ 11, 10,  9,  8, 7]]
  let example: [Int] = matrix_spiral(test)
  return example == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
})

print("PASSED: ", testCount[0], "/", testCount[1], "\n\n")
