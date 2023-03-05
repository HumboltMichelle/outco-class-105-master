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


// Worst Time Complexity:
// Worst Total (Call Stack + Auxiliary) Space Complexity:
// Average Time Complexity:
// Average Total (Call Stack + Auxiliary) Space Complexity:
// Stability:
class Mergesort{
  public static int[] compute(int[] input) {
    return new int[0];
  }

  private static int[] merge(int[] array1, int[] array2){
    // YOUR CODE HERE
    return new int[0];
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
