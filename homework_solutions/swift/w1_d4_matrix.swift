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
*       initialize:   takes in a valid array of arrayOfArrays, and
*
*                   Input: arrayOfArrays {Array of Arrays of Integers}
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
*                     returns -Infinity / int.MinValue if coordinates are invalid
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
*          flatten:   returns an array containing all the elements in the matrix if traversed row by row
*
*                   Input:      N/A
*                  Output:     {Array of Integers}
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

class Matrix {
  var m: Int
  var n: Int
  var storage: [[Int]] = []

  init(m: Int, n: Int) {
    self.m = m
    self.n = n
    for _ in 1...self.m {
      var row = [Int]()
      for _ in 1...self.n {
        row.append(0)
      }
      self.storage.append(row)
    }
  }

  func print() {
      Swift.print(self.storage)
  }

  func isValid(i: Int, j: Int) -> Bool {
    if i < 0 || j < 0 || i >= self.m || j >= self.n {
      return false
    }
    return true
  }


  func initialize(arrayOfArrays: [[Int]]) {
    self.storage = arrayOfArrays;
    self.m = arrayOfArrays.count;
    self.n = arrayOfArrays[0].count;
  }

  @discardableResult func insert(i: Int, j: Int, val: Int) -> Bool {
    if self.isValid(i: i, j: j) {
      self.storage[i][j] = val
      return true
    }
    return false
  }


  func retrieve(i: Int, j: Int) -> Int {
    if self.isValid(i: i, j: j) {
      return self.storage[i][j]
    }
    return Int.min
  }

  func scale(factor: Int) {
    var newVal: Int
    for i in 0...self.m-1 {
      for j in 0...self.n-1 {
        newVal = self.retrieve(i:i, j:j) * factor
        self.insert(i:i, j:j, val:newVal)
      }
    }
  }

  func fill(val: Int) {
    for i in 0...self.m {
      for j in 0...self.n {
        self.insert(i:i, j:j, val:val);
      }
    }
  }

  func flatten() -> [Int]? {
    var result: [Int]? = nil
    result = [Int]()
    for i in 0...self.m-1 {
      for j in 0...self.n-1 {
        result?.append( self.storage[i][j] )
      }
    }
    return result
  }

  func slice(rowRange: [Int], colRange: [Int]) -> Matrix? {
    let rowMin = max(0, rowRange[0])
    let rowMax = min(rowRange[1], self.m)
    let colMin = max(0, colRange[0])
    let colMax = min(colRange[1], self.n)

    var newMatrix: Matrix? = nil
    newMatrix = Matrix(m: rowMax - rowMin, n: colMax - colMin)

    var newVal: Int
    for i in rowMin...rowMax-1 {
      for j in colMin...colMax-1 {
        newVal = self.retrieve(i: i, j: j)
        newMatrix?.insert(i: i - rowMin, j: j - colMin, val: newVal)
      }
    }
    return newMatrix
  }

  func transpose() -> Matrix? {
    var newMatrix: Matrix? = nil
    newMatrix = Matrix(m: self.n, n: self.m)

    var val: Int
    for i in 0...self.m-1 {
      for j in 0...self.n-1 {
        val = self.retrieve(i:i, j:j)
        newMatrix?.insert(i:j, j:i, val:val)
      }
    }
    return newMatrix
  }

  func multiply(matrix: Matrix) -> Matrix? {
    if(self.n != matrix.m) {
      return nil
    }

    let newMatrix = Matrix(m: self.m, n: matrix.n)
    var newVal: Int
    for i in 0...newMatrix.m-1 {
      for j in 0...newMatrix.n-1 {
        newVal = 0
        for k in 0...self.n-1 {
          newVal += self.retrieve(i:i, j:k) * matrix.retrieve(i:k, j:j)
        }
        newMatrix.insert(i:i, j:j, val:newVal);
      }
    }
    return newMatrix
  }


  }
////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


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

print("Matrix Class")
print("isValid Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should return true for a valid set of coordinates",  {
  let matrix = Matrix(m:3, n:4)
  return matrix.isValid(i:1, j:1) == true
})

assert(&testCount, "should return false for a set of coordinates off the matrix",  {
  let matrix = Matrix(m:3, n:4)
  return matrix.isValid(i:5, j:1) == false
})

