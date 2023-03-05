/*
 *  Target Practice - Recursion
 *
 */

package main
import (
  "fmt"
  "strconv"
  "sort"
)

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

// Time Complexity: O(2^(M+N))
// Auxiliary Space Complexity: O(M+N)
func latticePaths(m int, n int) int {
  if m == 0 && n == 0 {
    return 1
  }
  if m < 0 || n < 0 {
    return 0
  }
  return latticePaths(m - 1, n) + latticePaths(m, n - 1)
}



/*
 *  Problem:  Powerset - Helper Method Recursion
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
 */
var results []string
var input string
func traverse(buildUp string, depth int) {
  if depth == len(input) {
    results = append(results, buildUp)
    return
  }

  traverse(buildUp, depth + 1)
  traverse(buildUp + string(input[depth]), depth + 1)
}
func powerset(str string) []string {
  results = []string{}
  input = str
  traverse("", 0)
  return results
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  latticePathsTests()
  powerSetTests()
}

func powerSetTests() {
  testCount := []int{0,0}
  fmt.Println("Power Set Tests")
  runTest(powerSetTest1, "should work on example input", testCount)
  runTest(powerSetTest2, "should work on empty input", testCount)
  runTest(powerSetTest3, "should work on two-letter input", testCount)
  runTest(powerSetTest4, "should work on longer input", testCount)
  printTestsPassed(testCount)
}

func latticePathsTests() {
  testCount := []int{0,0}
  fmt.Println("Lattice Paths Tests")
  runTest(latticePathsTest1, "should work on example case", testCount)
  runTest(latticePathsTest2, "should return 1 for 0 x 0 lattice", testCount)
  runTest(latticePathsTest3, "should return 2496144 for 13 x 11 lattice", testCount)
  printTestsPassed(testCount)
}


func powerSetTest1() bool {
  result := powerset("abc")
  answer := []string{"", "c", "b", "bc", "a", "ac", "ab", "abc"}
  sort.Strings(result)
  sort.Strings(answer)
  return areEqual(result, answer)
}

func powerSetTest2() bool {
  result := powerset("")
  answer := []string{""}
  sort.Strings(result)
  sort.Strings(answer)
  return areEqual(result, answer)
}

func powerSetTest3() bool {
  result := powerset("ab")
  answer := []string{"","a","b","ab"}
  sort.Strings(result)
  sort.Strings(answer)
  return areEqual(result, answer)
}

func powerSetTest4() bool {
  result := powerset("abcdefg")
  answer := []string{"","g","f","fg","e","eg","ef","efg","d",
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
              "abcefg","abcd","abcdg","abcdf","abcdfg","abcde","abcdeg","abcdef","abcdefg"}
  sort.Strings(result)
  sort.Strings(answer)
  return areEqual(result, answer)
}

func latticePathsTest1() bool {
  return latticePaths(2, 3) == 10
}

func latticePathsTest2() bool {
  return latticePaths(0, 0) == 1
}

func latticePathsTest3() bool {
  return latticePaths(13, 11) == 2496144
}




/*** Utility Functions ***/
func areEqual(list1 []string, list2 []string) bool {
  if(len(list1) != len(list2)) {
    return false
  }
  for i := 0; i < len(list1) ; i++ {
    if(list1[i] != list2[i]) {
      return false
    }
  }
  return true
}

func runTest(test func() bool, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = test()
  if(testPassed) {testCount[0]++}
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
  fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
