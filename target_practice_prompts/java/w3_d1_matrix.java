/*
 * Target Practice - Matrices
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

class MatrixProblems {

  public static int robotPaths(int[][] matrix) {
    // YOUR WORK HERE
    return -1;
  }

  private static int traverse(int x, int y, int[][] matrix) {
    // YOUR WORK HERE
    return -1;
   }


 /*
  *  Problem 2: Matrix Spiral
  *
  *  Given an (MxN) matrix of integers, return an array in spiral order.
  *
  *
  *  Input:  matrix {Integer[][]}
  *  Output: {Integer}
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

 public static int[] matrixSpiral(int[][] matrix) {
   //YOUR WORK HERE
   return new int[0];
 }

}





////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class MatrixTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Robot Paths Tests");

    // tests are in the form as shown
    assertTest(testCount, "should work on example input", () -> {
      int[][] matrix = {{0,0,0,0},
                        {0,0,0,0},
                        {0,0,0,0}};
      return MatrixProblems.robotPaths(matrix) == 38;
    });

    // tests are in the form as shown
    assertTest(testCount, "should work on second example input", () -> {
      int[][] matrix = {{0,0,0},
                        {0,0,0}};
      return MatrixProblems.robotPaths(matrix) == 4;
    });

    // tests are in the form as shown
    assertTest(testCount, "should work on single-element input", () -> {
      int[][] matrix = {{0}};
      return MatrixProblems.robotPaths(matrix) == 1;
    });

    // tests are in the form as shown
    assertTest(testCount, "should work on single-row input", () -> {
      int[][] matrix = {{0,0,0,0,0,0}};
      return MatrixProblems.robotPaths(matrix) == 1;
    });

    // tests are in the form as shown
    assertTest(testCount, "should work on single-column input", () -> {
      int[][] matrix = {{0},
                        {0},
                        {0},
                        {0},
                        {0}};
      return MatrixProblems.robotPaths(matrix) == 1;
    });

    assertTest(testCount, "should work on a 5 x 8 matrix input", () -> {
      int[][] matrix = {{0,0,0,0,0,0,0,0},
                        {0,0,0,0,0,0,0,0},
                        {0,0,0,0,0,0,0,0},
                        {0,0,0,0,0,0,0,0},
                        {0,0,0,0,0,0,0,0}};
      System.out.println("  Please be patient, test 6 may take longer to run");
      return MatrixProblems.robotPaths(matrix) == 7110272;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Matrix Spiral Tests");



    // tests are in the form as shown
    assertTest(testCount, "should work for sample input", () -> {
      int[][] matrix1 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
      int[] test = MatrixProblems.matrixSpiral(matrix1);
      int[] expected = {1, 2, 3, 6, 9, 8, 7, 4, 5};
      return arraysEqual(test, expected);
    });


    assertTest(testCount, "should work for empty matrix input", () -> {
      int[][] matrix1 = {{}};
      int[] test = MatrixProblems.matrixSpiral(matrix1);
      int[] expected = {};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work for single element matrix input", () -> {
      int[][] matrix = {{1}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work for single column matrix input", () -> {
      int[][] matrix = {{1},
                        {2},
                        {3},
                        {4},
                        {5}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1, 2, 3, 4, 5};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work for square matrix input", () -> {
      int[][] matrix = {{1, 2},
                        {4, 3}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1, 2, 3, 4};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work for single row matrix input", () -> {
      int[][] matrix = {{1, 2, 3, 4}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1, 2, 3, 4};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work on 3 x 5 matrix input", () -> {
      int[][] matrix = {{1, 2, 3},
                        {4, 5, 6},
                        {7, 8, 9},
                        {10, 11, 12},
                        {13, 14, 15}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11};
      return arraysEqual(test, expected);
    });

    assertTest(testCount, "should work on 5 x 3 matrix input", () -> {
      int[][] matrix = {{1, 2, 3, 4, 5},
                        {12, 13, 14, 15, 6},
                        {11, 10, 9, 8, 7}};
      int[] test = MatrixProblems.matrixSpiral(matrix);
      int[] expected = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
      return arraysEqual(test, expected);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }


  // do not edit below, this is to wrap the test and check for exceptions

  // function for checking if arrays are equal
  private static boolean arraysEqual(int[] arr1, int[] arr2) {
    if (arr1.length != arr2.length) {
      return false;
    }

    for (int i = 0 ; i < arr1.length ; i++) {
      if (arr1[i] != arr2[i]) {
        return false;
      }
    }

    return true;
  }

  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) {}
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
