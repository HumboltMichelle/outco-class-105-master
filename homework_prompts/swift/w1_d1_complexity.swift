/*
 *  Homework - Complexity
 *
 *  For the following functions, write the expected Time and Auxiliary Space
 *  Complexity using what you know about nested loops, hash table look-ups and
 *  the runtime of built in functions.
 *
 *  NOTE: You don't need to code to anything for these problems, just write
 *  what you the complexity to be using big-O notation
 **/

/**
Order of Magnitude

Reduce the following into it's Big-O order of magnitude.


1. 5 + N                    Answer:
2. N + N^2                  Answer:
3. 15N + 13N                Answer:
4. 10000                    Answer:
5. log(N) + 1               Answer:
6. log(N) * 3 + 14N + 3     Answer:
7. Nlog(N) + 3N^2           Answer:
8. N^3 + log(N^4)           Answer:
9. N! + 180000N^2           Answer:
10. 15002^N                 Answer:
**/


//
//     Index Of
//
//     Given an array of integers and a target value, return the index of the first
//     element that matches the target value. If there are no matches, return -1.
//
//     Parameters
//     Input: arr {Array of Integers}
//     Input: target {Integer}
//     Output: {Integer}
//
//     Examples
//     [1, 2, 3, 4, 5, 6], 5 --> 4
//     [9, 83, 74], 8 --> -1
//     [6, 4, 7, 9, 7, 8, 2, 4, 3], 7 --> 2
//
//
// Time Complexity:
// Auxiliary Space Complexity:


func indexOf(_ arr: [Int], _ target: Int) -> Int {
  for i in 0..<arr.count {
    if(arr[i] == target) {
      return i
    }
  }
  return -1
}

// test
// print(indexOf([1, 2, 3, 4, 5, 6], 4))


//     Evens
//
//     Given an array of integers, return an array of only the even values.
//
//     Parameters
//     Input: arr {Array of Integers}
//     Output: {Array of Integers}
//
//     Examples
//     [1, 2, 3, 4, 5, 6] --> [2, 4, 6]
//     [9, 83, 74] --> [74]
//     [6, 4, 7, 9, 7, 8, 2, 4, 3] --> [6, 4, 8, 2, 4]
// Time Complexity:
// Auxiliary Space Complexity:


func evens (_ arr: [Int]) -> [Int] {
  var results: [Int] = []
  for i in 0..<arr.count {
    if arr[i] % 2 == 0 {
      results.append(arr[i])
    }
  }
  return results
}

// test
// print(evens([1, 2, 3, 4, 5, 6]))

// test
// print(split("hello"))


//    Sum
//
//    Given an array of integers, return the sum of all the integers.
//
//    Parameters
//    Input: arr {Array of Integers}
//    Output: {Integer}
//
//    Examples
//    [1, 2, 3, 4, 5] --> 15
//    [0, 1, -1] --> 0
//    [] --> 0
// Time Complexity:
// Auxiliary Space Complexity:

func sum(_ arr: [Int]) -> Int {
  var total = 0
  for i in 0..<arr.count {
    total += arr[i]
  }
  return total
}

// test
// print(sum([1, 2, 3, 4, 5]))


//   Merge Arrays
//
//   Given two sorted arrays of integers, return a merged sorted array of both inputs.
//
//   Parameters
//   Input: arr1 {Array of Integers}
//   Input: arr2 {Array of Integers}
//   Output: {Array of Integers}
//
//   Examples
//   [1, 3, 9], [2, 4, 8] --> [1, 2, 3, 4, 8, 9]
//   [12, 25, 40], [20, 37, 45] --> [12, 20, 25, 37, 40, 45]
//   [10, 13, 24], [12, 35] --> [10, 12, 13, 24, 35]
// Time Complexity:
// Auxiliary Space Complexity:

