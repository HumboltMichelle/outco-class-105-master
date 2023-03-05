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


// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
func insertionSort(_ input: inout [Int]) -> [Int] {
  var i = 1

  while i < input.count {
    let temp = input[i]
    var j = i

    while j > 0 && temp < input[j - 1] {
      input[j] = input[j - 1]
      j -= 1
    }

    input[j] = temp
    i += 1
  }
  return input
}


// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
func selectionSort(_ input: inout [Int]) -> [Int] {
  for i in 0..<input.count {
    var min = input[i]
    var minIndex = i
    for j in (i + 1)..<input.count {
      if input[j] < min {
        min = input[j]
        minIndex = j
      }
    }
    input[minIndex] = input[i]
    input[i] = min
  }
  return input;
}



// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
func bubbleSort(_ input: inout [Int]) -> [Int] {
  var endIndex = input.count - 1
  while endIndex > 0 {
    var swap = false
    for i in 0..<endIndex {
      if (input[i] > input[i + 1]) {
        (input[i], input[i + 1]) = (input[i + 1], input[i])
        swap = true
      }
    }
    if !swap { break }
    endIndex -= 1
  }
  return input
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
