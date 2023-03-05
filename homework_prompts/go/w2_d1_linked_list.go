/**
 *  Homework - Linked List
 *
 *  Problem 1: ListNode class
 *
 *  Prompt:    Create a ListNode class
 *
 *             The ListNode class should contain the following public properties:
 *
 *                 value:   {Integer}
 *                  next:   {ListNode} (initially nil)
 *
 *               Example:   ListNode sample = new ListNode(1)
 *                          sample.value     // 1
 *                          sample.next      // nil
 *
 *
 *  Problem 2: LinkedList class
 *
 *  Prompt:    Create a LinkedList class
 *
 *             The LinkedList class should contain the following public
 *             properties:
 *
 *                length:   {Integer}
 *                  head:   {ListNode}
 *                  tail:   {ListNode}
 *
 *              The LinkedList class should also contain the following public
 *              methods:
 *
 *                append:   A method that appends a value to the end of the
 *                          LinkedList.
 *
 *                          Input:     {Integer}
 *                          Output:    {Void}
 *
 *                insert:   A method that inserts an integer value at a set
 *                          index in the LinkedList (assume head index is 0).
 *
 *                          Input:     value {Integer}
 *                          Input:     index {Integer}
 *                          Output:    {Void}
 *
 *                delete:   A method that removes a node at a specified index.
 *
 *                          Input:     index {Integer}
 *                          Output:    {Void}
 *
 *              contains:   A method that checks to see if a value is contained
 *                          in the list.
 *
 *                          Input:     value {Integer}
 *                          Output:    {Boolean}
 */

package main
import (
  "fmt"
  "strconv"
  "reflect"
)


type ListNode struct {
  value int
  next *ListNode
}


type LinkedList struct {
  length int
  head, tail *ListNode
}


// Time Complexity:
// Auxiliary Space Complexity:
func (ll *LinkedList) append(value int) {
  // YOUR WORK HERE
}


// Time Complexity:
// Auxiliary Space Complexity:
func (ll *LinkedList) insert(value int, index int){
  // YOUR WORK HERE
}


// Time Complexity:
// Auxiliary Space Complexity:
func (ll *LinkedList) delete(index int){
  // YOUR WORK HERE
}


// Time Complexity:
// Auxiliary Space Complexity:
func (ll *LinkedList) contains(value int) bool {
  // YOUR WORK HERE
  return false
}






////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  listNodeClassTests()
  linkedListClassTests()
  linkedListInsertMethodTests()
  linkedListAppendMethodTests()
  linkedListDeleteMethodTests()
  linkedListContainsMethodTests()
}

func listNodeClassTests() {
  testCount := []int{0,0}
  fmt.Println("ListNode Class")
  runTest(listNodeClassTest1, "able to create an instance", testCount)
  runTest(listNodeClassTest2, "has value field", testCount)
  runTest(listNodeClassTest3, "able to assign a value upon instantiation", testCount)
  runTest(listNodeClassTest4, "able to reassign a value", testCount)
  runTest(listNodeClassTest5, "able to point to another node", testCount)
  printTestsPassed(testCount)
}

func linkedListClassTests() {
  testCount := []int{0,0}
  fmt.Println("LinkedList Class")
  runTest(linkedListClassTest1, "able to create an instance", testCount)
  runTest(linkedListClassTest2, "has head field", testCount)
  runTest(linkedListClassTest3, "has tail field", testCount)
  runTest(linkedListClassTest4, "has length field", testCount)
  runTest(linkedListClassTest5, "default head set to null", testCount)
  runTest(linkedListClassTest6, "default tail set to null", testCount)
  runTest(linkedListClassTest7, "default length set to 0", testCount)
  printTestsPassed(testCount)
}

func linkedListInsertMethodTests() {
  testCount := []int{0,0}
  fmt.Println("LinkedList Insert Method")
  runTest(linkedListInsertMethodTest1, "able to insert a node into empty linked list", testCount)
  runTest(linkedListInsertMethodTest2, "able to insert a node after another node", testCount)
  runTest(linkedListInsertMethodTest3, "able to insert a node before another node", testCount)
  runTest(linkedListInsertMethodTest4, "does not insert a node if index is out of bounds linked list", testCount)
  printTestsPassed(testCount)
}

func linkedListAppendMethodTests() {
  testCount := []int{0,0}
  fmt.Println("LinkedList Append Method")
  runTest(linkedListAppendMethodTest1, "able to append a node into empty linked list", testCount)
  runTest(linkedListAppendMethodTest2, "able to append a second node into a linked list", testCount)
  runTest(linkedListAppendMethodTest3, "able to append a third node into a linked list", testCount)
  printTestsPassed(testCount)
}

