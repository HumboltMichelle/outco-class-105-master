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

import java.util.*;
import java.lang.reflect.Method;

class Matrix {

    private int m, n;
    private int[][] storage;

    public Matrix(int m, int n){
        this.m = m;
        this.n = n;
        this.storage = new int[m][n];
    }

    public int getM() {return this.m;}

    public int getN() {return this.n;}

    public int[][] getStorage() {return this.storage;}


    public void print() {
        for(int i = 0; i < this.m; i++) {
            for(int j = 0; j < this.n; j++) {
                System.out.print(storage[i][j] + "\t");
            }
            System.out.println();
        }
    }

    public boolean isValid(int i, int j) {
        return i >= 0 && j >= 0 && i < this.m && j < this.n;
    }

    public void initialize(int[][] arrayOfArrays) {
        this.storage = arrayOfArrays;
        this.m = arrayOfArrays.length;
        if(this.m > 0) this.n = arrayOfArrays[0].length;
    }

    public boolean insert(int i, int j, int val) {
        if(this.isValid(i, j)) {
            this.storage[i][j] = val;
            return true;
        }
        return false;
    }

    public int retrieve(int i, int j) {
        if(this.isValid(i, j)) {
            return this.storage[i][j];
        }
        return Integer.MIN_VALUE;
    }

    public void scale(int factor) {
        int newVal;
        for(int i = 0; i < this.m; i++) {
            for(int j = 0; j < this.n; j++) {
                newVal = this.retrieve(i, j) * factor;
                this.insert(i, j, newVal);
            }
        }
    }

    public void fill(int val) {
        for(int i = 0; i < this.m; i++) {
            for(int j = 0; j < this.n; j++) {
                this.insert(i, j, val);
            }
        }
    }

    public int[] flatten() {
        int[] result = new int[m*n];
        int counter = 0;
        for(int i = 0; i < this.m; i++) {
            for(int j = 0; j < this.n; j++) {
                result[counter++] = this.storage[i][j];
            }
        }
        return result;
    }

    public Matrix slice(int[] rowRange, int[] colRange) {
        int rowMin = Math.max(0, rowRange[0]);
        int rowMax = Math.min(rowRange[1], this.m);
        int colMin = Math.max(0, colRange[0]);
        int colMax = Math.min(colRange[1], this.n);

        Matrix newMatrix = new Matrix(rowMax - rowMin, colMax - colMin);
        int newVal;
        for(int i = rowMin; i < rowMax; i++) {
            for(int j = colMin; j < colMax; j++) {
                newVal = this.retrieve(i, j);
                newMatrix.insert(i - rowMin, j - colMin, newVal);
            }
        }
        return newMatrix;
    }

    public Matrix transpose() {
        Matrix newMatrix = new Matrix(this.n, this.m);
        int val;
        for(int i = 0; i < this.m; i++) {
            for(int j = 0; j < this.n; j++) {
                val = this.retrieve(i, j);
                newMatrix.insert(j, i, val);
            }
        }
        return newMatrix;
    }

