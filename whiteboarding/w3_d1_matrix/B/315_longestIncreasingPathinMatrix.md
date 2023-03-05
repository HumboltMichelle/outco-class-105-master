
# What is your favorite programming language and why?

Should take one minute; minute and a half at most

##### Prompt

Say: "What is your favorite programming language and why?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 315 - Longest Increasing Path

Given an integer matrix, find the length of the longest increasing path.

Given each cell, you can either move to four directions, left, right, up or down. You may NOT move diagonally or move outside of the
boundary (i.e. wrap-around is not allowed).

```
Input: Matrix of Integers
Output: Integer (length of the longest increasing path)
```

# Example

#### Example 1:

**Input**:

nums = [  
  [**9**, 9, 4],  
  [**6**, 6, 8],  
  [**2**, **1**,  1]  
]


**Output**: 4

#### Example 2:

**Input**:

nums = [  
  [**3**, **4**, **5**],  
  [3, 2, **6**],  
  [2, 2,  1]  
]


**Output**: 4

# Constraints
```
Time Complexity: O(M * N)  
Auxiliary Space Complexity: O(M*N)
```
# Solution

* 1) Perform Depth First Search on the matrix with Memoization.


```python

def longest_increaseing_path(matrix):

  directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

  if len(matrix) == 0: return 0

  num_of_rows, num_of_cols = len(matrix), len(matrix[0])

  cache = {}

  answer = 0

  def dfs(matrix, row, col):
    nonlocal cache
    nonlocal directions

    key = (row, col)

    if key in cache: return cache[key]

    cache[key] = 0

    for d in directions:
      next_row = row + d[0]
      next_col = col + d[1]

        if (next_row >= 0 and next_row < num_of_rows and next_col >= 0 and next_col < num_of_cols):
          if (matrix[next_row][next_col] > matrix[row][col]):
            cache[key] = max(cache[key], dfs(matrix, next_row, next_col))

    cache[key] += 1
    return cache[key]


    for row in range(num_of_rows):
      for col in range(num_of_cols):
        answer = max(answer, dfs(matrix, row, col))

  return answer
```


# Resources
https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
