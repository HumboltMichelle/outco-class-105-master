# Ensuring success in your first two weeks

#### Prompt

Say: "If you were hired here, what would you do in the first two weeks to ensure success?"

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 406 - Trapping Rain Water

Given an array of integers representing the elevations of rocks, determine the total amount of water that can be trapped between rocks.

```
Input: 	 Array of integers
Output: 	Integer
```

# Example

![rainwater](http://res.cloudinary.com/outco-io/image/upload/v1520892740/rainwater.png)

```
Input: [3, 0, 2, 0, 4]      
Output: 7
```


# Constraints

```
                            Advanced		 Insane
Time Complexity:			        O(N)				O(N)
Auxiliary Space Complexity: 	O(N)				O(1)
```

# Solution
* 1) Instantiate an integer total to track rain water.
* 2) Create an array called max_left to track the maximum height to the left of each index, and populate that array.
  * The example above would be: [0, 3, 3, 3, 3]
* 3) Also create an array called max_right to track the maximum height to the right of each index, and populate that array
  * The example above would be: [4, 4, 4, 4, 0]
* 4) Loop through the input array with index i
At each index, subtract the current value from the lower of the left_max and right_max
If the result is greater than zero, add it to the total
Return total at the end.

```Javascript
let test1 = [3, 0, 2, 0, 4];
let test2 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1];
let test3 = [3, 0, 2, 0, 4];
let test4 = [2, 0, 2];

function TrappedRainWater(arr){
    let total = 0;
    let max_left = [];
    let max_right= [];
    
    let n = arr.length;
    
    // init max_left
    max_left[0] = arr[0];
    for(let i = 1; i < n; i++){
        max_left[i] = Math.max(arr[i], max_left[i-1] );
    }

    // init max_right
    max_right[n-1] = arr[n-1];
    for(let i = n-2; i >= 0 ; i--){
        max_right[i] = Math.max(arr[i], max_right[i+1] );
    }
    
    for(let i = 0; i < n; i++){
        total += (Math.min(max_right[i], max_left[i]) - arr[i]);
    }
    
    return total;
}

console.log(TrappedRainWater(test1));
console.log(TrappedRainWater(test2));
console.log(TrappedRainWater(test3));
console.log(TrappedRainWater(test4));
```
# Resources
[Trapping Rainwater on Geeks for Geeks](http://www.geeksforgeeks.org/trapping-rain-water/)
