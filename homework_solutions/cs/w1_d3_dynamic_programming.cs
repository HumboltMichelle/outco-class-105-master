/**
 *  Homework - Dynamic Programming
 *
 *
 *  Instructions: Dynamic programming takes a lot of practice to recognize as
 *                well as develop algorithms. Thus we will be working on a few
 *                different problems using dynammic programming.
 *
 *                As a reminder, here are the two dynamic programing approaches:
 *
 *      			(1) Overlapping subproblems - Memoization
 *      				  Recursion sometimes call subproblems repeatedly. These repeated
 *                calls lead to inefficient computations and an exponential time
 *                complexity.
 *
 *      			(2) Optimal substructure - Tabulation
 *      					The solution of a larger problem can be solved using
 *      					solutions of its subproblems.
 */

using System;

class Problems {

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
   *  Output:    An interger (which represents the number of unique paths)
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

  // Time Complexity: O(max(M, N)^2)
  // Auxiliary Space Complexity: O(max(M,N))
   public static int latticePaths(int m, int n) {
     int larger = Math.Max(m, n);
     int smaller = Math.Min(m, n);

     int[] work = new int[larger+1];
     work[0] = 1;

     for (int i = 1 ; i < larger+1 ; i++) {
       int temp = 1;
       for (int j = 1 ; j < i+1 ; j++) {
         temp = temp + work[j];
         work[j] = temp;
       }
       work[i] = 2*temp;
     }

     return work[smaller];
   }

}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

    public static void Main() {
        int[] testCount = {0, 0};
        Console.WriteLine("Lattice Paths Tests");

        runTest(latticPathTest1, "should work on a 2 x 3 lattice", testCount);
        runTest(latticPathTest2, "should return the same for a 3 x 2 lattice", testCount);
        runTest(latticPathTest3, "should return the same for a 0 x 0 lattice", testCount);
        runTest(latticPathTest4, "should work for a 10 x 10 lattice (square input)", testCount);
        runTest(latticPathTest5, "should work for a 17 x 14 lattice (large input)", testCount);

        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
	}

    private static bool latticPathTest1() {
        return Problems.latticePaths(2, 3) == 10;
    }

    private static bool latticPathTest2() {
        return Problems.latticePaths(3, 2) == 10;
    }

    private static bool latticPathTest3() {
        return Problems.latticePaths(0, 0) == 1;
    }

    private static bool latticPathTest4() {
        return Problems.latticePaths(10, 10) == 184756;
    }

    private static bool latticPathTest5() {
        return Problems.latticePaths(17, 14) == 265182525;
    }

    private static void runTest(Func<bool> test, string testName, int[] testCount){
        testCount[1]++;
        bool testPassed = false;
        // Attempt to run test and suppress exceptions on failure
        try {
            testPassed = test();
            if(testPassed) testCount[0]++;
        } catch {}
        string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
        Console.WriteLine(result);
    }
}
