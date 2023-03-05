/*
 * Target Practice - Matrices
 *
 */

package main
import (
  "fmt"
  "strconv"
)

/*
 *  Problem 1:  Robot Paths
 *
 *  Prompt:   Given a matrix of zeroes, determine how many unique paths exist
 *            from the top left corner to the bottom right corner
 *
 *  Input:    An Array of Array of ints (matrix)
 *  Output:   int
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

func robotPaths(matrix [][]int) int {
  // YOUR WORK HERE
  return -1
}




/*
*  Problem 2: Matrix Spiral
*
*  Given an (MxN) matrix of integers, return an array in spiral order.
*
*
*  Input:  matrix {[][]int}
*  Output: {int}
*
*
* Example:
*  Input:  [[ 1, 2, 3],
*           [ 4, 5, 6],
*           [ 7, 8, 9]]
*
*  Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
*
*/

// Time Complexity:
// Auxiliary Space Complexity:
func matrixSpiral(matrix [][]int) []int {
   //YOUR WORK HERE
   return []int{}
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  robotPathsTests()
  matrixSpiralTests()
}

func robotPathsTests() {
  testCount := []int{0,0}
  fmt.Println("Robot Paths Tests")
  runTest(robotPathsTest1, "should work on example input", testCount)
  runTest(robotPathsTest2, "should work on second example input", testCount)
  runTest(robotPathsTest3, "should work on single-element input", testCount)
  runTest(robotPathsTest4, "should work on single-row input", testCount)
  runTest(robotPathsTest5, "should work on single-column input", testCount)
  runTest(robotPathsTest6, "should work on a 5 x 8 matrix input", testCount)
  printTestsPassed(testCount)
}

func matrixSpiralTests() {
  testCount := []int{0,0}
  fmt.Println("Matrix Spiral Tests")
  runTest(matrixSpiralTest1, "should work for empty matrix input", testCount)
  runTest(matrixSpiralTest2, "should work for single element matrix input", testCount)
  runTest(matrixSpiralTest3, "should work for single column matrix input", testCount)
  runTest(matrixSpiralTest4, "should work for square matrix input", testCount)
  runTest(matrixSpiralTest5, "should work for single row matrix input", testCount)
  runTest(matrixSpiralTest6, "should work on 3 x 5 matrix input", testCount)
  runTest(matrixSpiralTest7, "should work on 5 x 3 matrix input", testCount)
  printTestsPassed(testCount)
}

func robotPathsTest1() bool {
  var matrix [][]int = createZeroMatrix(3,4)
  return robotPaths(matrix) == 38
}

func robotPathsTest2() bool {
  var matrix [][]int = createZeroMatrix(2,3)
  return robotPaths(matrix) == 4
}

func robotPathsTest3() bool {
  var matrix [][]int = createZeroMatrix(1,1)
  return robotPaths(matrix) == 1
}

func robotPathsTest4() bool {
  var matrix [][]int = createZeroMatrix(1,6)
  return robotPaths(matrix) == 1
}

func robotPathsTest5() bool {
  var matrix [][]int = createZeroMatrix(5,1)
  return robotPaths(matrix) == 1
}

func robotPathsTest6() bool {
  var matrix [][]int = createZeroMatrix(5,8)
  fmt.Println("Please be patient, test 6 may take longer to run")
  return robotPaths(matrix) == 7110272
}



func matrixSpiralTest1() bool {
  matrix := [][]int{{}}
  var test []int = matrixSpiral(matrix)
  expected := []int{}
  return equalIntArr(test, expected)
}

func matrixSpiralTest2() bool {
  matrix := [][]int{{1}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1}
  return equalIntArr(test, expected)
}

func matrixSpiralTest3() bool {
  matrix := [][]int{{1},
                        {2},
                        {3},
                        {4},
                        {5}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1, 2, 3, 4, 5}
  return equalIntArr(test, expected)
}

func matrixSpiralTest4() bool {
  matrix := [][]int{{1, 2},
                        {4, 3}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1, 2, 3, 4}
  return equalIntArr(test, expected)
}

func matrixSpiralTest5() bool {
  matrix := [][]int{{1, 2, 3, 4}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1, 2, 3, 4}
  return equalIntArr(test, expected)
}

func matrixSpiralTest6() bool {
  matrix := [][]int{{1, 2, 3},
                    {4, 5, 6},
                    {7, 8, 9},
                    {10, 11, 12},
                    {13, 14, 15}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11}
  return equalIntArr(test, expected)
}

func matrixSpiralTest7() bool {
  matrix := [][]int{{1, 2, 3, 4, 5},
                    {12, 13, 14, 15, 6},
                    {11, 10, 9, 8, 7}}
  var test []int = matrixSpiral(matrix)
  expected := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
  return equalIntArr(test, expected)
}



/*** Utility Functions ***/
func createZeroMatrix(rows int, cols int) [][]int {
  matrix := make([][]int, rows)
  for i:=0; i<rows; i++ {
    matrix[i] = make([]int, cols)
  }
  return matrix
}

func equalIntArr(list1 []int, list2 []int) bool {
  if(len(list1) != len(list2)) {
    return false
  }
  for i := 0; i < len(list1) ; i++ {
    if(list1[i] != list2[i]) {
      return false
    }
  }
  return true
}

func runTest(test func() bool, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = test()
  if(testPassed) {testCount[0]++}
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
  fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
