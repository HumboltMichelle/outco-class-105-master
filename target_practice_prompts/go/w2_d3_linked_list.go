/**
 *  Target Practice - Linked List
 *
 *  Solve the following problems involving linked lists.
 */

package main
import (
  "fmt"
  "strconv"
  "os"
  "io"
  "bytes"
  "time"
  "math/rand"
)

// DO NOT EDIT
// ListNode *class for a linked list node
type ListNode struct {
  value int
  next *ListNode
}


// DO NOT EDIT
// Generate a linked list from an array
func generateList(arr []int) *ListNode {
  if len(arr) == 0 { return nil }
  var head *ListNode = &ListNode{value: arr[0]}
  var current *ListNode = head
  for i := 1; i < len(arr); i++ {
    current.next = &ListNode{value: arr[i]}
    current = current.next
  }
  return head
}


/**
 * 1a. Create a method which prints the value of each node until the tail
 *
 * Input: node {ListNode}
 * Output: func
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *          Head                    Tail
 *          1
 *          5
 *          7
 *          10
 */

// Time Complexity:
// Auxiliary Space Complexity:
func printForward(node *ListNode) {
  // YOUR WORK HERE
}


/**
 * 1b. Given a node, print the value of each node backwards from the tail to the
 * input node using recursion.
 *
 * Input: node {ListNode}
 * Output: func
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *          Head                    Tail
 *          10
 *          7
 *          5
 *          1
 */

// Time Complexity:
// Auxiliary Space Complexity:
func printBackward(node *ListNode) {
  // YOUR WORK HERE
}


/**
 * 1c. Create a public method on the singly LinkedList class that reverses the
 *     order of the nodes in the linked list
 *
 * Input: node {ListNode}
 * Output: {ListNode}
 *
 * Example: (1) --> (5) --> (7) --> (10) .reverse()
 *          Head                    Tail
 *
 *          (10) --> (7) --> (5) --> (1)
 *          Head                    Tail
 *
 * What is the time and auxiliary space complexity of your solution?
 */

// Time Complexity:
// Auxiliary Space Complexity:
func reverse(node *ListNode) *ListNode {
  // YOUR WORK HERE
  return nil
}


/**
 * 1d. Create a method which swaps the first occurance of the locations of two
 *     nodes in the linked list.
 *
 * Input: head {ListNode},
 * Input: a {Integer}
 * Input: b {Integer}
 * Output: {ListNode}
 *
 * Example:
 * ListNode head = Problems.generateList({1, 5, 7, 10});
 * head = swap(head, 5, 10);
 *
 *          (1) --> (5) --> (7) --> (10)
 *          Head
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head
 */

// Time Complexity:
// Auxiliary Space Complexity:
func swap(head *ListNode, a int, b int) *ListNode {
  // YOUR WORK HERE
  return nil
}


/**
 *  Extra Credit:
 *
 *  Given an input of a ListNode, return true if the ListNode is in a circular
 *  linked list, and false if the linked list that terminates.
*/
func isCircular(node *ListNode) bool{
 // YOUR WORK HERE
 return true
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  linkedListInstantiationTests()
  printForwardTests()
  printBackwardTests()
  reverseListTests()
  swapNodesTests()
  isCircularTests()
}

func linkedListInstantiationTests() {
  testCount := []int{0,0}
  fmt.Println("linked list instantiation tests")
  runTest(linkedListInstantiationTest1, "able to create a linked list instance", testCount)
  printTestsPassed(testCount)
}

func printForwardTests() {
  testCount := []int{0,0}
  fmt.Println("printForward tests")
  runTest(printForwardTest1, "should be able to print forward 1 --> 5 --> 7 --> 10", testCount)
  runTest(printForwardTest2, "should be able to print forward with single element", testCount)
  runTest(printForwardTest3, "should print nothing for empty list node", testCount)
  printTestsPassed(testCount)
}

func printBackwardTests() {
  testCount := []int{0,0}
  fmt.Println("printBackward tests")
  runTest(printBackwardTest1, "should be able to print backward elements of linked list 1 --> 5 --> 7 --> 10", testCount)
  runTest(printBackwardTest2, "should be able to print backward with single element linked list 1", testCount)
  runTest(printBackwardTest3, "should print nothing for empty linked list", testCount)
  printTestsPassed(testCount)
}

func reverseListTests() {
  testCount := []int{0,0}
  fmt.Println("reverse tests")
  runTest(reverseListTest1, "should be able to reverse 1 --> 5 --> 7 --> 10 to be 10 --> 7 --> 5 --> 1", testCount)
  runTest(reverseListTest2, "should be able to handle single element linked lists", testCount)
  printTestsPassed(testCount)
}

