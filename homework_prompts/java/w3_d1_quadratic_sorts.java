/*
 *  Homework - Quadratic Sorts
 *
 *  Problem 1: Insertion Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array sorted
 *             using insertion sort.
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 2: Selection Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using selection sort.
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 3: Bubble Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using bubble sort.
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

import java.util.*;

class BasicSort {

  // Time Complexity:
  // Auxiliary Space Complexity:
  public static int[] insertion(int[] input) {
    // YOUR WORK HERE
    return new int[0];
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  public static int[] selection(int[] input) {
    // YOUR WORK HERE
    return new int[0];
  }


  // Time Complexity:
  // Auxiliary Space Complexity:
  public static int[] bubble(int[] input) {
    // YOUR WORK HERE
    return new int[0];
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class BasicSortTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Insertion Sort Tests");

    // tests are in the form as shown
    assertTest(testCount, "should sort example input", () ->
            arraysEqual(BasicSort.insertion(new int[]{3, 9, 1, 4, 7}), new int[]{1, 3, 4, 7, 9}));

    assertTest(testCount, "should sort single-element input", () ->
            arraysEqual(BasicSort.insertion(new int[]{10}), new int[]{10}));

    assertTest(testCount, "should sort moderate-sized input", () -> {
      int[] input = new int[1000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000);
      }

      int[] solution = new int[1000];
      System.arraycopy(input, 0, solution, 0, input.length);
      BasicSort.insertion(input);

      Arrays.sort(solution);
      return isSorted(input) && arraysEqual(input, solution);
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Selection Sort Tests");

    assertTest(testCount, "should sort example input", () ->
            arraysEqual(BasicSort.selection(new int[]{3, 9, 1, 4, 7}), new int[]{1, 3, 4, 7, 9}));

    assertTest(testCount, "should sort single-element input", () ->
            arraysEqual(BasicSort.selection(new int[]{10}), new int[]{10}));

    assertTest(testCount, "should sort moderate-sized input", () -> {
      int[] input = new int[1000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000);
      }

      int[] solution = new int[1000];
      System.arraycopy(input, 0, solution, 0, input.length);
      BasicSort.selection(input);

      Arrays.sort(solution);
      return isSorted(input) && arraysEqual(input, solution);
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Bubble Sort Tests");

    // tests are in the form as shown
    assertTest(testCount, "should sort example input", () ->
            arraysEqual(BasicSort.bubble(new int[]{3, 9, 1, 4, 7}), new int[]{1, 3, 4, 7, 9}));

    assertTest(testCount, "should sort single-element input", () ->
            arraysEqual(BasicSort.bubble(new int[]{10}), new int[]{10}));

    assertTest(testCount, "should sort moderate-sized input", () -> {
      int[] input = new int[1000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000);
      }

      int[] solution = new int[1000];
      System.arraycopy(input, 0, solution, 0, input.length);
      BasicSort.bubble(input);

      Arrays.sort(solution);
      return isSorted(input) && arraysEqual(input, solution);
    });

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

  // checks if array is sorted in linear time
  private static boolean isSorted(int[] input) {
    if (input.length < 2) {
      return true;
    }

    for (int i = 1 ; i < input.length ; i++) {
      if (input[i-1] > input[i]) {
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
