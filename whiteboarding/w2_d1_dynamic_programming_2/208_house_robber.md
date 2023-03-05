# Interesting Problem

#### Prompt

Say: "Tell me about an interesting problem you've solved recently."

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 208 - House Robber

A house robber has a map of houses and the amount of gold in each home.  The robber knows that if two adjacent homes are robbed, then the neighborhood security system will sound.  Determine the total amount of gold the robber can get without setting off the alarm.

```
Input: 	 Array of Nonnegative Integers
Output: 	Integer
```

# Example
```
Input: [1, 2, 3]				      =>	Output: 4
Input: [1, 2, 4, 1, 5, 12, 5]	=>	Output: 17

Explanation:
Knowing you can't rob from two adjacent houses
The maximum gold you can steal in each case:

Example 1
1 + 3 = 4

Example 2
1 + 4 + 12 = 17

```


# Constraints

```
Time Complexity: O(N)
Auxiliary Space Complexity: Intermediate O(N), Advanced O(1)
```

# Notes

Think about how you might be able to do this with just three variables instead of an additional array.

# Solution
This can be solved using tabulation (iteratively).

* 1) Instantiate a new ‘max’ array to hold the max gold that can be accumulated up to each house.
* 2) Loop through the input array with, i.
* 3) For each house, the max gold (max[i]) will be the greater of:
  * The Maximum of: max of two houses back + the current house value and the precious houses's max 
  * The max of three houses back + the current house value
* 4) After the loop, return the last value in the max array

```Javascript
let test1 = [1, 2, 3];
let test2 = [1, 2, 4, 1, 5, 12, 5];
let test3 = [2, 1, 1, 2];

// solution described from above
function houseRobber(houses) {
  if (houses.length === 1) {
    return houses[0];
  }
  if (houses.length === 2) {
    return Math.max(houses[0], houses[1]);
  }

  let max = [houses[0], houses[1]];

  houses[2] = Math.max(houses[0] + houses[2], max[1]);

  for(let i = 3; i < houses.length; i++) {
        max[i] = Math.max(max[i-3] + houses[i], Math.max(max[i-2] + houses[i], max[i-1]));  
  }

  return max[max.length - 1];
}

// constant auxiliary space approach
function houseRobberConstantSpace(houses) {
  if (houses.length === 1) {
    return houses[0];
  }
  if (houses.length === 2) {
    return Math.max(houses[0], houses[1]);
  }

  let max0 = houses[0];
  let max1 = houses[1];
  let max2 = Math.max(max0 + houses[2], max1);

  for (let i = 3; i < houses.length; i++) {
    let temp = Math.max(houses[i] + max0, Math.max(houses[i] + max1, max2));
    max0 = max1
    max1 = max2;
    max2 = temp;
  }

  return max2;
}

console.log(houseRobber(test2));
console.log(houseRobber(test3));
console.log(houseRobberConstantSpace(test2));
```

# Resources
[House Robber on Geeks for Geeks](https://leetcode.com/problems/house-robber/)
