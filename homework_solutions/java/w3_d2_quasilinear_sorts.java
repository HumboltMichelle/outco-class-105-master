/*
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

import java.util.*;

// Worst Time Complexity: O(N * log(N))
// Worst Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Average Time Complexity: O(N * log(N))
// Average Total (Call Stack + Auxiliary) Space Complexity: O(N)
// Stability: Stable
class Mergesort{
  public static int[] compute(int[] input) {
    if (input.length < 2) {
      return input;
    }
    int mid = input.length / 2;
    int[] leftArray = new int[mid];
    int[] rightArray = new int[input.length - mid];
    System.arraycopy(input, 0, leftArray, 0, leftArray.length);
    System.arraycopy(input, mid, rightArray, 0, rightArray.length);
    return merge(compute(leftArray), compute(rightArray));
  }

  private static int[] merge(int[] array1, int[] array2){
    int[] result = new int[array1.length + array2.length];

    for (int i = 0, j = 0; i + j < result.length;) {
      if (j >= array2.length || (i < array1.length && array1[i] < array2[j])) {
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

// use the Main class to run the test cases
class MergesortTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("Merge Sort Tests");

    // tests are in the form as shown
    assertTest(testCount, "should sort example input", () ->
            arraysEqual(Mergesort.compute(new int[]{3, 9, 1, 4, 7}), new int[]{1, 3, 4, 7, 9}));

    assertTest(testCount, "should return empty array for empty input", () ->
            arraysEqual(Mergesort.compute(new int[]{}), new int[]{}));

    assertTest(testCount, "should sort single-element input", () ->
            arraysEqual(Mergesort.compute(new int[]{10}), new int[]{10}));

    assertTest(testCount, "should sort moderate-sized input", () -> {
      int[] input = new int[1000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000);
      }
      int[] solution = new int[1000];
      System.arraycopy(input, 0, solution, 0, input.length);
      input = Mergesort.compute(input);
      Arrays.sort(solution);
      return arraysEqual(input, solution);
    });

    assertTest(testCount, "should sort large-sized input", () -> {
      int[] input = new int[1000000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000000);
      }
      int[] solution = new int[1000000];
      System.arraycopy(input, 0, solution, 0, input.length);
      input = Mergesort.compute(input);
      Arrays.sort(solution);
      return arraysEqual(input, solution);
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }

  // function for checking if arrays are equal
  private static boolean arraysEqual(int[] arr1, int[] arr2) {
    if (arr1.length != arr2.length) {
      return false;
    }

    for (int i = 0 ; i < arr1.length ; i++) {
      if (arr1[i] != arr2[i]) {
        return false;
      }
    }

    return true;
  }


  // do not edit below, this is to wrap the test and check for exceptions
  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) {}
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
