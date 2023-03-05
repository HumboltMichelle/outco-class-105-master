/*
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
  public boolean search(int value) {
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

// use the Main class to run the test cases
class BSTTests {

  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("TreeNode Class");

    // tests are in the form as shown
    assertTest(testCount, "has value field", () -> {
      TreeNode node = new TreeNode(0);
      try {
        node.getClass().getField("value");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has left field", () -> {
      TreeNode node = new TreeNode(0);
      try {
        node.getClass().getField("left");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has right field", () -> {
      TreeNode node = new TreeNode(0);
      try {
        node.getClass().getField("right");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "able to assign a value upon instantiation", () -> {
      TreeNode node = new TreeNode(5);
      return node.value == 5;
    });


    assertTest(testCount, "able to point to left child node", () -> {
      TreeNode node1 = new TreeNode(5);
      node1.left = new TreeNode(10);
      return node1.left.value == 10;
    });

    assertTest(testCount, "able to point to right child node", () -> {
      TreeNode node1 = new TreeNode(5);
      node1.right = new TreeNode(10);
      return node1.right.value == 10;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Binary Search Tree Class");

    assertTest(testCount, "has root field", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      try {
        bst.getClass().getField("root");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "has size field", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      try {
        bst.getClass().getField("size");
        return true;
      } catch (Exception e) {
        return false;
      }
    });

    assertTest(testCount, "default root set to null", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      return bst.root == null;
    });

    assertTest(testCount, "default size set to zero", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      return bst.size == 0;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("BinarySearchTree Insert Method");

    assertTest(testCount, "has insert method", () -> {
      BinarySearchTree bst = new BinarySearchTree();

      try {
        bst.getClass().getMethod("insert", int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "able to insert a node into empty binary search tree", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      return bst.size == 1 && bst.root.value == 5;
    });

    assertTest(testCount, "able to insert node to left of root node", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(3);
      return bst.size == 2 && bst.root.value == 5 && bst.root.left.value == 3;
    });

    assertTest(testCount, "able to insert node to right of node left of root node", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(3);
      bst.insert(4);
      return bst.size == 3 && bst.root.value == 5 && bst.root.left.value == 3 && bst.root.left.right.value == 4;
    });

    assertTest(testCount, "able to insert node to right of root node", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(8);
      return bst.size == 2 && bst.root.value == 5 && bst.root.right.value == 8;
    });

    assertTest(testCount, "able to insert node to left of node right of root node", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(8);
      bst.insert(7);
      return bst.size == 3 && bst.root.value == 5 && bst.root.right.value == 8 && bst.root.right.left.value == 7;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("BinarySearchTree Search Method");

    assertTest(testCount, "has search method", () -> {
      BinarySearchTree bst = new BinarySearchTree();

      try {
        bst.getClass().getMethod("search", int.class);
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "returns true when element exists in binary search tree", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(3);
      bst.insert(8);
      bst.insert(4);
      bst.insert(7);
      return bst.search(4);
    });

    assertTest(testCount, "returns true when element does not exist in binary search tree", () -> {
      BinarySearchTree bst = new BinarySearchTree();
      bst.insert(5);
      bst.insert(3);
      bst.insert(8);
      bst.insert(4);
      bst.insert(7);
      return !bst.search(10);
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
