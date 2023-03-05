/*
*  Homework - Heap
*
*
*  Prompt: Create a Heap class/constructor
*
*  The Heap will take in the following input:
*
*                type: argument should be either 'min' or 'max'. This will
*                      dictate whether the heap will be a minheap or maxheap->
*                      The comparator method will be affected by this
*                      argument. See method description below
*
*  The Heap will have the following property:
*
*             storage: array/vector
*
*                type: property that will be either 'min' or 'max'. This will
*                      be dictated by
*
*  The Heap will have the following methods:
*
*             compare: takes in two arguments (a and b). Depending on the heap
*                      type (minheap or maxheap), the comparator will behave
*                      differently. If the heap is a minheap, then the compare
*                      function will return true if a is less than b, false
*                      otherwise. If the heap is a maxheap, then the compare
*                      function will return true if a is greater than b, false
*                      otherwise.
*
*                swap: takes in two indexes and swaps the elements at the two
*                      indexes in the storage array
*
*                peak: returns the peak element of the storage array. This
*                      will be the most minimum and maximum element for a
*                      minheap and maxheap respectively
*
*                size: returns the number of elements in the heap
*
*              insert: inserts a value into the heap-> Should begin by pushing
*                      the value onto the end of the array, and then calling
*                      the bubbleUp method from the last index of the array
*
*            bubbleUp: takes in an index, and considers the element at that
*                      index to be a child. Continues to swap that child with
*                      its parent value if the heap comparator condition is
*                      not fulfilled
*
*          removePeak: removes the peak element from the heap and returns it.
*                      Should begin by swapping the 0th-index element with the
*                      last element in the storage array. Uses bubbleDown
*                      method from the 0th index
*
*          bubbleDown: takes in an index, and considers the element at this
*                      index to be the parent. Continues to swap this parent
*                      element with its children if the heap comparator
*                      condition is not fulfilled
*
*              remove: takes in a value and (if it exists in the heap),
*                      removes that value from the heap data structure and
*                      returns it. Should rearrange the rest of the heap to
*                      ensure the heap comparator conditions are fulfilled
*                      for all of its elements
*
*
*
*  Input:  N/A
*  Output: A Heap instance
*
*  What are the time and auxilliary space complexities of the various methods?
*
*/

package main
import (
  "fmt"
  "strconv"
  "reflect"
)

type Heap struct {
  storage []int
  heapType string
}

// Time Complexity: O(1)
// Auxiliary Space Complexity: O(1)
func (heap *Heap) compare(a int, b int) bool {
  if heap.heapType == "max" {
    return heap.storage[a] > heap.storage[b]
  } else {
    return heap.storage[a] < heap.storage[b]
  }
}


// Time Complexity: O(1)
// Auxiliary Space Complexity: O(1)
func (heap *Heap) swap(index1 int, index2 int) {
  heap.storage[index1], heap.storage[index2] = heap.storage[index2], heap.storage[index1]
}


// Time Complexity: O(1)
// Auxiliary Space Complexity: O(1)
func (heap *Heap) peak() int {
  if heap.size() == 0 {
    return -1
  }
  return heap.storage[0]
}


// Time Complexity: O(1)
// Auxiliary Space Complexity: O(1)
func (heap *Heap) size() int {
  return len(heap.storage)
}

// Time Complexity: O(log(N))
// Auxiliary Space Complexity: O(1)
func (heap *Heap) insert(value int ) {
  heap.storage = append(heap.storage, value)
  heap.bubbleUp(heap.size() - 1)
}


// Time Complexity: O(log(N))
// Auxiliary Space Complexity: O(1)
func (heap *Heap) removePeak() int{
  if(heap.size() == 0) {
    return -1
  }
  heap.swap(0, heap.size() - 1)
  var toReturn int = heap.storage[heap.size()-1]
  heap.storage = heap.storage[:heap.size()-1]
  heap.bubbleDown(0)
  return toReturn
}


/*To implement remove, iterate through the array until you find the index
where the value to be removed is located. When found, swap this element
with the last element of the storage array, and then pop it off. Then run
bubbleUp and bubbleDown from the index where the last index was swapped in.*/
// Time Complexity: O(log(N))
// Auxiliary Space Complexity: O(1)
func (heap *Heap) remove(value int) bool{
  for i, item := range heap.storage {
    if item == value {
      heap.swap(i, heap.size() - 1)
      heap.storage = heap.storage[:heap.size()-1]
      heap.bubbleUp(i)
      heap.bubbleDown(i)
      return true
    }
  }
  return false;
}


// Time Complexity: O(log(N))
// Auxiliary Space Complexity: O(1)
func (heap *Heap) bubbleUp(childIndex int) {
  if childIndex < 1 || childIndex >= heap.size() { return }

  var parentIndex int = (childIndex - 1) / 2

  for childIndex > 0 && !heap.compare(parentIndex, childIndex) {
    heap.swap(parentIndex, childIndex)
    childIndex = parentIndex
    parentIndex = (childIndex - 1) / 2
  }
}


