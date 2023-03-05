# Matrices - N Spiral Matrix 

#### Prompt

Given an integer N, output an N x N spiral matrix with integers 1 through N<sup>2</sup>.


#### Examples:

```
Input:  3

Output: [[1, 2, 3],
         [8, 9, 4],
         [7, 6, 5]
 
Input: 1

Output: [[1]]

```


#### Input:
`n` = `{Integer}`

#### Output
`result` = `{Integer[][]}`


#### Constraints:

**Time**: O(N<sup>2</sup>)

**Space**: O(N<sup>2</sup>)


#### Resources:

[Spiral Matrix](!https://leetcode.com/problems/spiral-matrix/solution/)


#### Solution:

[//]: {{{
```python
def matrix_spiral(n):
  
  matrix = [[0] * (n) for i in range(n)] 
  min_row, min_col = 0, 0
  max_row, max_col = n - 1, n - 1 
  
  counter = 1 
  while min_row <= max_row and min_col <= max_col:
    
    for col in range(min_col, max_col + 1):
      matrix[min_row][col] = counter 
      counter += 1 
    
    min_row += 1 
    
    for row in range(min_row, max_row + 1):
      matrix[row][max_col] = counter 
      counter += 1 
    
    max_col -= 1 
    
    
    for col in range(max_col, min_col -1, -1):
      matrix[max_row][col] = counter 
      counter += 1 
    
    max_row -= 1 
    
    for row in range(max_row, min_row - 1, -1):
      matrix[row][min_col] = counter 
      counter += 1 
    
    min_col += 1 
  
  return matrix
```
[//]: ---
YOUR WORK HERE
[//]: }}}
