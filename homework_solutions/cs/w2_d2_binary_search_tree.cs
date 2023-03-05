/**
 *  Homework - Binary Search Tree
 *
 *  Problem 1: TreeNode class
 *
 *  Prompt:    Create a TreeNode class
 *             The TreeNode class should contain the following public properties:
 *
 *                   value:   {Integer}
 *                    left:   {TreeNode} (initially null)
 *                   right:   {TreeNode} (initially null)
 *
 *                 Example:   var TreeNode sample = new TreeNode(1)
 *                            sample.value        // 1
 *                            sample.left         // null
 *                            sample.right        // null
 *
 *
 *  Problem 2: BinarySearchTree class.
 *
 *  Prompt:    Create a BinarySearchTree class
 *
 *             The BinarySearchTree class should contain the following public
 *             properties:
 *
 *                    root:   {TreeNode} (initially null)
 *                    size:   {Integer}
 *
 *             The BinarySearchTree class should also contain the following
 *             public methods:
 *
 *                  insert:   A method that takes takes an integer value, and
 *                            creates a node with the given input.  The method
 *                            will then find the correct place to add the new
 *                            node. Values larger than the current node node go
 *                            to the right, and smaller values go to the left.
 *
 *                            Input:     {Integer}
 *                            Output:    {Void}
 *
 *                  search:   A method that will search to see if a node with a
 *                            specified value exists and returns true or false
 *                            if found.
 *
 *                            Input:     {Integer}
 *                            Output:    {Boolean}
 */


using System;

class TreeNode {
  public int value;
  public TreeNode left;
  public TreeNode right;

  public TreeNode(int value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }

}

class BinarySearchTree {
    public TreeNode root;
    public int size;

    public BinarySearchTree() {
        this.root = null;
        this.size = 0;
    }


    // Time Complexity: O(log(N))
    // Auxiliary Space Complexity: O(1)
    public void insert(int value) {
        TreeNode newNode = new TreeNode(value);
        if(this.root == null){
            this.root = newNode;
            size++;
            return;
        }

        TreeNode parent = null;
        TreeNode child = this.root;
        while (child != null) {
            parent = child;
            child = parent.value > value ? parent.left : parent.right;
        }
        if (parent.value > value) {
            parent.left = newNode;
        } else {
            parent.right = newNode;
        }
        size++;
    }


