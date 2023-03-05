
# Tell me about a time that you failed at work. What did you learn from it?

Should take one minute; minute and a half at most

##### Prompt

Say: "Tell me about a time that you failed at work. What did you learn from it?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 215 - Valid Binary Search Tree

Given a binary tree root node, check if the tree is a valid binary search tree.

```
Input: Node in a Binary Tree
Output: Boolean
```

# Example

Input:
![ValidBinarySearchTree](http://res.cloudinary.com/outco-io/image/upload/v1521248026/ValidBinarySearchTree.png)

Output: False

# Constraints
```
Time Complexity: O(N)
Auxiliary Space Complexity: O(N)
```
Binary Tree Node has the following properties:
1) value (Integer)
2) right (Binary Tree Node, default null)
3) left (Binary Tree Node, default null)

# Solution

* 1) Use Helper Method Recursion

* 2) Store an `array` in the outer function's scope.

* 3) Perform an in-order depth first traversal, pushing each `node`'s values into the `array`.   

* 2) Check to see if the array is sorted in ascending order.


```javascript
function isBST(root) {
  let result = []

  function dfsInOrder(node) {
    if(node === null) return;
    dfsInOrder(node.left);
    result.push(node.val);
    dfsInOrder(node.right);
  }

  dfsInOrder(root)

  for(let i = 1; i < result.length; i++) {
    if(result[i] < result[i - 1]) {
      return false;
    }
  }
  return true;
}
```


# Resources
https://leetcode.com/problems/validate-binary-search-tree/
