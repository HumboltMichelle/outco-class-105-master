/**
 *  Target Practice - Linked List
 *
 *  Solve the following problems involving linked lists.
 */

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

// DO NOT EDIT
// ListNode class for a linked list node
class ListNode {
  public int value;
  public ListNode next;

  public ListNode(int value){
    this.value = value;
  }
}


class Problems {

  // DO NOT EDIT
  // Generate a linked list from an array
  public static ListNode generateList(int[] arr) {
    if(arr.Length == 0){
      return null;
    }
    ListNode head = new ListNode(arr[0]);
    ListNode current = head;
    for(int i = 1; i < arr.Length; i++){
      current.next = new ListNode(arr[i]);
      current = current.next;
    }
    return head;
  }


/**
 * 1a. Create a method which prints the value of each node until the tail
 *
 * Input: node {ListNode}
 * Output: void
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
  public static void printForward(ListNode node) {
    // YOUR WORK HERE
  }


/**
 * 1b. Given a node, print the value of each node backwards from the tail to the
 * input node using recursion.
 *
 * Input: node {ListNode}
 * Output: void
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
  public static void printBackward(ListNode node) {
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
  public static ListNode reverse(ListNode node) {
    // YOUR WORK HERE
    return null;
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
  public static ListNode swap(ListNode head, int a, int b) {
    // YOUR WORK HERE
    return null;
  }


 /**
  *  Extra Credit 1:
  *
  *  Given an input of a ListNode, return true if the ListNode is in a circular
  *  linked list, and false if the linked list that terminates.
 */
  public static bool isCircular(ListNode node){
    // YOUR WORK HERE
    return true;
  }

}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    linkedListInstantiationTests();
    printForwardTests();
    printBackwardTests();
    reverseListTests();
    swapNodesTests();
    isCircularTests();
	}

  private static void   linkedListInstantiationTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("linked list instantiation tests");
        runTest(  linkedListInstantiationTest1, "able to create a linked list instance", testCount);
        printTestsPassed(testCount);
  }

  private static void printForwardTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("printForward tests");
        runTest(printForwardTest1, "should be able to print forward 1 --> 5 --> 7 --> 10", testCount);
        runTest(printForwardTest2, "should be able to print forward with single element", testCount);
        runTest(printForwardTest3, "should print nothing for empty list node", testCount);
        printTestsPassed(testCount);
  }

  private static void printBackwardTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("printBackward tests");
        runTest(printBackwardTest1, "should be able to print backward elements of linked list 1 --> 5 --> 7 --> 10", testCount);
        runTest(printBackwardTest2, "should be able to print backward with single element linked list 1", testCount);
        runTest(printBackwardTest3, "should print nothing for empty linked list", testCount);
        printTestsPassed(testCount);
  }

  private static void reverseListTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("reverse tests");
        runTest(reverseListTest1, "should be able to reverse 1 --> 5 --> 7 --> 10 to be 10 --> 7 --> 5 --> 1", testCount);
        runTest(reverseListTest2, "should be able to handle single element linked lists", testCount);
        printTestsPassed(testCount);
  }

  private static void swapNodesTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("swap tests");
        runTest(swapNodesTest1, "should be able to swap 1 and 5 to change 1 --> 5 --> 7 --> 10 linked list to look like 5 --> 1 --> 7 --> 10", testCount);
        runTest(swapNodesTest2, "should be able to swap 1 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 7 --> 5 --> 1 --> 10", testCount);
        runTest(swapNodesTest3, "should be able to swap 1 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 10 --> 5 --> 7 --> 1", testCount);
        runTest(swapNodesTest4, "should be able to swap 5 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 10 --> 7 --> 5", testCount);
        printTestsPassed(testCount);
  }

  private static void isCircularTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("isCircular tests");
        runTest(isCircularTest1, "should return true for circular linked list", testCount);
        runTest(isCircularTest2, "should return false for terminal linked list", testCount);
        printTestsPassed(testCount);
  }


  private static string stdOutCapture(Action<ListNode> printFunc, ListNode input) {
        // Set Console standard out to string writer
        var sw = new StringWriter();
        Console.SetOut(sw);
        Console.SetError(sw);

        // Print some output: goes to your special stream
        printFunc(input);

        // Reset standard out and standard error
        var standardOutput = new StreamWriter(Console.OpenStandardOutput());
        standardOutput.AutoFlush = true;
        var standardError = new StreamWriter(Console.OpenStandardError());
        standardError.AutoFlush = true;
        Console.SetOut(standardOutput);
        Console.SetError(standardError);

        // Show what happened
        return sw.ToString();
    }

  private static bool linkedListInstantiationTest1() {
    int[] arr = {1, 5, 7, 10};
    ListNode test = Problems.generateList(arr);
    return test.GetType() == typeof(ListNode) && test.value == 1 &&
      test.next.next.next.value == 10;
  }


  private static bool printForwardTest1() {
        int[] arr = {1, 5, 7, 10};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printForward, test);
        return result == ("1\n5\n7\n10\n");
  }

  private static bool printForwardTest2() {
        int[] arr = {1};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printForward, test);
        return result == ("1\n");
  }

  private static bool printForwardTest3() {
        int[] arr = {};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printForward, test);
        return result == ("");
  }



  private static bool printBackwardTest1() {
        int[] arr = {1, 5, 7, 10};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printBackward, test);
        return result == ("10\n7\n5\n1\n");
  }

  private static bool printBackwardTest2() {
        int[] arr = {1};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printBackward, test);
        return result == ("1\n");
  }

  private static bool printBackwardTest3() {
        int[] arr = {};
        ListNode test = Problems.generateList(arr);
        string result = stdOutCapture(Problems.printBackward, test);
        return result == ("");
  }

  private static bool reverseListTest1() {
        int[] arr = {1, 5, 7, 10};
        ListNode test = Problems.generateList(arr);
        test = Problems.reverse(test);

        return test.value == 10 &&
          test.next.value == 7 &&
          test.next.next.value == 5 &&
          test.next.next.next.value == 1;
  }

  private static bool reverseListTest2() {
        int[] arr = {10};
        ListNode test = Problems.generateList(arr);
        test = Problems.reverse(test);

        return test.value == 10;
  }

  private static bool swapNodesTest1() {
    int[] arr = {1, 5, 7, 10};
    ListNode test = Problems.generateList(arr);
    test = Problems.swap(test, 1, 5);

    return test.value == 5 &&
      test.next.value == 1 &&
      test.next.next.value == 7 &&
      test.next.next.next.value == 10;

  }

  private static bool swapNodesTest2() {
    int[] arr = {1, 5, 7, 10};
        ListNode test = Problems.generateList(arr);
        test = Problems.swap(test, 1, 7);

        return test.value == 7 &&
          test.next.value == 5 &&
          test.next.next.value == 1 &&
          test.next.next.next.value == 10;

  }

  private static bool swapNodesTest3() {
    int[] arr = {1, 5, 7, 10};
    ListNode test = Problems.generateList(arr);
    test = Problems.swap(test, 1, 10);

    return test.value == 10 &&
      test.next.value == 5 &&
      test.next.next.value == 7 &&
      test.next.next.next.value == 1;

  }

  private static bool swapNodesTest4() {
    int[] arr = {1, 5, 7, 10};
    ListNode test = Problems.generateList(arr);
    test = Problems.swap(test, 5, 10);

    return test.value == 1 &&
      test.next.value == 10 &&
      test.next.next.value == 7 &&
      test.next.next.next.value == 5;

  }


  private static bool isCircularTest1() {
    // setup of node in a circular linkedList
    ListNode work;

    ListNode node = new ListNode(new Random().Next(10000));
    work = node;
    int circleSize = 100 + (new Random().Next((10000 - 100) + 1));

    for (int i = 0; i < circleSize; i++){
      work.next = new ListNode(new Random().Next(10000));
      work = work.next;
      if (i == (circleSize - 1)){
        // connects the last node to the original nodeA
        work.next = node;
      }
    }

    return Problems.isCircular(node);
  }

  private static bool isCircularTest2() {
    // setup of a node in a linkedList that terminates
    ListNode work;
    ListNode node = new ListNode(new Random().Next(10000));
    work = node;
    int listSize = 100 + (new Random().Next((10000 - 100) + 1));

    for (int i = 0; i < listSize; i++){
      work.next = new ListNode(new Random().Next(10000));
      work = work.next;
    }

    return Problems.isCircular(node) == false;

  }


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a boolean
  //   indicating if test passed
  // string name : describes the test
  // int[] testCount : keeps track out how many tests pass and how many total
  //   in the form of a two item array i.e., [0, 0]
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
  // this is to print the number of test cases passed for a test suite function
  private static void printTestsPassed(int[] testCount) {
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }
}
