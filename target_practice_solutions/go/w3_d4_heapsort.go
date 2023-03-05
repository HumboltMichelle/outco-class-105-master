/*
 *  Target Practice - Heapsort
 */

package main
import (
  "fmt"
  "strconv"
  "math/rand"
  "time"
  "sort"
)

/*
 *  Problem: Implement Heapsort in-place.
 *
 *  NOTE: In-place means to manipulate the input array rather than create a
 *        new array.
 *
 *  Input:  {Array}
 *  Output: {Array}
 *
 *  Example: heapsort([4, 15, 16, 50, 8, 23, 42, 108])
 *              ==> [4, 8, 15, 16, 23, 42, 50, 108]
 */

// Worse Time Complexity: O(Nlog(N))
// Worse Auxiliary Space Complexity: O(1)
// Average Time Complexity: O(Nlog(N))
// Average Auxiliary Space Complexity: O(1)
var globalArr []int

func getChild(parentInd int, heapLength int) int {
  child1Ind := 2*parentInd + 1
  child2Ind := 2*parentInd + 2
  if(child1Ind >= heapLength || child2Ind >= heapLength || globalArr[child1Ind] > globalArr[child2Ind]) {
    return child1Ind
  }
  return child2Ind
}

func bubbleDown(parentInd int, heapLength int) {
  var childInd int = getChild(parentInd, heapLength)
  for childInd < heapLength && globalArr[parentInd] < globalArr[childInd] {
    globalArr[parentInd],globalArr[childInd] = globalArr[childInd],globalArr[parentInd]
    parentInd = childInd;
    childInd = getChild(parentInd, heapLength)
  }
}

func heapsort(arr []int) []int {
  globalArr = arr
  // Convert array to max heap
  for  parentInd := len(arr)-1; parentInd >= 0; parentInd-- {
    bubbleDown(parentInd, len(arr))
  }

  // Convert heap to sort, repeatedly shrink heap as subarray
  heapSize := len(arr)
  for heapSize > 1 {
    // Swap peak w/ end of heap & shrink heapSize
    arr[0], arr[heapSize-1] = arr[heapSize-1], arr[0]
    heapSize--
    // Bubble down new peak
    bubbleDown(0, heapSize)
  }
  return arr
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  testCount := []int{0,0}
  fmt.Println("Heap Sort Tests")
  runTest(sortTest1, "should sort example input", testCount);
  runTest(sortTest2, "should return empty array for empty input", testCount);
  runTest(sortTest3, "should sort single-element input", testCount);
  runTest(sortTest4, "should sort moderate-sized input", testCount);
  runTest(sortTest5, "should sort large-sized input", testCount);
  printTestsPassed(testCount);
}

func sortTest1() bool {
  return areEqual(heapsort([]int{3, 9, 1, 4, 7}), []int{1, 3, 4, 7, 9})
}

func sortTest2() bool {
  return areEqual(heapsort([]int{}), []int{})
}

func sortTest3() bool {
  return areEqual(heapsort([]int{10}), []int{10})
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
  input = heapsort(input)
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
  input = heapsort(input)
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
