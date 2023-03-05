/*
*  Homework - Quadratic Sorts
*
*  Problem 1: Insertion Sort
*
*  Prompt:    Given an unsorted array of integers, return the array sorted
*             using insertion sort.
*
*  Input:     input {Array}
*  Output:    {Array}
*
*  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
*
*
*  Problem 2: Selection Sort
*
*  Prompt:    Given an unsorted array of integers, return the array
*             sorted using selection sort.
*
*  Input:     input {Array}
*  Output:    {Array}
*
*  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
*
*
*  Problem 3: Bubble Sort
*
*  Prompt:    Given an unsorted array of integers, return the array
*             sorted using bubble sort.
*
*  Input:     input {Array}
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


// Time Complexity:
// Auxiliary Space Complexity:
func insertion(input []int) []int {
  // YOUR WORK HERE
  return []int{}
}


// Time Complexity:
// Auxiliary Space Complexity:
func selection(input []int) []int {
  // YOUR WORK HERE
  return []int{}
}


// Time Complexity:
// Auxiliary Space Complexity:
func bubble(input []int) []int{
  // YOUR WORK HERE
  return []int{}
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  sortTests(insertion, "Insertion Sort Tests")
  sortTests(selection, "Selection Sort Tests")
  sortTests(bubble, "Bubble Sort Tests")
}


func sortTests(sorter func([]int) []int, testName string){
  testCount := []int{0,0}
  fmt.Println(testName)
  runTest(sortTest1, sorter, "should sort example input", testCount)
  runTest(sortTest2, sorter, "should sort single-element input", testCount)
  runTest(sortTest3, sorter, "should sort moderate-sized input", testCount)
  printTestsPassed(testCount)
}


func sortTest1(sorter func([]int) []int) bool {
  return areEqual(sorter([]int{3, 9, 1, 4, 7}), []int{1, 3, 4, 7, 9})
}

func sortTest2(sorter func([]int) []int) bool {
  return areEqual(sorter([]int{10}), []int{10})
}

func sortTest3(sorter func([]int) []int) bool {
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
  input = sorter(input)
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


func runTest(sortTest func(func([]int) []int) bool,
    sorter func([]int) []int, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = sortTest(sorter)
  if(testPassed) { testCount[0]++ }
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName;
  fmt.Println(result);
}



func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
