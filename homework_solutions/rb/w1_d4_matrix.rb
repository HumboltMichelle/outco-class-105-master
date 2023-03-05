# Homework - Matrices
#
# Prompt: Create a Matrix class
#
# The Matrix will take in the following input:
#
#              m:    {Integer} - represents the number of ROWS
#              n:    {Integer} - represent the number of COLUMNS
#
# The Matrix will have the following properties:
#
#        storage:    {Array of Arrays of Integers} - stores of numbers within matrix
#              m:    {Integer} - represents the number of ROWS
#              n:    {Integer} - represent the number of COLUMNS
#
# The Matrix will have the following methods:
#
#         isValid:   checks whether given coordinates are within the matrix
#
#                  Input:      i {Integer} - row index
#                  Input:      j {Integer} - column index
#                 Output:        {Boolean}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.isValid(1, 1)
#
#                result == true
#
#                matrix.isValid(100, 1)
#
#                result == false
#
#
#      initialize:   takes in a valid array of arrayOfArrays, and
#
#                  Input: arrayOfArrays {Array of Arrays of Integers}
#
#                 Output:        {undefined / void}
#
#                Example:
#
#                matrix.intitialize([[0, 1, 2],
#                                    [3, 4, 5],
#                                    [6, 7, 8]])
#
#
#                result:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.m == 3
#
#                matrix.n == 3
#
#
#           print:   optional method to print the contents of a matrix's storage
#                    prints each row of the matrix on a new line.
#
#                  Input: N/A {undefined / void}
#
#                 Output:        {undefined / void}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#
#                console:
#
#                [0, 1, 2]
#                [3, 4, 5]
#                [6, 7, 8]
#
#
#          insert:   inserts an integer into the given coordinates
#                   returns true if insertion was successful
#                   returns false otherwise
#
#                  Input:      i {Integer}
#                  Input:      j {Integer}
#                  Input:    val {Integer}
#                 Output:        {Boolean}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.insert(1, 1, 400)
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 400, 5],
#                                   [6, 7, 8]]
#
#                result == true
#
#
#                matrix.insert(100, 1, 400)
#
#                matrix.storage = [[0, 1, 2],
#                                  [3, 4, 5],
#                                  [6, 7, 8]]
#
#                result == false
#
#
#        retrieve:   returns value stored at given coordinates
#                    returns -Infinity / Integer.MIN_VALUE if coordinates are invalid
#
#                  Input:      i {Integer} - row index
#                  Input:      j {Integer} - column index
#                 Output:        {Integer}
#
#                 Example:
#
#                 matrix.storage == [[0, 1, 2],
#                                    [3, 4, 5],
#                                    [6, 7, 8]]
#
#                 matrix.retrieve(1, 1)
#
#                 result == 4
#
#
#           scale:   multiplies every value in the matrix by some constant factor
#                    returns undefined / void
#
#                   Input:  factor {Integer} - amount each entry will be multiplied by
#                   Output:         {undefined}
#
#                  Example:
#
#                  matrix.storage == [[1, 1, 1],
#                                     [1, 1, 1],
#                                     [1, 1, 1]]
#
#                  matrix.scale(5)
#
#                  matrix.storage == [[5, 5, 5],
#                                     [5, 5, 5],
#                                     [5, 5, 5]]
#
#
#            fill:   sets every entry in the matrix equal to input value
#                    returns undefined / void
#
#                  Input:     val {Integer} - value to be inserted throughout matrix
#                 Output:         {undefined}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.fill(1)
#
#                matrix.storage == [[1, 1, 1],
#                                   [1, 1, 1],
#                                   [1, 1, 1]]
#
#
#         flatten:   returns an array containing all the elements in the matrix if traversed row by row
#
#                  Input:      N/A
#                 Output:     {Array of Integers}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.flatten()
#
#                result == [0, 1, 2, 3, 4, 5, 6, 7, 8]
#
#
#           slice:   returns a new Matrix representing a subset of the original matrix
#                    it's rows are bounded by the first two-element array input
#                    it's columns are bounded by the second two-element array input
#
#                    NOTE: If the rowRange or colRange is larger than the original matrix
#                          just return the bounds of the original matrix
#
#                    NOTE: Think about how much you'll have to offset insertions into the new matrix
#
#                   Input:      rowRange {Array of Two Integers}
#                   Input:      colRange {Array of Two Integers}
#                  Output:     {Matrix}
#
#                Example:
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5],
#                                   [6, 7, 8]]
#
#                matrix.slice([0, 2], [0, 2])
#
#                result == [[0, 1],
#                           [3, 4]]
#
#
#       transpose:   returns a new Matrix representing the transpose of the original matrix
#                    The transpose of a matrix is like flipping a matrix along its diagonal axis
#
#                    Link to Wikipedia:
#                    NOTE: if the original matrix was M x N, the new one will be N x M
#
#                   Input:      N/A
#                  Output:     {Matrix}
#
#                matrix.storage == [[0, 1, 2],
#                                   [3, 4, 5]]
#
#                matrix.transpose()
#
#                result == [[0, 3],
#                           [1, 4],
#                           [2, 5]]
#
#
#
#        mulitply:   returns a new Matrix representing the matrix multiplication of original matrix
#                    by the input matrix.
#
#                    Link to Wikipedia:
#                    NOTE: if the original matrix was M x N, the input one MUST be N x K
#                          the result matrix will then be M x K dimensions
#
#                   Input:      matrix {Matrix}
#                  Output:     {Matrix}
#
#                matrix.storage == [[4, 1, 3],
#                                   [3, 2, 5]]
#
#                matrix.multiply([[8, 9],
#                                 [7, 10],
#                                 [0, 6]])
#
#                result == [[39, 64],
#                           [38, 77]]
#
#                Reasoning:
#                         [[(4 * 8) + (1 * 7) + (3 * 0),    (4 * 9) + (1 * 10) + (3 * 6)],
#
#                          [(3 * 8) + (2 * 7) + (5 * 0),    (3 * 9) + (2 * 10) + (5 * 6)]]
#
#
#                     =>  [[32 + 7 + 0,   36 + 10 + 18],
#
#                          [24 + 14 + 0,  27 + 20 + 30]]
#
#
#                     =>  [[39, 64],
#                          [38, 77]]


