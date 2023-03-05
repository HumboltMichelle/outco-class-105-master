/*
 *  Target Practice - Sorting
 *
 *  Problem 1: Quicksort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using quicksort.
 *
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

using System;
using System.Linq;
using System.Collections.Generic;

 // Worse Time Complexity: O(N^2)
 // Worse Auxiliary Space Complexity: O(N)
 // Average Time Complexity: O(Nlog(N))
 // Average Auxiliary Space Complexity: O(log(N))
 class Quicksort {

   public static int[] compute(int[] input) {
     divide(input, 0, input.Length - 1);
     return input;
   }

   private static void divide(int[] input, int begin, int end) {
     int mid = begin;

     if (begin >= end) {
       return;
     }
     for(int i = begin; i < end; i++){
       if(input[i] < input[end]){
         swap(input, mid, i);
         mid++;
       }
     }

     swap(input, mid, end);
     divide(input, begin, mid - 1);
     divide(input, mid + 1, end);
   }

   private static void swap(int[] arr, int i, int j){
     int temp = arr[i];
     arr[i] = arr[j];
     arr[j] = temp;
    }
 }



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    int[] testCount = {0, 0};
    Console.WriteLine("Quick Sort Tests");
    runTest(sortTest1, "should sort example input", testCount);
    runTest(sortTest2, "should return empty array for empty input", testCount);
    runTest(sortTest3, "should sort single-element input", testCount);
    runTest(sortTest4, "should sort moderate-sized input", testCount);
    runTest(sortTest5, "should sort large-sized input", testCount);
    printTestsPassed(testCount);
	}

  private static bool sortTest1() {
    return Quicksort.compute(new int[]{3, 9, 1, 4, 7}).SequenceEqual(new int[]{1, 3, 4, 7, 9});
  }

  private static bool sortTest2() {
    return Quicksort.compute(new int[]{}).SequenceEqual(new int[]{});
  }

  private static bool sortTest3() {
    return Quicksort.compute(new int[]{10}).SequenceEqual(new int[]{10});
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
    input = Quicksort.compute(input);
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
    input = Quicksort.compute(input);
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


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a boolean
  //   indicating if test passed
  // string name : describes the test
  // int[] testCount : keeps track out how many tests pass and how many total
  //   in the form of a two item array i.e., [0, 0]
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
  // this is to print the number of test cases passed for a test suite function
  private static void printTestsPassed(int[] testCount) {
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }
}
