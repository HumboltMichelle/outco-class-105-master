/**
 *  Target Practice - Linked List
 *
 *  Solve the following problems involving linked lists.
 */

import Darwin

// DO NOT EDIT
// Node class for a linked list node
class ListNode {
  var value: Int
  var next: ListNode?

  init(_ value: Int) {
    self.value = value
  }
}


// DO NOT EDIT
// Generate a linked list from an array
func generateList(_ arr: [Int]) -> ListNode? {
  if arr.count == 0 {
    return nil
  }
  let head: ListNode = ListNode(arr[0])
  var current: ListNode = head
  for i in 1..<arr.count {
    current.next = ListNode(arr[i])
    current = current.next!
  }
  return head
}


/**
 * 1a. Create a method which prints the value of each node until the tail
 *
 * Input: node: ListNode
 * Output: Void
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          1
 *          5
 *          7
 *          10
 */

// Time Complexity:
// Auxiliary Space Complexity:
func printForward(_ node: ListNode) {
  // YOUR WORK HERE
}


/**
 * 1b. Print the value of each node backwards from the tail to the input node
 * using recursion.
 *
 * Input: node: ListNode?
 * Output: Void
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          10
 *          7
 *          5
 *          1
 */

 // Time Complexity:
 // Auxiliary Space Complexity:
func printBackward(_ node: ListNode?) {
  // YOUR WORK HERE
}


/**
 * 1c. Given a node in a linked list, reverse the order of the nodes in that
 * list.
 *
 * Input: node: ListNode?
 * Output: ListNode?
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          (10) --> (7) --> (5) --> (1)
 */

 // Time Complexity:
 // Auxiliary Space Complexity:
func reverse(_ node: ListNode?) -> ListNode? {
  // YOUR WORK HERE
  return node
}


/**
 * 1d. Create a method which swaps the first occurance of the locations of two
 *     nodes in the linked list.
 *
 * Input: head: ListNode
 * Input: a: Int
 * Input: b: Int
 * Output: ListNode
 *
 * Example:
 * var head: ListNode = generateList([1, 5, 7, 10])
 * head = swap(head, 5, 10)
 *
 *          (1) --> (5) --> (7) --> (10)
 *          Head
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head
 */

// Time Complexity:
// Auxiliary Space Complexity:
func swap(_ head: ListNode?, _ a: Int, _ b: Int) -> ListNode? {
  // YOUR WORK HERE
  return head
}


/**
 * Extra Credit 1:
 *
 * Given an input of a ListNode, return true if the ListNode is in a circular
 * linked list, and false if the linked list that terminates.
 *
 * Input: node: ListNode
 * Output: Bool
 */
