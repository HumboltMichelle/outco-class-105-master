/*
 *  Homework - Helper Method Recursion
 *
 *  Instructions: Using the Helper Method Recursive Pattern work through the
 *  following problems.
 *
 */

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;


/*
 * 1a. What is the term when the recursive call invokes itself more than once.
 *
 *
 */


/*
 * 1b. List the steps involved to build a Helper Method Recursion algorithm.
 *
 *
 */


/*
 * 1c. Should the recursive case or base case typically be tackled first?
 *
 *
 */


/*
 *  2a. Print each integer in an array in order using Helper Method Recursion
 *
 *  Input:   arr {Array}
 *  Output:  {void}
 *
 *  Example: int[] nums = {1, 2, 3};
 *
 *          PrintArray.compute(nums) =>
 *          1
 *          2
 *          3
 */
class PrintArray {

  public static void compute(int[] arr) {
    // YOUR WORK HERE
  }

  public static void computeHelper(int[] arr, int index) {
    // YOUR WORK HERE
  }
}

/**
 *  2b. Given an integer array, print each item backwards using Helper Method
 *      Recursion
 *
 *  Input:   arr {Array}
 *  Output:  {void}
 *
 *  Example: int[] nums = {1, 2, 3};
 *
 *          PrintReverse.compute(nums) =>
 *          3
 *          2
 *          1
 */
class PrintReverse {

  public static void compute(int[] arr) {
    // YOUR WORK HERE
  }

  private static void traverse(int[] arr, int index) {
    // YOUR WORK HERE
  }
}


/**
 *  2c. Reverse a string using Helper Method Recursion
 *
 *  Input:   String
 *  Output:  String
 *
 *  Example: String greeting = 'hello';
 *          ReverseString.compute(greeting) => 'olleh'
 */
class ReverseString {

  public static String compute(String str) {
    // YOUR WORK HERE
    return "";
  }

}


/**
 * 2d. Given an array of positive integers, create an array of two-item integer
 *     arrays (two dimensional integer array) using Helper Method Recursion
 *
 * Input:   Array of Integers
 * Output:  two-dimensional Integer Array
 *
 * Example: int[] nums = {1, 2, 3, 4, 5, 6};
 *          ArrayPairs.compute(nums)  =>
 *          {{1,2}, {3,4}, {5,6}}
 *
 * Example: int[] nums2 = {1, 2, 3, 4, 5};
 *          ArrayPairs.compute(nums2)  =>
 *          {{1,2}, {3,4}, {5, -1}}
 */
class ArrayPairs {

  public static int[][] compute(int[] arr) {
    // YOUR WORK HERE
    return new int[0][0];
  }



}


/**
 * 2e. Flatten a two dimensional integer array using Helper Method of Recursion
 *
 * Input:   two-dimensional Integer Array
 * Output:  Array of Integers
 *
 * Example: int matrix[][]= {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
 *          Flatten.compute(matrix) =>
 *          {1, 2, 3, 4, 5, 6, 7, 8, 9}
 */
class Flatten {

  public static int[] compute(int[][] matrix) {
    // YOUR WORK HERE
    return new int[0];
  }


}


/**
 * 2f. Given a base and an exponent, create a method to find the power using
 *     Helper Method Recursion
 *
 * Input:   Two Integers, base and exponent
 * Output:  Integer
 *
 * Example: Power.compute(3, 4) => 81
 */
class Power {

  public static int compute(int a, int b) {
    // YOUR WORK HERE
    return -1;
  }

}


/**
 * 2g. Merge two sorted arrays using the Helper Method Recursion
 *
 * Input:   Two Integer Arrays, both sorted
 * Output:  Integer Array, sorted
 *
 * Example: int[] nums1 = {1, 4, 7};
 *          int[] nums2 = {2, 3, 6, 9};
 *
 *          Merge.compute(nums1, nums2) =>
 *          { 1, 2, 3, 4, 6, 7, 9 }
 */
class Merge {