    // Time Complexity: O(log(N))
    // Auxiliary Space Complexity: O(1)
    public bool search(int value) {
        TreeNode current = this.root;
        while (current != null) {
            if (current.value == value) {
                return true;
            }
            current = current.value > value ? current.left : current.right;
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
        treeNodeClassTests();
        binarySearchTreeClassTests();
        bstInsertMethodTests();
        bstSearchMethodTests();
    }

    private static void treeNodeClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("TreeNode Class");
        runTest(treeNodeClassTest1, "able to create an instance", testCount);
        runTest(treeNodeClassTest2, "has value field", testCount);
        runTest(treeNodeClassTest3, "has left field", testCount);
        runTest(treeNodeClassTest4, "has right field", testCount);
        runTest(treeNodeClassTest5, "able to assign a value upon instantiation", testCount);
        runTest(treeNodeClassTest6, "able to reassign a value", testCount);
        runTest(treeNodeClassTest7, "able to point to left child node", testCount);
        runTest(treeNodeClassTest8, "able to point to right child node", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void binarySearchTreeClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Binary Search Tree Class");
        runTest(binarySearchTreeClassTest1, "able to create an instance", testCount);
        runTest(binarySearchTreeClassTest2, "has root field", testCount);
        runTest(binarySearchTreeClassTest3, "has size field", testCount);
        runTest(binarySearchTreeClassTest4, "default root set to null", testCount);
        runTest(binarySearchTreeClassTest5, "default size set to zero", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

     private static void bstInsertMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("BinarySearchTree Insert Method");
        runTest(bstInsertMethodTest1, "has insert method", testCount);
        runTest(bstInsertMethodTest2, "able to insert a node into empty binary search tree", testCount);
        runTest(bstInsertMethodTest3, "able to insert node to left of root node", testCount);
        runTest(bstInsertMethodTest4, "able to insert node to right of node left of root node", testCount);
        runTest(bstInsertMethodTest5, "able to insert node to right of root node", testCount);
        runTest(bstInsertMethodTest6, "able to insert node to left of node right of root node", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

     private static void bstSearchMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("BinarySearchTree Search Method");
        runTest(bstSearchMethodTest1, "has search method", testCount);
        runTest(bstSearchMethodTest2, "returns true when element exists in binary search tree", testCount);
        runTest(bstSearchMethodTest3, "returns true when element does not exist in binary search tree", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }


    private static bool treeNodeClassTest1() {
        TreeNode node = new TreeNode(0);
        return node.GetType() == typeof(TreeNode);
    }

    private static bool treeNodeClassTest2() {
        TreeNode node = new TreeNode(0);
        return node.GetType().GetField("value") != null;
    }

    private static bool treeNodeClassTest3() {
        TreeNode node = new TreeNode(0);
        return node.GetType().GetField("left") != null;
    }

    private static bool treeNodeClassTest4() {
        TreeNode node = new TreeNode(0);
        return node.GetType().GetField("right") != null;
    }

    private static bool treeNodeClassTest5() {
        TreeNode node = new TreeNode(5);
        return node.value == 5;
    }

    private static bool treeNodeClassTest6() {
        TreeNode node = new TreeNode(5);
        node.value = 0;
        return node.value == 0;
    }

    private static bool treeNodeClassTest7() {
        TreeNode node1 = new TreeNode(5);
        TreeNode node2 = new TreeNode(10);
        node1.left = node2;
        return node1.left.value == 10;
    }

    private static bool treeNodeClassTest8() {
        TreeNode node1 = new TreeNode(5);
        TreeNode node2 = new TreeNode(10);
        node1.right = node2;
        return node1.right.value == 10;
    }


    private static bool binarySearchTreeClassTest1() {
        BinarySearchTree node = new BinarySearchTree();
        return node.GetType() == typeof(BinarySearchTree);
    }

    private static bool binarySearchTreeClassTest2() {
        BinarySearchTree node = new BinarySearchTree();
        return node.GetType().GetField("root") != null;
    }

    private static bool binarySearchTreeClassTest3() {
        BinarySearchTree node = new BinarySearchTree();
        return node.GetType().GetField("size") != null;
    }

    private static bool binarySearchTreeClassTest4() {
        BinarySearchTree bst = new BinarySearchTree();
        return bst.root == null;
    }

    private static bool binarySearchTreeClassTest5() {
        BinarySearchTree bst = new BinarySearchTree();
        return bst.size == 0;
    }



    private static bool bstInsertMethodTest1() {
        BinarySearchTree node = new BinarySearchTree();
        return node.GetType().GetMethod("insert") != null;
    }

    private static bool bstInsertMethodTest2() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        return bst.size == 1 && bst.root.value == 5;
    }

    private static bool bstInsertMethodTest3() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(3);
        return bst.size == 2 && bst.root.value == 5 && bst.root.left.value == 3;
    }

    private static bool bstInsertMethodTest4() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(3);
        bst.insert(4);
        return bst.size == 3 && bst.root.value == 5 && bst.root.left.value == 3 && bst.root.left.right.value == 4;
    }

    private static bool bstInsertMethodTest5() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(8);
        return bst.size == 2 && bst.root.value == 5 && bst.root.right.value == 8;
    }

    private static bool bstInsertMethodTest6() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(8);
        bst.insert(7);
        return bst.size == 3 && bst.root.value == 5 && bst.root.right.value == 8 && bst.root.right.left.value == 7;
    }



    private static bool bstSearchMethodTest1() {
        BinarySearchTree node = new BinarySearchTree();
        return node.GetType().GetMethod("search") != null;
    }

    private static bool bstSearchMethodTest2() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(3);
        bst.insert(8);
        bst.insert(4);
        bst.insert(7);
        return bst.search(4);
    }

    private static bool bstSearchMethodTest3() {
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(5);
        bst.insert(3);
        bst.insert(8);
        bst.insert(4);
        bst.insert(7);
        return bst.search(10) == false;
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
