/*
 * Homework - Decrease and Conquer
 * Utilize the decrease and conquer pattern to solve these problems.
 */


package main
import (
  "fmt"
  "strconv"
)


/* Number of Ones
 *
 * Given a sorted bit array/vector (values of either 0 or 1), determine the number of 1's in the array.*
 *
 * **Parameters**
 * Input: arr {Array/vector of Integers}
 * Output: {Integer}
 *
 * **Constraints**
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1] --> 8`
 * `[0, 0, 0] --> 0`
 * `[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1] --> 7`
 */

func numberOfOnes(arr []int) int {
  // YOUR WORK HERE
  return -1
}

/*
* Closest Value
*
* Given a sorted bit array/vector of integers, and a target value, find the number in the array that is closest to the target.*
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Integer}
*
* **Constraints**
* If there are two numbers tied for the closest value, return the lowest value.
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[1, 2, 3, 5, 5, 7, 9, 10, 11], 6 --> 5`
* `[1, 2, 3], 8 --> 3`
* `[1, 10, 22, 59, 67, 72, 100], 70 --> 72`
*/

func closestValue(arr []int, target int) int {
  // YOUR WORK HERE
  return -1
}


/*
* Square Root
*
* Given a positive integer, find the square root.*
*
* **Parameters**
* Input: value {Double}
* Output: {Double}
*
* **Constraints**
* Do not use a native built in method.
* Ensure the result is accurate to 6 decimal places (0.000001)
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `4 --> 2.0`
* `98 --> 9.899495`
* `14856 --> 121.885192
*/


func squareRoot(n float64) float64 {
  // YOUR WORK HERE
  return -1.0
}


/*
* Greater Values
*
* *Given a sorted array/vector of integers, and a target value return the number of values greater the target.*
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Integer}
*
* **Constraints**
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[1, 2, 3, 5, 5, 7, 9, 10, 11], 5 --> 4`
* `[1, 2, 3], 4 --> 0`
* `[1, 10, 22, 59, 67, 72, 100], 13 --> 5`
*
*/

func greaterValues(arr []int, target int) int {
  // YOUR WORK HERE
  return -1
}


/*
* Sorted and Rotated Array [Extra Credit]
*
* *Given an array/vector that is sorted and rotated, find out if a target value exists in the array.*
*
* A sorted array is rotated by taking an unknown amount of values from the beginning and placing it at the end.
*
* `[3, 4, 5, 1, 2]` is rotated left by 2.
* `[99, 14, 25, 78, 93]` is rotated to the right by 1.
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Boolean}
*
* **Constraints**
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[35, 46, 79, 102, 1, 14, 29, 31], 46 --> true`
* `[35, 46, 79, 102, 1, 14, 29, 31], 47 --> false`
* `[7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 9 --> true`
*/

func binarySearch(nums []int, start int, end int, target int) bool {
  // YOUR WORK HERE
  return false
}

func rotatedArraySearch(nums []int, target int) bool {
  // YOUR WORK HERE
  return false
}



/*
* Multiplication Using Russian Peasant [Extra Credit]
*
* *Given two positive integers, return its product using Russian Peasant method of multiplication*
*
* Read up on how to apply the Russian Peasant method [here](https: *en.wikipedia.org/wiki/Ancient_Egyptian_multiplication). It is also referred to as the Egyptian multiplication.
*
* **Parameters**
* Input: a {Integer}
* Input: b {Integer}
* Output: {Integer}
*
* **Constraints**
* Assume a <= b, and the value of a is N.
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `487, 734 --> 357458`
* `846, 908--> 768168`
*/

func multiplicationRussianPeasant(a int, b int) int{
  // YOUR WORK HERE
  return -1
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  numberOfOnesTests();
  closestValueTests();
  squareRootTests();
  greaterValuesTests();
  rotatedSortedArrayTests();
  multiplicationRussianTests();
}


func numberOfOnesTests() {
    testCount := []int{0, 0}
    fmt.Println("Number Of Ones Tests")
    runTest(numberOfOnesTest1, "should return correct number of ones for array with zeroes and ones", testCount);
    runTest(numberOfOnesTest2, "should return correct number of ones for array with all zeroes", testCount);
    runTest(numberOfOnesTest3, "should return correct number of ones for array with all ones", testCount);
    printTestsPassed(testCount);
}

