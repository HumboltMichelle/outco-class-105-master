# Give me an example of a time you faced conflict working on a team. How did you handle it?

Should take one minute; minute and a half at most

##### Prompt

Say: "Give me an example of a time you faced conflict working on a team. How did you handle it?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 221 - Sorted & Rotated Array Search

Given a rotated, sorted array and a target value, return the index of the target value. If the target value does not exist inside of the collection, return -1.

A rotated, sorted array means that some number of elements have been taken from one end of the array and moved to the other end while maintaining the sorted status of the moved elements: `[1,2,3,4,5,6,7] → [3,4,5,6,7,1,2]`.

Assumptions: You can assume all elements are unique and there will no duplicate values.

```
Input: Array of integers, target value
Output: Integer index of target value (-1 if not found)
```

# Example
```
Input: [6,8,11,15,17,3,5], 3      	=>	Output: 5
Input: [6,8,11,15,17,3,5], 10		=>	Output: -1
```

# Constraints

```
Time Complexity: O(log(N))
Auxiliary Space Complexity: O(1)
```

All elements of the array are unique


# Solution
Perform a modified binary search:
* 1) Initialize a `start` index of `0` and an `end` of  `index length - 1`
* 2) Perform a `while` loop until `end` is less than `start`
* 3) Compute the `mid` index by taking the `Math.floor` of the average of `start + end`
* 4) If the `target` is found at `mid`, return `mid`
* 5) Otherwise, check which side is sorted by comparing the `start` and `end` values to the `mid`.
* 6) The target value should either exist in-between the sorted region or outside.
* 7) Discard the unused half by updating the ‘end’ to mid - 1 or ‘start’ to mid+1
* 8) If the while loop breaks without a matching value found, return -1

# Code

```javascript
function searchRotatedSortedArray(arr, target) {
  let start = 0;
  let end = arr.length;
  let mid;
  // Modified Binary Search
  while(start < end) {
    mid = Math.floor((start + end)/2);

    if(arr[mid] === target) {
      return mid;
    }

    if(arr[start] < arr[mid]) { // Left Half is the closed range
      if(target >= arr[start] && target <= arr[mid]) { //Target is in closed range
        end = mid;
      } else { //Target is in open range
        start = mid;
      }
    } else { //Left Half is the open range
      if(target >= arr[start] || target <= arr[mid]) { //Target is in open range
        end = mid;
      } else { //Target is in closed range
        start = mid;
      }
    }
  }
  return -1; //Didn't find the target
}

searchRotatedSortedArray([4,5,6,7,8,9,10,11,15,3], 15)
```

# Resources

[Search in Rotated Sorted Array on Leetcode](https://leetcode.com/problems/search-in-rotated-sorted-array/)
