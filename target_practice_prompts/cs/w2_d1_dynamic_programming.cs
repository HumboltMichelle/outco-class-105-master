/*
 *  Target Practice - Sliding Window / Dynamic Programming 2
 */

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

class Problems {

  /*
   * Minimum Window Substring (Sliding Window)
   *
   * Given a string, and a set of characters
   * return the substring representing the SMALLEST
   * window containing those characters.
   *
   * The characters needn't appear in the order in which they are given.
   *
   * If not all the characters are present in the string, return the empty string.
   *
   *
   * Input: str   (string)
   *        chars (string)
   *
   * Output: {string}
   *
   *
   * Example:
   *  Input: "ADOBECODEBANC", "ABC"
   *  Output: "BANC"
   *
   *  Input: "HELLO WORLD", "FOO"
   *  Output: ""
   *
   *
   * Explanation:
   *   Though there are many substrings containing all the characters
   *   "BANC" is the shortest.
   *
   * Assume that there won't be repeated characters in the second string input.
   *
   * Ignore capitalization.
   * (though taking it into account doesn't change the solution much)
   *
   * But as extra credit, how would you handle repeats?
   * Meaning if you were given two "A" characters, a valid window MUST
   * contain two "A"s
   *
   *
   */

  // Time Complexity:
  // Auxiliary Space Complexity:
   public static string minimumWindowSubstring(string str, string targets) {
     //YOUR WORK HERE
     return "";
   }



  /*
  *  Problem: Dungeon Escape
  *
  *          Given a matrix of integers that represents rooms in a dungeon,
  *          determine the minimum amount of health a adventurer must start with
  *          in order to escape the dungeon
  *
  *          The adventurer starts at the upper left corner of the matrix, and
  *          the exit is located at the bottom right corner.
  *
  *          The adventurer must leave the dungeon before sundown, so in the
  *          interest of time, this brave adventurer decides to only travel
  *          downwards and to the right
  *
  *          Negative integers represent rooms with monsters, so the adventurer
  *          would lose health when going though these rooms. 0s represent empty
  *          rooms, and positive integers represent rooms that contain health
  *          pots that will increase the adventurer's health
  *
  *
  *  Input:  dungeon {int[,]}
  *  Output: {int}
  *
  *
  * Example:
  *  Input:  [[ -2, -5, 10],
  *           [ -3,-10, 30],
  *           [  3,  1, -5]]
  *
  *  Output: 7 (The steps to do this would be down, down, right, right)
  *
  *
  *    Note: The initial health should be represented by a positve integers
  *          If the health ever drops to zero or a negative integer, the
  *          adventurer dies.
  *          Every room will contain an integer. It will either be empty (0),
  *          contain a monster (negative), or contain a health pot (positive).
  *          You could create every single possible path, but there is of course
  *          a dynamic programming approach to not go with this route.
  *
  */



  // Time Complexity:
  // Auxiliary Space Complexity:

  public static int escape(int[,] dungeon) {
    //YOUR WORK HERE
    return -1;
  }

}

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    minimumWindowSubstringTests();
    dungeonEscapeTests();
	}

  private static void minimumWindowSubstringTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Minimum Window Substring Tests");
    runTest(minimumWindowSubstringTest1, "should work for first example case", testCount);
    runTest(minimumWindowSubstringTest2, "should work for second example case", testCount);
    printTestsPassed(testCount);
  }

  private static void dungeonEscapeTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Dungeon Escape Tests");
    runTest(dungeonEscapeTest1, "should work for first example case", testCount);
    runTest(dungeonEscapeTest2, "should work for dungeon filled solely with health potions", testCount);
    runTest(dungeonEscapeTest3, "should work for an empty dungeon", testCount);
    runTest(dungeonEscapeTest4, "should work for a dungeon filled only with monsters", testCount);
    runTest(dungeonEscapeTest5, "should work for a two-room dungeon starting with a monster", testCount);
    runTest(dungeonEscapeTest6, "should work for a two-room dungeon starting with a strong monster", testCount);
    runTest(dungeonEscapeTest7, "should work for a two-room dungeon starting with a health pot", testCount);
    runTest(dungeonEscapeTest8, "should work for a two-room dungeon ending in a strong monster", testCount);
    runTest(dungeonEscapeTest9, "should work a dungeon with only a monster", testCount);
    runTest(dungeonEscapeTest10, "should work a dungeon with only a health pot", testCount);
    runTest(dungeonEscapeTest11, "should work a dungeon with a single empty room", testCount);
    printTestsPassed(testCount);
  }


  private static bool minimumWindowSubstringTest1() {
    return Problems.minimumWindowSubstring("ADOBECODEBANC", "ABC").Equals("BANC");
  }

  private static bool minimumWindowSubstringTest2() {
    return Problems.minimumWindowSubstring("HELLO WORLD", "FOO").Equals("");
  }


  private static bool dungeonEscapeTest1() {
    int[,] example = {{ -2, -5, 10},
                      { -3,-10, 30},
                      {  3,  1, -5}};
    int test = Problems.escape(example);
    return test == 7;
  }

  private static bool dungeonEscapeTest2() {
    int[,] example = {{  5,  1, 10},
                            { 10,312, 30},
                            {  3,  1,  7}};
    int test = Problems.escape(example);
    return test == 1;
  }

  private static bool dungeonEscapeTest3() {
    int[,] example = {{  0,  0,  0},
                            {  0,  0,  0},
                            {  0,  0,  0}};
    int test = Problems.escape(example);
    return test == 1;
  }

  private static bool dungeonEscapeTest4() {
    int[,] example = {{ -3, -6,-13},
                            {-12, -1, -7},
                            { -5,-11, -2}};
    int test = Problems.escape(example);
    return test == 20;
  }

  private static bool dungeonEscapeTest5() {
    int[,] example = {{-2, 5}};
    int test = Problems.escape(example);
    return test == 3;
  }

  private static bool dungeonEscapeTest6() {
    int[,] example = {{-13, 5}};
    int test = Problems.escape(example);
    return test == 14;
  }

  private static bool dungeonEscapeTest7() {
    int[,] example = {{5, -2}};
    int test = Problems.escape(example);
    return test == 1;
  }

  private static bool dungeonEscapeTest8() {
    int[,] example = {{5, -8}};
    int test = Problems.escape(example);
    return test == 4;
  }

  private static bool dungeonEscapeTest9() {
    int[,] example = {{-14}};
    int test = Problems.escape(example);
    return test == 15;
  }

  private static bool dungeonEscapeTest10() {
    int[,] example = {{6}};
    int test = Problems.escape(example);
    return test == 1;
  }

  private static bool dungeonEscapeTest11() {
    int[,] example = {{0}};
    int test = Problems.escape(example);
    return test == 1;
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
