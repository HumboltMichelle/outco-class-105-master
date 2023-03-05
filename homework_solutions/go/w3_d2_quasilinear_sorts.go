/**
 *  Homework - Quasilinear Sorts
 *
 *
 *  Problem: Mergesort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using mergesort.
 *
 *  Input:     {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

package main
import (
  "fmt"
  "strconv"
  "math/rand"
  "time"
  "sort"
)


// Worst Time Complexity: O(N * log(N))
// Worst Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Average Time Complexity: O(N * log(N))
// Average Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Stability: Stable
func mergesort(input []int) []int {
  if (len(input) < 2) {
    return input;
  }
  var mid int = len(input) / 2
  var leftArray []int = make([]int, mid)
  var rightArray []int = make([]int, len(input) - mid)
  copy(leftArray, input[:len(leftArray)])
  copy(rightArray, input[len(leftArray):])
  return merge(mergesort(leftArray), mergesort(rightArray))
}

func merge(array1 []int, array2 []int) []int {
  var result []int = make([]int, len(array1) + len(array2))
  for i, j := 0, 0; i + j < len(result); {
    if j >= len(array2) || (i < len(array1) && array1[i] < array2[j]) {
      result[i + j] = array1[i]
      i++
    } else {
      result[i + j] = array2[j]
      j++
    }
  }
  return result
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


func main() {
  testCount := []int{0,0}
  fmt.Println("Merge Sort Tests")
  runTest(sortTest1, "should sort example input", testCount)
  runTest(sortTest2, "should return empty array for empty input", testCount)
  runTest(sortTest3, "should sort single-element input", testCount)
  runTest(sortTest4, "should sort moderate-sized input", testCount)
  runTest(sortTest5, "should sort large-sized input", testCount)
  printTestsPassed(testCount);
}

func sortTest1() bool {
  return areEqual(mergesort([]int{3, 9, 1, 4, 7}), []int{1, 3, 4, 7, 9})
}

func sortTest2() bool {
  return areEqual(mergesort([]int{}), []int{})
}

func sortTest3() bool {
  return areEqual(mergesort([]int{10}), []int{10})
}

func sortTest4() bool {
  var RAND_MAX int = 1000
  input := make([]int, RAND_MAX)
  solution := make([]int, RAND_MAX)
  var randNum int
  seed := rand.NewSource(time.Now().UnixNano())
  randObj := rand.New(seed)
  for i := 0 ; i < len(input) ; i++ {
    randNum = randObj.Intn(RAND_MAX) // return a number between ​0​ and RAND_MAX
    input[i] =  randNum
    solution[i] =  randNum
  }
  input = mergesort(input)
  sort.Ints(solution)
  return isSorted(input) && areEqual(input, solution)
}

func sortTest5() bool {
  var RAND_MAX int = 1000000
  input := make([]int, RAND_MAX)
  solution := make([]int, RAND_MAX)
  var randNum int
  seed := rand.NewSource(time.Now().UnixNano())
  randObj := rand.New(seed)
  for i := 0 ; i < len(input) ; i++ {
    randNum = randObj.Intn(RAND_MAX) // return a number between ​0​ and RAND_MAX
    input[i] =  randNum
    solution[i] =  randNum
  }
  input = mergesort(input)
  sort.Ints(solution)
  return isSorted(input) && areEqual(input, solution)
}

/*** Utility Functions ***/
func areEqual(list1 []int, list2 []int) bool {
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

// checks if array is sorted in linear time
func isSorted(input []int) bool{
  for i := 1 ; i < len(input) ; i++ {
      if input[i-1] > input[i] {
          return false;
      }
  }
  return true;
}


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
