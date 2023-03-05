/*
*  Homework - Matrices
*
*  Prompt: Create a Matrix class
*
*  The Matrix will take in the following input:
*
*               m:    {Integer} - represents the number of ROWS
*               n:    {Integer} - represent the number of COLUMNS
*
*  The Matrix will have the following properties:
*
*         storage:    {Array of Arrays of Integers} - stores of numbers within matrix
*               m:    {Integer} - represents the number of ROWS
*               n:    {Integer} - represent the number of COLUMNS
*
*  The Matrix will have the following methods:
*
*          isValid:   checks whether given coordinates are within the matrix
*
*                   Input:      i {Integer} - row index
*                   Input:      j {Integer} - column index
*                  Output:        {Boolean}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.isValid(1, 1)
*
*                 result == true
*
*                 matrix.isValid(100, 1)
*
*                 result == false
*
*
*       reinitialize:   takes in a valid array/vector of arrayOfArrays, and
*
*                   Input: arrayOfArrays {Array/vector of Arrays/vectors of Integers}
*
*                  Output:        {undefined / void}
*
*                 Example:
*
*                 matrix.intitialize([[0, 1, 2],
*                                     [3, 4, 5],
*                                     [6, 7, 8]])
*
*
*                 result:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.m == 3
*
*                 matrix.n == 3
*
*
*            print:   optional method to print the contents of a matrix's storage
*                     prints each row of the matrix on a new line.
*
*                   Input: N/A {undefined / void}
*
*                  Output:        {undefined / void}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*
*                 console:
*
*                 [0, 1, 2]
*                 [3, 4, 5]
*                 [6, 7, 8]
*
*
*           insert:   inserts an integer into the given coordinates
*                    returns true if insertion was successful
*                    returns false otherwise
*
*                   Input:      i {Integer}
*                   Input:      j {Integer}
*                   Input:    val {Integer}
*                  Output:        {Boolean}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.insert(1, 1, 400)
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 400, 5],
*                                    [6, 7, 8]]
*
*                 result == true
*
*
*                 matrix.insert(100, 1, 400)
*
*                 matrix.storage = [[0, 1, 2],
*                                   [3, 4, 5],
*                                   [6, 7, 8]]
*
*                 result == false
*
*
*         retrieve:   returns value stored at given coordinates
*                     returns -Infinity/INT_MIN if coordinates are invalid
*
*                   Input:      i {Integer} - row index
*                   Input:      j {Integer} - column index
*                  Output:        {Integer}
*
*                  Example:
*
*                  matrix.storage == [[0, 1, 2],
*                                     [3, 4, 5],
*                                     [6, 7, 8]]
*
*                  matrix.retrieve(1, 1)
*
*                  result == 4
*
*
*            scale:   multiplies every value in the matrix by some constant factor
*                     returns undefined / void
*
*                    Input:  factor {Integer} - amount each entry will be multiplied by
*                    Output:         {undefined}
*
*                   Example:
*
*                   matrix.storage == [[1, 1, 1],
*                                      [1, 1, 1],
*                                      [1, 1, 1]]
*
*                   matrix.scale(5)
*
*                   matrix.storage == [[5, 5, 5],
*                                      [5, 5, 5],
*                                      [5, 5, 5]]
*
*
*             fill:   sets every entry in the matrix equal to input value
*                     returns undefined / void
*
*                   Input:     val {Integer} - value to be inserted throughout matrix
*                  Output:         {undefined}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.fill(1)
*
*                 matrix.storage == [[1, 1, 1],
*                                    [1, 1, 1],
*                                    [1, 1, 1]]
*
*
*          flatten:   returns an array/vector containing all the elements in the matrix if traversed row by row
*
*                   Input:      N/A
*                  Output:     {Array/vector of Integers}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.flatten()
*
*                 result == [0, 1, 2, 3, 4, 5, 6, 7, 8]
*
*
*            slice:   returns a new Matrix representing a subset of the original matrix
*                     it's rows are bounded by the first two-element array input
*                     it's columns are bounded by the second two-element array input
*
*                     NOTE: If the rowRange or colRange is larger than the original matrix
*                           just return the bounds of the original matrix
*
*                     NOTE: Think about how much you'll have to offset insertions into the new matrix
*
*                    Input:      rowRange {Array of Two Integers}
*                    Input:      colRange {Array of Two Integers}
*                   Output:     {Matrix}
*
*                 Example:
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix.slice([0, 2], [0, 2])
*
*                 result == [[0, 1],
*                            [3, 4]]
*
*
*        transpose:   returns a new Matrix representing the transpose of the original matrix
*                     The transpose of a matrix is like flipping a matrix along its diagonal axis
*
*                     Link to Wikipedia:
*                     NOTE: if the original matrix was M x N, the new one will be N x M
*
*                    Input:      N/A
*                   Output:     {Matrix}
*
*                 matrix.storage == [[0, 1, 2],
*                                    [3, 4, 5]]
*
*                 matrix.transpose()
*
*                 result == [[0, 3],
*                            [1, 4],
*                            [2, 5]]
*
*
*
*         mulitply:   returns a new Matrix representing the matrix multiplication of original matrix
*                     by the input matrix.
*
*                     Link to Wikipedia:
*                     NOTE: if the original matrix was M x N, the input one MUST be N x K
*                           the result matrix will then be M x K dimensions
*
*                    Input:      matrix {Matrix}
*                   Output:     {Matrix}
*
*                 matrix.storage == [[4, 1, 3],
*                                    [3, 2, 5]]
*
*                 matrix.multiply([[8, 9],
*                                  [7, 10],
*                                  [0, 6]])
*
*                 result == [[39, 64],
*                            [38, 77]]
*
*                 Reasoning:
*                          [[(4 * 8) + (1 * 7) + (3 * 0),    (4 * 9) + (1 * 10) + (3 * 6)],
*
*                           [(3 * 8) + (2 * 7) + (5 * 0),    (3 * 9) + (2 * 10) + (5 * 6)]]
*
*
*                      =>  [[32 + 7 + 0,   36 + 10 + 18],
*
*                           [24 + 14 + 0,  27 + 20 + 30]]
*
*
*                      =>  [[39, 64],
*                           [38, 77]]
*/


