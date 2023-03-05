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

package main
import (
  "fmt"
)


/*  Order of Magnitude

Reduce the following into it's Big-O order of magnitude.

1. 5 + N                    Answer:  N
2. N + N^2                  Answer:  N^2
3. 15N + 13N                Answer:  N
4. 10000                    Answer:  1
5. log(N) + 1               Answer:  log(N)
6. log(N) * 3 + 14N + 3     Answer:  N
7. Nlog(N) + 3N^2           Answer:  N^2
8. N^3 + log(N^4)           Answer:  N^3
9. N! + 180000N^2           Answer:  N!
10. 15002^N                 Answer:  15002^N
*/



/*  Index Of

Given an array of integers and a target value, return the index of the first
element that matches the target value. If there are no matches, return -1.

Parameters
Input: arr {Array of ints}
Input: target {int}
Output: {int}

Examples
[1, 2, 3, 4, 5, 6], 5 --> 4
[9, 83, 74], 8 --> -1
[6, 4, 7, 9, 7, 8, 2, 4, 3], 7 --> 2

Time Complexity: O(N)
Auxiliary Space Complexity: 0(1)

*/
func indexOf(arr []int, target int) int {
  for i := 0; i < len(arr); i++ {
    if arr[i] == target {
      return i
    }
  }
  return -1
}


/*  Evens

Given an array of integers, return an array of only the even values.

Parameters
Input: arr {Array of ints}
Output: {List of ints}

Examples
[1, 2, 3, 4, 5, 6] --> [2, 4, 6]
[9, 83, 74] --> [74]
[6, 4, 7, 9, 7, 8, 2, 4, 3] --> [6, 4, 8, 2, 4]

Time Complexity: O(N)
Auxiliary Space Complexity: 0(N)

*/
func evens(arr []int) []int {
  var results []int
  for i := 0; i < len(arr); i++ {
    if arr[i] % 2 == 0 {
      results = append(results, arr[i])
    }
  }
  return results
}


/*  Sum

Given an array of integers, return the sum of all the integers.

Parameters
Input: arr {Array of ints}
Output: {int}

Examples
[1, 2, 3, 4, 5] --> 15
[0, 1, -1] --> 0
[] --> 0

Time Complexity: O(N)
Auxiliary Space Complexity: 0(1)

*/
func sum(arr []int) int {
  total := 0
  for i := 0; i < len(arr); i++ {
    total = total + arr[i]
  }
  return total
}


/*  Merge Arrays

Given two sorted arrays of integers, return a merged sorted array of both inputs.

Parameters
Input: arr1 {Array of ints}
Input: arr2 {Array of ints}
Output: {Array of ints}

Examples
[1, 3, 9], [2, 4, 8] --> [1, 2, 3, 4, 8, 9]
[12, 25, 40], [20, 37, 45] --> [12, 20, 25, 37, 40, 45]
[10, 13, 24], [12, 35] --> [10, 12, 13, 24, 35]

Time Complexity: O(N+M)
Auxiliary Space Complexity: 0(N+M)

*/
func merge(arr1 []int, arr2 []int) []int {
  totalElements := len(arr1) + len(arr2)
  result := make([]int, totalElements)
  i,j,k := 0,0,0
  for i + j < totalElements {
    if j >= len(arr2) || (i < len(arr1) && arr1[i] <= arr2[j]) {
      result[k] = arr1[i]
      i++
      k++
    } else {
      result[k] = arr2[j]
      j++
      k++
    }
  }
  return result
}


/*  Binary Search

Given a sorted array and a target value, use binary search to return the index of the target in the input array.
Return -1 if no such target is found.

Parameters
Input: arr {Array of ints}
Input: val {int}
Output: {int}

Examples
[1, 3, 4, 5, 8, 9], 5 --> 3
[5, 7, 10, 12, 14], 7 --> 1
[2, 4, 8, 9, 15], 3 --> -1

Time Complexity: O(log(N))
Auxiliary Space Complexity: 0(1)

*/
func binarySearch(arr []int, val int) int {
  low := 0
  high := len(arr) - 1
  var mid int
  for low <= high {
    mid = (low + high) / 2
    if arr[mid] > val {
      high = mid - 1
    } else if arr[mid] < val {
      low = mid + 1
    } else {
      return mid
    }
  }
  return -1
}


/*  Factorial

Given an input integer n, return the n factorial value.

Parameters
Input: n {int}
Output: {int}

Examples
5  --> 120 (5 * 4 * 3 * 2 * 1)
1 --> 1 (1)
9 --> 362880 (9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)

Time Complexity: O(N)
Auxiliary Space Complexity: 0(N)

*/
func factorial(n int) int {
  if n <= 1 {
    return 1
  }
  return n * factorial(n - 1)
}


/*  First Times Last
*
*  Time Complexity: O(1)
*  Auxiliary Space Complexity: O(1)
*/
func firstTimesLast(arr []int) int {
  result := 0
  if len(arr) < 2 {
    return result
  } else {
    result = arr[0] * arr[len(arr)-1]
    return result
  }
}


/*  Most Frequent Occurrence
 *
 *  Time Complexity: O(N)
 *  Auxiliary Space Complexity: O(1)
 */
func mostFrequentOccurrence(str string) byte {
  letters := make(map[byte]int)
  var mostFrequent byte = str[0]
  var currentChar byte
  maxCount := 0

  for i := 0; i < len(str); i++ {
    currentChar = str[i]
    letters[currentChar]++
  }
  for key,count := range letters {
    if (count > maxCount) {
      mostFrequent = key
      maxCount = count
    }
  }

  return mostFrequent
}


/* Print Unordered Pairs
 *
 *  Time Complexity: O(N^2)
 *  Auxiliary Space Complexity: O(1)
 */
func printUnorderedPairs(arr []int) {
 for i := 0; i < len(arr); i++ {
    for j := i + 1; j < len(arr); j++ {
      fmt.Println(string(arr[i]) + "," + string(arr[j]))
    }
  }
}


/**
 *  Make Combined Matrix
 *  Time Complexity: O(MN)
 *  Auxiliary Space Complexity: O(MN)
 */
func makeCombinedMatrix(arr1 []int, arr2 []int) [][]int {
  result := make([][]int, len(arr1))

  for i := 0; i < len(arr1); i++ {
    result[i] = make([]int, len(arr2))
    for j := 0; j < len(arr2); j++ {
      result[i][j] = arr1[i] + arr2[j]
    }
  }
  return result
}

/**
 *  Nth Fibonacci
 *
 *  Time Complexity: O(N)
 *  Auxiliary Space Complexity: O(N)
 */
func nthFibonacci(n int) int {
  if n < 2 { return n }

  result := make([]int, n+1)
  result[0] = 0
  result[1] = 1

  for i := 2; i < n+1; i++ {
    result[i] = result[i-1] + result[i-2]
  }
  return result[n]
}


/* Nth Fibonacci - the return
*
*  Time Complexity: O(N)
*  Auxiliary Space Complexity: O(N)
*/

var cache map[int]int = make(map[int]int)
var result int

func searchFib(index int) int {
 var solution int
 if index < 2 { return index }
 if cacheResult, ok := cache[index]; ok {
  return cacheResult
 }
 solution = searchFib(index-1) + searchFib(index-2)
 cache[index] = solution
 return solution
}

func nthFibonnaci(n int) int {
 result = 0
 result = searchFib(n)
 return result
}


func main() {

}
