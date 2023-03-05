/*
 *  Homework - Linked List
 *
 *  Problem 1: ListNode class
 *
 *  Prompt:    Create a ListNode class
 *             The ListNode class should contain the following properties:
 *
 *                 value:   integer value
 *                  next:   pointer to another node (optional)
 *
 *               Example:   let sample1 = ListNode(1)
 *                          sample1.value     // 1
 *                          sample1.next      // nil
 *
 *
 *  Problem 2:  LinkedList class
 *
 *  Prompt:     Create a LinkedList class
 *              The LinkedList class should contain the following properties:
 *
 *                length:   The number of nodes in the linked list
 *                  head:   A pointer to the head node
 *                  tail:   A pointer to the tail node
 *
 *              The LinkedList class should also contain the following methods:
 *
 *                append:   A method appends a value to the end of the
 *                          LinkedList.
 *
 *                          Input:     Integer
 *                          Output:    LinkedList w/ appended ListNode instance
 *
 *                insert:   A method that inserts an integer value at a set
 *                          index in the LinkedList (assume head index is 0).
 *
 *                          Input:     Integer value, Integer index
 *                          Output:    LinkedList w/ appended ListNode instance
 *
 *                delete:   A method that removes a node at a specified index.
 *
 *                          Input:     Integer index
 *                          Output:    LinkedList w/ removed ListNode
 *
 *              contains:   A method that checks to see if a value is contained
 *                          in the list.
 *
 *                          Input:     Integer value
 *                          Output:    Boolean
 *
 *    What are the time and auxiliary space complexity of the various
 *    methods?
 *
 */

// throw error
// DO NOT EDIT
// enum LinkedListError: Error {
//     case outOfRange
// }


class ListNode {
  var value: Int
  var next: ListNode?

  init(_ value: Int) {
    self.value = value
  }
}


class LinkedList {
  var length: Int = 0
  var head: ListNode?
  var tail: ListNode?


