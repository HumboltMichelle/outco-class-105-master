/*
 *  Homework - Helper Method Recursion
 *
 *  Instructions: Using the Helper Method Recursive Pattern work through the
 *  following problems.
 *
 */

package main

import (
  "bytes"
  "fmt"
  "io"
  "os"
  "strconv"
)

/**
 * 1a. What is the term when the recursive call invokes itself more than once.
 *
 * multiple recursion
 *
 */


/**
 * 1b. List the steps involved to build a Helper Method Recursion algorithm.
 *
 * 1) Instantiate variables to track state
 * 2) Return variables
 * 3) Instantiate the helper function and invoke it
 * 4) Create base case inside the helper function
 * 5) Create recursive cases
 *
 */


/**
 * 1c. Should the recursive case or base case typically be tackled first?
 *
 * The base case
 *
 */


/**
 *  2a. Print each integer in an array in order using Helper Method Recursion
 *
 *  Input:   arr {Array of ints}
 *  Output:  {void}
 *
 *  Example: var nums int[]  = []int{1, 2, 3}
 *
 *          printArray(nums) =>
 *          1
 *          2
 *          3
 */
func printArray(arr []int) {
  var traverse func(index int)
  traverse = func(index int) {
    if (index == len(arr)) {
      return
    }
    fmt.Println(arr[index])
    traverse(index + 1)
  }
  traverse(0)
}


/**
 *  2b. Given an integer array, print each item backwards using Helper Method
 *      Recursion
 *
 *  Input:   arr {Array of ints}
 *  Output:  {void}
 *
 *  Example: var nums int[] = []int{1, 2, 3}
 *
 *          printReverse(nums) =>
 *          3
 *          2
 *          1
 */
func printReverse(arr []int) {
   var traverse func(index int)
   traverse = func(index int) {
     if (index == len(arr)) {
       return
     }
     traverse(index + 1)
     fmt.Println(arr[index])
   }
   traverse(0)
}



/**
 *  2c. Reverse a string using Helper Method Recursion
 *
 *  Input:   string
 *  Output:  string
 *
 *  Example: String greeting = 'hello'
 *          ReverseString.compute(greeting) => 'olleh'
 */
func reverseString(str string) string {
  var traverse func(index int)
  var result string
  traverse = func(index int) {
    if (index == len(str)) {
      return
    }
    result = string(str[index]) + result
    traverse(index + 1)
  }
  traverse(0)
  return result
}



/**
 * 2d. Given an array of positive integers, create an array of two-item integer
 *     arrays (two dimensional integer array) using Helper Method Recursion
 *
 * Input:   Array of int
 * Output:  two-dimensional int Array
 *
 * Example: var nums int[] = []int{1, 2, 3, 4, 5, 6}
 *          arrayPairs(nums)  =>
 *          {{1,2}, {3,4}, {5,6}}
 *
 * Example: var nums2 int[]  = []int{1, 2, 3, 4, 5}
 *          arrayPairs(nums2)  =>
 *          {{1,2}, {3,4}, {5, -1}}
 */
func arrayPairs(arr []int) [][]int {
  var traverse func(index int)
  var result [][]int

  traverse = func(index int) {
   if (index >= len(arr)) {
     return
   }

   if (index < len(arr) - 1) {
     result = append(result, []int{arr[index], arr[index + 1]})
   } else {
     // handling the case when we have an odd number of elements
     // -1 used as we cannot use nil for the second element
     result = append(result, []int{arr[index], -1})
   }
   traverse(index + 2)
  }
  traverse(0)

  return result
}



/**
 * 2e. Flatten a two dimensional integer array using Helper Method of Recursion
 *
 * Input:   two-dimensional int Array
 * Output:  Array of ints
 *
 * Example: var matrix [][]int = [][]int{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}
 *          flatten(matrix) =>
 *          {1, 2, 3, 4, 5, 6, 7, 8, 9}
 */
func flatten(arr [][]int) []int {
  var traverse func(index int)
  var result []int

  traverse = func(index int) {
   if (index >= len(arr)) {
     return
   }

   for i := 0; i < len(arr[index]); i++ {
     result = append(result, arr[index][i])
   }

   traverse(index + 1)
  }
  traverse(0)
  return result
}



/**
 * 2f. Given a base and an exponent, create a method to find the power using
 *     Helper Method Recursion
 *
 * Input:   Two ints, base and positive exponent
 * Output:  int
 *
 * Example: power(3, 4) => 81
 */