assert(&testCount, "should return false for a negative set of coordinates",  {
  let matrix = Matrix(m:3, n:4)
  return matrix.isValid(i:-4, j:1) == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

print("Initialize Tests")
testCount = [0,0]

assert(&testCount, "should override m and n values in old matrix",  {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.m == 2 && matrix.n == 3
})

assert(&testCount, "should override contents of old matrix",  {
  let matrix = Matrix(m: 1, n: 1)
  matrix.initialize(arrayOfArrays: [[1, 2], [3, 4]])
  return !matrix.storage.isEmpty
  && matrix.storage.count == 2 && matrix.storage[0].count == 2
  && matrix.storage[0][0] == 1 && matrix.storage[0][1] == 2 && matrix.storage[1][0] == 3 && matrix.storage[1][1] == 4
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Insert Tests")
testCount = [0,0]

assert(&testCount, "should return true if given valid coordinates",  {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.insert(i: 1, j: 1, val: 50) == true
})

assert(&testCount, "should override old value in matrix given valid coordinates", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.insert(i: 1, j: 1, val: 50) == true && matrix.storage[1][1] == 50;
});

assert(&testCount, "should return false if given invalid coordinates", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.insert(i: 5, j: 5, val: 10) == false
});

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

print("Retrieve Tests")
testCount = [0,0]

assert(&testCount, "should return correct value if given valid coordinates", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.retrieve(i:1, j:1) == 5
})

assert(&testCount, "should return Int.min if given invalid coordinates", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1, 2, 3], [4, 5, 6]])
  return matrix.retrieve(i:10, j:10) == Int.min
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

print("Scale Tests")
testCount = [0,0]

assert(&testCount, "should scale values in matrix by amount given", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1],[3, 4]])
  matrix.scale(factor: 2)
  return matrix.m == 2 && matrix.n == 2 &&
  matrix.storage[0][0] == 0 &&  matrix.storage[0][1] == 2 &&
  matrix.storage[1][0] == 6 &&  matrix.storage[1][1] == 8
})

assert(&testCount, "should scale values in matrix by amount given", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1],[3, 4]])
  matrix.scale(factor: -3)
  return matrix.m == 2 && matrix.n == 2 &&
  matrix.storage[0][0] == 0 &&  matrix.storage[0][1] == -3 &&
  matrix.storage[1][0] == -9 &&  matrix.storage[1][1] == -12
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Fill Tests")
testCount = [0,0]

assert(&testCount, "should set all values in the matrix to given amount", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1],[3, 4]])
  matrix.fill(val: 2)
  return matrix.m == 2 && matrix.n == 2 &&
  matrix.storage[0][0] == 2 &&  matrix.storage[0][1] == 2 &&
  matrix.storage[1][0] == 2 &&  matrix.storage[1][1] == 2
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Flatten Tests")
testCount = [0,0]

assert(&testCount, "should work for a single column matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0], [1], [3], [4]])
  return matrix.flatten() == [0, 1, 3, 4]
});

assert(&testCount, "should work for a single row matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 3, 4]])
  return matrix.flatten() == [0, 1, 3, 4]
})

assert(&testCount, "should work for example matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  return matrix.flatten() == [0, 1, 2, 3, 4, 5, 6, 7, 8]
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

print("Slice Tests")
testCount = [0,0]

assert(&testCount, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [0,2] and colRange is [0,2]", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  let newMatrix: Matrix? = matrix.slice(rowRange:[0,2], colRange:[0,2])

  return newMatrix != nil && newMatrix?.m == 2 && newMatrix?.n == 2 &&
  newMatrix?.storage[0][0] == 0 && newMatrix?.storage[0][1] == 1 &&
  newMatrix?.storage[1][0] == 3 && newMatrix?.storage[1][1] == 4
})

assert(&testCount, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [1,3] and colRange is [1,3]", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  let newMatrix: Matrix? = matrix.slice(rowRange:[1,3], colRange:[1,3])

  return newMatrix !== nil && newMatrix?.m == 2 && newMatrix?.n == 2 &&
  newMatrix?.storage[0][0] == 4 && newMatrix?.storage[0][1] == 5 &&
  newMatrix?.storage[1][0] == 7 && newMatrix?.storage[1][1] == 8
})

assert(&testCount, "should return copy of original matrix if rowRange and colRange are larger than original:", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  let newMatrix: Matrix? = matrix.slice(rowRange:[-5,20], colRange:[-2,6])

  return newMatrix != nil && newMatrix?.m == 3 && newMatrix?.n == 3 &&
  newMatrix?.storage[0][0] == 0 && newMatrix?.storage[0][1] == 1 &&
  newMatrix?.storage[0][2] == 2 && newMatrix?.storage[1][0] == 3 &&
  newMatrix?.storage[1][1] == 4 && newMatrix?.storage[1][2] == 5 &&
  newMatrix?.storage[2][0] == 6 && newMatrix?.storage[2][1] == 7 &&
  newMatrix?.storage[2][2] == 8
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Transpose Tests")
testCount = [0,0]

assert(&testCount, "should work correctly on a 1x1 matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[1]])

  let newMatrix: Matrix? = matrix.transpose()

  return newMatrix != nil && newMatrix?.m == 1 && newMatrix?.n == 1 &&
  newMatrix?.storage[0][0] == 1;
})

