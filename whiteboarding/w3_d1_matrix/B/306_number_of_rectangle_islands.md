# What is your biggest success?

Should take one minute; minute and a half at most

##### Prompt

Say: "What is your biggest success?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 306 - Number of Rectangle Islands

Given a rectangular `matrix` containing only the values “0” and “1”, where the values of “1” always appear in the form of a rectangular island and the islands are always separated row-wise and column-wise by at least one line of “0”s, count the number of islands in the given matrix.  Note that the islands can diagonally adjacent.
```
Input: Matrix of elements with values either 0 or 1
Output: An integer which is the count of all rectangular islands
```

# Example
```
Input: [[1, 1, 0, 1],
        [1, 1, 0, 1],
        [0, 0, 1, 0],
        [0, 0, 1, 0]]

Output: 3

Input: [[1, 0, 0, 0],
        [0, 0, 0, 1],
        [0, 1, 0, 1],
        [0, 0, 0, 1]]

Output: 3

```
# Constraints
```
Time Complexity: O(MN)
Auxiliary Space Complexity: O(1)
```

The islands are all rectangular and the islands are always separated row-wise and column-wise by at least one line of `0`s.

# Solution

Key insight: You only need to count the number of **top-left corners** of the islands.

Because for each distinct rectangular island, there is always EXACTLY 1 top left corner.

To test for a top left corner:

If you find a cell with a `1` in it, and the cells directly above and directly to the left of that cell are either `0` or off the matrix, then you have a top-left corner.

* 1) Create islandCount integer to count number of rectangle islands and initialize it to `0`

* 2) Iterate through the `matrix`

* 3) If current cell is `1` then check to see if cell directly above and to the left is a `1`

  * a) If yes, continue to next cell

  * b) If no, add one to our rectangle island `count`

* 4) Return `islandCount`


```javascript
function rectangleIslands(matrix) {
  let total = 0;

  for(let i = 0; i < matrix.length; i++) {
    for(let j = 0; j < matrix[i].length; j++) {
      if(matrix[i][j] === 1 &&
        ((i - 1) < 0 || matrix[i - 1][j] === 0) &&
        ((j - 1) < 0 || matrix[i][j - 1] === 0) ) {
        total++;
      }
    }
  }
  return total;
}

```

# Resources

[Count Rectangle Islands on Geeks for Geeks](http://www.geeksforgeeks.org/count-number-islands-every-island-separated-line/)
