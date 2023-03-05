# Tell me about a time you did something that hadn't been done before

Should take one minute; minute and a half at most

##### Prompt

Say: "Along your career path, I'd like you to tell me about a time you did something that hadn't been done before"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  
   - Something related to their programming experience (story should not delve into irrelevant topics)


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 314 - Word Search

Given a `matrix` of characters `a-z` and a `word`, return a boolean as to
whether the word can be found within the matrix. Words can only be built from adjacent letters (up, down, left, right), but not diagonals. Same elements cannot be used multiple times in the same word.


```
Input: Matrix of characters from a-z, String word
Output: Boolean as to whether word can be found in matrix
```

# Example
```
Input:

[['a', 'b', 'c', 'd'],
 ['e', 'f', 'g', 'h'],
 ['i', 'd', 'o', 'j'],
 ['k', 'l', 'm', 'n']]

'dog'

Output: true
```
# Constraints
```
Time Complexity: O((N*M)^2) where N is width of matrix, and M is the height
Auxiliary Space Complexity: O(N*M)
```

### Notes (Only give if asked; or as tools to help guide interviewee if he/she is stuck)

* There'll be at least one character inside the matrix
* All elements of the matrix will be single characters of lowercase a-z; no capitalized to worry about. Can assume valid input
* Second argument will be at least one character long (can assume valid input here as well)
* Duplicates can exist inside matrix; duplicates can exist inside target word


# Solution

We will perform depth first search from every cell within the matrix.
As we traverse outwards from each cell, we will use a visited set to
ensure we're not using characters in a word multiple times. As we
travel outwards from each cell, we'll use an index that increments (with
each recursive call) to check if the character we've travelled to matches
with a corresponding character within the target word. If the word is
found, we'll toggle a boolean to be true.

1. Create a `visited` set
2. Create a `wordFound` variable and set it to false
3. Perform a doubly-nested for loop to travel through each cell
   within the matrix
4. From each cell, call the recursive depth-first search function with
   three arguments: `x`, `y`, `index` (index always starts at 0)
   - base case: if index is equal to length of target word, set `wordFound`
     to be true and return
   - base case: if `x` or `y` coordinates are off of the matrix, return
   - base case: if matrix at `x`-`y` coordinates doesn't match the target
     word at the index, return
   - base case: if the `wordFound` is already true (meaning word has already
     been found), return
   - base case: if `x`-`y` coordinate has already been visited, return
   - action: add `x`-`y` coordinate to `visited` set
   - recursive case: travel up, down, left, and right from current position
      - call depth-first search recursively (repeat from step 4)
   - action: remove `x`-`y` coordinate from `visited` set
5. return wordFound at end of function


```javascript
function wordSearch(matrix, target) {
  let visited = new Set();
  let wordFound = false;

  function search(x, y, index) {
    if (index === target.length) {
      wordFound = true;
      return;
    }
    if (y < 0 || x < 0 || y >= matrix.length || x >= matrix[0].length) {
      return;
    }
    if (matrix[y][x] !== target[index]) {
      return;
    }
    if (wordFound) {
      return;
    }
    let key = x + '_' + y;
    if (visited.has(key)) {
      return;
    }

    visited.add(key);
    search(x + 1, y, index + 1);
    search(x - 1, y, index + 1);
    search(x, y + 1, index + 1);
    search(x, y - 1, index + 1);
    visited.delete(key);
  }


  for (let y = 0; y < matrix.length; y++) {
    for (let x = 0; x < matrix[0].length; x++) {
      search(x, y, 0);
    }
  }

  return wordFound;
};

Input:

matrix = [
 ['a', 'b', 'c', 'd'],
 ['e', 'f', 'g', 'h'],
 ['i', 'd', 'o', 'j'],
 ['k', 'l', 'm', 'n']
]

'dog' -> true
'abcgfd' -> true
'don' -> false

```
