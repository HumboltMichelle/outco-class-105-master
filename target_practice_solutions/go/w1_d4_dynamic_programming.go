/*
*  Target Practice - Dynamic Programming - Tabulation/Memoization
*
*/

package main
import (
  "fmt"
  "strconv"
)

/*          Given an array of coins and a target total, return how many
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

// Time Complexity: O(NK)
// Auxiliary Space Complexity: O(N)
// where N refers to the target total, and K refers to the length of the coins
// array

func coinSum(coins []int, total int) int {
  table := make([]int, total+1)
  table[0] = 1

  for _,coin := range coins {
    for j := coin; j < len(table); j++ {
      table[j] = table[j] + table[j - coin]
    }
  }
  return table[len(table) - 1]
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  coinSumTests()
}

func coinSumTests() {
  testCount := []int{0,0}
  fmt.Println("Coin Sum Tests")
  runTest(coinSumTest1, "should work for first example case", testCount)
  runTest(coinSumTest2, "should work for second example case", testCount)
  runTest(coinSumTest3, "should work for a single coin", testCount)
  printTestsPassed(testCount)
}
func coinSumTest1() bool {
  return coinSum([]int{1,2,3}, 4) == 4
}
func coinSumTest2() bool {
  return coinSum([]int{2,5,3,6}, 10) == 5
}
func coinSumTest3() bool {
  return coinSum([]int{2}, 10) == 1
}

/*** Utility Functions ***/
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