func power(a int, b int) int {
  var multiply func(count int)
  var result int = 1

  multiply = func(count int) {
   if (count == b) {
     return
   }

   result *= a
   multiply(count + 1)
  }
  multiply(0)

  return result
}



/**
 * 2g. Merge two sorted arrays using the Helper Method Recursion
 *
 * Input:   Two Integer Arrays, both sorted
 * Output:  Integer Array, sorted
 *
 * Example: var nums1 []int = []int{1, 4, 7};
 *          var nums2 []int = []int{2, 3, 6, 9};
 *
 *          merge(nums1, nums2) =>
 *          { 1, 2, 3, 4, 6, 7, 9 }
 */
func merge(arr1 []int, arr2 []int) []int {
  var compare func(i int, j int)
  var result []int

  compare = func(i int, j int) {
   if (i + j >= len(arr1) + len(arr2)) {
     return
   }
   if (j >= len(arr2) || (i < len(arr1) && arr1[i] < arr2[j])) {
     result = append(result, arr1[i])
     i++
   } else {
     result = append(result, arr2[j])
     j++
   }
   compare(i, j)
  }
  compare(0, 0)
  return result
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  printArrayTests()
  printReverseTests()
  reverseStringTests()
  arrayPairsTests()
  flattenTests()
  powerTests()
  mergeTests()
}


func printArrayTests() {
  testCount := []int{0,0}
  fmt.Println("PrintArray tests")
  runTest(printArrayTest1, "able to print the elements of [1,2,3] forwards", testCount)
  runTest(printArrayTest2, "does not print for an empty array", testCount)
  runTest(printArrayTest3, "able to print a single element array [5]", testCount)
  printTestsPassed(testCount)
}

func printReverseTests() {
  testCount := []int{0,0}
  fmt.Println("PrintReverse tests")
  runTest(printReverseTest1, "able to print the elements of [1,2,3] backwards", testCount)
  runTest(printReverseTest2, "does not print for an empty array", testCount)
  runTest(printReverseTest3, "able to print a single element array [5]", testCount)
  printTestsPassed(testCount)
}

func reverseStringTests() {
  testCount := []int{0,0}
  fmt.Println("ReverseString tests")
  runTest(reverseStringTest1, "able to reverse string 'hello'", testCount)
  runTest(reverseStringTest2, "able to return an empty string for empty string input", testCount)
  runTest(reverseStringTest3, "able to return the same character for a single-character input string", testCount)
  printTestsPassed(testCount)
}

func arrayPairsTests() {
  testCount := []int{0,0}
  fmt.Println("ArrayPairs tests")
  runTest(arrayPairsTest1, "should return [[1,2],[3,4],[5,6]] output for [1,2,3,4,5,6] input", testCount)
  runTest(arrayPairsTest2, "should return [[1,2],[3,4],[5,-1]] output for [1,2,3,4,5] input", testCount)
  runTest(arrayPairsTest3, "should return [] output for [] input", testCount)
  printTestsPassed(testCount)
}

func flattenTests() {
  testCount := []int{0,0}
  fmt.Println("Flatten tests")
  runTest(flattenTest1, "should return [1,2,3,4,5,6,7,8,9] output for [[1, 2, 3],[4, 5, 6],[7, 8, 9]] input", testCount)
  runTest(flattenTest2, "should return [] output for [] input", testCount)
  printTestsPassed(testCount)
}

func powerTests() {
  testCount := []int{0,0}
  fmt.Println("Power tests")
  runTest(powerTest1, "should return 81 for 3 to the 4th power", testCount)
  runTest(powerTest2, "should return 1 for 5 to the 0th power", testCount)
  runTest(powerTest3, "should return 1 for 1 to the 100th power", testCount)
  printTestsPassed(testCount)
}

func mergeTests() {
  testCount := []int{0,0}
  fmt.Println("Merge tests")
  runTest(mergeTest1, "should return [1, 2, 3, 4, 6, 7, 9] when merging [1, 4, 7] and [2, 3, 6, 9]", testCount)
  runTest(mergeTest2, "should handle inputs when left argument is empty array", testCount)
  runTest(mergeTest3, "should handle inputs when right argument is empty array", testCount)
  runTest(mergeTest4, "should handle two empty arrays as inputs", testCount)
  printTestsPassed(testCount)
}

