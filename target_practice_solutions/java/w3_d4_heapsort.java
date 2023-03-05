/*
 *  Target Practice - Heapsort
 *
 *  Problem 1: Implement Heapsort in-place.
 *
 *  NOTE: In-place means to manipulate the input array rather than create a
 *        new array.
 *
 *  Input:  {Array}
 *  Output: {Array}
 *
 *  Example: heapsort([4, 15, 16, 50, 8, 23, 42, 108])
 *           //[4, 8, 15, 16, 23, 42, 50, 108]
 */

 // Worse Time Complexity: O(Nlog(N))
 // Worse Auxiliary Space Complexity: O(1)
 // Average Time Complexity: O(Nlog(N))
 // Average Auxiliary Space Complexity: O(1)

import java.util.*;


class Heapsort {
  public static int[] compute(int[] arr) {
    for (int i = 1; i < arr.length; i++) {
      insert(arr, i);
    }
    for (int i = arr.length; i > 1; i--) {
      remove(arr, i);
    }
    return arr;
  }

  private static int getParent(int child) {
    return (child - 1) / 2;
  }

  private static int getChild(int parent, int[] arr, int heapLength) {
    int left = parent * 2 + 1;
    if (left >= heapLength - 1 || arr[left] >= arr[left + 1]) {
      return left;
    }
    return left + 1;
  }

  private static void bubbleUp(int[] arr, int heapLength) {
    int child = heapLength - 1;
    int parent = getParent(child);
    int temp;
    while (child > 0 && arr[parent] < arr[child]) {
      temp = arr[parent];
      arr[parent] = arr[child];
      arr[child] = temp;
      child = parent;
      parent = getParent(child);
    }
  }

  private static void bubbleDown(int[] arr, int heapLength) {
    int parent = 0;
    int child = getChild(parent, arr, heapLength);
    int temp;
    while (child < heapLength && arr[parent] < arr[child]) {
      temp = arr[parent];
      arr[parent] = arr[child];
      arr[child] = temp;
      parent = child;
      child = getChild(parent, arr, heapLength);
    }
  }

  private static void insert(int[] arr, int heapLength) {
    bubbleUp(arr, heapLength + 1);
  }

  private static void remove(int[] arr, int heapLength) {
    int temp = arr[0];
    arr[0] = arr[heapLength - 1];
    arr[heapLength - 1] = temp;
    bubbleDown(arr, heapLength - 1);
  }
}





////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class HeapsortTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("Heapsort Tests");

    assertTest(testCount, "should sort example input", () ->
            arraysEqual(Heapsort.compute(new int[]{3, 9, 1, 4, 7}), new int[]{1, 3, 4, 7, 9}));

    assertTest(testCount, "should return empty array for empty input", () ->
            arraysEqual(Heapsort.compute(new int[]{}), new int[]{}));

    assertTest(testCount, "should sort single-element input", () ->
            arraysEqual(Heapsort.compute(new int[]{10}), new int[]{10}));

    assertTest(testCount, "should sort moderate-sized input", () -> {
      int[] input = new int[1000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000);
      }

      int[] solution = new int[1000];
      System.arraycopy(input, 0, solution, 0, input.length);
      Heapsort.compute(input);

      Arrays.sort(solution);
      return isSorted(input) && arraysEqual(input, solution);
    });

    assertTest(testCount, "should sort large-sized input", () -> {
      int[] input = new int[1000000];
      for (int i = 0 ; i < input.length ; i++) {
        input[i] = (int) Math.floor(Math.random() * 1000000);
      }

      int[] solution = new int[1000000];
      System.arraycopy(input, 0, solution, 0, input.length);
      Heapsort.compute(input);

      Arrays.sort(solution);
      return isSorted(input) && arraysEqual(input, solution);
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
