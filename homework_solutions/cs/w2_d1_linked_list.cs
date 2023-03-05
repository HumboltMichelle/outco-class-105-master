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
 *                  next:   {ListNode} (initially null)
 *
 *               Example:   ListNode sample = new ListNode(1)
 *                          sample.value     // 1
 *                          sample.next      // null
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

using System;

class ListNode {
  public int value;
  public ListNode next;

  public ListNode(int value){
    this.value = value;
  }
}


class LinkedList {
  public int length = 0;
  public ListNode head;
  public ListNode tail;

  // Time Complexity: O(1)
  // Auxiliary Space Complexity: O(1)
  public void append(int value){
    insert(value, length);
  }


  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public void insert(int value, int index){
    if(index < 0 || index > length){
      return;
    }

    ListNode newNode = new ListNode(value);

    if(length == 0){
      head = newNode;
      tail = newNode;
    } else if(index == 0){
      newNode.next = head;
      head = newNode;
    } else if(index == length){
      tail.next = newNode;
      tail = newNode;
    } else {
      ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      newNode.next = prev.next;
      prev.next = newNode;
    }
    length++;
  }


  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public void delete(int index){
    if(index < 0 || index >= length){
      return;
    }

    if(length == 1){
      head = null;
      tail = null;
    } else if (index == 0){
      head = head.next;
    } else {
      ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      prev.next = prev.next.next;
      if(index == length-1){
        tail = prev;
      }
    }
    length--;
  }


  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public bool contains(int value){
    ListNode current = head;
    while(current != null){
      if(current.value == value){
        return true;
      }
      current = current.next;
    }
    return false;
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    listNodeClassTests();
    linkedListClassTests();
    linkedListInsertMethodTests();
    linkedListAppendMethodTests();
    linkedListDeleteMethodTests();
    linkedListContainsMethodTests();
	}

