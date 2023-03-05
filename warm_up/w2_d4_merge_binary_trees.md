# Binary Trees - Merge Binary Trees

#### Prompt

Given two binary trees, imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.

You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.

#### Examples
Input: root1 {BinaryTreeNode}, root2 {BinaryTreeNode}


	Tree 1                     Tree 2  

          1                         2                             
         / \                       / \                            
        3   2                     1   3                        
       /                           \   \                      
      5                             4   7   


 Output: {BinaryTreeNode}

    Merged tree:
	     3
	    / \
	   4   5
	  / \   \
	 5   4   7


#### Constraints
Time Complexity: O(N)   
Space Complexity: O(N)   


The merging process must start from the root nodes of both trees.   

#### Resources

[Binary Tree Traversals](http://www.ida.liu.se/opendsa/OpenDSA/Books/TDDD86_2014/html/BinaryTreeTraversal.html)

#### Hints

1. How can you traverse through both trees at the same time?
2. What happens when one of the nodes is null/None?
3. How can you break this problem into two smaller problems? ie. When should you merge, and when should you copy?

#### Solution

[//]: {{{
```javascript
class Main {
  public static void main(String[] args) {
    System.out.println("Hello world!");
    TreeNode test1 = new TreeNode(1);
    TreeNode test2 = new TreeNode(2);
    TreeNode test3 = TreeMethods.mergeTrees(test1, test2);
    System.out.println(test3.val); // => 3
  }
}

class TreeNode {
  public TreeNode left = null;
  public TreeNode right = null;
  public Integer val;

  public TreeNode(int val) {
    this.val = val;
  }
}

class TreeMethods {
  public static TreeNode copyTree(TreeNode node) {
    if(node == null) {
      return null;
    }
    TreeNode newNode = new TreeNode(node.val);
    newNode.left = copyTree(node.left);
    newNode.right = copyTree(node.right);
    return newNode;
  }

  public static TreeNode mergeTrees(TreeNode node1, TreeNode node2) {
  // Case 1: Neither is null
    if(node1 != null && node2 != null) {
      TreeNode newNode = new TreeNode(node1.val + node2.val);
      newNode.left = mergeTrees(node1.left, node2.left);
      newNode.right = mergeTrees(node1.right, node2.right);
      return newNode;
    }
    // Case 2: 1 or more is null
    if(node1 == null) {
      return copyTree(node2);
    }
    if(node2 == null) {
      return copyTree(node1);
    }
    return node1;
  }
}
```
[//]: ---
YOUR WORK HERE
[//]: }}}
