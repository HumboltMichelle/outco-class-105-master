import Foundation

/* Homework - Decrease and Conquer

Utilize the decrease and conquer pattern to solve these problems.

## Number of Ones

*Given a sorted bit array (values of either 0 or 1), determine the number of 1's in the array.*

**Parameters**
Input: arr {Array of Integers}
Output: {Integer}

**Constraints**
Time: O(logN)
Space: O(1)

**Examples**
`[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1] --> 8`
`[0, 0, 0] --> 0`
`[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1] --> 7`

*/

func numberOfOnes(_ arr: [Int]) -> Int {
  // YOUR WORK HERE
  return -1
}



/* Closest Value

*Given a sorted bit array of integers, and a target value, find the number in the array that is closest to the target.*

**Parameters**
Input: arr {Array of Integers}
Input: target {Integer}
Output: {Integer}

**Constraints**
If there are two numbers tied for the closest value, return the lowest value.

Time: O(logN)
Space: O(1)

**Examples**
`[1, 2, 3, 5, 5, 7, 9, 10, 11], 6 --> 5`
`[1, 2, 3], 8 --> 3`
`[1, 10, 22, 59, 67, 72, 100], 70 --> 72`
*/

func closestValue(_ arr: [Int], _ target: Int) -> Int {
  // YOUR WORK HERE
  return -1
}



/* Square Root

*Given an positive integer, find the square root.*

**Parameters**
Input: value {Integer}
Output: {Float}

**Constraints**
Do not use a native built in method.
Ensure the result is accurate to 6 decimal places (0.000001)

Time: O(logN)
Space: O(1)

**Examples**
`4 --> 2.0`
`98 --> 9.899495`
`14856 --> 121.885192
*/


func squareRoot(_ n: Int) -> Double {
  // YOUR WORK HERE
  return -1.0
}



/* Greater Values

*Given an sorted array of integers, and a target value return the number of values greater the target.*

**Parameters**
Input: arr {Array of Integers}
Input: target {Integer}
Output: {Integer}

**Constraints**

Time: O(logN)
Space: O(1)

**Examples**
`[1, 2, 3, 5, 5, 7, 9, 10, 11], 5 --> 4`
`[1, 2, 3], 4 --> 0`
`[1, 10, 22, 59, 67, 72, 100], 13 --> 5`
*/


func greaterValues(_ arr: [Int], _ target: Int) -> Int {
  // YOUR WORK HERE
  return -1
}



/*
## Sorted and Rotated Array [Extra Credit]
*Given a array that is sorted and rotated, find out if a target value exists in the array.*

An sorted array is rotated by taking an unknown amount of values from the beginning and placing it at the end.

`[3, 4, 5, 1, 2]` is rotated left by 2.
`[99, 14, 25, 78, 93]` is rotated to the right by 1.

**Parameters**
Input: arr {Array}
Output: {Boolean}

**Constraints**
Time: O(logN)
Space: O(1)

**Examples**
`[35, 46, 79, 102, 1, 14, 29, 31], 46 --> true`
`[35, 46, 79, 102, 1, 14, 29, 31], 47 --> false`
`[7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 9 --> true`
*/

func rotatedArraySearch(_ nums: [Int], _ target: Int) -> Bool {
  // YOUR WORK HERE
  return false
}

func binarySearch(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Bool {
  // YOUR WORK HERE
  return false
}



/*
## Multiplication Using Russian Peasant [Extra Credit]

*Given two positive integers, return its product using Russian Peasant method of multiplication*

Read up on how to apply the Russian Peasant method [here](https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication). It is also referred to as the Egyptian multiplication.

**Parameters**
Input: a {Integer}
Input: b {Integer}
Output: {Integer}

**Constraints**
Assume a <= b, and the value of a is N.

Time: O(logN)
Space: O(1)

**Examples**
`487, 734 --> 357458`
`846, 908--> 768168`
*/

func multiplicationRussianPeasant(_ a: Int, _ b: Int) -> Int {
  // YOUR WORK HERE
  return -1
}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}

var testCount: [Int] = [0, 0]


print("Number of Ones Tests")

assert(&testCount, "should return correct number of ones for array with zeroes and ones",  {
  let example:Int = numberOfOnes([0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1])
  return example == 8
})

assert(&testCount, "should return correct number of ones for array with all zeroes",  {
  let example:Int = numberOfOnes([0, 0, 0])
  return example == 0
})

assert(&testCount, "should return correct number of ones for array with all ones",  {
  let example:Int = numberOfOnes([1, 1, 1])
  return example == 3
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Closest Value Tests")

assert(&testCount, "should return correct closest value for number in the middle range",  {
  let example:Int = closestValue([1, 2, 3, 5, 5, 7, 9, 10, 11], 6)
  return example == 5
})

assert(&testCount, "should return closest value for highest number",  {
  let example:Int = closestValue([1, 2, 3], 8)
  return example == 3
})

assert(&testCount, "should return closest value for lowest number",  {
  let example:Int = closestValue([-2, -1, 0], -5)
  return example == -2
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Square Root Tests")

assert(&testCount, "should return correct square root for number < 10",  {
  let example:Double = squareRoot(4)
  return example == 2.0
})

assert(&testCount, "should return correct square root for number between 10 and 100",  {
  let example:Double = squareRoot(98)
  return example == 9.899495
})

assert(&testCount, "should return correct square root for number over 10,000",  {
  let example:Double = squareRoot(14856)
  return example == 121.885192
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Greater Values Tests")

assert(&testCount, "should return greater values for number in the middle of the array",  {
  let example:Int = greaterValues([1, 2, 3, 5, 5, 7, 9, 10, 11], 5)
  return example == 4
})

assert(&testCount, "should return 0 for number greater than largest in the array",  {
  let example:Int = greaterValues([1, 2, 3], 4)
  return example == 0
})

assert(&testCount, "should return greater values for number less than least in the array",  {
  let example:Int = greaterValues([1, 10, 22, 59, 67, 72, 100], -2)
  return example == 7
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Rotated Sorted Array Tests")

assert(&testCount, "returns true when target is in the array",  {
  let example:Bool = rotatedArraySearch([35, 46, 79, 102, 1, 14, 29, 31], 46)
  return example == true
})

assert(&testCount, "returns false when target is not in the array",  {
  let example:Bool = rotatedArraySearch([35, 46, 79, 102, 1, 14, 29, 31], 47)
  return example == false
})

assert(&testCount, "returns true when target is the first number in the array",  {
  let example:Bool = rotatedArraySearch([7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 7)
  return example == true
})

assert(&testCount, "returns true when target is the last number in the array",  {
  let example:Bool = rotatedArraySearch([7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 6)
  return example == true
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Multiplication Russian Peasant Tests")

assert(&testCount, "returns correct value for two integers", {
  let example:Int = multiplicationRussianPeasant(487,734)
  return example == 357458
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]
