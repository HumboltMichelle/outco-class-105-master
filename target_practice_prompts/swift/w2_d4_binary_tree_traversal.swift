/**
 *  Target Practice - BST Traversal
 *
 *  Solve the following problems involving binary tree traversals.
 */

// DO NOT EDIT
// Node class for a binary tree node
class TreeNode {
  var value: Int
  var left: TreeNode? = nil
  var right: TreeNode? = nil

  init(_ value: Int) {
    self.value = value
  }
}


// DO NOT EDIT
// generate tree from array
func deserialize(_ arr: [Int?]) -> TreeNode? {
  if arr.count == 0 || arr[0] == nil {
    return nil
  }
  let root = TreeNode(arr[0]!)
  var queue: [TreeNode] = [root]
  var i = 1
  var current: TreeNode
  while i < arr.count {
    current = queue.removeFirst()
    if arr[i] != nil {
      current.left = TreeNode(arr[i]!)
      queue.append(current.left!)
    }
    if i + 1 < arr.count && arr[i + 1] != nil {
      current.right = TreeNode(arr[i + 1]!)
      queue.append(current.right!)
    }
    i += 2
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
let arr = [4, 2, 5, 1, 3, nil, 7, nil, nil, nil, nil, 6, 8]

let sampleTree = deserialize(arr);


/**
 *  2. Given the example output binary search tree from Problem 1, what would
 *     the order of values printed be if we used:
 *
 *     a. BREADTH FIRST traversal:
 *     b. PRE-ORDER DEPTH first traversal:
 *     c. IN-ORDER DEPTH first traversal:
 *     d. POST-ORDER DEPTH first traversal:
 */


/**
 *  3a. Using a queue and while loop write a function that takes the root of a
 *      binary tree node and outputs an array of values ordered by BREADTH
 *      FIRST.
 *
 *  Input: node: TreeNode
 *  Output: [Int]
 *
 *  NOTE: You may use an array or linked list for your queue.
 */

func bfs(_ node: TreeNode?) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}


/*
 *  3b. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */
func dfsPre(_ node: TreeNode?) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}


/**
 *  3c. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by IN-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */
func dfsIn(_ node: TreeNode?) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}


/**
 *  3d. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by POST-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2d.
 */
 func dfsPost(_ node: TreeNode?) -> [Int] {
   // YOUR WORK HERE
   return [Int]()
 }



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}

func arraysEqual(_ arr1: [Int], _ arr2: [Int]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}


let test = TreeNode(4)
test.left = TreeNode(2)
test.left!.left = TreeNode(1)
test.left!.right = TreeNode(3)
test.right = TreeNode(5)
test.right!.right = TreeNode(7)
test.right!.right!.left = TreeNode(6)
test.right!.right!.right = TreeNode(8)



print("Problem 1 tests")
var testCount: [Int] = [0,0]

assert(&testCount, "able to build tree as indicated in diagram",  {
  if sampleTree == nil {
    return false
  }
  return sampleTree!.value == 4 &&
    sampleTree!.left!.value == 2 &&
    sampleTree!.left!.left!.value == 1 &&
    sampleTree!.left!.right!.value == 3 &&
    sampleTree!.right!.value == 5 &&
    sampleTree!.right!.right!.value == 7 &&
    sampleTree!.right!.right!.left!.value == 6 &&
    sampleTree!.right!.right!.right!.value == 8;
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("breadth first search tests")
testCount = [0,0]

assert(&testCount, "able to return values in breadth first order",  {
  let results = bfs(test)
  return arraysEqual(results, [4, 2, 5, 1, 3, 7, 6, 8])
})

assert(&testCount, "should return empty array for empty input",  {
  let results = bfs(deserialize([]))
  return arraysEqual(results, [])
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("pre-order depth first search tests")
testCount = [0,0]

assert(&testCount, "able to return values in pre-order depth first order - [4, 2, 1, 3, 5, 7, 6, 8]",  {
  let results = dfsPre(test)
  return arraysEqual(results, [4, 2, 1, 3, 5, 7, 6, 8])
})

assert(&testCount, "should return empty array for empty input",  {
  let results = dfsPre(deserialize([]))
  return arraysEqual(results, [])
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("in-order depth first search tests")
testCount = [0,0]

assert(&testCount, "able to return values in in-order depth first order - [1, 2, 3, 4, 5, 6, 7, 8]",  {
  let results = dfsIn(test)
  return arraysEqual(results, [1, 2, 3, 4, 5, 6, 7, 8])
})

assert(&testCount, "should return empty array for empty input",  {
  let results = dfsIn(deserialize([]))
  return arraysEqual(results, [])
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("post-order depth first search tests")
testCount = [0,0]

assert(&testCount, "able to return values in post-order depth first order - [1, 3, 2, 6, 8, 7, 5, 4]",  {
  let results = dfsPost(test)
  return arraysEqual(results, [1, 3, 2, 6, 8, 7, 5, 4])
})

assert(&testCount, "should return empty array for empty input",  {
  let results = dfsPost(deserialize([]))
  return arraysEqual(results, [])
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