func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int]{
  let totalElements = arr1.count + arr2.count
  var result:[Int] = []
  var i = 0
  var j = 0

  while(i + j < totalElements) {
    if(j >= arr2.count || i < arr1.count && arr1[i] <= arr2[j]) {
      result.append(arr1[i])
      i += 1
    } else {
      result.append(arr2[j])
      j += 1
    }
  }
  return result
}

// test
// print(merge([1, 3, 9], [2, 4, 8]))


// #    Binary Search
// #
// #    Given a sorted array and a target value, use binary search to return the index of the target in the input array.
// #    Return -1 if no such target is found.
// #
// #    Parameters
// #    Input: arr {Array of Integers}
// #    Input: val {Integer}
// #    Output: {Integer}
// #
// #    Examples
// #    [1, 3, 4, 5, 8, 9], 5 --> 3
// #    [5, 7, 10, 12, 14], 7 --> 1
// #    [2, 4, 8, 9, 15], 3 --> -1
//
// Time Complexity:
// Auxiliary Space Complexity:


func binarySearch(_ arr: [Int], _ val: Int) -> Int {
  var low: Int = 0
  var high: Int = arr.count - 1
  var mid: Int

  while(low <= high) {
    mid = ((low + high) / 2)
    if(arr[mid] > val) {
      high = mid - 1
    }
    else if (arr[mid] < val) {
      low = mid + 1
    }
    else {
      return mid
    }
  }
  return -1
}

// test
// print(binarySearch([1, 3, 4, 5, 8, 9], 5))


// #    Factorial
// #
// #    Given an input integer n, return the n factorial value.
// #
// #    Parameters
// #    Input: n {Integer}
// #    Output: {Integer}
// #
// #   Examples
// #   5  --> 120 (5 * 4 * 3 * 2 * 1)
// #   1 --> 1 (1)
// #   9 --> 362880 (9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)
//
// Time Complexity:
// Auxiliary Space Complexity:


func factorial(_ n: Int) -> Int {
  if(n <= 1) {
    return 1
  }
  return n * factorial(n - 1)
}

// test
// print(factorial(10))

/**
 *
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func firstTimesLast(_ arr: [Int]) -> Int? {
  if arr.count < 2 {
    return nil
  }
  return arr[0] * arr[arr.count - 1]
}


/**
 *
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func mostFrequentOccurrence(_ str: String) -> Character {
    var letters: [Character: Int] = [:]
    var maxOccurence: Int = 0
    var maxChar: Character = " "

    for char in str.characters {
      if letters[char] == nil {
        letters[char] = 1
      } else {
        letters[char]! += 1
      }
    }

    for (char, count) in letters {
      if (count > maxOccurence) {
        maxOccurence = count
        maxChar = char
      }
    }

    return maxChar
}


/**
 *
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func printUnorderedPairs(_ arr: [Int]) {
 for i in 0..<arr.count {
 for j in (i+1)..<arr.count {
      print(String(arr[i]) + ", " + String(arr[j]));
    }
  }
}


/**
 *
 * Make Combined Matrix
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func makeCombinedMatrix(_ arr1: [Int], _ arr2: [Int]) -> [[Int]] {
  var result = [[Int]]()
  var row: [Int]

  for num1 in arr1 {
    row = []
    for num2 in arr2 {
      row.append(num1 + num2)
    }
    result.append(row)
  }
  return result
}

/**
 * Nth Fibonacci
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func nthFibonacci(_ n: Int) -> Int {
  if n < 2 {
    return n
  }
  var result: [Int] = [0, 1]
  for i in 2...n {
    result.append(result[i - 1] + result[i - 2])
  }
  return result[n]
}


/**
 *  Nth Fibonacci - the return
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
func nthFibonacciMemo(_ n: Int) -> Int {
  var cache: [Int: Int] = [:]

  func searchFib(_ index: Int) -> Int {
    if index < 2 {
     return index
    }
    cache[index] = cache[index] != nil ? cache[index]! : searchFib(index - 1) + searchFib(index - 2)
    return cache[index]!
  }

  return searchFib(n)
}
