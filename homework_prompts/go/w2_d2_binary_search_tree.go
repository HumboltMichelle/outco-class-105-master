/**
 *  Homework Binary Search Tree
 *
 *  Problem 1: TreeNode class
 *
 *  Prompt:    Create a TreeNode class
 *             The TreeNode class should contain the following public properties:
 *
 *                   value:   {Integer}
 *                    left:   {TreeNode} (initially null)
 *                   right:   {TreeNode} (initially null)
 *
 *                 Example:   var TreeNode sample = new TreeNode(1)
 *                            sample.value        // 1
 *                            sample.left         // null
 *                            sample.right        // null
 *
 *
 *  Problem 2: BinarySearchTree class.
 *
 *  Prompt:    Create a BinarySearchTree class
 *
 *             The BinarySearchTree class should contain the following public
 *             properties:
 *
 *                    root:   {TreeNode} (initially null)
 *                    size:   {Integer}
 *
 *             The BinarySearchTree class should also contain the following
 *             public methods:
 *
 *                  insert:   A method that takes takes an integer value, and
 *                            creates a node with the given input.  The method
 *                            will then find the correct place to add the new
 *                            node. Values larger than the current node node go
 *                            to the right, and smaller values go to the left.
 *
 *                            Input:     {Integer}
 *                            Output:    {Void}
 *
 *                  search:   A method that will search to see if a node with a
 *                            specified value exists and returns true or false
 *                            if found.
 *
 *                            Input:     {Integer}
 *                            Output:    {Boolean}
 */


package main
import (
 "fmt"
 "strconv"
 "reflect"
)


type TreeNode struct {
  value int
  left *TreeNode
  right *TreeNode
}


type BinarySearchTree struct {
  root *TreeNode
  size int
}

// Time Complexity:
// Auxiliary Space Complexity:
func (bst *BinarySearchTree) insert(value int) {
  // YOUR WORK HERE
}



// Time Complexity:
// Auxiliary Space Complexity:
func (bst *BinarySearchTree) search(value int) bool{
    // YOUR WORK HERE
    return false
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  treeNodeClassTests()
  binarySearchTreeClassTests()
  bstInsertMethodTests()
  bstSearchMethodTests()
}

func treeNodeClassTests() {
  testCount := []int{0,0}
  fmt.Println("TreeNode Class")
  runTest(treeNodeClassTest1, "able to create an instance", testCount)
  runTest(treeNodeClassTest2, "has value field", testCount)
  runTest(treeNodeClassTest3, "has left field", testCount)
  runTest(treeNodeClassTest4, "has right field", testCount)
  runTest(treeNodeClassTest5, "able to assign a value upon instantiation", testCount)
  runTest(treeNodeClassTest6, "able to reassign a value", testCount)
  runTest(treeNodeClassTest7, "able to point to left child node", testCount)
  runTest(treeNodeClassTest8, "able to point to right child node", testCount)
  printTestsPassed(testCount)
}

func binarySearchTreeClassTests() {
  testCount := []int{0,0}
  fmt.Println("Binary Search Tree Class")
  runTest(binarySearchTreeClassTest1, "able to create an instance", testCount)
  runTest(binarySearchTreeClassTest2, "has root field", testCount)
  runTest(binarySearchTreeClassTest3, "has size field", testCount)
  printTestsPassed(testCount)
}


func bstInsertMethodTests() {
  testCount := []int{0,0}
  fmt.Println("BinarySearchTree Insert Method")
  runTest(bstInsertMethodTest1, "able to insert a node into empty binary search tree", testCount)
  runTest(bstInsertMethodTest2, "able to insert node to left of root node", testCount)
  runTest(bstInsertMethodTest3, "able to insert node to right of node left of root node", testCount)
  runTest(bstInsertMethodTest4, "able to insert node to right of root node", testCount)
  runTest(bstInsertMethodTest5, "able to insert node to left of node right of root node", testCount)
  printTestsPassed(testCount)
}

func bstSearchMethodTests() {
  testCount := []int{0,0}
  fmt.Println("BinarySearchTree Search Method")
  runTest(bstSearchMethodTest1, "returns true when element exists in binary search tree", testCount)
  runTest(bstSearchMethodTest2, "returns true when element does not exist in binary search tree", testCount)
  printTestsPassed(testCount)
}


func treeNodeClassTest1() bool {
  node := TreeNode{}
	return reflect.TypeOf(node) == reflect.TypeOf(TreeNode{})
}


func treeNodeClassTest2() bool {
  node := TreeNode{}
  return reflectStructField(node, "value")
}

func treeNodeClassTest3() bool {
  node := TreeNode{}
  return reflectStructField(node, "left")
}

func treeNodeClassTest4() bool {
  node := TreeNode{}
  return reflectStructField(node, "right")
}

func treeNodeClassTest5() bool {
  node := TreeNode{value:5}
  return node.value == 5
}

func treeNodeClassTest6() bool {
  node := TreeNode{value:5}
  node.value = 0
  return node.value == 0
}

func treeNodeClassTest7() bool {
  node1 := TreeNode{value:5}
  node2 := TreeNode{value:10}
  node1.left = &node2
  return node1.left.value == 10
}

func treeNodeClassTest8() bool {
  node1 := TreeNode{value:5}
  node1.right = &TreeNode{value:10}
  return node1.right.value == 10
}



func binarySearchTreeClassTest1() bool {
  bst := BinarySearchTree{}
	return reflect.TypeOf(bst) == reflect.TypeOf(BinarySearchTree{})
}

func binarySearchTreeClassTest2() bool {
  bst := BinarySearchTree{}
  return reflectStructField(bst, "root")
}

func binarySearchTreeClassTest3() bool {
  bst := BinarySearchTree{}
  return reflectStructField(bst, "size")
}


func bstInsertMethodTest1()  bool{
    bst := &BinarySearchTree{}
    bst.insert(5)
    return bst.size == 1 && bst.root.value == 5
}

func bstInsertMethodTest2() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(3)
    return bst.size == 2 && bst.root.value == 5 && bst.root.left.value == 3
}

func bstInsertMethodTest3() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(3)
    bst.insert(4)
    return bst.size == 3 && bst.root.value == 5 && bst.root.left.value == 3 && bst.root.left.right.value == 4
}

func bstInsertMethodTest4() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(8)
    return bst.size == 2 && bst.root.value == 5 && bst.root.right.value == 8
}

func bstInsertMethodTest5() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(8)
    bst.insert(7)
    return bst.size == 3 && bst.root.value == 5 && bst.root.right.value == 8 && bst.root.right.left.value == 7
}

func bstSearchMethodTest1() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(3)
    bst.insert(8)
    bst.insert(4)
    bst.insert(7)
    return bst.search(4)
}

func bstSearchMethodTest2() bool {
    bst := &BinarySearchTree{}
    bst.insert(5)
    bst.insert(3)
    bst.insert(8)
    bst.insert(4)
    bst.insert(7)
    return bst.search(10) == false
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