func linkedListDeleteMethodTests() {
  testCount := []int{0,0}
  fmt.Println("LinkedList Delete Method")
  runTest(linkedListDeleteMethodTest1, "able to delete a node from the head", testCount)
  runTest(linkedListDeleteMethodTest2, "able to delete a node in between two nodes", testCount)
  runTest(linkedListDeleteMethodTest3, "able to delete the only node in a linked list", testCount)
  runTest(linkedListDeleteMethodTest4, "does not delete a node when the index is out of bounds", testCount)
  printTestsPassed(testCount)
}

func linkedListContainsMethodTests() {
  testCount := []int{0,0}
  fmt.Println("LinkedList Contains Method")
  runTest(linkedListContainsMethodTest1, "returns true if linked list contains value", testCount)
  runTest(linkedListContainsMethodTest2, "returns false if linked list does not contains value", testCount)
  printTestsPassed(testCount)
}


func listNodeClassTest1() bool {
    node := ListNode{}
  	return reflect.TypeOf(node) == reflect.TypeOf(ListNode{})
}

func listNodeClassTest2() bool {
  node := &ListNode{}
  return reflectStructField(node, "value")
}

func listNodeClassTest3() bool {
  node := &ListNode{value:5}
  return node.value == 5
}

func listNodeClassTest4() bool {
  node := &ListNode{value:5}
  node.value = 1
  return node.value == 1
}

func listNodeClassTest5() bool {
  node1 := &ListNode{value:5}
  node2 := &ListNode{value:10}
  node1.next = node2
  return node1.next.value == 10
}


func linkedListClassTest1() bool {
  ll := LinkedList{}
  return reflect.TypeOf(ll) == reflect.TypeOf(LinkedList{})
}

func linkedListClassTest2() bool {
  ll := &LinkedList{}
  return reflectStructField(ll, "head")
}

func linkedListClassTest3() bool {
  ll := &LinkedList{}
  return reflectStructField(ll, "tail")
}

func linkedListClassTest4() bool {
  ll := &LinkedList{}
  return reflectStructField(ll, "length")
}

func linkedListClassTest5() bool {
  linkedList := &LinkedList{}
  return linkedList.head == nil
}

func linkedListClassTest6() bool {
  linkedList := &LinkedList{}
  return linkedList.tail == nil
}

func linkedListClassTest7() bool {
  linkedList := &LinkedList{}
  return linkedList.length == 0
}




func linkedListInsertMethodTest1() bool {
  linkedList := &LinkedList{}
  linkedList.insert(5,0)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5
  }
  return false
}

func linkedListInsertMethodTest2() bool {
  linkedList := &LinkedList{}
  linkedList.insert(5,0)
  linkedList.insert(10, 1)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10
  }
  return false
}

func linkedListInsertMethodTest3() bool {
  linkedList := &LinkedList{}
  linkedList.insert(5,0)
  linkedList.insert(10,0)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 2 && linkedList.head.value == 10 && linkedList.tail.value == 5
  }
  return false
}

func linkedListInsertMethodTest4() bool {
  linkedList := &LinkedList{}
  linkedList.insert(5,-1)
  linkedList.insert(10,3)
  return linkedList.length == 0 && linkedList.head == nil && linkedList.tail == nil
}



func linkedListAppendMethodTest1() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5
  }
  return false
}

func linkedListAppendMethodTest2() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10
  }
  return false
}

func linkedListAppendMethodTest3() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  linkedList.append(15)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 3 && linkedList.head.value == 5 && linkedList.tail.value == 15
  }
  return false
}



func linkedListDeleteMethodTest1() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  linkedList.delete(0)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 1 && linkedList.head.value == 10 && linkedList.tail.value == 10
  }
  return false
}

func linkedListDeleteMethodTest2() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  linkedList.append(15)
  linkedList.delete(1)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 15
  }
  return false
}

func linkedListDeleteMethodTest3() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.delete(0)
  return linkedList.length == 0 && linkedList.head == nil && linkedList.tail == nil
}

func linkedListDeleteMethodTest4() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.delete(-1)
  linkedList.delete(2)
  if(linkedList.head != nil && linkedList.tail != nil) {
    return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5
  }
  return false
}


func linkedListContainsMethodTest1() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  linkedList.append(15)
  return linkedList.contains(15)
}

func linkedListContainsMethodTest2() bool {
  linkedList := &LinkedList{}
  linkedList.append(5)
  linkedList.append(10)
  linkedList.append(15)
  return linkedList.contains(8) == false
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
