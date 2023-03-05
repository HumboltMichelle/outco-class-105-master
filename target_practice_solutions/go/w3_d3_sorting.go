/*
 *  Target Practice - Quicksort
 */

package main
import (
  "fmt"
  "strconv"
  "math/rand"
  "time"
  "sort"
)

/*  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using quicksort.
 *
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

// Worse Time Complexity: O(N^2)
// Worse Auxiliary Space Complexity: O(N)
// Average Time Complexity: O(Nlog(N))
// Average Auxiliary Space Complexity: O(log(N))
func divide(input []int, begin int, end int) {
  mid := begin
  if begin >= end { return }
  for i := begin; i < end; i++ {
    if input[i] < input[end] {
      input[mid], input[i] = input[i], input[mid]
      mid++
    }
  }
  input[mid], input[end] = input[end], input[mid]
  divide(input, begin, mid - 1)
  divide(input, mid + 1, end)
}

func quicksort(input []int) []int {
   divide(input, 0, len(input) - 1)
   return input
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  testCount := []int{0,0}
  fmt.Println("Quick Sort Tests")
  runTest(sortTest1, "should sort example input", testCount);
  runTest(sortTest2, "should return empty array for empty input", testCount);
  runTest(sortTest3, "should sort single-element input", testCount);
  runTest(sortTest4, "should sort moderate-sized input", testCount);
  runTest(sortTest5, "should sort large-sized input", testCount);
  printTestsPassed(testCount);
}

func sortTest1() bool {
  return areEqual(quicksort([]int{3, 9, 1, 4, 7}), []int{1, 3, 4, 7, 9})
}

func sortTest2() bool {
  return areEqual(quicksort([]int{}), []int{})
}

func sortTest3() bool {
  return areEqual(quicksort([]int{10}), []int{10})
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
  input = quicksort(input)
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
  input = quicksort(input)
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
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
  fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