func swapNodesTests() {
  testCount := []int{0,0}
  fmt.Println("swap tests")
  runTest(swapNodesTest1, "should be able to swap 1 and 5 to change 1 --> 5 --> 7 --> 10 linked list to look like 5 --> 1 --> 7 --> 10", testCount)
  runTest(swapNodesTest2, "should be able to swap 1 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 7 --> 5 --> 1 --> 10", testCount)
  runTest(swapNodesTest3, "should be able to swap 1 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 10 --> 5 --> 7 --> 1", testCount)
  runTest(swapNodesTest4, "should be able to swap 5 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 10 --> 7 --> 5", testCount)
  printTestsPassed(testCount)
}

func isCircularTests() {
  testCount := []int{0,0}
  fmt.Println("isCircular tests")
  runTest(isCircularTest1, "should return true for circular linked list", testCount)
  runTest(isCircularTest2, "should return false for terminal linked list", testCount)
  printTestsPassed(testCount)
}



func linkedListInstantiationTest1() bool {
  arr := []int{1, 5, 7, 10}
  var test *ListNode = generateList(arr)
  return test != nil && test.value == 1 && test.next != nil &&
    test.next.next != nil && test.next.next.next != nil &&
    test.next.next.next.value == 10
}


func printForwardTest1() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  result := stdOutCapture(printForward, test)
  return result == "1\n5\n7\n10\n"
}

func printForwardTest2() bool {
  arr := []int{1}
  test := generateList(arr)
  result := stdOutCapture(printForward, test)
  return result == "1\n"
}

func printForwardTest3() bool {
  arr := []int{}
  test := generateList(arr)
  result := stdOutCapture(printForward, test)
  return result == ""
}



func printBackwardTest1() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  result := stdOutCapture(printBackward, test)
  return result == "10\n7\n5\n1\n"
}

func printBackwardTest2() bool {
  arr := []int{1}
  test := generateList(arr)
  result := stdOutCapture(printBackward, test)
  return result == "1\n"
}

func printBackwardTest3() bool {
  arr := []int{}
  test := generateList(arr)
  result := stdOutCapture(printBackward, test)
  return result == ""
}

func reverseListTest1() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  test = reverse(test)

  return test != nil && test.value == 10 &&
    test.next != nil &&  test.next.value == 7 &&
    test.next.next != nil && test.next.next.value == 5 &&
    test.next.next.next != nil && test.next.next.next.value == 1
}

func reverseListTest2() bool {
  arr := []int{10}
  test := generateList(arr)
  test = reverse(test)
  return test != nil && test.value == 10
}

func swapNodesTest1() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  test = swap(test, 1, 5)

  return test != nil && test.value == 5 &&
    test.next != nil && test.next.value == 1 &&
    test.next.next != nil && test.next.next.value == 7 &&
    test.next.next.next != nil && test.next.next.next.value == 10

}

func swapNodesTest2() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  test = swap(test, 1, 7)

  return test != nil && test.value == 7 &&
    test.next != nil && test.next.value == 5 &&
    test.next.next != nil && test.next.next.value == 1 &&
    test.next.next.next != nil && test.next.next.next.value == 10

}

func swapNodesTest3() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  test = swap(test, 1, 10)

  return test != nil && test.value == 10 &&
    test.next != nil && test.next.value == 5 &&
    test.next.next != nil && test.next.next.value == 7 &&
    test.next.next.next != nil && test.next.next.next.value == 1

}

func swapNodesTest4() bool {
  arr := []int{1, 5, 7, 10}
  test := generateList(arr)
  test = swap(test, 5, 10)

  return test != nil && test.value == 1 &&
    test.next != nil && test.next.value == 10 &&
    test.next.next != nil && test.next.next.value == 7 &&
    test.next.next.next != nil && test.next.next.next.value == 5
}


func isCircularTest1() bool {
  // setup of node in a circular linkedList
  var circleSize int = 10000
  var work *ListNode
  seed := rand.NewSource(time.Now().UnixNano())
  randObj := rand.New(seed)

  var node *ListNode = &ListNode{value: randObj.Intn(circleSize)}
  work = node

  for i := 0; i < circleSize; i++ {
    work.next = &ListNode{value: randObj.Intn(circleSize)}
    work = work.next
    if i == (circleSize - 1) {
      // connects the last node to the original nodeA
      work.next = node
    }
  }
  return isCircular(node)
}

func isCircularTest2() bool {
  // setup of a node in a linkedList that terminates
  var listSize int = 10000
  var work *ListNode
  seed := rand.NewSource(time.Now().UnixNano())
  randObj := rand.New(seed)

  var node *ListNode = &ListNode{value: randObj.Intn(listSize)}
  work = node
  for i := 0; i < listSize; i++ {
    work.next = &ListNode{value: randObj.Intn(listSize)}
    work = work.next
  }

  return !isCircular(work)
}




/*** Utility Functions ***/
// Source: https://stackoverflow.com/questions/10473800/in-go-how-do-i-capture-stdout-of-a-function-into-a-string
func stdOutCapture(printTest func(*ListNode), input *ListNode) string {
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
