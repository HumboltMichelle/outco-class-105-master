/**
 *  Target Practice - Binary Tree Traversal
 *
 *  Solve the following problems involving binary tree traversals.
 */


package main
import (
  "fmt"
  "strconv"
)


// DO NOT EDIT
// TreeNode class for a binary tree node
type TreeNode struct {
  value int
  left, right *TreeNode
};


// DO NOT EDIT
// generate tree from array, nil value are represented as -1
func deserialize(arr []int) *TreeNode {
  if len(arr) == 0 {
    return nil
  }
  root := &TreeNode{value: arr[0]}
  queue := []*TreeNode{root}

  var current *TreeNode
  for i := 1; i < len(arr); i += 2 {
    current, queue = queue[0], queue[1:len(queue)]
    if arr[i] != -1 {
      current.left = &TreeNode{value: arr[i]}
      queue = append(queue, current.left)
    }
    if arr[i + 1] != -1 && (i + 1) < len(arr) {
      current.right = &TreeNode{value: arr[i + 1]}
      queue = append(queue, current.right)
    }
  }
  return root
}

/**
 *
 * Deserialize operates by building out the tree in a breadth-first
 * manner. One only needs to build down to the lowest row where there
 * exists nodes. For example, in this tree,
 *
 *          1
 *            \
 *              3
 *   				  /
 *   				 2
 *
 * The array that you would pass in to the deserialize function would
 * be [1,nil,3,2,nil]. The first nil represents the left child of
 * the 1 node, and the second nil represents the right child of the 3 node.
 *
 *  1. Here, we have built out the following tree using deserialize:
 *
 *              4
 *            /   \
 *          2       5
 *        /   \       \
 *      1       3       7
 *                    /   \
 *                  6      8
 */

 // DO NOT EDIT
var arr []int = []int{4, 2, 5, 1, 3, -1, 7, -1, -1, -1, -1, 6, 8}
var sampleTree *TreeNode = deserialize(arr)


/**
 *  2. Given the example output binary search tree from Problem 1, what would
 *     the order of values printed be if we used:
 *
 *     a. BREADTH FIRST traversal: {4, 2, 5, 1, 3, 7, 6, 8}
 *     b. PRE-ORDER DEPTH first traversal: {4, 2, 1, 3, 5, 7, 6, 8}
 *     c. IN-ORDER DEPTH first traversal: {1, 2, 3, 4, 5, 6, 7, 8}
 *     d. POST-ORDER DEPTH first traversal: {1, 3, 2, 6, 8, 7, 5, 4}
 */


 /**
  *  3a. Using a queue and while loop write a function that takes the root of a
  *      binary tree node and outputs an array of values ordered by BREADTH
  *      FIRST.
  *
  *  Input: node {TreeNode}
  *  Output: {vector}
  *
  *  NOTE: You may use an array or linked list for your queue.
  *  NOTE: Confirm with your answer from Problem 2a.
  */
func bfs(node *TreeNode) []int {
  var result []int
  if node == nil {
    return result
  }
  queue := []*TreeNode{node}
  var current *TreeNode
  for len(queue) > 0 {
    current, queue = queue[0], queue[1:len(queue)]
    if (current.left != nil) {
      queue = append(queue, current.left)
    }
    if (current.right != nil) {
      queue = append(queue, current.right)
    }
    result = append(result, current.value)
  }

  return result
}



/**
 *  3b. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */

func dfsPreTraverse(current *TreeNode, result *[]int) {

  if(current == nil) {
    return
  }
  *result = append(*result, current.value)
  dfsPreTraverse(current.left, result)
  dfsPreTraverse(current.right, result)
}

func dfsPre (node *TreeNode) []int {
  result := []int{}
  dfsPreTraverse(node, &result)
  return result
}



/**
 *  3c. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by IN-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */

func dfsInTraverse(current *TreeNode, result *[]int) {
  if (current == nil) {
   return
  }
  dfsInTraverse(current.left, result)
  *result = append(*result, current.value)
  dfsInTraverse(current.right, result)
}

