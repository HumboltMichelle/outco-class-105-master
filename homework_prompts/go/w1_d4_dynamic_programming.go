/*
 *  Homework - Sliding Window
 *
 */

package main
import (
  "fmt"
  "strconv"
)


/* Problem 1: Max Consecutive Sum
*
*  Prompt:    Given an array of integers find the sum of consecutive
*             values in the array that produces the maximum value.
*
*  Input:     Unsorted array of positive and negative integers
*  Output:    Integer (max consecutive sum)
*
*  Example:   input = [6, -1, 3, 5, -10]
*             output = 13 (6 + -1 + 3 + 5 = 13)
*
*/

// Time Complexity:
// Auxiliary Space Complexity:
func maxConsecutiveSum(arr []int) int {
  //YOUR WORK HERE
  return -1;
}

/*
*  Problem 2: Bit Flip
*
*     Given an array of binary values (0 and 1) and N number of flips (convert
*     a 0 to a 1), determine the maximum number of consecutive 1's that can be
*     made.
*
*  Input: An Array of 1's and 0's, and an Integer N denoting the number of
*         flips
*  Output: Integer
*
*  Example: bitFlip([0,1,1,1,0,1,0,1,0,0], 2)
*  Result: 7
*/

// Time Complexity:
// Auxiliary Space Complexity:
func bitFlip(arr []int, N int) int {
  //YOUR WORK HERE
  return -1;
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////


func main(){
  maxConsecutiveSumTests()
  bitFlipTests()
}

func maxConsecutiveSumTests() {
  testCount := []int{0,0}
  fmt.Println("maxConsecutiveSum Tests")
  runTest(maxConsecutiveSumTest1, "should work on example input", testCount);
  runTest(maxConsecutiveSumTest2, "should work on single-element input", testCount);
  runTest(maxConsecutiveSumTest3, "should return 0 for empty input", testCount);
  runTest(maxConsecutiveSumTest4, "should work on longer input", testCount);
  printTestsPassed(testCount);
}

func bitFlipTests() {
  testCount := []int{0,0}
  fmt.Println("bitFlip Tests")
  runTest(bitFlipTest1, "should handle example case", testCount)
  runTest(bitFlipTest2, "should handle smaller edge case where flip is allowed", testCount)
  runTest(bitFlipTest3, "should handle smaller edge case where flip is not allowed", testCount)
  printTestsPassed(testCount)
}

func maxConsecutiveSumTest1() bool {
    return maxConsecutiveSum([]int{6, -1, 3, 5, -10}) == 13;
}

func maxConsecutiveSumTest2() bool {
    return maxConsecutiveSum([]int{5}) == 5;
}

func maxConsecutiveSumTest3() bool {
    return maxConsecutiveSum([]int{}) == 0;
}

func maxConsecutiveSumTest4() bool {
    return maxConsecutiveSum([]int{-2, 1, -3, 4, -1, 2, 1, -5, 4}) == 6;
}


func bitFlipTest1() bool {
    input := []int{0,1,1,1,0,1,0,1,0,0}
    output := bitFlip(input, 2)
    return output == 7
}

func bitFlipTest2() bool {
    input := []int{0}
    output := bitFlip(input, 1)
    return output == 1
}

func bitFlipTest3() bool {
    input := []int{0}
    output := bitFlip(input, 0)
    return output == 0
}


/*** Utility Functions ***/
func runTest(test func() bool, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = test()
  if(testPassed) {testCount[0]++}
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName;
  fmt.Println(result);
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}

func max(x, y int) int {
  if(x > y) {return x}
  return y
}
