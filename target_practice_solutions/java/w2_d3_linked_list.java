/*
 *  Target Practice - Linked List
 *
 *  Solve the following problems involving linked lists.
 */

import java.io.*;


// DO NOT EDIT
// ListNode class for a linked list node
class ListNode {
  public int value;
  public ListNode next;

  public ListNode(int value){
    this.value = value;
  }
}


class LLProblems {

  // DO NOT EDIT
  // Generate a linked list from an array
  public static ListNode generateList(int[] arr) {
    if(arr.length == 0){
      return null;
    }
    ListNode head = new ListNode(arr[0]);
    ListNode current = head;
    for(int i = 1; i < arr.length; i++){
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

  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public static void printForward(ListNode node) {
    ListNode current = node;
    while (current != null) {
      System.out.println(current.value);
      current = current.next;
    }
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

  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(N)
  public static void printBackward(ListNode node) {
    if (node == null) {
      return;
    }
    printBackward(node.next);
    System.out.println(node.value);
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

  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public static ListNode reverse(ListNode node) {
    if (node == null) {
      return null;
    }
    ListNode prev = null;
    ListNode current = node;
    ListNode next;
    while(current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }

    return prev;
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
 * ListNode head = LLProblems.generateList({1, 5, 7, 10});
 * head = swap(head, 5, 10);
 *
 *          (1) --> (5) --> (7) --> (10)
 *          Head
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head
 */

  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(1)
  public static ListNode swap(ListNode head, int a, int b) {
    if (head == null || a == b) {
      return head;
    }

    ListNode[] location1 = LLProblems.locate(head, a);
    ListNode[] location2 = LLProblems.locate(head, b);
    ListNode prev1 = location1[0];
    ListNode current1 = location1[1];
    ListNode prev2 = location2[0];
    ListNode current2 = location2[1];

    if (current1 == null || current2 == null) { return head; }
    if (prev1 != null) {
      prev1.next = current2;
    }
    if (prev2 != null) {
      prev2.next = current1;
    }
    ListNode temp = current1.next;
    current1.next = current2.next;
    current2.next = temp;

    if (prev1 == null) {
      return current2;
    }
    if (prev2 == null) {
      return current1;
    }
    return head;
  }

  private static ListNode[] locate(ListNode node, int target) {
    ListNode prev = null;
    ListNode current = node;
    ListNode[] results = new ListNode[2];
    while (current != null) {
      if(current.value == target){
          results[0] = prev;
          results[1] = current;
          return results;
      }
      prev = current;
      current = current.next;
    }
    return results;
  }

 /**
  *  Extra Credit 1:
  *
  *  Given an input of a ListNode, return true if the ListNode is in a circular
  *  linked list, and false if the linked list that terminates.
 */
  public static boolean isCircular(ListNode node){
    ListNode tortoise = node;
    ListNode hare = node;

    while (hare != null && hare.next != null) {
      hare = hare.next.next;
      tortoise = tortoise.next;
      if (tortoise == hare) {
        return true;
      }
    }
    return false;
  }

}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use main class to run the test cases
class LLTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("linked list instantiation tests");

    // tests are in the form as shown
    assertTest(testCount, "able to create a linked list instance", () -> {
      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      return test != null && test.value == 1 &&
        test.next.next.next.value == 10;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("printForward tests");

    assertTest(testCount, "should be able to print forward 1 --> 5 --> 7 --> 10", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printForward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("1\n5\n7\n10\n");

    });

    assertTest(testCount, "should be able to print forward with single element", () -> {

      int[] arr = {1};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printForward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("1\n");

    });
    assertTest(testCount, "should print nothing for empty list node", () -> {

      int[] arr = {};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printForward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("");

    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("printBackward tests");

    assertTest(testCount, "should be able to print backward elements of linked list 1 --> 5 --> 7 --> 10", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printBackward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("10\n7\n5\n1\n");

    });

    assertTest(testCount, "should be able to print backward with single element linked list 1", () -> {

      int[] arr = {1};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printBackward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("1\n");

    });

    assertTest(testCount, "should print nothing for empty linked list", () -> {

      int[] arr = {};
      ListNode test = LLProblems.generateList(arr);

      // Create a stream to hold the output
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      PrintStream ps = new PrintStream(baos);
      // IMPORTANT: Save the old System.out!
      PrintStream old = System.out;
      // Tell Java to use your special stream
      System.setOut(ps);

      // Print some output: goes to your special stream
      LLProblems.printBackward(test);

      // Put things back
      System.out.flush();
      System.setOut(old);

      return baos.toString().equals("");

    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("reverse tests");

    assertTest(testCount, "should be able to reverse 1 --> 5 --> 7 --> 10 to be 10 --> 7 --> 5 --> 1", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.reverse(test);

      return test != null && test.value == 10 &&
        test.next.value == 7 &&
        test.next.next.value == 5 &&
        test.next.next.next.value == 1;

    });

    assertTest(testCount, "should be able to handle single element linked lists", () -> {

      int[] arr = {10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.reverse(test);

      return test != null && test.value == 10;

    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("swap tests");

    assertTest(testCount, "should be able to swap 1 and 5 to change 1 --> 5 --> 7 --> 10 linked list to look like 5 --> 1 --> 7 --> 10", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.swap(test, 1, 5);

      return test != null && test.value == 5 &&
        test.next.value == 1 &&
        test.next.next.value == 7 &&
        test.next.next.next.value == 10;

    });

    assertTest(testCount, "should be able to swap 1 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 7 --> 5 --> 1 --> 10", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.swap(test, 1, 7);

      return test != null && test.value == 7 &&
        test.next.value == 5 &&
        test.next.next.value == 1 &&
        test.next.next.next.value == 10;

    });

    assertTest(testCount, "should be able to swap 1 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 10 --> 5 --> 7 --> 1", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.swap(test, 1, 10);

      return test != null && test.value == 10 &&
        test.next.value == 5 &&
        test.next.next.value == 7 &&
        test.next.next.next.value == 1;
    });

    assertTest(testCount, "should be able to swap 5 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 10 --> 7 --> 5", () -> {

      int[] arr = {1, 5, 7, 10};
      ListNode test = LLProblems.generateList(arr);
      test = LLProblems.swap(test, 5, 10);

      return test != null && test.value == 1 &&
        test.next.value == 10 &&
        test.next.next.value == 7 &&
        test.next.next.next.value == 5;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("isCircular tests");

    // tests are in the form as shown
    assertTest(testCount, "should return true for circular linked list", () -> {

      // setup of node in a circular linkedList
      ListNode work;

      ListNode node = new ListNode((int)(Math.random() * 10000));
      work = node;
      int circleSize = 100 + (int)(Math.random() * ((10000 - 100) + 1));

      for (int i = 0; i < circleSize; i++){
        work.next = new ListNode((int)(Math.random() * 10000));
        work = work.next;
        if (i == (circleSize - 1)){
          // connects the last node to the original nodeA
          work.next = node;
        }
      }

      return LLProblems.isCircular(node);
    });

    assertTest(testCount, "should return false for terminal linked list", () -> {

      // setup of a node in a linkedList that terminates
      ListNode work;
      ListNode node = new ListNode((int)(Math.random() * 10000));
      work = node;
      int listSize = 100 + (int)(Math.random() * ((10000 - 100) + 1));

      for (int i = 0; i < listSize; i++){
        work.next = new ListNode((int)(Math.random() * 10000));
        work = work.next;
      }

      return !LLProblems.isCircular(node);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  // do not edit below, this is to wrap the test and check for exceptions
  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) {}
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
