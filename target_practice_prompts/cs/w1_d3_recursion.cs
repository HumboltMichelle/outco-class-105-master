/*
 *  Target Practice - Recursion
 *
 *  Problem 1:  Powerset - Helper Method Recursion
 *
 *  Prompt:   Given a set S, return the powerset P(S), which is
 *            a set of all subsets of S.
 *
 *  Input:    {string}
 *  Output:   {Array}
 *
 *  Example:  S = "abc", P(S) = ['', 'a', 'b','c','ab','ac','bc','abc']
 *
 *  Notes:     The input string will not contain duplicate characters
 *            The letters in the subset string must be in the same order
 *            as the original input.
 *
 *  Hints:
 *
 *  From Cracking the Coding Interview, by Gayle Laakmann McDowell. 8.4: Powerset
 *
 *  #273. How can you build all subsets of {a , b, c} from the subsets of {a , b}?
 *
 *  #290. Anything that is a subset of {a , b} is also a subset of {a , b , c}. Which sets are
 *  subsets of {a , b , c} but not {a , b}?
 *
 *  #338. Subsets that contain c will be subsets {a , b , c} but not {a , b}. Can you build these
 *  subsets from the subsets of (a , b}?
 *
 *  #354. You can build the remaining subsets by adding c to all the subsets of {a , b).
 *
 *  #373. You can also do this by mapping each subset to a binary number. The i th bit could
 *  represent a "boolean" flag for whether an element is in the set.
 *
 */

using System;
using System.Linq;
using System.Collections.Generic;

class Powerset {

  public static List<string> compute(string str) {
    // YOUR WORK HERE
    return new List<string>();
  }

}



/*
*  Problem: Lattice Paths - Pure Recursion
*
*  Prompt:  Count the number of unique paths to travel from the top left
*           corder to the bottom right corner of a lattice of M x N squares.
*
*           When moving through the lattice, one can only travel to the adjacent
*           corner on the right or down.
*
*  Input:   m {Integer} - rows of squares
*  Input:   n {Integer} - column of squares
*  Output:  {Integer}
*
*  Example: input: (2, 3)
*
*           (2 x 3 lattice of squares)
*            __ __ __
*           |__|__|__|
*           |__|__|__|
*
*           output: 10 (number of unique paths from top left corner to bottom right)
*
*  Resource: https://projecteuler.net/problem=15
*
*/

// Time Complexity:
// Auxiliary Space Complexity:
class LatticePaths {
  public static int compute(int m, int n) {
    // YOUR WORK HERE
    return -1;
  }
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    powerSetTests();
    latticePathsTests();
  }


  private static void powerSetTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Power Set Tests");
    runTest(powerSetTest1, "should work on example input", testCount);
    runTest(powerSetTest2, "should work on empty input", testCount);
    runTest(powerSetTest3, "should work on two-letter input", testCount);
    runTest(powerSetTest4, "should work on longer input", testCount);
    printTestsPassed(testCount);
  }

  private static void latticePathsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Lattice Paths Tests");
    runTest(latticePathsTest1, "should work on example case", testCount);
    runTest(latticePathsTest2, "should return 1 for 0 x 0 lattice", testCount);
    runTest(latticePathsTest3, "should return 2496144 for 13 x 11 lattice", testCount);
    printTestsPassed(testCount);
  }

  private static bool powerSetTest1() {
    List<string> result = Powerset.compute("abc");
    List<string> answer = new List<string>(){"", "c", "b", "bc", "a", "ac", "ab", "abc"};
    result.Sort();
    answer.Sort();
    return result.SequenceEqual(answer);
  }

  private static bool powerSetTest2() {
    List<string> result = Powerset.compute("");
    List<string> answer = new List<string>(){""};
    result.Sort();
    answer.Sort();
    return result.SequenceEqual(answer);
  }

  private static bool powerSetTest3() {
    List<string> result = Powerset.compute("ab");
    List<string> answer = new List<string>(){"","a","b","ab"};
    result.Sort();
    answer.Sort();
    return result.SequenceEqual(answer);
  }

  private static bool powerSetTest4() {
    List<string> result = Powerset.compute("abcdefg");
    List<string> answer = new List<string>(){"","g","f","fg","e","eg","ef","efg","d",
                "dg","df","dfg","de","deg","def","defg","c","cg","cf","cfg","ce","ceg",
                "cef","cefg","cd","cdg","cdf","cdfg","cde","cdeg","cdef","cdefg","b","bg",
                "bf","bfg","be","beg","bef","befg","bd","bdg","bdf","bdfg","bde","bdeg",
                "bdef","bdefg","bc","bcg","bcf","bcfg","bce","bceg","bcef","bcefg","bcd",
                "bcdg","bcdf","bcdfg","bcde","bcdeg","bcdef","bcdefg","a","ag","af","afg",
                "ae","aeg","aef","aefg","ad","adg","adf","adfg","ade","adeg","adef",
                "adefg","ac","acg","acf","acfg","ace","aceg","acef","acefg","acd","acdg",
                "acdf","acdfg","acde","acdeg","acdef","acdefg","ab","abg","abf","abfg",
                "abe","abeg","abef","abefg","abd","abdg","abdf","abdfg","abde","abdeg",
                "abdef","abdefg","abc","abcg","abcf","abcfg","abce","abceg","abcef",
                "abcefg","abcd","abcdg","abcdf","abcdfg","abcde","abcdeg","abcdef","abcdefg"};
    result.Sort();
    answer.Sort();
    return result.SequenceEqual(answer);
  }

  private static bool latticePathsTest1() {
    return LatticePaths.compute(2, 3) == 10;
  }

  private static bool latticePathsTest2() {
    return LatticePaths.compute(0, 0) == 1;
  }

  private static bool latticePathsTest3() {
    return LatticePaths.compute(13, 11) == 2496144;
  }


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a boolean
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
