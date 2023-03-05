/*
 *  Target Practice - Dynamic Programming pt. 2 / Sliding Window
 */

import java.util.*;

class DPProblems2 {

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
   * Input: str   (String)
   *        chars (String)
   *
   * Output: {String}
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
   public static String minimumWindowSubstring(String str, String targets) {
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
  *  Input:  dungeon {Integer[][]}
  *  Output: {Integer}
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

  public static int escape(int[][] dungeon) {
    //YOUR WORK HERE
    return -1;
  }

}





 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

 // use the Main class to run the test cases
 class DPProblems2Tests {
   // an interface to perform tests
   public interface Test {
     boolean execute();
   }

   public static void main(String[] args) {

     int[] testCount = {0, 0};
     System.out.println("Minimum Window Substring Tests");

     assertTest(testCount, "should work on first example case", () ->
             DPProblems2.minimumWindowSubstring("ADOBECODEBANC", "ABC").equals("BANC"));

     assertTest(testCount, "should work on second example case", () ->
             DPProblems2.minimumWindowSubstring("HELLO WORLD", "FOO").equals(""));

     // print the result of tests passed for a module
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


     // instantiate the testing of each module by resetting count and printing title of module
     testCount[0] = 0;
     testCount[1] = 0;

     System.out.println("Dungeon Escape Tests");

     // tests are in the form as shown
     assertTest(testCount, "should work for first example case", () -> {
       int[][] example = {{ -2, -5, 10},
                          { -3,-10, 30},
                          {  3,  1, -5}};
       int test = DPProblems2.escape(example);
       return test == 7;
     });

     assertTest(testCount, "should work for dungeon filled solely with health potions", () -> {
       int[][] example = {{  5,  1, 10},
                          { 10,312, 30},
                          {  3,  1,  7}};
       int test = DPProblems2.escape(example);
       return test == 1;
     });

     assertTest(testCount, "should work for an empty dungeon", () -> {
       int[][] example = {{  0,  0,  0},
                          {  0,  0,  0},
                          {  0,  0,  0}};
       int test = DPProblems2.escape(example);
       return test == 1;
     });

     assertTest(testCount, "should work for a dungeon filled only with monsters", () -> {
       int[][] example = {{ -3, -6,-13},
                          {-12, -1, -7},
                          { -5,-11, -2}};
       int test = DPProblems2.escape(example);
       return test == 20;
     });

     assertTest(testCount, "should work for a two-room dungeon starting with a monster", () -> {
       int[][] example = {{-2, 5}};
       int test = DPProblems2.escape(example);
       return test == 3;
     });

     assertTest(testCount, "should work for a two-room dungeon starting with a strong monster", () -> {
       int[][] example = {{-13, 5}};
       int test = DPProblems2.escape(example);
       return test == 14;
     });

     assertTest(testCount, "should work for a two-room dungeon starting with a health pot", () -> {
       int[][] example = {{5, -2}};
       int test = DPProblems2.escape(example);
       return test == 1;
     });

     assertTest(testCount, "should work for a two-room dungeon ending in a strong monster", () -> {
       int[][] example = {{5, -8}};
       int test = DPProblems2.escape(example);
       return test == 4;
     });

     assertTest(testCount, "should work a dungeon with only a monster", () -> {
       int[][] example = {{-14}};
       int test = DPProblems2.escape(example);
       return test == 15;
     });

     assertTest(testCount, "should work a dungeon with only a health pot", () -> {
       int[][] example = {{6}};
       int test = DPProblems2.escape(example);
       return test == 1;
     });

     assertTest(testCount, "should work a dungeon with a single empty room", () -> {
       int[][] example = {{0}};
       int test = DPProblems2.escape(example);
       return test == 1;
     });

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