class Matrix
  def initialize(m, n)
    @m = m
    @n = n
    @storage = Array.new(m) { Array.new(n,0) }
  end

  attr_accessor :m,:n,:storage

  def printer()
    @storage.each do |row|
        # Loop over each cell in the row.
        row.each do |cell|
            printf "%s\t ", cell
        end
        puts
    end
    puts
  end


  def isValid(i, j)
    return !(i < 0 or j < 0 or i >= @m or j >= @n)
  end


  def init(arrayOfArrays)
    if arrayOfArrays.length > 0
      #Validate that matrix length is > 0 and all rows have same # of cols
      colnum = arrayOfArrays[0].length
      arrayOfArrays.each do |row|
        if row.length != colnum
          return
        end
      end

      @storage = arrayOfArrays
      @m = arrayOfArrays.length
      @n = arrayOfArrays[0].length
    end
  end


  def insert(i, j, val)
    if isValid(i, j)
      @storage[i][j] = val
      return true
    end
    return false
  end


  def retrieve(i, j)
    if isValid(i, j)
      return @storage[i][j]
    end
    return -Float::INFINITY
  end


  def scale(factor)
    for row in 0..@m-1 do
      for col in 0..@n-1 do
        newVal = retrieve(row, col)*factor
        insert(row,col, newVal)
      end
    end
  end


  def fill(val)
    for row in 0..@m-1 do
      for col in 0..@n-1 do
        insert(row,col, val)
      end
    end
  end


  def flatten()
    result = []
    for row in 0..@m-1 do
      for col in 0..@n-1 do
        result.push(retrieve(row,col))
      end
    end
    return result
  end


  def slice(rowRange, colRange)
    rowMin = [0, rowRange[0]].max
    rowMax = [rowRange[1], @m].min
    colMin = [0, colRange[0]].max
    colMax = [colRange[1], @n].min

    newMatrix = Matrix.new(rowMax - rowMin, colMax - colMin)
    for i in rowMin..rowMax-1 do
      for j in colMin..colMax-1 do
        newVal = retrieve(i, j)
        newMatrix.insert(i - rowMin, j - colMin, newVal)
      end
    end

    return newMatrix
  end


  def transpose()
    newMatrix = Matrix.new(@n, @m)
    for row in 0..@m-1 do
      for col in 0..@n-1 do
        val = retrieve(row, col)
        newMatrix.insert(col, row, val)
      end
    end
    return newMatrix
  end


  def multiply(matrix)
    if @n != matrix.m
      return nil
    end

    newMatrix = Matrix.new(@m, matrix.n)
    for i in 0..newMatrix.m-1 do #range(newMatrix.m):
      for j  in 0..newMatrix.n-1 do #range(newMatrix.n):
        newVal = 0
        for k in 0..@n-1 do
          newVal += retrieve(i, k) * matrix.retrieve(k, j)
        end
        newMatrix.insert(i, j, newVal)
      end
    end
    return newMatrix
  end

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