  // Time Complexity:
  // Auxiliary Space Complexity:
  func append(_ value: Int) {
  // YOUR WORK HERE
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func insert(_ value: Int, _ index: Int) {
    // YOUR WORK HERE
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  func delete(_ index: Int) {
    // YOUR WORK HERE
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func contains(_ value: Int) -> Bool {
    // YOUR WORK HERE
    return false
  }
}


// A computed property to display a LinkedList when called with print()
// DO NOT EDIT
extension LinkedList: CustomStringConvertible {
  public var description: String {
    var values = [Int]()

    var current: ListNode? = head
    for _ in 0..<length {
        values.append((current?.value)!)
        current = current?.next
    }

    return values.map { String($0) }.joined(separator: " -> ")
  }
}


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


print("ListNode Class")
var testCount: [Int] = [0,0]

assert(&testCount, "able to create an instance",  {
  let node = ListNode(1)
  return node is ListNode
})

assert(&testCount, "has a value property",  {
  let node = ListNode(1)
  return node.value == 1
})

assert(&testCount, "has next property, defaults to nil",  {
  let node = ListNode(1)
  return node.next == nil
})

assert(&testCount, "able to reassign a value",  {
  let node = ListNode(1)
  node.value = 2
  return node.value == 2
})

assert(&testCount, "able to point to another node", {
  let node1 = ListNode(5)
  let node2 = ListNode(10)
  node1.next = node2
  return node1.next!.value == 10
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("LinkedList Class")
testCount = [0,0]

assert(&testCount, "able to create an instance",  {
  let lst = LinkedList()
  return lst is LinkedList
})

assert(&testCount, "has head property, defaults to nil",  {
  let lst = LinkedList()
  return lst.head == nil
})

assert(&testCount, "has tail property, defaults to nil",  {
  let lst = LinkedList()
  return lst.tail == nil
})

assert(&testCount, "has tail property, defaults to nil",  {
  let lst = LinkedList()
  return lst.tail == nil
})

assert(&testCount, "has length property, defaults to 0",  {
  let lst = LinkedList()
  return lst.length == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("LinkedList Insert Method")
testCount = [0, 0]

assert(&testCount, "has insert method",  {
  let lst = LinkedList()
  return lst.insert is (Int, Int) -> ()
})

assert(&testCount, "able to insert a node into empty linked list",  {
  let lst = LinkedList()
  lst.insert(5, 0)
  return lst.length == 1 && lst.head!.value == 5 && lst.tail!.value == 5
})

assert(&testCount, "able to insert a node after another node",  {
  let lst = LinkedList()
  lst.insert(5, 0)
  lst.insert(10, 1)
  return lst.length == 2 &&
         lst.head!.value == 5 &&
         lst.tail!.value == 10
})

assert(&testCount, "able to insert a node before another node",  {
  let lst = LinkedList()
  lst.insert(5, 0)
  lst.insert(10, 0)
  return lst.length == 2 &&
         lst.head!.value == 10 &&
         lst.tail!.value == 5
})

assert(&testCount, "able to insert a node in between two nodes",  {
  let lst = LinkedList()
  lst.insert(5, 0)
  lst.insert(10, 1)
  lst.insert(7, 1)
  return lst.length == 3 &&
         lst.head!.value == 5 &&
         lst.tail!.value == 10 &&
         lst.head!.next!.value == 7
})

assert(&testCount, "does not insert a node if index is out of bounds linked list",  {
  let lst = LinkedList()
  lst.insert(5, -1)
  lst.insert(10, 3)
  return lst.length == 0 &&
         lst.head == nil &&
         lst.tail == nil
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("LinkedList Append Method")
testCount = [0, 0]

assert(&testCount, "has append method",  {
  let lst = LinkedList()
  return lst.append is (Int) -> ()
})

assert(&testCount, "able to append a node into empty linked list",  {
  let lst = LinkedList()
  lst.append(5)
  return lst.length == 1 &&
         lst.head!.value == 5 &&
         lst.tail!.value == 5
})

assert(&testCount, "able to append a second node into a linked list",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  return lst.length == 2 &&
         lst.head!.value == 5 &&
         lst.tail!.value == 10
})

assert(&testCount, "able to append a third node into a linked list",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.append(15)
  return lst.length == 3 &&
         lst.head!.value == 5 &&
         lst.tail!.value == 15
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("LinkedList Delete Method")
testCount = [0, 0]

assert(&testCount, "has delete method",  {
  let lst = LinkedList()
  return lst.delete is (Int) -> ()
})

assert(&testCount, "able to delete a node from the head",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.delete(0)
  return lst.length == 1 && lst.head!.value == 10
})

assert(&testCount, "able to delete a node from the tail",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.delete(1)
  return lst.length == 1 && lst.tail!.value == 5
})

assert(&testCount, "able to delete a node in between two nodes",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.append(15)
  lst.delete(1)
  return lst.length == 2 && lst.head!.value == 5 && lst.tail!.value == 15
})

assert(&testCount, "able to delete the only node in a linked list",  {
  let lst = LinkedList()
  lst.append(5)
  lst.delete(0)
  return lst.length == 0 && lst.head == nil && lst.tail == nil
})

assert(&testCount, "does not delete a node when the index is out of bounds",  {
  let lst = LinkedList()
  lst.append(5)
  lst.delete(-1)
  lst.delete(2)
  return lst.length == 1 && lst.head!.value == 5 && lst.tail!.value == 5
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("LinkedList Contains Method")
testCount = [0, 0]

assert(&testCount, "has contains method",  {
  let lst = LinkedList()
  return lst.contains is (Int) -> (Bool)
})

assert(&testCount, "returns true if linked list contains value'",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.append(15)
  return lst.contains(15) == true
})

assert(&testCount, "returns false if linked list does not contains value",  {
  let lst = LinkedList()
  lst.append(5)
  lst.append(10)
  lst.append(15)
  return lst.contains(8) == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
