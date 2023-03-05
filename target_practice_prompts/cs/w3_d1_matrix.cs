/*
 * Target Practice - Matrices
 *
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

using System;
using System.Linq;
using System.Collections.Generic;

class Problems {

  public static int robotPaths(int[,] matrix) {
    // YOUR WORK HERE
    return -1;
  }

  private static int traverse(int row, int col, int[,] matrix) {
    // YOUR WORK HERE
    return -1;
   }


 /*
  *  Problem 2: Matrix Spiral
  *
  *  Given an (MxN) matrix of integers, return an array in spiral order.
  *
  *
  *  Input:  matrix {int[,]}
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

 public static int[] matrixSpiral(int[,] matrix) {
   //YOUR WORK HERE
   return new int[0];
 }

}

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    robotPathsTests();
    matrixSpiralTests();
	}

  private static void robotPathsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Robot Paths Tests");
    runTest(robotPathsTest1, "should work on example input", testCount);
    runTest(robotPathsTest2, "should work on second example input", testCount);
    runTest(robotPathsTest3, "should work on single-element input", testCount);
    runTest(robotPathsTest4, "should work on single-row input", testCount);
    runTest(robotPathsTest5, "should work on single-column input", testCount);
    runTest(robotPathsTest6, "should work on a 5 x 8 matrix input", testCount);
    printTestsPassed(testCount);
  }

  private static void matrixSpiralTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Matrix Spiral Tests");
    runTest(matrixSpiralTest1, "should work for empty matrix input", testCount);
    runTest(matrixSpiralTest2, "should work for single element matrix input", testCount);
    runTest(matrixSpiralTest3, "should work for single column matrix input", testCount);
    runTest(matrixSpiralTest4, "should work for square matrix input", testCount);
    runTest(matrixSpiralTest5, "should work for single row matrix input", testCount);
    runTest(matrixSpiralTest6, "should work on 3 x 5 matrix input", testCount);
    runTest(matrixSpiralTest7, "should work on 5 x 3 matrix input", testCount);
    printTestsPassed(testCount);
  }


  private static bool robotPathsTest1() {
    int[,] matrix = {{0,0,0,0},
                          {0,0,0,0},
                          {0,0,0,0}};
    return Problems.robotPaths(matrix) == 38;
  }

  private static bool robotPathsTest2() {
    int[,] matrix = {{0,0,0},
                          {0,0,0}};
    return Problems.robotPaths(matrix) == 4;
  }

  private static bool robotPathsTest3() {
    int[,] matrix = {{0}};
    return Problems.robotPaths(matrix) == 1;
  }

  private static bool robotPathsTest4() {
    int[,] matrix = {{0,0,0,0,0,0}};
    return Problems.robotPaths(matrix) == 1;
  }

  private static bool robotPathsTest5() {
    int[,] matrix = {{0},
                          {0},
                          {0},
                          {0},
                          {0}};
    return Problems.robotPaths(matrix) == 1;
  }

  private static bool robotPathsTest6() {
    int[,] matrix = {{0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0},
                          {0,0,0,0,0,0,0,0}};
    Console.WriteLine("  Please be patient, test 6 may take longer to run");
    return Problems.robotPaths(matrix) == 7110272;
  }


  private static bool matrixSpiralTest1() {
    int[,] matrix = {{}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest2() {
    int[,] matrix = {{1}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest3() {
    int[,] matrix = {{1},
                          {2},
                          {3},
                          {4},
                          {5}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1, 2, 3, 4, 5};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest4() {
    int[,] matrix = {{1, 2},
                          {4, 3}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1, 2, 3, 4};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest5() {
    int[,] matrix = {{1, 2, 3, 4}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1, 2, 3, 4};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest6() {
    int[,] matrix = {{1, 2, 3},
                      {4, 5, 6},
                      {7, 8, 9},
                      {10, 11, 12},
                      {13, 14, 15}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11};
    return test.SequenceEqual(expected);
  }

  private static bool matrixSpiralTest7() {
    int[,] matrix = {{1, 2, 3, 4, 5},
                      {12, 13, 14, 15, 6},
                      {11, 10, 9, 8, 7}};
    int[] test = Problems.matrixSpiral(matrix);
    int[] expected = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    return test.SequenceEqual(expected);
  }


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a bool
  //   indicating if test passed
  // string name : describes the test
  // int[] testCount : keeps track out how many tests pass and how many total
  //   in the form of a two item array i.e., [0, 0]
  private static void runTest(Func<bool> test, string testName, int[] testCount){
      testCount[1]++;
      bool testPassed = false;
      // Attempt to run test and suppress exceptions on failure
      try {
          testPassed = test();
          if(testPassed) testCount[0]++;
      } catch (Exception e) {
        Console.WriteLine(e);
      }
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
  // this is to print the number of test cases passed for a test suite function
  private static void printTestsPassed(int[] testCount) {
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }
}
