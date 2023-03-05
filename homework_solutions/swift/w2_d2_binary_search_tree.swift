/*
 *  Homework - Binary Search Tree
 *
 *  Problem 1: Node class
 *
 *  Prompt:    Create a Node class
 *             The Node class should contain the following properties:
 *
 *                   value:   Integer - integer value
 *                    left:   Node? - pointer to another node
 *                   right:   Node? - pointer to another node
 *
 *                 Example:   let sample = new Node(1)
 *                            sample.value        // 1
 *                            sample.left         // nil
 *                            sample.right        // nil
 */

/*  Problem 2: BinarySearchTree class
 *
 *  Prompt:    Create a BinarySearchTree class
 *
 *             The BinarySearchTree class should contain the following
 *             properties:
 *
 *                    root:   Node? - pointer to the root node
 *                    size:   Integer - number of nodes in the BinarySearchTree
 *
 *             The BinarySearchTree class should also contain the following
 *             methods:
 *
 *                  insert:   A method that takes takes an integer value, and
 *                            creates a node with the given input.  The method
 *                            will then find the correct place to add the new
 *                            node. Values larger than the current node node go
 *                            to the right, and smaller values go to the left.
 *
 *                            Input:     value: Integer
 *                            Output:    Void
 *
 *                  search:   A method that will search to see if a node with a
 *                            specified value exists and returns true or false
 *                            if found.
 *
 *                            Input:     value: Integer
 *                            Output:    Bool
 *
 *
 *             What are the time and auxiliary space complexity of the
 *             various methods?
 *
 *
 *  Extra:     Remove method for BinarySearchTree class
 *
 *  Prompt:    Add the following method to the BinarySearchTree class:
 *
 *                  remove:   A method that removes a value matching the input
 *                            the tree is then retied so that the binary search
 *                            tree order is not violated.
 *
 *                            Input:     value: Integer
 *                            Output:    Void
 */

class Node {
  var value: Int
  var left: Node? = nil
  var right: Node? = nil

  init(_ value: Int) {
    self.value = value
  }
}

class BinarySearchTree {
  var root: Node? = nil
  var size: Int = 0


  // Time Complexity: O(N) - assuming an imbalanced tree
  // Auxiliary Space Complexity: O(1)
  func insert(_ value: Int) {
    let newNode = Node(value)
    if root == nil {
      root = newNode;
      size += 1
      return
    }

    var parent : Node? = nil
    var child : Node? = root
    while child != nil {
      parent = child
      child = parent!.value > value ? parent?.left : parent?.right
    }
    if parent!.value > value {
      parent?.left = newNode
    } else {
      parent?.right = newNode
    }
    size += 1
  }


  // Time Complexity: O(N) - assuming an imbalanced tree
  // Auxiliary Space Complexity: O(1)
  func search(_ value: Int) -> Bool {
    var current: Node? = root
    while current != nil {
      if current?.value == value {
        return true
      }
      current = current!.value > value ? current?.left : current?.right
    }
    return false
  }
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


print("Node Class")
var testCount: [Int] = [0,0]


assert(&testCount, "has a value property",  {
  let node = Node(1)
  return node.value == 1
})

assert(&testCount, "has a left property, defaults to nil",  {
  let node = Node(1)
  return node.left == nil
})

assert(&testCount, "has a right property, defaults to nil",  {
  let node = Node(1)
  return node.right == nil
})

assert(&testCount, "able to reassign a value",  {
  let node = Node(1)
  node.value = 5
  return node.value == 5
})

assert(&testCount, "able to point to left child node",  {
  let node1 = Node(5)
  let node2 = Node(10)
  node1.left = node2
  return node1.left!.value == 10
})

assert(&testCount, "able to point to right child node",  {
  let node1 = Node(5)
  let node2 = Node(10)
  node1.right = node2
  return node1.right!.value == 10
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Binary Search Tree Class")
testCount = [0,0]


assert(&testCount, "has root property, defaults to nil",  {
  let bst = BinarySearchTree()
  return bst.root == nil
})

assert(&testCount, "has root property, defaults to 0",  {
  let bst = BinarySearchTree()
  return bst.size == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Binary Search Tree Insert Method")
testCount = [0,0]

assert(&testCount, "able to insert a node into empty binary search tree",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  return bst.size == 1 && bst.root!.value == 5
})

assert(&testCount, "able to insert a node to left of root node",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(3)
  return bst.size == 2 && bst.root!.value == 5 && bst.root!.left!.value == 3
})

assert(&testCount, "able to insert a node to right of root node",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(8)
  return bst.size == 2 && bst.root!.value == 5 && bst.root!.right!.value == 8
})

assert(&testCount, "able to insert node to right of node left of root node",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(3)
  bst.insert(4)
  return bst.size == 3 && bst.root!.value == 5 && bst.root!.left!.value == 3 && bst.root!.left!.right!.value == 4
})

assert(&testCount, "able to insert a node to right of root node",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(8)
  bst.insert(7)
  return bst.size == 3 && bst.root!.value == 5 && bst.root!.right!.value == 8 && bst.root!.right!.left!.value == 7
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Binary Search Tree Search Method")
testCount = [0,0]

assert(&testCount, "returns true when element exists in binary search tree",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(3)
  bst.insert(8)
  bst.insert(4)
  bst.insert(7)
  return bst.search(4) == true
})

assert(&testCount, "returns false when element does not exist in binary search tree",  {
  let bst = BinarySearchTree()
  bst.insert(5)
  bst.insert(3)
  bst.insert(8)
  bst.insert(4)
  bst.insert(7)
  return bst.search(10) == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