func isCircular(_ node: ListNode) -> Bool {
  // YOUR WORK HERE
  return false
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

// DO NOT EDIT
// setup of node in a circular linked list
var circularNode: ListNode = ListNode(Int(arc4random()))
var current: ListNode = circularNode
var size: Int = Int(arc4random_uniform(10000)) + 100
for i in 0..<size {
  current.next = ListNode(Int(arc4random()))
  current = current.next!
  if i == size - 1 {
    // connects the last node to the original circularNode
    current.next = circularNode
  }
}


// DO NOT EDIT
// setup of a node in a linked list that terminates
var terminalNode = ListNode(Int(arc4random()))
current = terminalNode
size = Int(arc4random_uniform(10000)) + 100
for _ in 0..<size {
  current.next = ListNode(Int(arc4random()))
  current = current.next!
}

print("ListNode Class")
var testCount: [Int] = [0,0]

assert(&testCount, "able to create a linked list instance",  {
  let test = generateList([1, 5, 7, 10])

  return test! is ListNode
    && test!.value == 1
    && test!.next!.next!.next!.value == 10
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("printForward tests")
testCount = [0, 0]

assert(&testCount, "should be able to print forward elements of linked list 1 --> 5 --> 7 --> 10",  {
  let test = generateList([1, 5, 7, 10])

  return test! is ListNode
    && test!.value == 1
    && test!.next!.next!.next!.value == 10
})

assert(&testCount, "should be able to print forward with single element",  {
  let test = generateList([1])

  return test! is ListNode
    && test!.value == 1
})

assert(&testCount, "should print nothing for empty list node",  {
  let test = generateList([])

  return test == nil
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("printBackward tests")
testCount = [0, 0]

assert(&testCount, "should be able to print backward elements of linked list 1 --> 5 --> 7 --> 10",  {
  let test = generateList([1, 5, 7, 10])

  return test! is ListNode
    && test!.value == 1
    && test!.next!.next!.next!.value == 10
})

assert(&testCount, "should be able to print backward with single element",  {
  let test = generateList([1])

  return test! is ListNode
    && test!.value == 1
})

assert(&testCount, "should print nothing for empty list node",  {
  let test = generateList([])

  return test == nil
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("reverse tests")
testCount = [0, 0]

assert(&testCount, "should be able to reverse 1 --> 5 --> 7 --> 10 to be 10 --> 7 --> 5 --> 1",  {
  var test = generateList([1, 5, 7, 10])
  test = reverse(test)

  return test! is ListNode
    && test!.next!.value == 7
    && test!.next!.next!.value == 5
    && test!.next!.next!.next!.value == 1
})

assert(&testCount, "should be able to handle single element linked lists",  {
  var test = generateList([1])
  test = reverse(test)

  return test != nil
    && test!.value == 1
    && test!.next == nil
})

assert(&testCount, "should be able to handle empty linked lists",  {
  var test = generateList([])
  test = reverse(test)

  return test == nil
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("swap tests")
testCount = [0, 0]

assert(&testCount, "should be able to swap 1 and 5 to change 1 --> 5 --> 7 --> 10 linked list to look like 5 --> 1 --> 7 --> 10",  {
  var test = generateList([1, 5, 7, 10])
  test = swap(test, 1, 5)

  return test!.value == 5 &&
    test!.next!.value == 1 &&
    test!.next!.next!.value == 7 &&
    test!.next!.next!.next!.value == 10
})

assert(&testCount, "should be able to swap 1 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 7 --> 5 --> 1 --> 10",  {
  var test = generateList([1, 5, 7, 10])
  test = swap(test, 1, 7)

  return test!.value == 7 &&
    test!.next!.value == 5 &&
    test!.next!.next!.value == 1 &&
    test!.next!.next!.next!.value == 10
})

assert(&testCount, "should be able to swap 1 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 10 --> 5 --> 7 --> 1",  {
  var test = generateList([1, 5, 7, 10])
  test = swap(test, 1, 10)

  return test!.value == 10 &&
    test!.next!.value == 5 &&
    test!.next!.next!.value == 7 &&
    test!.next!.next!.next!.value == 1
})

assert(&testCount, "should be able to swap 5 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 7 --> 5 --> 10",  {
  var test = generateList([1, 5, 7, 10])
  test = swap(test, 5, 7)

  return test!.value == 1 &&
    test!.next!.value == 7 &&
    test!.next!.next!.value == 5 &&
    test!.next!.next!.next!.value == 10
})

assert(&testCount, "should be able to swap 5 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 7 --> 5 --> 10",  {
  var test = generateList([1, 5, 7, 10])
  test = swap(test, 5, 10)

  return test!.value == 1 &&
    test!.next!.value == 10 &&
    test!.next!.next!.value == 7 &&
    test!.next!.next!.next!.value == 5
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("isCircular tests")
testCount = [0, 0]

assert(&testCount, "should return true for circular linked list",  {
  let test = isCircular(circularNode)
  return test == true
})

assert(&testCount, "should return false for terminal linked list",  {
  let test = isCircular(terminalNode)
  return test == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
