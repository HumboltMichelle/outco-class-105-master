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

import java.util.*;

class ComplexityHW {

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
  Input: arr {Array of Integers}
  Input: target {Integer}
  Output: {Integer}

  Examples
  [1, 2, 3, 4, 5, 6], 5 --> 4
  [9, 83, 74], 8 --> -1
  [6, 4, 7, 9, 7, 8, 2, 4, 3], 7 --> 2

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int indexOf(int[] arr, int target) {
    for (int i = 0; i < arr.length; i++) {
      if(arr[i] == target) {
        return i;
      }
    }
    return -1;
  }


  /*  Evens

  Given an array of integers, return an array of only the even values.

  Parameters
  Input: arr {Array of Integers}
  Output: {ArrayList of Integers}

  Examples
  [1, 2, 3, 4, 5, 6] --> [2, 4, 6]
  [9, 83, 74] --> [74]
  [6, 4, 7, 9, 7, 8, 2, 4, 3] --> [6, 4, 8, 2, 4]

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static ArrayList<Integer> evens(int [] arr) {
    ArrayList<Integer> results = new ArrayList<>();
    for (int value : arr) {
      if (value % 2 == 0) {
        results.add(value);
      }
    }
    return results;
  }


  /*  Sum

  Given an array of integers, return the sum of all the integers.

  Parameters
  Input: arr {Array of Integers}
  Output: {Integer}

  Examples
  [1, 2, 3, 4, 5] --> 15
  [0, 1, -1] --> 0
  [] --> 0

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int sum(int[] arr) {
    int total = 0;
    for (int value : arr) {
      total = total + value;
    }
    return total;
  }


  /*  Merge Arrays

  Given two sorted arrays of integers, return a merged sorted array of both inputs.

  Parameters
  Input: arr1 {Array of Integers}
  Input: arr2 {Array of Integers}
  Output: {Array of Integers}

  Examples
  [1, 3, 9], [2, 4, 8] --> [1, 2, 3, 4, 8, 9]
  [12, 25, 40], [20, 37, 45] --> [12, 20, 25, 37, 40, 45]
  [10, 13, 24], [12, 35] --> [10, 12, 13, 24, 35]

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int[] merge(int[] arr1, int[] arr2) {
    int totalElements = arr1.length + arr2.length;
    int [] result = new int[arr1.length + arr2.length];
    int i = 0;
    int j = 0;
    int k = 0;
    while(i + j < totalElements) {
      if(j >= arr2.length || (i < arr1.length && arr1[i] <= arr2[j])) {
        result[k] = arr1[i];
        i++;
      } else {
        result[k] = arr2[j];
        j++;
      }
      k++;
    }
    return result;
  }


  /*  Binary Search

  Given a sorted array and a target value, use binary search to return the index of the target in the input array.
  Return -1 if no such target is found.

  Parameters
  Input: arr {Array of Integers}
  Input: val {Integer}
  Output: {Integer}

  Examples
  [1, 3, 4, 5, 8, 9], 5 --> 3
  [5, 7, 10, 12, 14], 7 --> 1
  [2, 4, 8, 9, 15], 3 --> -1

  Time Complexity:
  Auxiliary Space Complexity:

  */
  public static int binarySearch(int[] arr, int val) {
    int low = 0;
    int high = arr.length - 1;
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
  Input: n {Integer}
  Output: {Integer}

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
    if (arr.length >= 2) {
      result = arr[0] * arr[arr.length - 1];
    }
    return result;
  }


  /*  Most Frequent Occurrence
   *
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static char mostFrequentOccurrence(String str) {
    String lowerString = str.toLowerCase();
    Map<Character, Integer> letters = new HashMap<>();
    char mostFrequent = str.charAt(0);
    char currentChar;
    int maxCount = 0;

    for (int i = 0; i < lowerString.length(); i++) {
      currentChar = lowerString.charAt(i);
      if (letters.get(currentChar) != null) {
        letters.put(currentChar, letters.get(currentChar)+1);
      } else {
        letters.put(currentChar, 1);
      }
    }

    for (Character key : letters.keySet()) {
      if (letters.get(key) > maxCount) {
        mostFrequent = key;
        maxCount = letters.get(key);
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
   for (int i = 0; i < arr.length; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        System.out.println(arr[i] + "," + arr[j]);
      }
    }
  }


  /**
   *  Make Combined Matrix
   *  Time Complexity:
   *  Auxiliary Space Complexity:
   */
  public static int[][] makeCombinedMatrix(int[] arr1, int[] arr2) {
    int[][] result = new int[arr1.length][arr2.length];

    for (int i = 0; i < arr1.length; i++) {
      for (int j = 0; j < arr2.length; j++) {
        result[i][j] = arr1[i] + arr2[j];
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

    System.out.println(Arrays.toString(result));

    for(int i = 2; i < n+1; i++) {
      result[i] = result[i-1] + result[i-2];
    }
    return result[n];
  }


/* Nth Fibonacci - the return
 *
 *  Time Complexity:
 *  Auxiliary Space Complexity:
 */
  private static HashMap<Integer, Integer> fibCache = new HashMap<>();

  public static int NthFib(int n) {
    return searchFib(n);
  }

  private static int searchFib(int index) {
    int solution;

    if (index < 2) {
      return index;
    }

    if (fibCache.get(index) != null) {
      return fibCache.get(index);
    }

    solution = searchFib(index-1) + searchFib(index-2);
    fibCache.put(index, solution);
    return solution;
  }

  public static void main(String[] args) {
    // Use main method to test any function in this HW you want to
  }

}