package main
import (
  "fmt"
  "strconv"
  "math"
)


type Matrix struct {
  m,n int
  storage [][]int
}

func (matrix *Matrix) Init(m,n int) *Matrix {
  matrix.m = m
  matrix.n = n
  matrix.storage = make([][]int, m)
  for col := 0; col < m; col++ {
    matrix.storage[col] = make([]int, n)
  }
  return matrix
}

func (matrix *Matrix) print() {
  // YOUR WORK HERE
}

func (matrix *Matrix) isValid(i, j int) bool {
  // YOUR WORK HERE
  return false
}

func (matrix *Matrix) reinitialize(arrayOfArrays [][]int) {
  // YOUR WORK HERE
}


func (matrix *Matrix) insert(i,j,val int) bool {
  // YOUR WORK HERE
  return false
}

func (matrix *Matrix) retrieve(i,j int) int {
  // YOUR WORK HERE
  return math.MinInt64
}


func (matrix *Matrix) scale(factor int) {
  // YOUR WORK HERE
}


func (matrix *Matrix) fill(val int) {
  // YOUR WORK HERE
}


func (matrix *Matrix) flatten() []int {
  // YOUR WORK HERE
  return []int{}
}


func (matrix *Matrix) slice(rowRange, colRange []int) *Matrix {
  // YOUR WORK HERE
  return nil
}


func (matrix *Matrix) transpose() *Matrix {
  // YOUR WORK HERE
  return nil
}