// Time Complexity: O(log(N))
// Auxiliary Space Complexity: O(1)
func (heap *Heap) bubbleDown(parentIndex int) {
  if parentIndex >= heap.size() { return }
  var childIndex int = heap._getChild(parentIndex)
  for childIndex < heap.size() && !heap.compare(parentIndex, childIndex) {
    heap.swap(parentIndex, childIndex)
    parentIndex = childIndex;
    childIndex = heap._getChild(parentIndex)
  }
}

func (heap *Heap) _getChild(parentIndex int) int{
  var childIndex1 int = 2 * parentIndex + 1;
  var childIndex2 int = 2 * parentIndex + 2;
  if childIndex1 >= heap.size() {
    return childIndex1
  } else if (childIndex2 > heap.size()) {
    return childIndex1
  } else {
    if heap.compare(childIndex1, childIndex2) {
      return childIndex1
    } else {
      return childIndex2
    }
  }
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases

func main() {
  heapClassTests()
  heapPeakMethodTests()
  heapBubbleUpMethodTests()
  heapInsertMethodTests()
  heapBubbleDownMethodTests()
  heapRemovePeakMethodTests()
  heapRemoveMethodTests()
}

func heapClassTests() {
  testCount := []int{0,0}
  fmt.Println("Heap Class")
  runTest(heapClassTest1, "able to create an instance", testCount)
  runTest(heapClassTest2, "has storage field", testCount)
  runTest(heapClassTest3, "has heapType field", testCount)
  printTestsPassed(testCount)
}

func heapPeakMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap peak method")
  runTest(heapPeakMethodTest1, "should return the 0th element of the storage array", testCount)
  // runTest(heapPeakMethodTest2, "upon building out your insert method, should return the smallest element for a minheap", testCount
  // runTest(heapPeakMethodTest3, "upon building out your insert method, should return the largest element for a maxheap", testCount
  printTestsPassed(testCount)
}


func heapBubbleUpMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap bubbleUp method")
  runTest(heapBubbleUpMethodTest1, "should be able to 'bubble up' an element if its minheap condition is not fulfilled", testCount)
  runTest(heapBubbleUpMethodTest2, "should be able to 'bubble up' an element if its maxheap condition is not fulfilled", testCount)
  runTest(heapBubbleUpMethodTest3, "should not perform bubbling up if minheap conditions are fulfilled", testCount)
  runTest(heapBubbleUpMethodTest4, "should not perform bubbling up if maxheap conditions are fulfilled", testCount)
  printTestsPassed(testCount)
}

func heapInsertMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap insert method")
  runTest(heapInsertMethodTest1, "should be able to insert a single element", testCount)
  runTest(heapInsertMethodTest2, "should be able to insert multiple elements into a minheap and have peak element be smallest element", testCount)
  runTest(heapInsertMethodTest3, "should be able to insert multiple elements into a maxheap and have peak element be largest element", testCount)
  printTestsPassed(testCount)
}

func heapBubbleDownMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap bubbleDown method")
  runTest(heapBubbleDownMethodTest1, "should be able to 'bubble down' an element if its minheap condition is not fulfilled", testCount)
  runTest(heapBubbleDownMethodTest2, "should be able to 'bubble down' an element if its maxheap condition is not fulfilled", testCount)
  runTest(heapBubbleDownMethodTest3, "should not perform bubbling down if minheap conditions are fulfilled", testCount)
  runTest(heapBubbleDownMethodTest4, "should not perform bubbling down if maxheap conditions are fulfilled", testCount)
  printTestsPassed(testCount)
}

func heapRemovePeakMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap removePeak method")
  runTest(heapRemovePeakMethodTest1, "should be able to remove a single element", testCount)
  runTest(heapRemovePeakMethodTest2, "should be able to remove and return peak element for a minheap and rearrange minheap accordingly", testCount)
  runTest(heapRemovePeakMethodTest3, "should be able to remove and return peak element for a maxheap and rearrange maxheap accordingly", testCount)
  printTestsPassed(testCount)
}

func heapRemoveMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Heap remove method")
  runTest(heapRemoveMethodTest1, "is able to remove specified value from minheap", testCount)
  runTest(heapRemoveMethodTest2, "is able to remove specified value from maxheap", testCount)
  runTest(heapRemoveMethodTest3, "is able to remove last value from minheap", testCount)
  runTest(heapRemoveMethodTest4, "is able to remove last value from maxheap", testCount)
  runTest(heapRemoveMethodTest5, "does not remove anything from minheap if value does not exist", testCount)
  runTest(heapRemoveMethodTest6, "does not remove anything from maxheap if value does not exist", testCount)
  printTestsPassed(testCount)
}




func heapClassTest1() bool {
  heap := Heap{heapType: "max"}
	return reflect.TypeOf(heap) == reflect.TypeOf(Heap{})
}

func heapClassTest2() bool {
  heap := Heap{}
  return reflectStructField(heap, "storage")
}

func heapClassTest3() bool {
  heap := Heap{}
  return reflectStructField(heap, "heapType")
}


func heapPeakMethodTest1() bool {
  heap := Heap{heapType: "min"}
  heap.storage = append(heap.storage, 1)
  heap.storage = append(heap.storage, 5)
  heap.storage = append(heap.storage, 10)
  return heap.peak() == 1;
}




