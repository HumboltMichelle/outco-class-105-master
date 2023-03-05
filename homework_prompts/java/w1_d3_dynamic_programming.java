/*
 *  Homework - Dynamic Programming
 *
 *
 *  Instructions: Dynamic programming takes a lot of practice to recognize as
 *                well as develop algorithms. Thus we will be working on a few
 *                different DPProblems using dynammic programming.
 *
 *                As a reminder, here are the two dynamic programing approaches:
 *
 *      			(1) Overlapping subDPProblems - Memoization
 *      				  Recursion sometimes call subDPProblems repeatedly. These repeated
 *                calls lead to inefficient computations and an exponential time
 *                complexity.
 *
 *      			(2) Optimal substructure - Tabulation
 *      					The solution of a larger problem can be solved using
 *      					solutions of its subDPProblems.
 */

class DPProblems {

  /*
   *  Problem: Lattice Paths (Dynamic Programming Approach)
   *
   *  Prompt:    Count the number of unique paths to travel from the top left
   *             to the bottom right of a lattice of squares.
   *
   *             NOTE: You are traveling along the **EDGES** of the lattice
   *
   *  Input:     An integer N (which is the width of the lattice)
   *             An integer M (which is the height of the lattice)
   *
   *  Output:    An integer (which represents the number of unique paths)
   *
   *  Example:   input: 2
   *
   *             (2 x 3 lattice of squares)
   *              __ __ __
   *             |__|__|__|
   *             |__|__|__|
   *
   *             output: 10 (number of unique paths from top left corner to bottom
   *                     right)
   *
   *             Diagram:
   *
   *             1__1__1__1
   *             |  |  |  |
   *             1__2__3__4
   *             |  |  |  |
   *             1__3__6__10
   *
   *  Notes:     What is the time and auxilliary space complexity of your solution?
   *
   *             When moving through the lattice, you can only move either down or
   *             to the right.
   *
   *             You did this problem before with recursion. Try implementing it
   *             now with dynamic programming!
   *
   *  Resources:
   *    1: https://projecteuler.net/problem=15
   *    2: https://en.wikipedia.org/wiki/Lattice_path
   *
   */

  // Time Complexity:
  // Auxiliary Space Complexity:
  public static int latticePaths(int m, int n) {
    //YOUR WORK HERE
    return -1;
   }

}

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class DPTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("Lattice Paths Tests");

    assertTest(testCount, "should work on a 2 x 3 lattice", () -> DPProblems.latticePaths(2, 3) == 10);

    assertTest(testCount, "should return the same for a 3 x 2 lattice", () -> DPProblems.latticePaths(3, 2) == 10);

    assertTest(testCount, "should return the same for a 0 x 0 lattice", () -> DPProblems.latticePaths(0, 0) == 1);

    assertTest(testCount, "should work for a 10 x 10 lattice (square input)", () -> DPProblems.latticePaths(10, 10) == 184756);

    assertTest(testCount, "should work for a 17 x 14 lattice (large input)", () -> DPProblems.latticePaths(17, 14) == 265182525);

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }



  // do not edit below, this is to wrap the test and check for exceptions
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