    public Matrix multiply(Matrix matrix) {
        if(this.n != matrix.m) {
            return null;
        }
        Matrix newMatrix = new Matrix(this.m, matrix.n);
        int newVal;
        for(int i = 0; i < newMatrix.m; i++) {
            for(int j = 0; j < newMatrix.n; j++) {
                newVal = 0;
                for(int k = 0; k < this.n; k++) {
                    newVal += this.retrieve(i, k) * matrix.retrieve(k, j);
                }
                newMatrix.insert(i, j, newVal);
            }
        }

        return newMatrix;
    }
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class MatrixTests {

    public static void main(String[] args) {
         isValidTests();
         initializeTests();
         insertTests();
         retrieveTests();
         scaleTests();
         fillTests();
         flattenTests();
         sliceTests();
         transposeTests();
         multiplyTests();
    }

     private static void isValidTests() {
        int[] testCount = {0, 0};
        System.out.println("IsValid Tests");
        runTest("isValidTest1", "should return true for a valid set of coordinates", testCount);
        runTest("isValidTest2", "should return false for a set of coordinates off the matrix", testCount);
        runTest("isValidTest3", "should return false for a negative set of coordinates", testCount);
        System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
     }

    private static void initializeTests() {
        int[] testCount = {0, 0};
        System.out.println("Initialize Tests");
        runTest("initializeTest1", "should override m and n values in old matrix", testCount);
        runTest("initializeTest2", "should override contents of old matrix", testCount);
        System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void insertTests() {
        int[] testCount = {0, 0};
        System.out.println("Insert Tests");
        runTest("insertTest1", "should return true if given valid coordinates", testCount);
        runTest("insertTest2", "should override old value in matrix given valid coordinates", testCount);
        runTest("insertTest3", "should return false if given invalid coordinates", testCount);
        System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

   private static void retrieveTests() {
     int[] testCount = {0, 0};
     System.out.println("Retrieve Tests");
     runTest("retrieveTest1", "should return correct value if given valid coordinates", testCount);
     runTest("retrieveTest2", "should return int.MinValue if given invalid coordinates", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void scaleTests() {
     int[] testCount = {0, 0};
     System.out.println("Scale Tests");
     runTest("scaleTest1", "should scale values in matrix by amount given", testCount);
     runTest("scaleTest2", "should scale values in matrix by amount given", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void fillTests() {
     int[] testCount = {0, 0};
     System.out.println("Fill Tests");
     runTest("fillTest1", "should set all values in the matrix to given amount", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void flattenTests() {
     int[] testCount = {0, 0};
     System.out.println("Flatten Tests");
     runTest("flattenTest1", "should work for a single column matrix", testCount);
     runTest("flattenTest2", "should work for a single row matrix", testCount);
     runTest("flattenTest3", "should work for example matrix", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void sliceTests() {
     int[] testCount = {0, 0};
     System.out.println("Slice Tests");
     runTest("sliceTest1", "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [0,2] and colRange is [0,2]", testCount);
     runTest("sliceTest2", "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [1,3] and colRange is [1,3]", testCount);
     runTest("sliceTest3", "should return copy of original matrix if rowRange and colRange are larger than original", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void transposeTests() {
     int[] testCount = {0, 0};
     System.out.println("Transpose Tests");
     runTest("transposeTest1", "should work correctly on a 1x1 matrix", testCount);
     runTest("transposeTest2", "should work correctly on a 2x2 matrix", testCount);
     runTest("transposeTest3", "should work correctly on a 3x2 matrix", testCount);
     runTest("transposeTest4", "should work correctly on a 2x3 matrix", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static void multiplyTests() {
     int[] testCount = {0, 0};
     System.out.println("Multiply Tests");
     runTest("multiplyTest1", "should work correctly on example matrix with valid input", testCount);
     runTest("multiplyTest2", "should work correctly on example matrix with invalid input of wrong dimensions", testCount);
     runTest("multiplyTest3", "should work correctly on example matrix when multiplied by 3x1 matrix", testCount);
     runTest("multiplyTest4", "should work correctly when 1x2 matrix is multiplied by example matrix", testCount);
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
   }

   private static boolean isValidTest1() {
     Matrix matrix = new Matrix(3, 4);
     return matrix.isValid(1, 1);
   }


   private static boolean isValidTest2() {
     Matrix matrix = new Matrix(3, 4);
     return !matrix.isValid(5, 1);
   }

   private static boolean isValidTest3() {
     Matrix matrix = new Matrix(3, 4);
     return !matrix.isValid(-4, 1);
   }


   private static boolean initializeTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1, 2, 3}, {4, 5, 6}});
     return matrix.getM() == 2 && matrix.getN() == 3;
   }

   private static boolean initializeTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1, 2}, {3, 4}});
     int[][] storage = matrix.getStorage();
     return storage != null && storage.length == 2 && storage[0].length == 2
     && storage[0][0] == 1 && storage[0][1] == 2 && storage[1][0] == 3 && storage[1][1] == 4;
   }


   private static boolean insertTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1, 2, 3}, {4, 5, 6}});
     return matrix.insert(1, 1, 50);
   }

   private static boolean insertTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1, 2, 3}, {4, 5, 6}});
     return matrix.insert(1, 1, 50) && matrix.getStorage()[1][1] == 50;
   }

   private static boolean insertTest3() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1, 2, 3}, {4, 5, 6}});
     return !matrix.insert(5, 5, 10);
   }



   private static boolean retrieveTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2},{3, 4, 5},{6, 7, 8}});
     return matrix.retrieve(1, 1) == 4;
   }

   private static boolean retrieveTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2},{3, 4, 5},{6, 7, 8}});
     return matrix.retrieve(10, 10) == Integer.MIN_VALUE;
   }



   private static boolean scaleTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1},{3, 4}});
     matrix.scale(2);
     int[][] storage = matrix.getStorage();
     return storage[0][0] == 0 &&  storage[0][1] == 2 &&
           storage[1][0] == 6 &&  storage[1][1] == 8;
   }

   private static boolean scaleTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1},{3, 4}});
     matrix.scale(-3);
     int[][] storage = matrix.getStorage();
     return storage[0][0] == 0 && storage[0][1] == -3 &&
           storage[1][0] == -9 && storage[1][1] == -12;
   }



   private static boolean fillTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1},{3, 4}});
     matrix.fill(2);
     int[][] storage = matrix.getStorage();
     return storage[0][0] == 2 &&  storage[0][1] == 2 &&
           storage[1][0] == 2 &&  storage[1][1] == 2;
   }



   private static boolean flattenTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0}, {1}, {3}, {4}});
     return Arrays.equals(matrix.flatten() ,(new int[]{0, 1, 3, 4}));
   }

   private static boolean flattenTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 3, 4}});
     return Arrays.equals(matrix.flatten() ,(new int[]{0, 1, 3, 4}));
   }

   private static boolean flattenTest3() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
     return Arrays.equals(matrix.flatten() ,(new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8}));
   }



   private static boolean sliceTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
     Matrix newMatrix = matrix.slice(new int[]{0,2}, new int[]{0,2});
     int[][] newMatrixStorage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 2 && newMatrixStorage[0][0] == 0 &&
             newMatrixStorage[0][1] == 1 && newMatrixStorage[1][0] == 3 && newMatrixStorage[1][1] == 4;
   }

   private static boolean sliceTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
     Matrix newMatrix = matrix.slice(new int[]{1,3}, new int[]{1,3});
     int[][] newMatrixStorage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 2 && newMatrixStorage[0][0] == 4 &&
             newMatrixStorage[0][1] == 5 && newMatrixStorage[1][0] == 7 && newMatrixStorage[1][1] == 8;
   }

   private static boolean sliceTest3() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
     Matrix newMatrix = matrix.slice(new int[]{-5,20}, new int[]{-2,6});
     return array2DEquals(matrix.getStorage(), newMatrix.getStorage());
   }



   private static boolean transposeTest1() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{1}});
     Matrix newMatrix = matrix.transpose();
     return newMatrix != null && newMatrix.getM() == 1 && newMatrix.getN() == 1 &&
           newMatrix.getStorage()[0][0] == 1;
   }

   private static boolean transposeTest2() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1}, {2, 3}});
     Matrix newMatrix = matrix.transpose();
     int[][] storage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 2 && storage[0][0] == 0 && storage[0][1] == 2 &&
             storage[1][0] == 1 && storage[1][1] == 3;
   }

   private static boolean transposeTest3() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1}, {3, 4}, {6, 7}});
     Matrix newMatrix = matrix.transpose();
     int[][] storage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 3 && storage[0][0] == 0 &&
             storage[0][1] == 3 && storage[0][2] == 6 && storage[1][0] == 1 &&
             storage[1][1] == 4 && storage[1][2] == 7;
   }

   private static boolean transposeTest4() {
     Matrix matrix = new Matrix(1, 1);
     matrix.initialize(new int[][]{{0, 1, 3}, {4, 6, 7}});
     Matrix newMatrix = matrix.transpose();
     int[][] storage = newMatrix.getStorage();
     return newMatrix.getM() == 3 && newMatrix.getN() == 2 && storage[0][0] == 0 &&
             storage[0][1] == 4 && storage[1][0] == 1 && storage[1][1] == 6 &&
             storage[2][0] == 3 && storage[2][1] == 7;
   }


   private static boolean multiplyTest1() {
     Matrix matrix1 = new Matrix(1, 1);
     Matrix matrix2 = new Matrix(1, 1);
     matrix1.initialize(new int[][]{{4, 1, 3},
                                   {3, 2, 5}});
     matrix2.initialize(new int[][]{{8, 9},
                                   {7, 10},
                                   {0, 6}});
     Matrix newMatrix = matrix1.multiply(matrix2);
     int[][] newMatrixstorage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 2 && newMatrixstorage[0][0] == 39 &&
             newMatrixstorage[0][1] == 64 && newMatrixstorage[1][0] == 38 && newMatrixstorage[1][1] == 77;
   }

   private static boolean multiplyTest2() {
     Matrix matrix1 = new Matrix(1, 1);
     Matrix matrix2 = new Matrix(1, 1);
     matrix1.initialize(new int[][]{{4, 1, 3},
                                   {3, 2, 5}});
     matrix2.initialize(new int[][]{{8}});
     Matrix newMatrix = matrix1.multiply(matrix2);
     return newMatrix == null;
   }

   private static boolean multiplyTest3() {
     Matrix matrix1 = new Matrix(1, 1);
     Matrix matrix2 = new Matrix(1, 1);
     matrix1.initialize(new int[][]{{4, 1, 3},
                                   {3, 2, 5}});
     matrix2.initialize(new int[][]{{8}, {1}, {2}});
     Matrix newMatrix = matrix1.multiply(matrix2);
     int[][] newMatrixstorage = newMatrix.getStorage();
     return newMatrix.getM() == 2 && newMatrix.getN() == 1 && newMatrixstorage[0][0] == 39 && newMatrixstorage[1][0] == 36;
   }

   private static boolean multiplyTest4() {
     Matrix matrix1 = new Matrix(1, 1);
     Matrix matrix2 = new Matrix(1, 1);
     matrix1.initialize(new int[][]{{4, 1, 3},
                                   {3, 2, 5}});
     matrix2.initialize(new int[][]{{3, 5}});
     Matrix newMatrix = matrix2.multiply(matrix1);
     int[][] newMatrixstorage = newMatrix.getStorage();
     return newMatrix.getM() == 1 && newMatrix.getN() == 3 && newMatrixstorage[0][0] == 27 &&
             newMatrixstorage[0][1] == 13 && newMatrixstorage[0][2] == 34;
   }


   // DO NOT TOUCH FUNCTIONS BELOW


   // function for checking if 2d arrays contain same elements in the same order
    private static boolean array2DEquals(int[][] arr1, int[][] arr2) {
        if (arr1 == null) return (arr2 == null);
        if (arr2 == null) return false;
        if (arr1.length != arr2.length) return false;
        for (int i = 0; i < arr1.length; i++) {
            if (!Arrays.equals(arr1[i], arr2[i])) {
                return false;
            }
        }
        return true;
    }

   // Custom runTest function to handle tests
   // String testName : name of test function to be run
   // String testDesc : describes the test
   // int[] testCount : keeps track out how many tests pass and how many total
   //   in the form of a two item array i.e., [0, 0]
    private static void runTest(String testName, String testDesc, int[] testCount) {
        testCount[1]++;
        boolean testPassed = false;
        // Attempt to run test and suppress exceptions on failure
        try {
            Method method = MatrixTests.class.getDeclaredMethod(testName);
            testPassed = (boolean) method.invoke(new MatrixTests()); //test();
            if(testPassed) testCount[0]++;
        } catch (Exception ignored){}
        String result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testDesc;
        System.out.println(result);
    }
}