puts 'Matrix tests'
p ("IsValid Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(3, 4)
  return matrix.isValid(1, 1) == true
end
expect(test_count, "should return true for a valid set of coordinates", test)

def test
  matrix = Matrix.new(3, 4)
  return matrix.isValid(5, 1) == false
end
expect(test_count, "should return false for a set of coordinates off the matrix", test)

def test
  matrix = Matrix.new(3, 4)
  return matrix.isValid(-4, 1) == false
end
expect(test_count, "should return false for a negative set of coordinates", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



p ("Initialize Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1, 2, 3], [4, 5, 6]])
  return matrix.m == 2 && matrix.n == 3
end
expect(test_count, "should override m and n values in old matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1, 2], [3, 4]])
  return matrix.storage != nil && matrix.storage[0] != nil &&
        matrix.storage[1] != nil && matrix.storage[0][0] == 1 &&
        matrix.storage[0][1] == 2 && matrix.storage[1][0] == 3 &&
        matrix.storage[1][1] == 4
end
expect(test_count, "should override m and n values in old matrix", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



p ("Insert Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1, 2, 3], [4, 5, 6]])
  return matrix.insert(1, 1, 50) == true
end
expect(test_count, "should return true if given valid coordinates", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1, 2, 3], [4, 5, 6]])
  return matrix.insert(1, 1, 50) == true && matrix.storage[1][1] == 50
end
expect(test_count, "should override old value in matrix given valid coordinates", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1, 2, 3], [4, 5, 6]])
  return matrix.insert(5, 5, 10) == false
end
expect(test_count, "should return false if given invalid coordinates", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Retrieve Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
  return matrix.retrieve(1, 1) == 4
end
expect(test_count, "should return correct value if given valid coordinates", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
  return matrix.retrieve(10, 10) == -Float::INFINITY
end
expect(test_count, "should return -Infinity if given invalid coordinates", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Scale Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1],[3, 4]])
  matrix.scale(2)
  return matrix.storage[0][0] == 0 &&  matrix.storage[0][1] == 2 &&
       matrix.storage[1][0] == 6 &&  matrix.storage[1][1] == 8
end
expect(test_count, "should scale values in matrix by amount given", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1],[3, 4]])
  matrix.scale(-3)
  return matrix.storage[0][0] == 0 &&  matrix.storage[0][1] == -3 &&
       matrix.storage[1][0] == -9 &&  matrix.storage[1][1] == -12
end
expect(test_count, "should scale values in matrix by amount given", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Fill Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1],[3, 4]])
  matrix.fill(2)
  return matrix.storage[0][0] == 2 &&  matrix.storage[0][1] == 2 &&
       matrix.storage[1][0] == 2 &&  matrix.storage[1][1] == 2
end
expect(test_count, "should fill values in matrix with given value", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Flatten Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0], [1], [3], [4]])
  return matrix.flatten() == [0, 1, 3, 4]