func (matrix *Matrix) multiply(matrix2 *Matrix) *Matrix{
  // YOUR WORK HERE
  return nil
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  isValidTests()
  initializeTests()
  insertTests()
  retrieveTests()
  scaleTests()
  fillTests()
  flattenTests()
  sliceTests()
  transposeTests()
  multiplyTests()
}

func isValidTests() {
  testCount := []int{0,0}
  fmt.Println("IsValid Tests")
  runTest(isValidTest1, "should return true for a valid set of coordinates", testCount)
  runTest(isValidTest2, "should return false for a set of coordinates off the matrix", testCount)
  runTest(isValidTest3, "should return false for a negative set of coordinates", testCount)
  printTestsPassed(testCount)
}


func initializeTests() {
  testCount := []int{0,0}
  fmt.Println("Reinitialize Tests")
  runTest(reinitializeTest1, "should override m and n values in old matrix", testCount)
  runTest(reinitializeTest2, "should override contents of old matrix", testCount)
  printTestsPassed(testCount)
}

func insertTests() {
  testCount := []int{0,0}
  fmt.Println("Insert Tests")
  runTest(insertTest1, "should return true if given valid coordinates", testCount)
  runTest(insertTest2, "should override old value in matrix given valid coordinates", testCount)
  runTest(insertTest3, "should return false if given invalid coordinates", testCount)
  printTestsPassed(testCount)
}

func retrieveTests() {
  testCount := []int{0,0}
  fmt.Println("Retrieve Tests")
  runTest(retrieveTest1, "should return correct value if given valid coordinates", testCount)
  runTest(retrieveTest2, "should return int.MinValue if given invalid coordinates", testCount)
  printTestsPassed(testCount)
}

func scaleTests() {
  testCount := []int{0,0}
  fmt.Println("Scale Tests")
  runTest(scaleTest1, "should scale values in matrix by amount given", testCount)
  runTest(scaleTest2, "should scale values in matrix by amount given", testCount)
  printTestsPassed(testCount)
}

func fillTests() {
  testCount := []int{0,0}
  fmt.Println("Fill Tests")
  runTest(fillTest1, "should set all values in the matrix to given amount", testCount)
  printTestsPassed(testCount)
}

func flattenTests() {
  testCount := []int{0,0}
  fmt.Println("Flatten Tests")
  runTest(flattenTest1, "should work for a single column matrix", testCount)
  runTest(flattenTest2, "should work for a single row matrix", testCount)
  runTest(flattenTest3, "should work for example matrix", testCount)
  printTestsPassed(testCount)
}

func sliceTests() {
  testCount := []int{0,0}
  fmt.Println("Slice Tests")
  runTest(sliceTest1, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [0,2] and colRange is [0,2]", testCount)
  runTest(sliceTest2, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [1,3] and colRange is [1,3]", testCount)
  runTest(sliceTest3, "should return copy of original matrix if rowRange and colRange are larger than original", testCount)
  printTestsPassed(testCount)
}

func transposeTests() {
  testCount := []int{0,0}
  fmt.Println("Transpose Tests")
  runTest(transposeTest1, "should work correctly on a 1x1 matrix", testCount)
  runTest(transposeTest2, "should work correctly on a 2x2 matrix", testCount)
  runTest(transposeTest3, "should work correctly on a 3x2 matrix", testCount)
  runTest(transposeTest4, "should work correctly on a 2x3 matrix", testCount)
  printTestsPassed(testCount)
}

func multiplyTests() {
  testCount := []int{0,0}
  fmt.Println("Multiply Tests")
  runTest(multiplyTest1, "should work correctly on example matrix with valid input", testCount)
  runTest(multiplyTest2, "should work correctly on example matrix with invalid input of wrong dimensions", testCount)
  runTest(multiplyTest3, "should work correctly on example matrix when multiplied by 3x1 matrix", testCount)
  runTest(multiplyTest4, "should work correctly when 1x2 matrix is multiplied by example matrix", testCount)
  printTestsPassed(testCount)
}



func isValidTest1() bool {
 matrix := new(Matrix).Init(3, 4)
 return matrix.isValid(1, 1)
}


func isValidTest2() bool {
 matrix := new(Matrix).Init(3, 4)
 return !matrix.isValid(5, 1)
}

func isValidTest3() bool {
 matrix := new(Matrix).Init(3, 4)
 return !matrix.isValid(-4, 1)
}


func reinitializeTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1, 2, 3}, {4, 5, 6}})
  return matrix.m == 2 && matrix.n == 3
}

func reinitializeTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1, 2}, {3, 4}})
  storage := matrix.storage
  return storage != nil && len(storage) == 2 && len(storage[0]) == 2 &&
    storage[0][0] == 1 && storage[0][1] == 2 && storage[1][0] == 3 && storage[1][1] == 4
}



func insertTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1, 2, 3}, {4, 5, 6}})
  return matrix.insert(1, 1, 50)
}

func insertTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1, 2, 3}, {4, 5, 6}})
  return matrix.insert(1, 1, 50) && matrix.storage[1][1] == 50
}

func insertTest3() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1, 2, 3}, {4, 5, 6}})
  return !matrix.insert(5, 5, 10)
}



func retrieveTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2},{3, 4, 5},{6, 7, 8}})
  return matrix.retrieve(1, 1) == 4
}

func retrieveTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2},{3, 4, 5},{6, 7, 8}})
  return matrix.retrieve(10, 10) == math.MinInt64
}



func scaleTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1},{3, 4}})
  matrix.scale(2)
  storage := matrix.storage
  return len(storage) == 2 && len(storage[0]) == 2 &&
        storage[0][0] == 0 &&  storage[0][1] == 2 &&
        storage[1][0] == 6 &&  storage[1][1] == 8
}

func scaleTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1},{3, 4}})
  matrix.scale(-3)
  storage := matrix.storage
  return len(storage) == 2 && len(storage[0]) == 2 &&
        storage[0][0] == 0 && storage[0][1] == -3 &&
        storage[1][0] == -9 && storage[1][1] == -12
}



func fillTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1},{3, 4}})
  matrix.fill(2)
  storage := matrix.storage
  return len(storage) == 2 && len(storage[0]) == 2 &&
        storage[0][0] == 2 &&  storage[0][1] == 2 &&
        storage[1][0] == 2 &&  storage[1][1] == 2
}



func flattenTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0}, {1}, {3}, {4}})
  return arrayEquals(matrix.flatten() ,[]int{0, 1, 3, 4})
}

func flattenTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 3, 4}})
  return arrayEquals(matrix.flatten() ,[]int{0, 1, 3, 4})
}

func flattenTest3() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}})
  return arrayEquals(matrix.flatten() ,[]int{0, 1, 2, 3, 4, 5, 6, 7, 8})
}



func sliceTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}})
  newMatrix := matrix.slice([]int{0,2}, []int{0,2})
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 && newMatrix.storage[0][0] == 0 &&
          newMatrix.storage[0][1] == 1 && newMatrix.storage[1][0] == 3 && newMatrix.storage[1][1] == 4
}

func sliceTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}})
  newMatrix := matrix.slice([]int{1,3}, []int{1,3})
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 && newMatrix.storage[0][0] == 4 &&
          newMatrix.storage[0][1] == 5 && newMatrix.storage[1][0] == 7 && newMatrix.storage[1][1] == 8
}

func sliceTest3() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}})
  newMatrix := matrix.slice([]int{-5,20}, []int{-2,6})
  return newMatrix != nil && array2DEquals(matrix.storage, newMatrix.storage)
}



func transposeTest1() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{1}})
  newMatrix := matrix.transpose()
  return newMatrix != nil && newMatrix.m == 1 && newMatrix.n == 1 &&
        newMatrix.storage[0][0] == 1
}