// Source: https://stackoverflow.com/questions/10473800/in-go-how-do-i-capture-stdout-of-a-function-into-a-string
func stdOutCapture(printTest func([] int), input []int) string {
  old := os.Stdout // keep backup of the real stdout
  r, w, _ := os.Pipe()
  os.Stdout = w

  printTest(input)

  outC := make(chan string)
  // copy the output in a separate goroutine so printing can't block indefinitely
  go func() {
      var buf bytes.Buffer
      io.Copy(&buf, r)
      outC <- buf.String()
  }()

  // back to normal state
  w.Close()
  os.Stdout = old // restoring the real stdout
  out := <-outC

  // reading our temp stdout
  return out
}

func printArrayTest1() bool {
    var input []int = []int{1,2,3}
    var result string = stdOutCapture(printArray, input)
    return result == "1\n2\n3\n"
}

func printArrayTest2() bool {
    var input []int = []int{}
    var result string = stdOutCapture(printArray, input)
    return result == ""
}

func printArrayTest3() bool {
    var input []int = []int{5}
    var result string = stdOutCapture(printArray, input)
    return result == "5\n"
}


func printReverseTest1() bool {
    var input []int = []int{1,2,3}
    var result string = stdOutCapture(printReverse, input)
    return result == "3\n2\n1\n"
}

func printReverseTest2() bool {
    var input []int = []int{}
    var result string = stdOutCapture(printReverse, input)
    return result == ""
}

func printReverseTest3() bool {
    var input []int = []int{5}
    var result string = stdOutCapture(printReverse, input)
    return result == "5\n"
}

func reverseStringTest1() bool {
    return reverseString("hello") == "olleh"
}

func reverseStringTest2() bool {
    return reverseString("") == ""
}

func reverseStringTest3() bool {
    return reverseString("b") == "b"
}


func arrayPairsTest1() bool {
    var input []int = []int{1,2,3,4,5,6}
    var output [][]int = arrayPairs(input)
    return len(output) == 3 &&
              output[0][0] == 1 && output[0][1] == 2 &&
              output[1][0] == 3 && output[1][1] == 4 &&
              output[2][0] == 5 && output[2][1] == 6
}

func arrayPairsTest2() bool {
    var input []int = []int{1,2,3,4,5}
    var output [][]int = arrayPairs(input)
    return len(output) == 3 &&
              output[0][0] == 1 && output[0][1] == 2 &&
              output[1][0] == 3 && output[1][1] == 4 &&
              output[2][0] == 5 && output[2][1] == -1
}

func arrayPairsTest3() bool {
    var input []int = []int{}
    var output [][]int = arrayPairs(input)
    return len(output) == 0
}

func flattenTest1() bool {
    var input [][]int = [][]int{{1, 2, 3} ,{4, 5, 6}, {7, 8, 9}}
    var output []int = flatten(input)

    return len(output) == 9 &&
              output[0] == 1 && output[1] == 2 &&
              output[2] == 3 && output[3] == 4 &&
              output[4] == 5 && output[5] == 6 &&
              output[6] == 7 && output[7] == 8 &&
              output[8] == 9
}

func flattenTest2() bool {
    var input [][]int = [][]int{}
    var output []int = flatten(input)
    return len(output) == 0
}


func powerTest1() bool {
    return power(3,4) == 81
}

func powerTest2() bool {
    return power(5,0) == 1
}

func powerTest3() bool {
    return power(1,100) == 1
}


func mergeTest1() bool {
    var input1 []int = []int{1,4,7}
    var input2 []int = []int{2,3,6,9}

    var output []int = merge(input1, input2)

    return len(output) == 7 &&
              output[0] == 1 &&
              output[1] == 2 &&
              output[2] == 3 &&
              output[3] == 4 &&
              output[4] == 6 &&
              output[5] == 7 &&
              output[6] == 9
}

func mergeTest2() bool {
    var input1 []int = []int{}
    var input2 []int = []int{2,3,6,9}

    var output []int = merge(input1, input2)

    return len(output) == 4 &&
              output[0] == 2 &&
              output[1] == 3 &&
              output[2] == 6 &&
              output[3] == 9
}

func mergeTest3() bool {
    var input1 []int = []int{1,4,7}
    var input2 []int = []int{}

    var output []int = merge(input1, input2)

    return len(output) == 3 &&
              output[0] == 1 &&
              output[1] == 4 &&
              output[2] == 7
}

func mergeTest4() bool {
    var input1 []int = []int{}
    var input2 []int = []int{}

    var output []int = merge(input1, input2)

    return len(output) == 0
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
