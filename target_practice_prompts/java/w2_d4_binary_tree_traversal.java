/*
 *  Target Practice - Binary Tree Traversal
 *
 *  Solve the following problems involving binary tree traversals.
 */

import java.util.*;

// DO NOT EDIT
// TreeNode class for a binary tree node
class TreeNode {
  public int value;
  public TreeNode left;
  public TreeNode right;

  public TreeNode(int value){
    this.value = value;
  }
}

class BTProblems {

  // DO NOT EDIT
  // generate tree from array, null value are represented as -1
  public static TreeNode deserialize(int[] arr) {
    if (arr.length == 0) {
      return null;
    }
    TreeNode root = new TreeNode(arr[0]);
    Queue<TreeNode> queue = new LinkedList<>();
    queue.add(root);
    TreeNode current;
    for (int i = 1; i < arr.length; i += 2) {
      current = queue.remove();
      if (arr[i] != -1) {
        current.left = new TreeNode(arr[i]);
        queue.add(current.left);
      }
      if (arr[i + 1] != -1 && (i + 1) < arr.length) {
        current.right = new TreeNode(arr[i + 1]);
        queue.add(current.right);
      }
    }
    return root;
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
   * be [1,null,3,2,null]. The first null represents the left child of
   * the 1 node, and the second null represents the right child of the 3 node.
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
  public static int[] arr = {4, 2, 5, 1, 3, -1, 7, -1, -1, -1, -1, 6, 8};

  public static TreeNode sampleTree = deserialize(arr);


  /**
   *  2. Given the example output binary search tree from Problem 1, what would
   *     the order of values printed be if we used:
   *
   *     a. BREADTH FIRST traversal:
   *     b. PRE-ORDER DEPTH first traversal:
   *     c. IN-ORDER DEPTH first traversal:
   *     d. POST-ORDER DEPTH first traversal:
   */

   /*
    *  3a. Using a queue and while loop write a function that takes the root of a
    *      binary tree node and outputs an array of values ordered by BREADTH
    *      FIRST.
    *
    *  Input: node {TreeNode}
    *  Output: {ArrayList}
    *
    *  NOTE: You may use an array or linked list for your queue.
    *  NOTE: Confirm with your answer from Problem 2a.
    */
  public static List<Integer> bfs(TreeNode node) {
    // YOUR WORK HERE
    return new ArrayList<Integer>();
  }


  /**
   *  3b. Using recursion, write a function that takes in a tree node and outputs
   *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
   *
   *  Input: node {TreeNode}
   *  Output: {ArrayList}
   *
   *      NOTE: Confirm with your answer from problem 2b.
   */
  public static List<Integer> dfsPre (TreeNode node) {
    // YOUR WORK HERE
    return new ArrayList<Integer>();
  }


  /**
   *  3c. Using recursion, write a function that takes in a tree node and outputs
   *      an array of values ordered by IN-ORDER DEPTH FIRST traversal.
   *
   *  Input: node {TreeNode}
   *  Output: {List}
   *
   *      NOTE: Confirm with your answer from problem 2b.
   */
  public static List<Integer> dfsIn(TreeNode node) {
    // YOUR WORK HERE
    return new ArrayList<Integer>();
  }


  /**
   *  3d. Using recursion, write a function that takes in a tree node and outputs
   *      an array of values ordered by POST-ORDER DEPTH FIRST traversal.
   *
   *  Input: node {TreeNode}
   *  Output: {List}
   *
   *      NOTE: Confirm with your answer from problem 2d.
   */
  public static List<Integer> dfsPost (TreeNode node) {
    // YOUR WORK HERE
    return new ArrayList<Integer>();
  }

}

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class BTTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Deserialize Test");

    // tests are in the form as shown
    assertTest(testCount, "able to build tree as indicated in diagram", () ->
            BTProblems.sampleTree.value == 4 &&
            BTProblems.sampleTree.left.value == 2 &&
            BTProblems.sampleTree.left.left.value == 1 &&
            BTProblems.sampleTree.left.right.value == 3 &&
            BTProblems.sampleTree.right.value == 5 &&
            BTProblems.sampleTree.right.right.value == 7 &&
            BTProblems.sampleTree.right.right.left.value == 6 &&
            BTProblems.sampleTree.right.right.right.value == 8);

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("breadth first search tests");

    // tests are in the form as shown
    assertTest(testCount, "able to return values of BST in breadth first manner - [4,2,5,1,3,7,6,8]", () -> {
      List<Integer> result = BTProblems.bfs(BTProblems.sampleTree);
      List<Integer> expectation = Arrays.asList(4,2,5,1,3,7,6,8);

      return result.equals(expectation);
    });


    assertTest(testCount, "able to return empty array for an empty BST", () -> {

      int[] input = {};

      TreeNode testRoot = BTProblems.deserialize(input);
      List<Integer> result = BTProblems.bfs(testRoot);
      List<Integer> expectation = Collections.emptyList();

      return result.equals(expectation);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("dfsPre tests");

    // tests are in the form as shown
    assertTest(testCount, "able to return values of BST in pre-order depth first manner - [4,2,1,3,5,7,6,8]", () -> {
      List<Integer> result = BTProblems.dfsPre(BTProblems.sampleTree);
      List<Integer> expectation = Arrays.asList(4,2,1,3,5,7,6,8);

      return result.equals(expectation);
    });

    assertTest(testCount, "able to return empty array for an empty BST", () -> {

      int[] input = {};

      TreeNode testRoot = BTProblems.deserialize(input);
      List<Integer> result = BTProblems.dfsPre(testRoot);
      List<Integer> expectation = Collections.emptyList();

      return result.equals(expectation);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("dfsIn tests");

    // tests are in the form as shown
    assertTest(testCount, "able to return values of BST in in-order depth first manner - [1,2,3,4,5,6,7,8]", () -> {
      List<Integer> result = BTProblems.dfsIn(BTProblems.sampleTree);
      List<Integer> expectation = Arrays.asList(1,2,3,4,5,6,7,8);

      return result.equals(expectation);
    });

    assertTest(testCount, "able to return empty array for an empty BST", () -> {
      int[] input = {};

      TreeNode testRoot = BTProblems.deserialize(input);
      List<Integer> result = BTProblems.dfsIn(testRoot);
      List<Integer> expectation = Collections.emptyList();

      return result.equals(expectation);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("dfsPost tests");

    // tests are in the form as shown
    assertTest(testCount, "able to return values of BST in post-order depth first manner - [1,3,2,6,8,7,5,4]", () -> {
      List<Integer> result = BTProblems.dfsPost(BTProblems.sampleTree);
      List<Integer> expectation = Arrays.asList(1,3,2,6,8,7,5,4);

      return result.equals(expectation);
    });

    assertTest(testCount, "able to return empty array for an empty BST", () -> {
      int[] input = {};

      TreeNode testRoot = BTProblems.deserialize(input);
      List<Integer> result = BTProblems.dfsPost(testRoot);
      List<Integer> expectation = Collections.emptyList();

      return result.equals(expectation);
    });

    // // print the result of tests passed for a module
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
