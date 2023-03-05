/**
 *  Target Practice - Binary Tree Traversal
 *
 *  Solve the following problems involving binary tree traversals.
 */

using System;
using System.Linq;
using System.Collections.Generic;

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

class Problems {

  // DO NOT EDIT
  // generate tree from array, null value are represented as -1
  public static TreeNode deserialize(int[] arr) {
    if (arr.Length == 0) {
      return null;
    }
    TreeNode root = new TreeNode(arr[0]);
    Queue<TreeNode> queue = new Queue<TreeNode>();
    queue.Enqueue(root);
    TreeNode current;
    for (int i = 1; i < arr.Length; i += 2) {
      current = queue.Dequeue();
      if (arr[i] != -1) {
        current.left = new TreeNode(arr[i]);
        queue.Enqueue(current.left);
      }
      if (arr[i + 1] != -1 && (i + 1) < arr.Length) {
        current.right = new TreeNode(arr[i + 1]);
        queue.Enqueue(current.right);
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
    *  Output: {List}
    *
    *  NOTE: You may use an array or linked list for your queue.
    *  NOTE: Confirm with your answer from Problem 2a.
    */
  public static List<int> bfs(TreeNode node) {
    List<int> result = new List<int>();
    if(node == null) {
      return result;
    }
    Queue<TreeNode> queue = new Queue<TreeNode>();
    queue.Enqueue(node);
    TreeNode current;
    while (queue.Count > 0) {
      current = queue.Dequeue();
      if (current.left != null) {
        queue.Enqueue(current.left);
      }
      if (current.right != null) {
        queue.Enqueue(current.right);
      }
      result.Add(current.value);
    }

    return result;
  }


  /**
   *  3b. Using recursion, write a function that takes in a tree node and outputs
   *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
   *
   *  Input: node {TreeNode}
   *  Output: {List}
   *
   *      NOTE: Confirm with your answer from problem 2b.
   */
  public static List<int> dfsPre (TreeNode node) {
    List<int> result = new List<int>();
    dfsPreTraverse(node, result);
    return result;
  }

  private static void dfsPreTraverse(TreeNode current, List<int> result) {

    if(current == null) {
      return;
    }
    result.Add(current.value);
    dfsPreTraverse(current.left, result);
    dfsPreTraverse(current.right, result);
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
  public static List<int> dfsIn(TreeNode node) {
    List<int> result = new List<int>();
    if (node == null) {
      return result;
    }
    dfsInTraverse(node, result);
    return result;
  }

  private static void dfsInTraverse(TreeNode current, List<int> result) {
    if (current == null) {
      return;
    }
    dfsInTraverse(current.left, result);
    result.Add(current.value);
    dfsInTraverse(current.right, result);
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
  public static List<int> dfsPost (TreeNode node) {
    List<int> result = new List<int>();
    dfsPostTraverse(node, result);
    return result;
  }

  private static void dfsPostTraverse(TreeNode current, List<int> result) {
    if (current == null) {
      return;
    }
    dfsPostTraverse(current.left, result);
    dfsPostTraverse(current.right, result);
    result.Add(current.value);
  }
}

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  private static TreeNode emptyTreeExample = Problems.deserialize(new int[]{});

  public static void Main() {
    problem1Tests();
    bfsTests();
    dfsPreTests();
    dfsInTests();
    dfsPostTests();
	}

  private static void problem1Tests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Problem 1 tests");
    runTest(problem1Test1, "able to build tree as indicated in diagram", testCount);
    printTestsPassed(testCount);
  }

  private static void bfsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("breadth first search tests");
    runTest(bfsTest1, "able to return values of BST in breadth first manner - [4,2,5,1,3,7,6,8]", testCount);
    runTest(bfsTest2, "able to return empty array for an empty BST", testCount);
    printTestsPassed(testCount);
  }

  private static void dfsPreTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("dfsPre tests");
    runTest(dfsPreTest1, "able to return values of BST in pre-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
    runTest(dfsPreTest2, "able to return empty array for an empty BST", testCount);
    printTestsPassed(testCount);
  }

  private static void dfsInTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("dfsIn tests");
    runTest(dfsInTest1, "able to return values of BST in in-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
    runTest(dfsInTest2, "able to return empty array for an empty BST", testCount);
    printTestsPassed(testCount);
  }

  private static void dfsPostTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("dfsPost tests");
    runTest(dfsPostTest1, "able to return values of BST in post-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
    runTest(dfsPostTest2, "able to return empty array for an empty BST", testCount);
    printTestsPassed(testCount);
  }


  private static bool problem1Test1() {
    return Problems.sampleTree.value == 4 &&
                Problems.sampleTree.left.value == 2 &&
                Problems.sampleTree.left.left.value == 1 &&
                Problems.sampleTree.left.right.value == 3 &&
                Problems.sampleTree.right.value == 5 &&
                Problems.sampleTree.right.right.value == 7 &&
                Problems.sampleTree.right.right.left.value == 6 &&
                Problems.sampleTree.right.right.right.value == 8;
  }



  private static bool bfsTest1() {
    return Problems.bfs(Problems.sampleTree).SequenceEqual(new List<int>{4,2,5,1,3,7,6,8});
  }

  private static bool bfsTest2() {
    return Problems.bfs(emptyTreeExample).Count == 0;
  }


  private static bool dfsPreTest1() {
    return Problems.dfsPre(Problems.sampleTree).SequenceEqual(new List<int>{4,2,1,3,5,7,6,8});
  }
  private static bool dfsPreTest2() {
    return Problems.dfsPre(emptyTreeExample).Count == 0;
  }


  private static bool dfsInTest1() {
    return Problems.dfsIn(Problems.sampleTree).SequenceEqual(new List<int>{1,2,3,4,5,6,7,8});
  }
  private static bool dfsInTest2() {
    return Problems.dfsIn(emptyTreeExample).Count == 0;
  }



  private static bool dfsPostTest1() {
    return Problems.dfsPost(Problems.sampleTree).SequenceEqual(new List<int>{1,3,2,6,8,7,5,4});
  }
  private static bool dfsPostTest2() {
    return Problems.dfsPost(emptyTreeExample).Count == 0;
  }


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a bool
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
