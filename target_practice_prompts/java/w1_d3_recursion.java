/*
 *  Target Practice - Recursion
 *
 *  Problem 1:  Powerset - Helper Method Recursion
 *
 *  Prompt:   Given a set S, return the powerset P(S), which is
 *            a set of all subsets of S.
 *
 *  Input:    {String}
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

import java.util.*;
import java.util.ArrayList;


class Powerset {

  public static List<String> compute(String str) {
    // YOUR WORK HERE
    return new ArrayList<String>();
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

// use the Main class to run the test cases
class RecursionTests {
  // an interface to perform tests
  public interface Test {
      boolean execute();
  }

  public static void main(String[] args) {
    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Power Set Tests");

    // tests are in the form as shown
    assertTest(testCount, "should work on example input", () -> {

      List<String> result = Powerset.compute("abc");

      List<String> answer = Arrays.asList("", "c", "b", "bc", "a", "ac", "ab", "abc");

      Collections.sort(result);
      Collections.sort(answer);

      return result.equals(answer);
    });

    assertTest(testCount, "should work on empty input", () -> {

      List<String> result = Powerset.compute("");

      List<String> answer = new ArrayList<>(Collections.singletonList(""));

      Collections.sort(result);
      Collections.sort(answer);

      return result.equals(answer);
    });

    assertTest(testCount, "should work on two-letter input", () -> {

      List<String> result = Powerset.compute("ab");

      List<String> answer = Arrays.asList("","a","b","ab");

      Collections.sort(result);
      Collections.sort(answer);

      return result.equals(answer);
    });

    assertTest(testCount, "should work on longer input", () -> {

      List<String> result = Powerset.compute("abcdefg");

      List<String> answer = Arrays.asList("","g","f","fg","e","eg","ef","efg","d",
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
              "abcefg","abcd","abcdg","abcdf","abcdfg","abcde","abcdeg","abcdef","abcdefg");

      Collections.sort(result);
      Collections.sort(answer);

      return result.equals(answer);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;

    System.out.println("Lattice Paths Tests");

    // tests are in the form as shown
    assertTest(testCount, "should work on example case", () -> LatticePaths.compute(2, 3) == 10);

    assertTest(testCount, "should return 1 for 0 x 0 lattice", () -> LatticePaths.compute(0, 0) == 1);

    assertTest(testCount, "should return 2496144 for 13 x 11 lattice", () -> LatticePaths.compute(13, 11) == 2496144);


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
