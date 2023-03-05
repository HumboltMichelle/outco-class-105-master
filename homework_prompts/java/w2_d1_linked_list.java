/*
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


class ListNode {
  public int value;
  public ListNode next;

  public ListNode(int value){
    // YOUR WORK HERE
  }
}


class LinkedList {
  public int length = 0;
  public ListNode head;
  public ListNode tail;

  // Time Complexity:
  // Auxiliary Space Complexity:
  public void append(int value){
    // YOUR WORK HERE
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  public void insert(int value, int index){
    // YOUR WORK HERE
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  public void delete(int index){
    // YOUR WORK HERE
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  public boolean contains(int value){
    // YOUR WORK HERE
    return false;
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class LinkedListTests {

  // an interface to perform tests
  public interface Test {
      boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("ListNode Class");

    assertTest(testCount, "has value field", () -> {
      ListNode node = new ListNode(0);
      try {
        node.getClass().getField("value");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to assign a value upon instantiation", () -> {
      ListNode node = new ListNode(5);
      return node.value == 5;
    });

    assertTest(testCount, "able to point to another node", () -> {
      ListNode node1 = new ListNode(5);
      node1.next = new ListNode(10);
      return node1.next.value == 10;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("LinkedList Class");


    assertTest(testCount, "has head field", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.getClass().getField("head");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has tail field", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.getClass().getField("tail");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has length field", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.getClass().getField("length");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "default head set to null", () -> {
      LinkedList linkedList = new LinkedList();
      return linkedList.head == null;
    });

    assertTest(testCount, "default tail set to null", () -> {
      LinkedList linkedList = new LinkedList();
      return linkedList.tail == null;
    });

    assertTest(testCount, "default length set to 0", () -> {
      LinkedList linkedList = new LinkedList();
      return linkedList.length == 0;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("LinkedList Insert Method");

    assertTest(testCount, "has insert method", () -> {
      LinkedList linkedList = new LinkedList();

      try {
        linkedList.getClass().getMethod("insert", int.class, int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "able to insert a node into empty linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.insert(5,0);
        return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to insert a node after another node", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.insert(5,0);
        linkedList.insert(10, 1);
        return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to insert a node before another node", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.insert(5,0);
        linkedList.insert(10,0);
        return linkedList.length == 2 && linkedList.head.value == 10 && linkedList.tail.value == 5;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "does not insert a node if index is out of bounds linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.insert(5,-1);
        linkedList.insert(10,3);
        return linkedList.length == 0 && linkedList.head == null && linkedList.tail == null;
      } catch (Exception e) {
        return false;
      }
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("LinkedList Append Method");

    assertTest(testCount, "has append method", () -> {
      LinkedList linkedList = new LinkedList();

      try {
        linkedList.getClass().getMethod("append", int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "able to append a node into empty linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to append a second node into a linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 10;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to append a third node into a linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        linkedList.append(15);
        return linkedList.length == 3 && linkedList.head.value == 5 && linkedList.tail.value == 15;
      } catch (Exception e) {
        return false;
      }
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("LinkedList Delete Method");

    assertTest(testCount, "has delete method", () -> {
      LinkedList linkedList = new LinkedList();

      try {
        linkedList.getClass().getMethod("delete", int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "able to delete a node from the head", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        linkedList.delete(0);
        return linkedList.length == 1 && linkedList.head.value == 10 && linkedList.tail.value == 10;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to delete a node in between two nodes", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        linkedList.append(15);
        linkedList.delete(1);
        return linkedList.length == 2 && linkedList.head.value == 5 && linkedList.tail.value == 15;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to delete the only node in a linked list", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.delete(0);
        return linkedList.length == 0 && linkedList.head == null && linkedList.tail == null;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "does not delete a node when the index is out of bounds", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.delete(-1);
        linkedList.delete(2);
        return linkedList.length == 1 && linkedList.head.value == 5 && linkedList.tail.value == 5;
      } catch (Exception e) {
        return false;
      }
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("LinkedList Contains Method");

    assertTest(testCount, "has contains method", () -> {
      LinkedList linkedList = new LinkedList();

      try {
        linkedList.getClass().getMethod("contains", int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "returns true if linked list contains value", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        linkedList.append(15);
        return linkedList.contains(15);
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "returns false if linked list does not contains value", () -> {
      LinkedList linkedList = new LinkedList();
      try {
        linkedList.append(5);
        linkedList.append(10);
        linkedList.append(15);
        return !linkedList.contains(8);
      } catch (Exception e) {
        return false;
      }
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }

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
