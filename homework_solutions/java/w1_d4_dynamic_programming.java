/*
 *  Homework - Sliding/Moving Window
 *
 *  Problem 1: Max Consecutive Sum
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


 class SWProblems {

   // Time Complexity: O(N)
   // Auxiliary Space Complexity: O(1)
   public static int maxConsecutiveSum(int[] arr) {
     if (arr.length == 0) {
       return 0;
     }

     int localMax = arr[0];
     int ultimateMax = arr[0];

     for (int i = 1 ; i < arr.length ; i++) {
       localMax = Math.max(localMax + arr[i], arr[i]);
       ultimateMax = Math.max(localMax, ultimateMax);
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
   public static int bitFlip(int[] arr, int N) {
     int max = 0;
     int streak = 0;
     int start = 0;

     for (int value : arr) {
       if (value == 0) {
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
       max = Math.max(max, streak);
     }
     return max;
   }
 }




 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

 // use the Main class to run the test cases
 class SlidingWindowTests {

   // an interface to perform tests
   public interface Test {
     boolean execute();
   }

   public static void main(String[] args) {

     // instantiate the testing of each module by resetting count and printing title of module
     int[] testCount = {0, 0};
     System.out.println("maxConsecutiveSum Tests");

     // tests are in the form as shown
     assertTest(testCount, "should work on example input", () ->
             SWProblems.maxConsecutiveSum(new int[]{6, -1, 3, 5, -10}) == 13);

     assertTest(testCount, "should work on single-element input", () ->
             SWProblems.maxConsecutiveSum(new int[]{5}) == 5);

     assertTest(testCount, "should return 0 for empty input", () ->
             SWProblems.maxConsecutiveSum(new int[]{}) == 0);

     assertTest(testCount, "should work on longer input", () ->
             SWProblems.maxConsecutiveSum(new int[]{-2, 1, -3, 4, -1, 2, 1, -5, 4}) == 6);

     // print the result of tests passed for a module
     System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

     // instantiate the testing of each module by resetting count and printing title of module
     testCount[0] = 0;
     testCount[1] = 0;
     System.out.println("bitFlip Tests");

     // tests are in the form as shown
     assertTest(testCount, "should handle example case", () -> {
       int[] input = {0,1,1,1,0,1,0,1,0,0};
       int output = SWProblems.bitFlip(input, 2);
       return output == 7;
     });

     assertTest(testCount, "should handle smaller edge case where flip is allowed", () -> {
       int[] input = {0};
       int output = SWProblems.bitFlip(input, 1);
       return output == 1;
     });

     assertTest(testCount, "should handle smaller edge case where flip is not allowed", () -> {
       int[] input = {0};
       int output = SWProblems.bitFlip(input, 0);
       return output == 0;
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
