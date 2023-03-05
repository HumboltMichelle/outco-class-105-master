/**
 *  Homework - Quasilinear Sorts
 *
 *
 *  Problem 1: Mergesort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using mergesort.
 *
 *  Input:     {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

using System;
using System.Linq;


// Worst Time Complexity: O(N * log(N))
// Worst Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Average Time Complexity: O(N * log(N))
// Average Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Stability: Stable
class Mergesort{
  public static int[] compute(int[] input) {
    if (input.Length < 2) {
      return input;
    }
    int mid = input.Length / 2;
    int[] leftArray = new int[mid];
    int[] rightArray = new int[input.Length - mid];
    Array.Copy(input, 0, leftArray, 0, leftArray.Length);
    Array.Copy(input, mid, rightArray, 0, rightArray.Length);
    return merge(compute(leftArray), compute(rightArray));
  }

  private static int[] merge(int[] array1, int[] array2){
    int[] result = new int[array1.Length + array2.Length];

    for (int i = 0, j = 0; i + j < result.Length;) {
      if (j >= array2.Length || (i < array1.Length && array1[i] < array2[j])) {
        result[i + j] = array1[i];
        i++;
      } else {
        result[i + j] = array2[j];
        j++;
      }
    }
    return result;
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    int[] testCount = {0, 0};
    Console.WriteLine("Merge Sort Tests");
    runTest(sortTest1, "should sort example input", testCount);
    runTest(sortTest2, "should return empty array for empty input", testCount);
    runTest(sortTest3, "should sort single-element input", testCount);
    runTest(sortTest4, "should sort moderate-sized input", testCount);
    runTest(sortTest5, "should sort large-sized input", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
	}

  private static bool sortTest1() {
    return Mergesort.compute(new int[]{3, 9, 1, 4, 7}).SequenceEqual(new int[]{1, 3, 4, 7, 9});
  }

  private static bool sortTest2() {
    return Mergesort.compute(new int[]{}).SequenceEqual(new int[]{});
  }

  private static bool sortTest3() {
    return Mergesort.compute(new int[]{10}).SequenceEqual(new int[]{10});
  }

  private static bool sortTest4() {
    int[] input = new int[1000];
    int[] solution = new int[1000];
    int randNum;
    Random rand = new Random();
    for (int i = 0 ; i < input.Length ; i++) {
      randNum = rand.Next(0, 1000);
      input[i] =  randNum;
      solution[i] =  randNum;
    }
    input = Mergesort.compute(input);
    Array.Sort(solution);
    return isSorted(input) && input.SequenceEqual(solution);
  }

  private static bool sortTest5() {
    int[] input = new int[1000000];
    int[] solution = new int[1000000];
    int randNum;
    Random rand = new Random();
    for (int i = 0 ; i < input.Length ; i++) {
      randNum = rand.Next(0, 1000000);
      input[i] =  randNum;
      solution[i] =  randNum;
    }
    input = Mergesort.compute(input);
    Array.Sort(solution);
    return isSorted(input) && input.SequenceEqual(solution);
  }


  // checks if array is sorted in linear time
  private static bool isSorted(int[] input) {
      for (int i = 1 ; i < input.Length ; i++) {
          if (input[i-1] > input[i]) {
              return false;
          }
      }
      return true;
  }

  private static void runTest(Func<bool> test, string testName, int[] testCount){
      testCount[1]++;
      bool testPassed = false;
      // Attempt to run test and suppress exceptions on failure
      try {
          testPassed = test();
          if(testPassed) testCount[0]++;
      } catch {}
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
}