func heapInsertMethodTest1() bool{
  heap := Heap{heapType: "min"}
  heap.insert(5)
  return heap.size() > 0 && heap.storage[0] == 5
}

func heapInsertMethodTest2() bool{
  heap := Heap{heapType: "min"}
  heap.insert(5)
  heap.insert(10)
  heap.insert(7)
  heap.insert(1)
  heap.insert(8)
  heap.insert(6)
  return heap.peak() == 1
}

func heapInsertMethodTest3() bool{
  heap := Heap{heapType: "max"}
  heap.insert(5)
  heap.insert(10)
  heap.insert(7)
  heap.insert(1)
  heap.insert(8)
  heap.insert(6)
  return heap.peak() == 10
}


func heapBubbleUpMethodTest1() bool{
  heap := Heap{heapType: "min"}
  heap.storage = []int{2,4,7,6,9,10,8,1}
  heap.bubbleUp(7)
  return areEqual(heap.storage, []int{1,2,7,4,9,10,8,6})
}

func heapBubbleUpMethodTest2() bool{
  heap := Heap{heapType: "max"}
  heap.storage = []int{9,8,6,7,3,5,2,10}
  heap.bubbleUp(7)
  return areEqual(heap.storage, []int{10,9,6,8,3,5,2,7})
}

func heapBubbleUpMethodTest3() bool{
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6};
  heap.bubbleUp(7)
  return areEqual(heap.storage, []int{1,2,7,4,9,10,8,6})
}

func heapBubbleUpMethodTest4() bool{
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7}
  heap.bubbleUp(7)
  return areEqual(heap.storage, []int{10,9,6,8,3,5,2,7})
}



func heapBubbleDownMethodTest1() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{10,1,2,6,4,9,8,7}
  heap.bubbleDown(0)
  return areEqual(heap.storage, []int{1,4,2,6,10,9,8,7})
}

func heapBubbleDownMethodTest2() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{2,10,9,5,8,3,6,7}
  heap.bubbleDown(0)
  return areEqual(heap.storage, []int{10,8,9,5,2,3,6,7})
}

func heapBubbleDownMethodTest3() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6}
  heap.bubbleDown(0)
  return areEqual(heap.storage, []int{1,2,7,4,9,10,8,6})
}

func heapBubbleDownMethodTest4() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7}
  heap.bubbleDown(0)
  return areEqual(heap.storage, []int{10,9,6,8,3,5,2,7})
}



func heapRemovePeakMethodTest1() bool {
  heap := Heap{heapType: "min"}
  heap.insert(5)
  heap.removePeak()
  return heap.size() == 0
}

func heapRemovePeakMethodTest2() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6}
  var peak int = heap.removePeak()
  return peak == 1 && areEqual(heap.storage, []int{2,4,7,6,9,10,8})
}

func heapRemovePeakMethodTest3() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7}
  var peak int = heap.removePeak()
  return peak == 10 && areEqual(heap.storage, []int{9,8,6,7,3,5,2})
}



func heapRemoveMethodTest1() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6}
  var removed bool = heap.remove(10)
  return removed && areEqual(heap.storage, []int{1,2,6,4,9,7,8})
}

func heapRemoveMethodTest2() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7};
  var removed bool = heap.remove(6);
  return removed && areEqual(heap.storage, []int{10,9,7,8,3,5,2});
}

func heapRemoveMethodTest3() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6}
  var removed bool = heap.remove(6)
  return removed && areEqual(heap.storage, []int{1,2,7,4,9,10,8})
}

func heapRemoveMethodTest4() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7}
  var removed bool = heap.remove(7)
  return removed && areEqual(heap.storage, []int{10,9,6,8,3,5,2})
}

func heapRemoveMethodTest5() bool {
  heap := Heap{heapType: "min"}
  heap.storage = []int{1,2,7,4,9,10,8,6}
  heap.remove(3)
  return areEqual(heap.storage, []int{1,2,7,4,9,10,8,6})
}

func heapRemoveMethodTest6() bool {
  heap := Heap{heapType: "max"}
  heap.storage = []int{10,9,6,8,3,5,2,7}
  heap.remove(4)
  return areEqual(heap.storage, []int{10,9,6,8,3,5,2,7})
}



/*** Utility Functions ***/

// Reflect if an interface is either a struct or a pointer to a struct
// and has the defined member field, if error is nil, the given
// FieldName exists and is accessible with reflect.
// Source: https://mrwaggel.be/post/golang-reflect-if-initialized-struct-has-member-method-or-fields/
func reflectStructField(heap interface{}, fieldName string) bool {
	valueIface := reflect.ValueOf(heap)

	// Check if the passed interface is a pointer
	if valueIface.Type().Kind() != reflect.Ptr {
		// Create a new type of Iface's Type, so we have a pointer to work with
		valueIface = reflect.New(reflect.TypeOf(heap))
	}

	// 'dereference' with Elem() and get the field by name
	field := valueIface.Elem().FieldByName(fieldName)
  return field.IsValid()
}


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
