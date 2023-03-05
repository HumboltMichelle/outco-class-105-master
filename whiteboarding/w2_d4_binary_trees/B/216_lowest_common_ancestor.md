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

# 216 - Lowest Common Ancestor

Given the root node of a binary tree and two distinct values, find the lowest common ancestor.

```
Input: Root Node, Two Integer Values
Output: Integer Value of Lowest Common Ancestor
```

# Example

Input: root, 4, 9      	=>	Output: 7
![LowestCommonAncestor](http://res.cloudinary.com/outco-io/image/upload/v1521248026/LowestCommonAncestor.png)


# Constraints
```
Time Complexity: O(N)
Auxiliary Space Complexity: O(N)
```
Integer values of nodes are all distinct.

Binary Tree Node has the following properties:
1) `value` (Integer)
2) `right` (Binary Tree Node, default null)
3) `left` (Binary Tree Node, default null)

# Solution

 * 1) Perform a tree traversal to find/collect the path to the first node.  

    * Place values of the path into an array (e.g., `[5, 7, 4]`)

 * 2) Perform a tree traversal to find/collect the path to the second node.

    * Place values of the path into second array (e.g., `[5, 7, 8, 9]`)

 * 3) Iterate through both path arrays and compare the values.

 * 4) Return the last matching value. (e.g., return `7`)

# Notes
Facebook technical screen problem

```javascript
function LowestCommonAncestor (root, num1, num2) {
  let result = -1;

  let arr1 = [];
  let arr2 = [];

  let path = [];

  function ancestorPath (node) {
    if(node === null) {
      return;
    }
    path.push(node.value);

    if(node.value === num1) {
      arr1 = path.slice();
    }

    if(node.value === num2) {
      arr2 = path.slice();
    }

    ancestorPath(node.left);
    ancestorPath(node.right);
    path.pop();
  }

  ancestorPath(root);


  let i = 0;

  while(arr1[i] === arr2[i]) {
    result = arr1[i];
    i++;
  }

  return result;
}


```


```python

# Alternate pure recursion approach in python

def lowest_common_ancestor(root, a, b):                                                              
    if root is None:                                    
        return                                          
    if root.value == a or root.value == b:              
        return root                                     
    left = lowest_common_ancestor(root.left, a, b)      
    right = lowest_common_ancestor(root.right, a, b)    
    if left and right:                                  
        return root                                     
    elif left and not right:                            
        return left                                     
    elif right and not left:                            
        return right                                    
    else:                                               
        return     

```   

# Resources
http://www.geeksforgeeks.org/lowest-common-ancestor-binary-tree-set-1/