func dfsIn (node *TreeNode) []int  {
  result := []int{}
  if (node == nil) {
    return result
  }
  dfsInTraverse(node, &result)
  return result
}



/**
 *  3d. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by POST-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2d.
 */

func dfsPostTraverse(current *TreeNode, result *[]int) {
  if (current == nil) {
    return
  }
  dfsPostTraverse(current.left, result)
  dfsPostTraverse(current.right, result)
  *result = append(*result, current.value)
}

func dfsPost(node *TreeNode) []int  {
  result := []int{}
  dfsPostTraverse(node, &result)
  return result
}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

var emptyTreeExample *TreeNode = deserialize([]int{})

func main() {
  problem1Tests()
  bfsTests()
  dfsPreTests()
  dfsInTests()
  dfsPostTests()
}


func problem1Tests() {
  testCount := []int{0,0}
  fmt.Println("Problem 1 tests")
  runTest(problem1Test1, "able to build tree as indicated in diagram", testCount)
  printTestsPassed(testCount)
}

func bfsTests() {
  testCount := []int{0,0}
  fmt.Println("breadth first search tests")
  runTest(bfsTest1, "able to return values of BST in breadth first manner - [4,2,5,1,3,7,6,8]", testCount)
  runTest(bfsTest2, "able to return empty array for an empty BST", testCount)
  printTestsPassed(testCount)
}

func dfsPreTests() {
  testCount := []int{0,0}
  fmt.Println("dfsPre tests")
  runTest(dfsPreTest1, "able to return values of BST in pre-order depth first manner - [4,2,1,3,5,7,6,8]", testCount)
  runTest(dfsPreTest2, "able to return empty array for an empty BST", testCount)
  printTestsPassed(testCount)
}

func dfsInTests() {
  testCount := []int{0,0}
  fmt.Println("dfsIn tests")
  runTest(dfsInTest1, "able to return values of BST in in-order depth first manner - [4,2,1,3,5,7,6,8]", testCount)
  runTest(dfsInTest2, "able to return empty array for an empty BST", testCount)
  printTestsPassed(testCount)
}

func dfsPostTests() {
  testCount := []int{0,0}
  fmt.Println("dfsPost tests")
  runTest(dfsPostTest1, "able to return values of BST in post-order depth first manner - [4,2,1,3,5,7,6,8]", testCount)
  runTest(dfsPostTest2, "able to return empty array for an empty BST", testCount)
  printTestsPassed(testCount)
}


func problem1Test1() bool {
  return sampleTree != nil && sampleTree.value == 4 &&
    sampleTree.left != nil && sampleTree.left.value == 2 &&
    sampleTree.left.left != nil && sampleTree.left.left.value == 1 &&
    sampleTree.left.right != nil && sampleTree.left.right.value == 3 &&
    sampleTree.right != nil && sampleTree.right.value == 5 &&
    sampleTree.right.right != nil && sampleTree.right.right.value == 7 &&
    sampleTree.right.right.left != nil && sampleTree.right.right.left.value == 6 &&
    sampleTree.right.right.right != nil && sampleTree.right.right.right.value == 8
}



func bfsTest1() bool {
  return areEqual(bfs(sampleTree), []int{4,2,5,1,3,7,6,8})
}

func bfsTest2() bool {
  return len(bfs(emptyTreeExample)) == 0
}


func dfsPreTest1() bool {
  return areEqual(dfsPre(sampleTree), []int{4,2,1,3,5,7,6,8})
}
func dfsPreTest2() bool {
  return len(dfsPre(emptyTreeExample))== 0
}


func dfsInTest1() bool {
  return areEqual(dfsIn(sampleTree), []int{1,2,3,4,5,6,7,8})
}
func dfsInTest2() bool {
  return len(dfsIn(emptyTreeExample)) == 0
}



func dfsPostTest1() bool {
  return areEqual(dfsPost(sampleTree), []int{1,3,2,6,8,7,5,4})
}
func dfsPostTest2() bool {
  return len(dfsPost(emptyTreeExample)) == 0
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
