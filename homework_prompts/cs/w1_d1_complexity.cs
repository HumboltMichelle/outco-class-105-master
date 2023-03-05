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

using System;
using System.Collections.Generic;

class Complexity {
  public static void Main() {
  }

  /*  Order of Magnitude

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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int indexOf(int[] arr, int target) {
    for (int i = 0; i < arr.Length; i++) {
      if(arr[i] == target) {
        return i;
      }
    }
    return -1;
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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static List<int> evens(int[] arr) {
    List<int> results = new List<int>();
    for(int i = 0; i < arr.Length; i++) {
      if(arr[i] % 2 == 0) {
        results.Add(arr[i]);
      }
    }
    return results;
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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int sum(int[] arr) {
    int total = 0;
    for(int i = 0; i < arr.Length; i++) {
      total = total + arr[i];
    }
    return total;
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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int[] merge(int[] arr1, int[] arr2) {
    int totalElements = arr1.Length + arr2.Length;
    int [] result = new int[arr1.Length + arr2.Length];
    int i = 0;
    int j = 0;
    int k = 0;
    while(i + j < totalElements) {
      if(j >= arr2.Length || (i < arr1.Length && arr1[i] <= arr2[j])) {
        result[k] = arr1[i];
        i++;
        k++;
      } else {
        result[k] = arr2[j];
        j++;
        k++;
      }
    }
    return result;
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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int binarySearch(int[] arr, int val) {
    int low = 0;
    int high = arr.Length - 1;
    int mid;
    while(low <= high) {
      mid = (low + high) / 2;
      if(arr[mid] > val) {
        high = mid - 1;
      }
      else if (arr[mid] < val) {
        low = mid + 1;
      }
      else {
        return mid;
      }
    }
    return -1;
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

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int factorial(int n) {
    if(n <= 1) {
      return 1;
    }
    return n * factorial(n - 1);
  }


 /*  First Times Last
  *
  *  Time Complexity:
  *  Auxiliary Space Complexity:
  */
  public static int firstTimesLast(int[] arr) {
    int result = 0;
    if (arr.Length < 2) {
      return result;
    } else {
      result = arr[0] * arr[arr.Length-1];
      return result;
    }
  }


  /*  Most Frequent Occurrence
   *
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static char mostFrequentOccurrence(string str) {
    string lowerString = str.ToLower();
    Dictionary<char, int> letters = new Dictionary<char, int>();
    char mostFrequent = str[0];
    char currentChar;
    int maxCount = 0;

    for (int i = 0; i < lowerString.Length; i++) {
      currentChar = lowerString[i];
      if (letters.ContainsKey(currentChar)) {
        letters[currentChar] = 1;
      } else {
        letters[currentChar] = letters[currentChar]+1;
      }
    }

    foreach (char key in letters.Keys) {
      if (letters[key] > maxCount) {
        mostFrequent = key;
        maxCount = letters[key];
      }
    }

    return mostFrequent;
  }


  /* Print Unordered Pairs
   *
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static void printUnorderedPairs(int[] arr) {
   for (int i = 0; i < arr.Length; i++) {
      for (int j = i + 1; j < arr.Length; j++) {
        Console.WriteLine(arr[i] + "," + arr[j]);
      }
    }
  }


  /**
   *  Make Combined Matrix
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static int[,] makeCombinedMatrix(int[] arr1, int[] arr2) {
    int[,] result = new int[arr1.Length,arr2.Length];

    for (int i = 0; i < arr1.Length; i++) {
      for (int j = 0; j < arr2.Length; j++) {
        result[i,j] = arr1[i] + arr2[j];
      }
    }

    return result;
  }

  /**
   *  Nth Fibonacci
   *
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static int nthFibonacci(int n) {
    if(n < 2){ return n; }

    int[] result = new int[n+1];
    result[0] = 0;
    result[1] = 1;

    Console.WriteLine(result);

    for(int i = 2; i < n+1; i++) {
      result[i] = result[i-1] + result[i-2];
    }
    return result[n];
  }

}

/* Nth Fibonacci - the return
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
class NthFib {

  private static Dictionary<int, int> cache = new Dictionary<int, int>();
  private static int result;

  public static int compute(int n) {
    result = 0;

    result = searchFib(n);
    return result;
  }

  private static int searchFib(int index) {
    int solution;

    if (index < 2) {
      return index;
    }

    if (cache.ContainsKey(index)) {
      return cache[index];
    }

    solution = searchFib(index-1) + searchFib(index-2);
    cache[index] = solution;
    return solution;
  }

}
