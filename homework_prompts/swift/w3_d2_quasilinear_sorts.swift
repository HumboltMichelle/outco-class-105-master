/*
*  Homework - Quasilinear Sorts
*
*  Problem 1: Mergesort
*
*  Prompt:    Given an unsorted array of integers, return the array
*             sorted using mergesort.
*
*             What are the time and auxilliary space complexity?
*
*  Input:     An unsorted array of integers
*  Output:    A sorted array of integers
*
*  Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
*
*/

import Darwin


// Worse Time Complexity:
// Worse Auxiliary Space Complexity:
// Average Time Complexity:
// Average Auxiliary Space Complexity:
func mergesort(_ input: inout [Int]) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}


/**
 *  Problem 2: Bucket Sort
 *
 *  Prompt:    Given an unsorted array of numbers which are randomly distributed
 *             across the a range, sort the numbers using bucket sort.
 *
 *  Input:     arr: [Float]
 *  Input:     {Float} - minimum of range (inclusive)
 *  Input:     {Float} - maximum of range (exclusive)
 *
 *  Output:    {Array}
 *
 *  Example:   [0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434], 0.0, 1.0 -->
 *             [0.1234, 0.3434, 0.565, 0.656, 0.665, 0.897]
 *
 *  HINT:      Use either N buckets or square root of N buckets
 *             Recursively sort each bucket using bucketsort until the bucket
 *             size is less than 50.
 */


 // Time Complexity:
 // Auxiliary Space Complexity:
 func bucketsort(_ arr: [Float], _ min: Float, _ max: Float) -> [Float] {
   // YOUR WORK HERE
   return [Float]()
 }


 /*
  *
  *  Problem 3: Kth Smallest Element in a Range
  *
  *  Prompt:    Given an unsorted array of whole integers in the range
  *             1000 to 9000, find the Kth smallest element in linear time
  *             The array can have duplicates.
  *
  *  Input:     Unsorted array of whole integers in range of 1000 to 9000
  *             Kth smallest element you want to find
  *
  *  Output:    Kth smalest element in the range
  *
  *  Example:   array = [1984, 1337, 9000, 8304, 5150, 9000, 8304], k=5
  *             output = 8304
  *
  *  Notes:     What are the time and auxilliary space complexity?
  *
  */

 // Time Complexity:
 // Auxiliary Space Complexity:
 func kthSmallest(_ arr: [Int], _ k: Int) -> Int{
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

func arraysEqual(_ arr1: [Int], _ arr2: [Int]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}


print("Mergesort Sort Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = mergesort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = mergesort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = mergesort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int(arc4random_uniform(1000)))
  }
  var arr2 = arr
  let test = mergesort(&arr2)
  return arraysEqual(test, arr.sorted())
})

assert(&testCount, "should sort large input",  {
  var arr = [Int]()
  for _ in 1..<1000000 {
    arr.append(Int(arc4random_uniform(1000000)))
  }
  var arr2 = arr
  let test = mergesort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");

func arraysEqual(_ arr1: [Float], _ arr2: [Float]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}

print("Bucketsort Tests")
testCount = [0,0]

assert(&testCount, "should sort example input",  {
  let example = bucketsort([0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434], 0.0, 1.0)
  return arraysEqual(example, [0.1234, 0.3434, 0.565, 0.656, 0.665, 0.897])
})

assert(&testCount, "should return empty array for empty input",  {
  let example = bucketsort([Float](), 0.0, 1.0)
  return arraysEqual(example, [Float]())
})

assert(&testCount, "should sort single-element input",  {
  let example = bucketsort([0.5], 0.0, 1.0)
  return arraysEqual(example, [0.5])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Float]()
  for _ in 1..<1000 {
    arr.append(Float(arc4random_uniform(1000)) / 1000)
  }
  let arr2 = arr
  let test = bucketsort(arr2, 0.0, 1.0)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


print("Kth Smallest Element Tests")
testCount = [0,0]

assert(&testCount, "should return 8304 for sample input",  {
  let example = kthSmallest([1984, 1337, 9000, 8304, 5150, 9000, 8304], 5)
  return example == 8304
})

assert(&testCount, "should return 1337 for 1st smallest element with sample input array",  {
  let example = kthSmallest([1984, 1337, 9000, 8304, 5150, 9000, 8304], 1)
  return example == 1337
})

assert(&testCount, "should error out when asking for kth smallest when k exceeds size of input array",  {
  let example = kthSmallest([1984, 1337, 9000, 8304, 5150, 9000, 8304], 10)
  return example == -1
})

assert(&testCount, "should work for single-element array",  {
  let example = kthSmallest([8304], 1)
  return example == 8304
})

assert(&testCount, "should work for a large array",  {
  var testCase = [Int]()
  for _ in 1..<1000000 {
    testCase.append(Int(arc4random_uniform(8000)) + 1000)
  }
  let example = kthSmallest(testCase, 21875)
  testCase = testCase.sorted()
  return example == testCase[21874]
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
