
# Why should we hire you?

Should take one minute; minute and a half at most

##### Prompt

Say: "Why should we hire you?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 214 - Invert a Binary Tree

Given a binary tree root node, invert the binary tree (mirror) and return back the root node.

```
Input: Node in a Binary Tree
Output: Node in a Binary Tree
```

# Example

Input:
![InvertBinaryTree1](http://res.cloudinary.com/outco-io/image/upload/v1521248026/InvertBinaryTree1.png)


Output:
![InvertbinaryTree2](http://res.cloudinary.com/outco-io/image/upload/v1521248026/InvertBinaryTree2.png)

# Constraints
```
Time Complexity: O(N)
Auxiliary Space Complexity: O(N)
```
Binary Tree Node has the following properties:
1) value (Integer)
2) left (Binary Tree Node, default null)
3) right (Binary Tree Node, default null)

Must swap the entire node instances, not just their values

# Solution

1) Use Pure Recursion to solve this problem. Our only input is `node`.

    * For the base case, if input `node` is null, return `null`, otherwise, swap the `left` and `right` child.

    * Use a temp variable if necessary.

    * Call the function recursively on both the `node.left` and `node.right`.

2) Return the input `node`.


# Notes

The creator of homebrew couldn't solve this problem in a Google Interview:
https://twitter.com/mxcl/status/608682016205344768



```python

# Python Solution:

def invert_tree(node):                                                                            
    if node is None:                                   
        return                                         
    invert_tree(node.left)                             
    invert_tree(node.right)                            
    node.right, node.left = node.left, node.right      
    return node        
    
   #alternatively you could flip/swap the nodes first then invert the left, invert right. 

```
# Resources
https://leetcode.com/problems/invert-binary-tree/
