# Why do you want to work for this company?

Before the interview, ask them to choose a company they'd want to work for. Once they have a company in mind, the question should take one minute; minute and a half at most.

##### Prompt

Say: "Why do you want to work for this company?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 321 - Knapsack Problem 0/1

Given a set of items where each item has a weight and a value. And given a knapsack with max weight capacity, determine the maximum value that can be placed into the knapsack without going over the capacity.
```
Input: An integer array of weights
       An integer array of values
           (The ith item has weights[i] and values[i])
       Integer value of the max weight capacity of the knapsack
Output: Integer of maximum total value
```
# Example
```
Input:
  weights = [10, 20, 30]
  values =  [60, 100, 120]
  capacity = 50

Output: 220
```

![Knapsack](http://res.cloudinary.com/outco-io/image/upload/v1521248027/Knapsack.png)

# Constraints
```
                      Intermediate    Advanced
Time Complexity:         O(2^N)        O(KN)
Aux Space Complexity:    O(N)          O(K)
```

`K` is the capacity of the knapsack, `N` is the number of items

Once you add an item to the knapsack, you can't add it again (no replacement)

# Solution

Utilize recursion for the intermediate solution.

Use dynamic programming w/ memoization of the recursive solution or use tabulation

### Advanced Tabulation Approach:

The inner loop iterates from 0 to the knapsack capacity and we try to determine the maximum value at each incremental capacity.
If adding the current item results in a higher value, we update our max value at that capacity.

### Detailed Pseudocode for Tabulation Approach:

* 1) Instantiate an array called `finalMax` with a length equal to one plus the capacity
* 2) Loop through the number of items
  * a) Inside this first loop, make a copy of `finalMax` called `tempMax`
  * b) Create an inner loop and increment a variable `cap` from `0` to the input `capacity`
  * c) If the weight of the `current` item is less than or equal to the `current cap`,
  * d) Check to see if the value at `tempMax[cap - weight]` plus the value of the `current` item is greater value than what is currently in `tempMax[cap]`.
  * e) If greater, replace the value at `tempMax[cap]`
* 3) After performing both loops, the `finalMax` should contain the max values obtainable for each `capacity` level. Since we only care about the max value at our input `capacity`, return `finalMax[capacity]`.

# Code Solution

```javascript
function knapsack(weights, values, capacity) {
  var finalMax = new Int32Array(capacity + 1); // create a new array of 0’s
  for(var i = 0; i < weights.length; i++) {
    var weight = weights[i];
    var value = values[i];
    var tempMax = finalMax.slice(); // make a copy of the finalMax array
    for(var cap = 0; cap <= capacity; cap++) {
      if(cap - weight >= 0) {
        tempMax[cap] = Math.max(tempMax[cap], finalMax[cap - weight] + value);
      }
    }
    finalMax = tempMax;
  }
  return finalMax[capacity];
}

console.log(knapsack([10,20,30], [60,100,120], 50));
```
### Top Down Dynamic Programic with a Memoized Approach

```python
def knapsack(weights, value, capacity):
  
  dp = [[-1 for _ in range(capacity+1)] for _ in range(len(weights))]
  
  
  def recursive(dp, weights, value, capacity, index):
    
    #Base Case
    if capacity<=0 or index>=len(weights):
      return 0
    
    #Recursive Case 
    value1 = 0 
    
    if weights[index] <= capacity:
        value1 =  value[index] + recursive(dp, weights, value, capacity-weights[index], index+1)
        
    value2 = recursive(dp, weights, value, capacity, index+1)
    
    dp[index][capacity] = max(value1,value2)
    
    return dp[index][capacity]
  
  return recursive(dp, weights, value, capacity, 0)
  
print(knapsack([10, 20, 30], [60, 100, 120], 50))
```


### Top Down Dynamic Programic with a Memoized Approach
```python
### Top Down Dynamic Programic with a Memoized Approach

```python
'''
Input: weights = [2,3,4,5]
        value =  [1,2,5,6]
        capacity = 8


          DP TABLE
          
       0  1   2   3    4    5    6    7    8
     |  -------------------------------------
    2|  0  0   1   1    1    1    1    1    1 
    
    3|  0  0   1   2    2    3    3    3    3 
    
    4|  0  0   1   2    5    5    6    7    7
    
    5|  0  0   1   2    5    6    6    7    8
 '''
def knapsack(weights, value, capacity):
  
  dp = [[-1 for _ in range(capacity+1)] for _ in range(len(weights))]
  
  
  def recursive(dp, weights, value, capacity, index):
    
    #Base Case
    if capacity<=0 or index>=len(weights):
      return 0
    
    #Recursive Case 
    value1 = 0 
    
    if weights[index] <= capacity:
        value1 =  value[index] + recursive(dp, weights, value, capacity-weights[index], index+1)
        
    value2 = recursive(dp, weights, value, capacity, index+1)
    
    dp[index][capacity] = max(value1,value2)
    
    return dp[index][capacity]
  
  return recursive(dp, weights, value, capacity, 0)
  
print(knapsack([2,3,4,5], [1,2,5,6], 8))
```

# Resources

[Knapsack on Geeks for Geeks]( http://www.geeksforgeeks.org/dynamic-programming-set-10-0-1-knapsack-problem/)

[Knapsack on Wikipedia](https://en.wikipedia.org/wiki/Knapsack_problem)