assert(&testCount, "should work correctly on a 2x2 matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1], [2, 3]])

  let newMatrix: Matrix? = matrix.transpose()

  return newMatrix != nil && newMatrix?.m == 2 && newMatrix?.n == 2 &&
  newMatrix?.storage[0][0] == 0 && newMatrix?.storage[0][1] == 2 &&
  newMatrix?.storage[1][0] == 1 && newMatrix?.storage[1][1] == 3
});

assert(&testCount, "should work correctly on a 3x2 matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1], [3, 4], [6, 7]])

  let newMatrix: Matrix? = matrix.transpose()

  return newMatrix != nil && newMatrix?.m == 2 && newMatrix?.n == 3 &&
  newMatrix?.storage[0][0] == 0 && newMatrix?.storage[0][1] == 3 &&
  newMatrix?.storage[0][2] == 6 && newMatrix?.storage[1][0] == 1 &&
  newMatrix?.storage[1][1] == 4 && newMatrix?.storage[1][2] == 7
})

assert(&testCount, "should work correctly on a 2x3 matrix", {
  let matrix = Matrix(m:1, n:1)
  matrix.initialize(arrayOfArrays: [[0, 1, 3], [4, 6, 7]])

  let newMatrix: Matrix? = matrix.transpose()

  return newMatrix != nil && newMatrix?.m == 3 && newMatrix?.n == 2 &&
  newMatrix?.storage[0][0] == 0 && newMatrix?.storage[0][1] == 4 &&
  newMatrix?.storage[1][0] == 1 && newMatrix?.storage[1][1] == 6 &&
  newMatrix?.storage[2][0] == 3 && newMatrix?.storage[2][1] == 7
});

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Multiply Tests")
testCount = [0,0]

assert(&testCount, "should work correctly on example matrix with valid input", {
  let matrix1 = Matrix(m:1, n:1)
  let matrix2 = Matrix(m:1, n:1)

  matrix1.initialize(arrayOfArrays: [[4, 1, 3], [3, 2, 5]])
  matrix2.initialize(arrayOfArrays: [[8, 9],[7, 10],[0, 6]])

  let newMatrix: Matrix? = matrix1.multiply(matrix: matrix2)

  return newMatrix != nil && newMatrix?.m == 2 && newMatrix?.n == 2 &&
  newMatrix?.storage[0][0] == 39 && newMatrix?.storage[0][1] == 64 &&
  newMatrix?.storage[1][0] == 38 && newMatrix?.storage[1][1] == 77
})

assert(&testCount, "should work correctly on example matrix with invalid input of wrong dimensions", {
  let matrix1 = Matrix(m:1, n:1)
  let matrix2 = Matrix(m:1, n:1)

  matrix1.initialize(arrayOfArrays: [[4, 1, 3], [3, 2, 5]])
  matrix2.initialize(arrayOfArrays: [[8]])

  let newMatrix: Matrix? = matrix1.multiply(matrix: matrix2)

  return newMatrix == nil
})

assert(&testCount, "should work correctly on example matrix when multiplied by 3x1 matrix", {
  let matrix1 = Matrix(m:1, n:1)
  let matrix2 = Matrix(m:1, n:1)

  matrix1.initialize(arrayOfArrays: [[4, 1, 3], [3, 2, 5]])
  matrix2.initialize(arrayOfArrays: [[8], [1], [2]])

  let newMatrix: Matrix? = matrix1.multiply(matrix: matrix2)

  return newMatrix !== nil && newMatrix?.m == 2 && newMatrix?.n == 1 &&
  newMatrix?.storage[0][0] == 39 && newMatrix?.storage[1][0] == 36
})

assert(&testCount, "should work correctly when 1x2 matrix is multiplied by example matrix", {
  let matrix1 = Matrix(m:1, n:1)
  let matrix2 = Matrix(m:1, n:1)

  matrix1.initialize(arrayOfArrays: [[4, 1, 3], [3, 2, 5]])
  matrix2.initialize(arrayOfArrays: [[3, 5]])

  let newMatrix: Matrix? = matrix2.multiply(matrix: matrix1)

  return newMatrix !== nil && newMatrix?.m == 1 && newMatrix?.n == 3 &&
  newMatrix?.storage[0][0] == 27 && newMatrix?.storage[0][1] == 13 &&
  newMatrix?.storage[0][2] == 34;
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
