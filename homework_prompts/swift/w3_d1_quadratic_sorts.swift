/**
 *  Homework - Quadratic Sorts
 *
 *  Problem 1: Insertion Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array sorted
 *             using insertion sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     arr: [Int]
 *  Output:    sorted arr
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 2: Selection Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using selection sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     arr: [Int]
 *  Output:    sorted arr
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 3: Bubble Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using bubble sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     arr: [Int]
 *  Output:    sorted arr
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

import Darwin


// Time Complexity:
// Auxiliary Space Complexity:
func insertionSort(_ input: inout [Int]) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}


// Time Complexity:
// Auxiliary Space Complexity:
func selectionSort(_ input: inout [Int]) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
}



// Time Complexity:
// Auxiliary Space Complexity:
func bubbleSort(_ input: inout [Int]) -> [Int] {
  // YOUR WORK HERE
  return [Int]()
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

print("Insertion Sort Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = insertionSort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = insertionSort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = insertionSort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int(arc4random_uniform(1000)))
  }
  var arr2 = arr
  let test = insertionSort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("Selection Sort Tests")
testCount = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = selectionSort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = selectionSort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = selectionSort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int(arc4random_uniform(1000)))
  }
  var arr2 = arr
  let test = selectionSort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");


print("Bubble Sort Tests")
testCount = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = bubbleSort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = bubbleSort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = bubbleSort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int(arc4random_uniform(1000)))
  }
  var arr2 = arr
  let test = bubbleSort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
