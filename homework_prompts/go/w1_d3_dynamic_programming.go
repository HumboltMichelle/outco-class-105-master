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

package main
import (
  "fmt"
  "strconv"
)

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

// Time Complexity:
// Auxiliary Space Complexity:
func latticePaths(m int, n int) int {
  //YOUR WORK HERE
  return -1
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////


func main(){
  testCount := []int{0,0}
  fmt.Println("Lattice Paths Tests")
  runTest(latticPathTest1, "should work on a 2 x 3 lattice", testCount)
  runTest(latticPathTest2, "should return the same for a 3 x 2 lattice", testCount)
  runTest(latticPathTest3, "should return the same for a 0 x 0 lattice", testCount)
  runTest(latticPathTest4, "should work for a 10 x 10 lattice (square input)", testCount)
  runTest(latticPathTest5, "should work for a 17 x 14 lattice (large input)", testCount)
  printTestsPassed(testCount)
}

func latticPathTest1() bool {
    return latticePaths(2, 3) == 10
}

func latticPathTest2() bool {
    return latticePaths(3, 2) == 10
}

func latticPathTest3() bool {
    return latticePaths(0, 0) == 1
}

func latticPathTest4() bool {
    return latticePaths(10, 10) == 184756
}

func latticPathTest5() bool {
    return latticePaths(17, 14) == 265182525
}


/*** Utility Functions ***/
func max(x, y int) int {
  if(x > y) {return x}
  return y
}

func min(x, y int) int {
  if(x < y) {return x}
  return y
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
