/*
 *  Target Practice - Sliding Window / Dynamic Programming 2
 */

 package main
 import (
   "fmt"
   "strconv"
 )


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
func minimumWindowSubstring(str string, targets string) string {
  //YOUR WORK HERE
  return ""
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
func escape(dungeon [][]int) int {
  //YOUR WORK HERE
  return -1
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  minimumWindowSubstringTests()
  dungeonEscapeTests()
}

func minimumWindowSubstringTests() {
  testCount := []int{0,0}
  fmt.Println("Minimum Window Substring Tests")
  runTest(minimumWindowSubstringTest1, "should work for first example case", testCount)
  runTest(minimumWindowSubstringTest2, "should work for second example case", testCount)
  printTestsPassed(testCount)
}

func dungeonEscapeTests() {
  testCount := []int{0,0}
  fmt.Println("Dungeon Escape Tests")
  runTest(dungeonEscapeTest1, "should work for first example case", testCount)
  runTest(dungeonEscapeTest2, "should work for dungeon filled solely with health potions", testCount)
  runTest(dungeonEscapeTest3, "should work for an empty dungeon", testCount)
  runTest(dungeonEscapeTest4, "should work for a dungeon filled only with monsters", testCount)
  runTest(dungeonEscapeTest5, "should work for a two-room dungeon starting with a monster", testCount)
  runTest(dungeonEscapeTest6, "should work for a two-room dungeon starting with a strong monster", testCount)
  runTest(dungeonEscapeTest7, "should work for a two-room dungeon starting with a health pot", testCount)
  runTest(dungeonEscapeTest8, "should work for a two-room dungeon ending in a strong monster", testCount)
  runTest(dungeonEscapeTest9, "should work a dungeon with only a monster", testCount)
  runTest(dungeonEscapeTest10, "should work a dungeon with only a health pot", testCount)
  runTest(dungeonEscapeTest11, "should work a dungeon with a single empty room", testCount)
  printTestsPassed(testCount)
}


func minimumWindowSubstringTest1() bool {
  return minimumWindowSubstring("ADOBECODEBANC", "ABC") == ("BANC")
}

func minimumWindowSubstringTest2() bool {
  return minimumWindowSubstring("HELLO WORLD", "FOO") == ("")
}


func dungeonEscapeTest1() bool {
  example := [][]int{{ -2, -5, 10},
                    { -3,-10, 30},
                    {  3,  1, -5}}
  return escape(example) == 7
}

func dungeonEscapeTest2() bool {
  example := [][]int{{  5,  1, 10},
                          { 10,312, 30},
                          {  3,  1,  7}}
  return escape(example) == 1
}

func dungeonEscapeTest3() bool {
  example := [][]int{{  0,  0,  0},
                          {  0,  0,  0},
                          {  0,  0,  0}}
  return escape(example) == 1
}

func dungeonEscapeTest4() bool {
  example := [][]int{{ -3, -6,-13},
                          {-12, -1, -7},
                          { -5,-11, -2}}
  return escape(example) == 20
}

func dungeonEscapeTest5() bool {
  example := [][]int{{-2, 5}}
  return escape(example) == 3
}

func dungeonEscapeTest6() bool {
  example := [][]int{{-13, 5}}
  return escape(example) == 14
}

func dungeonEscapeTest7() bool {
  example := [][]int{{5, -2}}
  return escape(example) == 1
}

func dungeonEscapeTest8() bool {
  example := [][]int{{5, -8}}
  return escape(example) == 4
}

func dungeonEscapeTest9() bool {
  example := [][]int{{-14}}
  return escape(example) == 15
}

func dungeonEscapeTest10() bool {
  example := [][]int{{6}}
  return escape(example) == 1
}

func dungeonEscapeTest11() bool {
  example := [][]int{{0}}
  return escape(example) == 1
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
