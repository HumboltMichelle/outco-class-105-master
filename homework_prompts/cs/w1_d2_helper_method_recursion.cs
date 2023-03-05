/*
 *  Homework - Helper Method Recursion
 *
 *  Instructions: Using the Helper Method Recursive Pattern work through the
 *  following problems.
 *
 */

using System;
using System.IO;


/**
 * 1a. What is the term when the recursive call invokes itself more than once.
 *
 *
 */


/**
 * 1b. List the steps involved to build a Helper Method Recursion algorithm.
 *
 *
 */


/**
 * 1c. Should the recursive case or base case typically be tackled first?
 *
 *
 */


/**
 *  2a. Print each integer in an array in order using Helper Method Recursion
 *
 *  Input:   arr {Array of ints}
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
 *  Input:   arr {Array of ints}
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
 *  Input:   string
 *  Output:  string
 *
 *  Example: String greeting = 'hello';
 *          ReverseString.compute(greeting) => 'olleh'
 */
class ReverseString {

    public static string compute(string str) {
        // YOUR WORK HERE
        return "";
    }

}


/**
 * 2d. Given an array of positive integers, create an array of two-item integer
 *     arrays (two dimensional integer array) using Helper Method Recursion
 *
 * Input:   Array of int
 * Output:  two-dimensional int Array
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

    public static int[,] compute(int[] arr) {
        // YOUR WORK HERE
        return new int[0,0];
    }



}


/**
 * 2e. Flatten a two dimensional integer array using Helper Method of Recursion
 *
 * Input:   two-dimensional int Array
 * Output:  Array of ints
 *
 * Example: int matrix[,]= {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
 *          Flatten.compute(matrix) =>
 *          {1, 2, 3, 4, 5, 6, 7, 8, 9}
 */
class Flatten {

    public static int[] compute(int[,] matrix) {
        // YOUR WORK HERE
        return new int[0];
    }


}