end
expect(test_count, "should work for a single column matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 3, 4]])
  return matrix.flatten() == [0, 1, 3, 4]
end
expect(test_count, "should work for a single row matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  return matrix.flatten() == [0, 1, 2, 3, 4, 5, 6, 7, 8]
end
expect(test_count, "should work for example matrix", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Slice Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  newMatrix = matrix.slice([0,2], [0,2])
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 &&
         newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 1 &&
         newMatrix.storage[1][0] == 3 && newMatrix.storage[1][1] == 4
end
expect(test_count, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [0,2] and colRange is [0,2]", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  newMatrix = matrix.slice([1,3], [1,3])
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 &&
         newMatrix.storage[0][0] == 4 && newMatrix.storage[0][1] == 5 &&
         newMatrix.storage[1][0] == 7 && newMatrix.storage[1][1] == 8
end
expect(test_count, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [1,3] and colRange is [1,3]", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  newMatrix = matrix.slice([-5,20], [-2,6])
  return newMatrix != nil && newMatrix.m == 3 && newMatrix.n == 3 &&
         newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 1 &&
         newMatrix.storage[0][2] == 2 && newMatrix.storage[1][0] == 3 &&
         newMatrix.storage[1][1] == 4 && newMatrix.storage[1][2] == 5 &&
         newMatrix.storage[2][0] == 6 && newMatrix.storage[2][1] == 7 &&
         newMatrix.storage[2][2] == 8
end
expect(test_count, "should return copy of original matrix if rowRange and colRange are larger than original", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Transpose Tests")
test_count = [0, 0]

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[1]])
  newMatrix = matrix.transpose()
  return newMatrix != nil && newMatrix.m == 1 && newMatrix.n == 1 &&
         newMatrix.storage[0][0] == 1
end
expect(test_count, "should work correctly on a 1x1 matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1], [2, 3]])
  newMatrix = matrix.transpose()
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 &&
       newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 2 &&
       newMatrix.storage[1][0] == 1 && newMatrix.storage[1][1] == 3
end
expect(test_count, "should work correctly on a 2x2 matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1], [3, 4], [6, 7]])
  newMatrix = matrix.transpose()
  return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 3 &&
       newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 3 &&
       newMatrix.storage[0][2] == 6 && newMatrix.storage[1][0] == 1 &&
       newMatrix.storage[1][1] == 4 && newMatrix.storage[1][2] == 7
end
expect(test_count, "should work correctly on a 3x2 matrix", test)

def test
  matrix = Matrix.new(1, 1)
  matrix.init([[0, 1, 3], [4, 6, 7]])
  newMatrix = matrix.transpose()
  return newMatrix != nil && newMatrix.m == 3 && newMatrix.n == 2 &&
       newMatrix.storage[0][0] == 0 && newMatrix.storage[0][1] == 4 &&
       newMatrix.storage[1][0] == 1 && newMatrix.storage[1][1] == 6 &&
       newMatrix.storage[2][0] == 3 && newMatrix.storage[2][1] == 7
end
expect(test_count, "should work correctly on a 2x3 matrix", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"




p ("Multiply Tests")
test_count = [0, 0]

def test()
    matrix1 = Matrix.new(1, 1)
    matrix2 = Matrix.new(1, 1)

    matrix1.init([[4, 1, 3],
                      [3, 2, 5]])

    matrix2.init([[8, 9],
                      [7, 10],
                      [0, 6]])

    newMatrix = matrix1.multiply(matrix2)

    return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 2 &&
         newMatrix.storage[0][0] == 39 && newMatrix.storage[0][1] == 64 &&
         newMatrix.storage[1][0] == 38 && newMatrix.storage[1][1] == 77
end
expect(test_count, 'should work correctly on example matrix with valid input', test)

def test()
    matrix1 = Matrix.new(1, 1)
    matrix2 = Matrix.new(1, 1)

    matrix1.init([[4, 1, 3],
                      [3, 2, 5]])

    matrix2.init([[8]])

    newMatrix = matrix1.multiply(matrix2)

    return newMatrix == nil
end
expect(test_count, 'should work correctly on example matrix with invalid input of wrong dimensions', test)

def test()
    matrix1 = Matrix.new(1, 1)
    matrix2 = Matrix.new(1, 1)

    matrix1.init([[4, 1, 3],
                      [3, 2, 5]])

    matrix2.init([[8], [1], [2]])

    newMatrix = matrix1.multiply(matrix2)

    return newMatrix != nil && newMatrix.m == 2 && newMatrix.n == 1 &&
         newMatrix.storage[0][0] == 39 && newMatrix.storage[1][0] == 36
end
expect(test_count, 'should work correctly on example matrix when multiplied by 3x1 matrix', test)

def test()
    matrix1 = Matrix.new(1, 1)
    matrix2 = Matrix.new(1, 1)

    matrix1.init([[4, 1, 3],
                      [3, 2, 5]])

    matrix2.init([[3, 5]])

    newMatrix = matrix2.multiply(matrix1)

    return newMatrix != nil && newMatrix.m == 1 && newMatrix.n == 3 &&
         newMatrix.storage[0][0] == 27 && newMatrix.storage[0][1] == 13 &&
         newMatrix.storage[0][2] == 34
end
expect(test_count, 'should work correctly when 1x2 matrix is multiplied by example matrix', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
