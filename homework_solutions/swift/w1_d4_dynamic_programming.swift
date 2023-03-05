/*
 *  Homework - Dynamic Programming - Moving Window
 *
 *  Problem 1: Max Consecutive Sum
 *
 *  Prompt:    Given an array of integers find the sum of consecutive
 *             values in the array that produces the maximum value.
 *
 *  Input:     Unsorted array of positive and negative integers
 *  Output:    Integer (max consecutive sum)
 *
 *  Example:   input = [6, -1, 3, 5, -10]
 *             output = 13 (6 + -1 + 3 + 5 = 13)
 *
 *  Time Complexity: O(N)
 *  Auxiliary Space Complexity: O(1)
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
func maxConsecutiveSum(_ arr: [Int]) -> Int {
  if arr.count == 0 { return 0 }
  var localMax = arr[0]
  var ultimateMax = arr[0]

  for i in 1..<arr.count {
    localMax = max(localMax + arr[i], arr[i])
    ultimateMax = max(localMax, ultimateMax)
  }

  return ultimateMax
}



/*
 *  2. Given an array of binary values (0 and 1) and N number of flips (convert
 *     a 0 to a 1), determine the maximum number of consecutive 1's that can be
 *     made.
 *
 *  Input: An Array of 1's and 0's, and an Integer N denoting the number of
 *         flips
 *  Output: Integer
 *
 *  Example: bitFlip([0,1,1,1,0,1,0,1,0,0], 2)
 *  Result: 7
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)
func bitFlip(_ arr: [Int], _ n: Int) -> Int {
  var n = n
  var max = 0
  var start = 0
  var end = 0
  while end < arr.count {
    if arr[end] == 0 {
      n -= 1
    }
    end += 1
    while n < 0 {
      if arr[start] == 0 {
        n += 1
      }
      start += 1
    }
    max = Swift.max(max, end - start)
  }
  return max
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

print("maxConsecutiveSum Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should work on example input",  {
  let example = maxConsecutiveSum([6,-1,3,5,-10])
  return example == 13
})

assert(&testCount, "should work on a single-element input",  {
  let example = maxConsecutiveSum([5])
  return example == 5
})

assert(&testCount, "should return 0 for empty input",  {
  let example = maxConsecutiveSum([])
  return example == 0
})

assert(&testCount, "should work on longer input",  {
  let example = maxConsecutiveSum([-2, 1, -3, 4, -1, 2, 1, -5, 4])
  return example == 6
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("Bit Flip Tests")
testCount = [0,0]

assert(&testCount, "should handle example case",  {
  let example = bitFlip([0,1,1,1,0,1,0,1,0,0], 2)
  return example == 7
})

assert(&testCount, "should handle smaller edge case where flip is allowed",  {
  let example = bitFlip([0], 1)
  return example == 1
})

assert(&testCount, "should handle smaller edge case where flip is not allowed",  {
  let example = bitFlip([0], 0)
  return example == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