func closestValueTests() {
    testCount := []int{0, 0}
    fmt.Println("Closest Value Tests")
    runTest(closestValueTest1, "should return correct closest value for number in the middle range", testCount);
    runTest(closestValueTest2, "should return closest value for highest number", testCount);
    runTest(closestValueTest3, "should return closest value for lowest number", testCount);
    printTestsPassed(testCount);
}

func squareRootTests() {
    testCount := []int{0, 0}
    fmt.Println("Square Root Tests")
    runTest(squareRootTest1, "should return correct square root for number < 10", testCount);
    runTest(squareRootTest2, "should return correct square root for number between 10 and 100", testCount);
    runTest(squareRootTest3, "should return correct square root for number over 10,000", testCount);
    printTestsPassed(testCount);
}

func greaterValuesTests() {
    testCount := []int{0, 0}
    fmt.Println("Greater Values Tests")
    runTest(greaterValuesTest1, "should return greater values for number in the middle of the array", testCount);
    runTest(greaterValuesTest2, "should return 0 for number greater than largest in the array", testCount);
    runTest(greaterValuesTest3, "should return length of array for number less than least in the array", testCount);
    printTestsPassed(testCount);
}

func rotatedSortedArrayTests() {
    testCount := []int{0, 0}
    fmt.Println("Rotated Sorted Array Tests")
    runTest(rotatedSortedArrayTest1, "returns true when target is in the array", testCount);
    runTest(rotatedSortedArrayTest2, "returns false when target is not in the array", testCount);
    runTest(rotatedSortedArrayTest3, "returns true when target is the first number in the array", testCount);
    runTest(rotatedSortedArrayTest4, "returns true when target is the last number in the array", testCount);
    printTestsPassed(testCount);
}

func multiplicationRussianTests() {
    testCount := []int{0, 0}
    fmt.Println("Multiplication Russian Tests")
    runTest(multiplicationRussianTest1, "returns correct value for two integers", testCount);
    printTestsPassed(testCount);
}


func numberOfOnesTest1() bool {
    return numberOfOnes([]int{0, 0, 0, 1, 1, 1}) == 3;
}

func numberOfOnesTest2() bool {
    return numberOfOnes([]int{0, 0, 0, 0, 0, 0}) == 0;
}

func numberOfOnesTest3() bool {
    return numberOfOnes([]int{1, 1, 1, 1, 1}) == 5;
}


func closestValueTest1() bool {
    return closestValue([]int{1, 2, 3, 5, 5, 7, 9, 10, 11}, 6) == 5;
}

func closestValueTest2() bool {
    return closestValue([]int{1, 2, 3}, 8) == 3;
}

func closestValueTest3() bool {
    return closestValue([]int{-2, -1, 0}, -5) == -2;
}

func squareRootTest1() bool {
    return squareRoot(4.0) == 2.0;
}

func squareRootTest2() bool {
    return squareRoot(98.0) == 9.899495;
}

func squareRootTest3() bool {
    return squareRoot(14856.0) == 121.885192;
}


func greaterValuesTest1() bool {
    return greaterValues([]int {1, 2, 3, 5, 5, 7, 9, 10, 11}, 5) == 4;
}

func greaterValuesTest2() bool {
    return greaterValues([]int {1, 2, 3}, 4) == 0;
}

func greaterValuesTest3() bool {
    return greaterValues([]int {1, 10, 22, 59, 67, 72, 100}, -2) == 7;
}


func rotatedSortedArrayTest1() bool {
    return rotatedArraySearch([]int {35, 46, 79, 102, 1, 14, 29, 31}, 46);
}

func rotatedSortedArrayTest2() bool {
    return !rotatedArraySearch([]int {35, 46, 79, 102, 1, 14, 29, 31}, 47);
}

func rotatedSortedArrayTest3() bool {
    return rotatedArraySearch([]int {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 7);
}

func rotatedSortedArrayTest4() bool {
    return rotatedArraySearch([]int {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 6);
}


func multiplicationRussianTest1() bool {
    return multiplicationRussianPeasant(487,734) == 357458;
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
