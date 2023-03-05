/*
*  Target Practice - Sorting
*
*  Problem 1: Quicksort
*
*  Prompt:    Given an unsorted array of integers, return the array
*             sorted using quicksort.
*
*             What are the time and auxilliary space complexity?
*
*  Input:     An unsorted array of integers
*  Output:    A sorted array of integers
*
*  Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
*
*/


// Worse Time Complexity: O(N^2)
// Worse Auxiliary Space Complexity: O(N)
// Average Time Complexity: O(Nlog(N))
// Average Auxiliary Space Complexity: O(log(N))
func quicksort(_ input: inout [Int]) -> [Int] {
  func divide(start: Int, end: Int) {
    if start >= end { return }

    var mid = start
    let pivot = end
    for i in start..<end {
      if input[i] < input[pivot] {
        (input[i], input[mid]) = (input[mid], input[i])
        mid += 1
      }
    }
    (input[pivot], input[mid]) = (input[mid], input[pivot])
    divide(start: start, end: mid - 1)
    divide(start: mid + 1, end: end)
  }

  divide(start: 0, end: input.count - 1)
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

print("Quicksort Sort Tests")
var testCount: [Int] = [0,0]

assert(&testCount, "should sort [3,9,1,4,7]",  {
  var arr = [3,9,1,4,7]
  let test = quicksort(&arr)
  return arraysEqual(test, [1,3,4,7,9])
})

assert(&testCount, "should return empty array for empty input",  {
  var arr = [Int]()
  let test = quicksort(&arr)
  return arraysEqual(test, [])
})

assert(&testCount, "should sort single-element input",  {
  var arr = [10]
  let test = quicksort(&arr)
  return arraysEqual(test, [10])
})

assert(&testCount, "should sort moderate-sized input",  {
  var arr = [Int]()
  for _ in 1..<1000 {
    arr.append(Int.random(in: 0..<1000))
  }
  var arr2 = arr
  let test = quicksort(&arr2)
  return arraysEqual(test, arr.sorted())
})

assert(&testCount, "should sort large input",  {
  var arr = [Int]()
  for _ in 1..<1000000 {
    arr.append(Int.random(in: 0..<1000000))
  }
  var arr2 = arr
  let test = quicksort(&arr2)
  return arraysEqual(test, arr.sorted())
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n");