  private static void listNodeClassTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("ListNode Class");
    runTest(listNodeClassTest1, "able to create an instance", testCount);
    runTest(listNodeClassTest2, "has value field", testCount);
    runTest(listNodeClassTest3, "able to assign a value upon instantiation", testCount);
    runTest(listNodeClassTest4, "able to reassign a value", testCount);
    runTest(listNodeClassTest5, "able to point to another node", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void linkedListClassTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("LinkedList Class");
    runTest(linkedListClassTest1, "able to create an instance", testCount);
    runTest(linkedListClassTest2, "has head field", testCount);
    runTest(linkedListClassTest3, "has tail field", testCount);
    runTest(linkedListClassTest4, "has length field", testCount);
    runTest(linkedListClassTest5, "default head set to null", testCount);
    runTest(linkedListClassTest6, "default tail set to null", testCount);
    runTest(linkedListClassTest7, "default length set to 0", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void linkedListInsertMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("LinkedList Insert Method");
    runTest(linkedListInsertMethodTest1, "has insert method", testCount);
    runTest(linkedListInsertMethodTest2, "able to insert a node into empty linked list", testCount);
    runTest(linkedListInsertMethodTest3, "able to insert a node after another node", testCount);
    runTest(linkedListInsertMethodTest4, "able to insert a node before another node", testCount);
    runTest(linkedListInsertMethodTest5, "does not insert a node if index is out of bounds linked list", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void linkedListAppendMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("LinkedList Append Method");
    runTest(linkedListAppendMethodTest1, "has append method", testCount);
    runTest(linkedListAppendMethodTest2, "able to append a node into empty linked list", testCount);
    runTest(linkedListAppendMethodTest3, "able to append a second node into a linked list", testCount);
    runTest(linkedListAppendMethodTest4, "able to append a third node into a linked list", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void linkedListDeleteMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("LinkedList Delete Method");
    runTest(linkedListDeleteMethodTest1, "has delete method", testCount);
    runTest(linkedListDeleteMethodTest2, "able to delete a node from the head", testCount);
    runTest(linkedListDeleteMethodTest3, "able to delete a node in between two nodes", testCount);
    runTest(linkedListDeleteMethodTest4, "able to delete the only node in a linked list", testCount);
    runTest(linkedListDeleteMethodTest5, "does not delete a node when the index is out of bounds", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void linkedListContainsMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("LinkedList Contains Method");
    runTest(linkedListContainsMethodTest1, "has contains method", testCount);
    runTest(linkedListContainsMethodTest2, "returns true if linked list contains value", testCount);
    runTest(linkedListContainsMethodTest3, "returns false if linked list does not contains value", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }



  private static bool listNodeClassTest1() {
      ListNode node = new ListNode(0);
      return node.GetType() == typeof(ListNode);
  }

  private static bool listNodeClassTest2() {
    ListNode node = new ListNode(0);
    return node.GetType().GetField("value") != null;
  }

  private static bool listNodeClassTest3() {
    ListNode node = new ListNode(5);
    return node.value == 5;
  }

  private static bool listNodeClassTest4() {
    ListNode node = new ListNode(5);
    node.value = 1;
    return node.value == 1;
  }

  private static bool listNodeClassTest5() {
    ListNode node1 = new ListNode(5);
    ListNode node2 = new ListNode(10);
    node1.next = node2;
    return node1.next.value == 10;
  }


  private static bool linkedListClassTest1() {
    LinkedList node = new LinkedList();
    return node.GetType() == typeof(LinkedList);
  }

  private static bool linkedListClassTest2() {
    LinkedList node = new LinkedList();
    return node.GetType().GetField("head") != null;
  }

  private static bool linkedListClassTest3() {
    LinkedList node = new LinkedList();
    return node.GetType().GetField("tail") != null;
  }

  private static bool linkedListClassTest4() {
    LinkedList node = new LinkedList();
    return node.GetType().GetField("length") != null;
  }

  private static bool linkedListClassTest5() {
    LinkedList linkedList = new LinkedList();
    return linkedList.head == null;
  }

  private static bool linkedListClassTest6() {
    LinkedList linkedList = new LinkedList();
    return linkedList.tail == null;
  }

  private static bool linkedListClassTest7() {
    LinkedList linkedList = new LinkedList();
    return linkedList.length == 0;
  }



  private static bool linkedListInsertMethodTest1() {
    return new LinkedList().GetType().GetMethod("insert") != null;
  }

  private static bool linkedListInsertMethodTest2() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.insert(5,0);
      return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
    } catch {
      return false;
    }
  }

  private static bool linkedListInsertMethodTest3() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.insert(5,0);
      linkedList.insert(10, 1);
      return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10;
    } catch {
      return false;
    }
  }

  private static bool linkedListInsertMethodTest4() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.insert(5,0);
      linkedList.insert(10,0);
      return linkedList.length == 2 && linkedList.head.value == 10 && linkedList.tail.value == 5;
    } catch {
      return false;
    }
  }

  private static bool linkedListInsertMethodTest5() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.insert(5,-1);
      linkedList.insert(10,3);
      return linkedList.length == 0 && linkedList.head == null && linkedList.tail == null;
    } catch {
      return false;
    }
  }



  private static bool linkedListAppendMethodTest1() {
    return new LinkedList().GetType().GetMethod("append") != null;
  }

  private static bool linkedListAppendMethodTest2() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
    } catch {
      return false;
    }
  }

  private static bool linkedListAppendMethodTest3() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10;
    } catch {
      return false;
    }
  }

  private static bool linkedListAppendMethodTest4() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      linkedList.append(15);
      return linkedList.length == 3 && linkedList.head.value == 5 && linkedList.tail.value == 15;
    } catch {
      return false;
    }
  }



  private static bool linkedListDeleteMethodTest1() {
    return new LinkedList().GetType().GetMethod("delete") != null;
  }

  private static bool linkedListDeleteMethodTest2() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      linkedList.delete(0);
      return linkedList.length == 1 && linkedList.head.value == 10 && linkedList.tail.value == 10;
    } catch {
      return false;
    }
  }

  private static bool linkedListDeleteMethodTest3() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      linkedList.append(15);
      linkedList.delete(1);
      return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 15;
    } catch {
      return false;
    }
  }

  private static bool linkedListDeleteMethodTest4() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.delete(0);
      return linkedList.length == 0 && linkedList.head == null && linkedList.tail == null;
    } catch {
      return false;
    }
  }

  private static bool linkedListDeleteMethodTest5() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.delete(-1);
      linkedList.delete(2);
      return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
    } catch {
      return false;
    }
  }


  private static bool linkedListContainsMethodTest1() {
    return new LinkedList().GetType().GetMethod("contains") != null;
  }

  private static bool linkedListContainsMethodTest2() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      linkedList.append(15);
      return linkedList.contains(15);
    } catch {
      return false;
    }
  }

  private static bool linkedListContainsMethodTest3() {
    LinkedList linkedList = new LinkedList();
    try {
      linkedList.append(5);
      linkedList.append(10);
      linkedList.append(15);
      return linkedList.contains(8) == false;
    } catch {
      return false;
    }
  }


  private static void runTest(Func<bool> test, string testName, int[] testCount){
      testCount[1]++;
      bool testPassed = false;
      // Attempt to run test and suppress exceptions on failure
      try {
          testPassed = test();
          if(testPassed) testCount[0]++;
      } catch {}
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
}