/**
 * 2f. Given a base and an exponent, create a method to find the power using
 *     Helper Method Recursion
 *
 * Input:   Two ints, base and positive exponent
 * Output:  int
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

// use the Test class to run the test cases
class Test{

    public static void Main() {
        printArrayTests();
        printReverseTests();
        reverseStringTests();
        arrayPairsTests();
        flattenTests();
        powerTests();
        mergeTests();
	}

    private static void printArrayTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("PrintArray tests");
        runTest(printArrayTest1, "able to print the elements of [1,2,3] forwards", testCount);
        runTest(printArrayTest2, "does not print for an empty array", testCount);
        runTest(printArrayTest3, "able to print a single element array [5]", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void printReverseTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("PrintReverse tests");
        runTest(printReverseTest1, "able to print the elements of [1,2,3] backwards", testCount);
        runTest(printReverseTest2, "does not print for an empty array", testCount);
        runTest(printReverseTest3, "able to print a single element array [5]", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void reverseStringTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("ReverseString tests");
        runTest(reverseStringTest1, "able to reverse string 'hello'", testCount);
        runTest(reverseStringTest2, "able to return an empty string for empty string input", testCount);
        runTest(reverseStringTest3, "able to return the same character for a single-character input string", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void arrayPairsTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("ArrayPairs tests");
        runTest(arrayPairsTest1, "should return [[1,2],[3,4],[5,6]] output for [1,2,3,4,5,6] input", testCount);
        runTest(arrayPairsTest2, "should return [[1,2],[3,4],[5,-1]] output for [1,2,3,4,5] input", testCount);
        runTest(arrayPairsTest3, "should return [] output for [] input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void flattenTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Flatten tests");
        runTest(flattenTest1, "should return [1,2,3,4,5,6,7,8,9] output for [[1, 2, 3],[4, 5, 6],[7, 8, 9]] input", testCount);
        runTest(flattenTest2, "should return [] output for [] input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void powerTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Power tests");
        runTest(powerTest1, "should return 81 for 3 to the 4th power", testCount);
        runTest(powerTest2, "should return 1 for 5 to the 0th power", testCount);
        runTest(powerTest3, "should return 1 for 1 to the 100th power", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void mergeTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Merge tests");
        runTest(mergeTest1, "should return [1, 2, 3, 4, 6, 7, 9] when merging [1, 4, 7] and [2, 3, 6, 9]", testCount);
        runTest(mergeTest2, "should handle inputs when left argument is empty array", testCount);
        runTest(mergeTest3, "should handle inputs when right argument is empty array", testCount);
        runTest(mergeTest4, "should handle two empty arrays as inputs", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }


    private static string stdOutCapture(Action<int[]> printFunc, int[] input) {
        // Set Console standard out to string writer
        var sw = new StringWriter();
        Console.SetOut(sw);
        Console.SetError(sw);

        // Print some output: goes to your special stream
        printFunc(input);

        // Reset standard out and standard error
        var standardOutput = new StreamWriter(Console.OpenStandardOutput());
        standardOutput.AutoFlush = true;
        var standardError = new StreamWriter(Console.OpenStandardError());
        standardError.AutoFlush = true;
        Console.SetOut(standardOutput);
        Console.SetError(standardError);

        // Show what happened
        return sw.ToString();
    }

    private static bool printArrayTest1() {
        int[] input = {1,2,3};
        string result = stdOutCapture(PrintArray.compute, input);
        return result.Equals("1\n2\n3\n");
    }

    private static bool printArrayTest2() {
        int[] input = {};
        string result = stdOutCapture(PrintArray.compute, input);
        return result.Equals("");
    }

    private static bool printArrayTest3() {
        int[] input = {5};
        string result = stdOutCapture(PrintArray.compute, input);
        return result.Equals("5\n");
    }


    private static bool printReverseTest1() {
        int[] input = {1,2,3};
        string result = stdOutCapture(PrintReverse.compute, input);
        return result.Equals("3\n2\n1\n");
    }

    private static bool printReverseTest2() {
        int[] input = {};
        string result = stdOutCapture(PrintReverse.compute, input);
        return result.Equals("");
    }

    private static bool printReverseTest3() {
        int[] input = {5};
        string result = stdOutCapture(PrintReverse.compute, input);
        return result.Equals("5\n");
    }

    private static bool reverseStringTest1() {
        return ReverseString.compute("hello").Equals("olleh");
    }

    private static bool reverseStringTest2() {
        return ReverseString.compute("").Equals("");
    }

    private static bool reverseStringTest3() {
        return ReverseString.compute("b").Equals("b");
    }


    private static bool arrayPairsTest1() {
        int[] input = {1,2,3,4,5,6};
        int[,] output = ArrayPairs.compute(input);
        return output.GetLength(0) == 3 &&
                  output[0,0] == 1 && output[0,1] == 2 &&
                  output[1,0] == 3 && output[1,1] == 4 &&
                  output[2,0] == 5 && output[2,1] == 6;
    }

    private static bool arrayPairsTest2() {
        int[] input = {1,2,3,4,5};
        int[,] output = ArrayPairs.compute(input);
        return output.GetLength(0) == 3 &&
                  output[0,0] == 1 && output[0,1] == 2 &&
                  output[1,0] == 3 && output[1,1] == 4 &&
                  output[2,0] == 5 && output[2,1] == -1;
    }

    private static bool arrayPairsTest3() {
        int[] input = {};
        int[,] output = ArrayPairs.compute(input);
        return output.GetLength(0) == 0;
    }

    private static bool flattenTest1() {
        int[,] input = {{1, 2, 3} ,{4, 5, 6}, {7, 8, 9}};
        int[] output = Flatten.compute(input);

        return output.Length == 9 &&
                  output[0] == 1 && output[1] == 2 &&
                  output[2] == 3 && output[3] == 4 &&
                  output[4] == 5 && output[5] == 6 &&
                  output[6] == 7 && output[7] == 8 &&
                  output[8] == 9;
    }

    private static bool flattenTest2() {
        int[,] input = {};
        int[] output = Flatten.compute(input);
        return output.Length == 0;
    }


    private static bool powerTest1() {
        return Power.compute(3,4) == 81;
    }

    private static bool powerTest2() {
        return Power.compute(5,0) == 1;
    }

    private static bool powerTest3() {
        return Power.compute(1,100) == 1;
    }


    private static bool mergeTest1() {
        int[] input1 = {1,4,7};
        int[] input2 = {2,3,6,9};

        int[] output = Merge.compute(input1, input2);

        return output.Length == 7 &&
                  output[0] == 1 &&
                  output[1] == 2 &&
                  output[2] == 3 &&
                  output[3] == 4 &&
                  output[4] == 6 &&
                  output[5] == 7 &&
                  output[6] == 9;
    }

    private static bool mergeTest2() {
        int[] input1 = {};
        int[] input2 = {2,3,6,9};

        int[] output = Merge.compute(input1, input2);

        return output.Length == 4 &&
                  output[0] == 2 &&
                  output[1] == 3 &&
                  output[2] == 6 &&
                  output[3] == 9;
    }

    private static bool mergeTest3() {
        int[] input1 = {1,4,7};
        int[] input2 = {};

        int[] output = Merge.compute(input1, input2);

        return output.Length == 3 &&
                  output[0] == 1 &&
                  output[1] == 4 &&
                  output[2] == 7;
    }

    private static bool mergeTest4() {
        int[] input1 = {};
        int[] input2 = {};

        int[] output = Merge.compute(input1, input2);

        return output.Length == 0;
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
