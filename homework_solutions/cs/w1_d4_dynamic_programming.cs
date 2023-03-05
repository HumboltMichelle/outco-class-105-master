/*
 *  Homework - Sliding Window
 *
 */

using System;


class Problems {

/*  Problem 1: Max Consecutive Sum
 *
 *  Prompt:    Given an array of integers find the sum of consecutive
 *             values in the array that produces the maximum value.
 *
 *  Input:     Unsorted array of positive and negative integers
 *  Output:    Integer (max consecutive sum)
 *
 *  Example:   input = [6, -1, 3, 5, -10]
 *             output = 13 (6 + -1 + 3 + 5 = 13)
 *
 */

    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(1)
    public static int maxConsecutiveSum(int[] arr) {
        if (arr.Length == 0) {
            return 0;
        }

        int localMax = arr[0];
        int ultimateMax = arr[0];

        for (int i = 1 ; i < arr.Length ; i++) {
            localMax = Math.Max(localMax + arr[i], arr[i]);
            ultimateMax = Math.Max(localMax, ultimateMax);
        }
        return ultimateMax;
    }


/*
*  Problem 2: Bit Flip
*
*     Given an array of binary values (0 and 1) and N number of flips (convert
*     a 0 to a 1), determine the maximum number of consecutive 1's that can be
*     made.
*
*  Input: An Array of 1's and 0's, and an Integer N denoting the number of
*         flips
*  Output: Integer
*
*  Example: bitFlip([0,1,1,1,0,1,0,1,0,0], 2)
*  Result: 7
*/

    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(N)
    public static int BitFlip(int[] arr, int N) {
        int max = 0;
        int streak = 0;
        int start = 0;

        for (int i = 0 ; i < arr.Length ; i++) {
            if (arr[i] == 0) {
                if (N > 0) {
                N--;
                } else {
                int subtract = 1;
                while (arr[start] == 1) {
                    start++;
                    subtract++;
                }
                start++;
                streak -= subtract;
                }
            }
            streak++;
            max = Math.Max(max, streak);
        }
        return max;
    }

}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

    public static void Main() {
        maxConsecutiveSumTests();
        bitFlipTests();
	}

    private static void maxConsecutiveSumTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("maxConsecutiveSum Tests");
        runTest(maxConsecutiveSumTest1, "should work on example input", testCount);
        runTest(maxConsecutiveSumTest2, "should work on single-element input", testCount);
        runTest(maxConsecutiveSumTest3, "should return 0 for empty input", testCount);
        runTest(maxConsecutiveSumTest4, "should work on longer input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void bitFlipTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Bit Flip Tests");
        runTest(bitFlipTest1, "should handle example case", testCount);
        runTest(bitFlipTest2, "should handle smaller edge case where flip is allowed", testCount);
        runTest(bitFlipTest3, "should handle smaller edge case where flip is not allowed", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static bool maxConsecutiveSumTest1() {
        return Problems.maxConsecutiveSum(new int[]{6, -1, 3, 5, -10}) == 13;
    }

    private static bool maxConsecutiveSumTest2() {
        return Problems.maxConsecutiveSum(new int[]{5}) == 5;
    }

    private static bool maxConsecutiveSumTest3() {
        return Problems.maxConsecutiveSum(new int[]{}) == 0;
    }

    private static bool maxConsecutiveSumTest4() {
        return Problems.maxConsecutiveSum(new int[]{-2, 1, -3, 4, -1, 2, 1, -5, 4}) == 6;
    }


    private static bool bitFlipTest1() {
        int[] input = {0,1,1,1,0,1,0,1,0,0};
        int output = Problems.BitFlip(input, 2);
        return output == 7;
    }

    private static bool bitFlipTest2() {
        int[] input = {0};
        int output = Problems.BitFlip(input, 1);
        return output == 1;
    }

    private static bool bitFlipTest3() {
        int[] input = {0};
        int output = Problems.BitFlip(input, 0);
        return output == 0;
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