  public static int[] compute(int[] arr1, int[] arr2) {
    // YOUR WORK HERE
    return new int[0];
  }

}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class HelperMethodRecursionTests {

  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("PrintArray tests");

    // tests are in the form as shown
    assertTest(testCount, "able to print the elements of [1,2,3] forwards", () -> {
        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {1,2,3};
        PrintArray.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("1\n2\n3\n");
    });

    assertTest(testCount, "does not print for an empty array", () -> {
        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {};
        PrintArray.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("");
    });

    assertTest(testCount, "able to print a single element array [5]", () -> {
        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {5};
        PrintArray.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("5\n");
    });


    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");




    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("PrintReverse tests");

    // tests are in the form as shown
    assertTest(testCount, "able to print the elements of [1,2,3] backwards", () -> {
        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {1,2,3};
        PrintReverse.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("3\n2\n1\n");
    });

    assertTest(testCount, "does not print for an empty array", () -> {
       // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {};
        PrintReverse.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("");
    });

    assertTest(testCount, "able to print a single element array [5]", () -> {
        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out;
        // Tell Java to use your special stream
        System.setOut(ps);

        // Print some output: goes to your special stream
        int[] input = {5};
        PrintReverse.compute(input);

        // Put things back
        System.out.flush();
        System.setOut(old);
        // Show what happened
        //System.out.println("Here: " + baos.toString());

        return baos.toString().equals("5\n");
    });


    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("ReverseString tests");

    // tests are in the form as shown
    assertTest(testCount, "able to reverse string 'hello'", () ->
      ReverseString.compute("hello").equals("olleh"));


    assertTest(testCount, "able to return an empty string for empty string input", () ->
      ReverseString.compute("").equals(""));


    assertTest(testCount, "able to return the same character for a single-character input string", () ->
        ReverseString.compute("b").equals("b"));


    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("ArrayPairs tests");

    // tests are in the form as shown
    assertTest(testCount, "should return [[1,2],[3,4],[5,6]] output for [1,2,3,4,5,6] input", () -> {

        int[] input = {1,2,3,4,5,6};
        int[][] output = ArrayPairs.compute(input);

        return output.length == 3 &&
                  output[0][0] == 1 && output[0][1] == 2 &&
                  output[1][0] == 3 && output[1][1] == 4 &&
                  output[2][0] == 5 && output[2][1] == 6;

    });

    assertTest(testCount, "should return [[1,2],[3,4],[5,-1]] output for [1,2,3,4,5] input", () -> {

        int[] input = {1,2,3,4,5};
        int[][] output = ArrayPairs.compute(input);

        return output.length == 3 &&
                  output[0][0] == 1 && output[0][1] == 2 &&
                  output[1][0] == 3 && output[1][1] == 4 &&
                  output[2][0] == 5 && output[2][1] == -1;

    });

    assertTest(testCount, "should return [] output for [] input", () -> {

        int[] input = {};
        int[][] output = ArrayPairs.compute(input);

        return output.length == 0;

    });


    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");




    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Flatten tests");

    // tests are in the form as shown
    assertTest(testCount, "should return [1,2,3,4,5,6,7,8,9] output for [[1, 2, 3],[4, 5, 6],[7, 8, 9]] input", () -> {

        int[][] input = {{1, 2, 3} ,{4, 5, 6}, {7, 8, 9}};
        int[] output = Flatten.compute(input);

        return output.length == 9 &&
                  output[0] == 1 && output[1] == 2 &&
                  output[2] == 3 && output[3] == 4 &&
                  output[4] == 5 && output[5] == 6 &&
                  output[6] == 7 && output[7] == 8 &&
                  output[8] == 9;

    });

    assertTest(testCount, "should return [] output for [] input", () -> {

        int[][] input = {};
        int[] output = Flatten.compute(input);
        return output.length == 0;

    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Power tests");

    // tests are in the form as shown
    assertTest(testCount, "should return 81 for 3 to the 4th power", () ->
      Power.compute(3,4) == 81);


    assertTest(testCount, "should return 1 for 5 to the 0th power", () ->
      Power.compute(5,0) == 1);

    assertTest(testCount, "should return 1 for 1 to the 100th power", () ->
      Power.compute(1,100) == 1);

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Merge tests");

    // tests are in the form as shown
    assertTest(testCount, "should return [1, 2, 3, 4, 6, 7, 9] when merging [1, 4, 7] and [2, 3, 6, 9]", () -> {

        int[] input1 = {1,4,7};
        int[] input2 = {2,3,6,9};

        int[] output = Merge.compute(input1, input2);

        return output.length == 7 &&
                  output[0] == 1 &&
                  output[1] == 2 &&
                  output[2] == 3 &&
                  output[3] == 4 &&
                  output[4] == 6 &&
                  output[5] == 7 &&
                  output[6] == 9;

    });

    assertTest(testCount, "should handle inputs when left argument is empty array", () -> {

        int[] input1 = {};
        int[] input2 = {2,3,6,9};

        int[] output = Merge.compute(input1, input2);

        return output.length == 4 &&
                  output[0] == 2 &&
                  output[1] == 3 &&
                  output[2] == 6 &&
                  output[3] == 9;

    });

    assertTest(testCount, "should handle inputs when right argument is empty array", () -> {

        int[] input1 = {1,4,7};
        int[] input2 = {};

        int[] output = Merge.compute(input1, input2);

        return output.length == 3 &&
                  output[0] == 1 &&
                  output[1] == 4 &&
                  output[2] == 7;

    });

    assertTest(testCount, "should handle two empty arrays as inputs", () -> {

        int[] input1 = {};
        int[] input2 = {};

        int[] output = Merge.compute(input1, input2);

        return output.length == 0;

    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


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
