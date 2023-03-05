/*
*  Target Practice - Dynamic Programming - Tabulation/Memoization
*
*          Given an array of coins and a target total, return how many
*          unique ways there are to use the coins to make up that total.
*
*  Input:  coins {Integer Array}, total {Integer}
*  Output: {Integer}
*
*
* Example:
*  Input:  [1,2,3], 4
*  Output: 4
*
*          1+1+1+1
*          1+3
*          1+1+2
*          2+2
*
*
*  Input:  [2,5,3,6], 10
*  Output: 5
*
*          2+3+5
*          5+5
*          2+3+2+3
*          2+2+6
*          2+2+2+2+2
*
*    Note: You have an unlimited number of each coin type. All coins in the
*          coin array will be unique
*          Order does not matter. Ex: One penny and one nickel to create six
*          cents is equivalent to one nickel and one penny
*
*/

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

class Problems {

   // Time Complexity: O(NK)
   // Auxiliary Space Complexity: O(N)
   // where N refers to the target total, and K refers to the length of the coins
   // array

   public static int coinSum(int[] coins, int total) {
     int[] table = new int[total + 1];
     table[0] = 1;

     for (int i = 0; i < coins.Length; i++) {
       int coin = coins[i];
       for (int j = coin; j < table.Length; j++) {
         table[j] = table[j] + table[j - coin];
       }
     }
     return table[table.Length - 1];
   }
}

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    coinSumTests();
	}

  private static void coinSumTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Coin Sum Tests");
    runTest(coinSumTest1, "should work for first example case", testCount);
    runTest(coinSumTest2, "should work for second example case", testCount);
    runTest(coinSumTest3, "should work for a single coin", testCount);
    printTestsPassed(testCount);
  }


  private static bool coinSumTest1() {
    return Problems.coinSum(new int[]{1,2,3}, 4) == 4;
  }
  private static bool coinSumTest2() {
    return Problems.coinSum(new int[]{2,5,3,6}, 10) == 5;
  }
  private static bool coinSumTest3() {
    return Problems.coinSum(new int[]{2}, 10) == 1;
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
      } catch {}
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
  // this is to print the number of test cases passed for a test suite function
  private static void printTestsPassed(int[] testCount) {
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }
}