func transposeTest2() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1}, {2, 3}})
  newMatrix := matrix.transpose()
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 && newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 2 &&
          newMatrix.storage[1][0] == 1 && newMatrix.storage[1][1] == 3
}

func transposeTest3() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1}, {3, 4}, {6, 7}})
  newMatrix := matrix.transpose()
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 3 && newMatrix.storage[0][0] == 0 &&
          newMatrix.storage[0][1] == 3 && newMatrix.storage[0][2] == 6 && newMatrix.storage[1][0] == 1 &&
          newMatrix.storage[1][1] == 4 && newMatrix.storage[1][2] == 7
}

func transposeTest4() bool {
  matrix := new(Matrix).Init(1, 1)
  matrix.reinitialize([][]int{{0, 1, 3}, {4, 6, 7}})
  newMatrix := matrix.transpose()
  return newMatrix != nil && newMatrix.m == 3 && newMatrix.n == 2 && newMatrix.storage[0][0] == 0 &&
          newMatrix.storage[0][1] == 4 && newMatrix.storage[1][0] == 1 && newMatrix.storage[1][1] == 6 &&
          newMatrix.storage[2][0] == 3 && newMatrix.storage[2][1] == 7
}


func multiplyTest1() bool {
  matrix1 := new(Matrix).Init(1, 1)
  matrix2 := new(Matrix).Init(1, 1)
  matrix1.reinitialize([][]int{{4, 1, 3},
                                {3, 2, 5}})
  matrix2.reinitialize([][]int{{8, 9},
                                {7, 10},
                                {0, 6}})
  newMatrix := matrix1.multiply(matrix2)
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 && newMatrix.storage[0][0] == 39 &&
          newMatrix.storage[0][1] == 64 && newMatrix.storage[1][0] == 38 && newMatrix.storage[1][1] == 77
}

func multiplyTest2() bool {
  matrix1 := new(Matrix).Init(1, 1)
  matrix2 := new(Matrix).Init(1, 1)
  matrix1.reinitialize([][]int{{4, 1, 3},
                                {3, 2, 5}})
  matrix2.reinitialize([][]int{{8}})
  newMatrix := matrix1.multiply(matrix2)
  return newMatrix == nil
}

func multiplyTest3() bool {
  matrix1 := new(Matrix).Init(1, 1)
  matrix2 := new(Matrix).Init(1, 1)
  matrix1.reinitialize([][]int{{4, 1, 3},
                                {3, 2, 5}})
  matrix2.reinitialize([][]int{{8}, {1}, {2}})
  newMatrix := matrix1.multiply(matrix2)
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 1 && newMatrix.storage[0][0] == 39 && newMatrix.storage[1][0] == 36
}

func multiplyTest4() bool {
  matrix1 := new(Matrix).Init(1, 1)
  matrix2 := new(Matrix).Init(1, 1)
  matrix1.reinitialize([][]int{{4, 1, 3},
                                {3, 2, 5}})
  matrix2.reinitialize([][]int{{3, 5}})
  newMatrix := matrix2.multiply(matrix1)
  return newMatrix != nil && newMatrix.m == 1 && newMatrix.n == 3 && newMatrix.storage[0][0] == 27 &&
          newMatrix.storage[0][1] == 13 && newMatrix.storage[0][2] == 34
}

// DO NOT TOUCH FUNCTIONS BELOW


// function for checking if 2d arrays contain same elements in the same order
func arrayEquals(arr1, arr2 []int) bool {
  if len(arr1) != len(arr2) { return false }
  for i := 0; i < len(arr1); i++ {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}

func array2DEquals(arr1, arr2 [][]int) bool {
   if len(arr1) != len(arr2) { return false }
   for i := 0; i < len(arr1); i++ {
     if !arrayEquals(arr1[i], arr2[i]) {
       return false
     }
   }
   return true
 }



func max(a,b int) int {
  if(a > b) { return a }
  return b
}

func min(a,b int) int {
  if(a > b) { return b }
  return a
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
