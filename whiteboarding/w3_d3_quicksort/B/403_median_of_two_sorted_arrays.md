# What is the toughest problem you've solved?

Should take one minute; minute and a half at most

##### Prompt

Say: "What is the toughest problem you've solved?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?


# 403 - Median of Two Sorted Arrays

Given two sorted arrays of integers of the same length, determine the median of the combined sorted array.

The **median** of an array of sorted numbers corresponds to the **middle element**, if the array has an odd number of elements, and the **average** of the **two middle elements** if the array has an even number of elements.

For the interviewer: This example happens to have the two arrays be of even length. If your interviewee ask 'what if they two arrays are of different length', it shows they are thinking of other situations.
```
Input: Two Arrays of Integers
Output: Integer
```

# Example

```
Input:  	[1, 12, 13, 26, 38], [2, 15, 17, 30, 45]
Output:	16
(because the median of [1, 2, 12, 13, 15, 17, 26, 30, 38, 45] equals 16)
```

# Constraints
```
Time Complexity: (Intermediate) O(N), (Advanced) O(log(N))
Auxiliary Space Complexity: O(1).
```
# Solution

### Intermediate
* 1) Create two vars `i` and `j` and initiate them at zero. These will correspond to indices in `arr1` and `arr2`, respectively.

* 2) Similar to “merging two sorted arrays” compare & choose the lower value between `arr1[i]` and `arr2[j]`.

* 3) Increment up either `i` or `j` depending on which one is pointing to the lower value

* 4) Repeat for `N` elements, keeping track of the current `largest`, and `second_largest` element between `arr1` and `arr2`.

* 5) Take the average of the `largest` element and `second_largest` element `N-1` and return that value.

### Advanced
Find the median of both arrays separately
```
        ↓ 
                             ↓
[1, 12, 13, 26, 38], [2, 15, 17, 30, 45]
```

* 1) If the values are the same then, return that value

* 2) If the median of array 1 is smaller than array 2, apply “divide and conquer” to focus on the larger half of array 1 and smaller half of array 2 (vice versa if the median of  array 1 is larger).

* 3) Take the median of the new subarrays and repeat steps 1. through 3. until there are only 2 items in each array

```
     ↓		 
                  ↓
[13, 26, 38], [2, 15, 17]
(take upper half of arr1 and lower of arr2)
```

* 4) Finally, when there are only two items left in each array, zip the elements of each array together and take the average of the second and third elements

```
[13, 26], [15, 17]  => [13, 15, 17, 26] => (15+17)/2 = 16
```

# Notes

In some cases, when there are two elements left, you will pick an element from each array to compute the median.

In other cases, both elements will be picked from the same array.

Can you think of why?


# Resources

[Median of Two Sorted Arrays on Geeks for Geeks](http://www.geeksforgeeks.org/median-of-two-sorted-arrays/)
