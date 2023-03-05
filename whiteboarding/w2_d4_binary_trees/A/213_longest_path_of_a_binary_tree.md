
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

# 213 - Longest Path of a Binary Tree

Given a binary tree node, return the number of nodes in the longest path between the root and a leaf node

```
Input: Node in a Binary Tree
Output: Integer
```

# Example
```
Input: <BSTNode 1> =>   Output: 3 (from path 1--> 3--> 4)     
```

![LongestPathBinaryTree](http://res.cloudinary.com/outco-io/image/upload/v1521248026/LongestPathBinaryTree.png)

# Constraints
```
Time Complexity: O(N)
Auxiliary Space Complexity: O(N)
```
Binary Tree Node has the following properties:
1) value (Integer)
2) left (Binary Tree Node, default null)
3) right (Binary Tree Node, default null)

# Solution

Use pure recursion.

* 1) If the `root` is null, return `0` (we've reached the end of a path)

* 2) Otherwise:
  * a) Store the `leftPath` as the result of `longestPath(root.left)`
  * b) Store the `rightPath` as the result of `longestPath(root.right)`


* 3) Return the `max` of `leftPath` and `rightPath` plus `1` (we're adding the current node to the path)


# Notes

Onsite whiteboarding question for Google (2016).

```javascript

// JavaScript Solution:

function longestPath(root) {
  if(root === null) return 0;
  let leftPath = longestPath(root.left);
  let rightPath = longestPath(root.right);
  return Math.max(leftPath, rightPath) + 1;
}

```
# Resources
[Maximum Depth of Binary Tree on Leetcode](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
