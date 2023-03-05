/*
 * Homework - Decrease and Conquer
 * Utilize the decrease and conquer pattern to solve these problems.
 */


class DACProblems {

/*
 *
 *  Number of Ones
 *
 * *Given a sorted bit array (values of either 0 or 1), determine the number of 1's in the array.*
 *
 * **Parameters**
 * Input: arr {Array of Integers}
 * Output: {Integer}
 *
 * **Constraints**
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1] --> 8`
 * `[0, 0, 0] --> 0`
 * `[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1] --> 7`
 */

  public static int numberOfOnes(int[] arr) {
    // YOUR WORK HERE
    return -1;
  }

/*
 * Closest Value
 *
 * Given a sorted bit array of integers, and a target value, find the number in the array that is closest to the target.*
 *
 * **Parameters**
 * Input: arr {Array of Integers}
 * Input: target {Integer}
 * Output: {Integer}
 *
 * **Constraints**
 * If there are two numbers tied for the closest value, return the lowest value.
 *
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `[1, 2, 3, 5, 5, 7, 9, 10, 11], 6 --> 5`
 * `[1, 2, 3], 8 --> 3`
 * `[1, 10, 22, 59, 67, 72, 100], 70 --> 72`
 */

public static int closestValue(int[] arr, int target) {
  // YOUR WORK HERE
  return -1;
}


/*
 * Square Root
 *
 * Given a positive integer, find the square root.*
 *
 * **Parameters**
 * Input: value {Double}
 * Output: {Double}
 *
 * **Constraints**
 * Do not use a native built in method.
 * Ensure the result is accurate to 6 decimal places (0.000001)
 *
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `4 --> 2.0`
 * `98 --> 9.899495`
 * `14856 --> 121.885192
 */


public static Double squareRoot(Double n) {
  // YOUR WORK HERE
  return -1.0;
}


/*
 * Greater Values
 *
 * *Given a sorted array of integers, and a target value return the number of values greater the target.*
 *
 * **Parameters**
 * Input: arr {Array of Integers}
 * Input: target {Integer}
 * Output: {Integer}
 *
 * **Constraints**
 *
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `[1, 2, 3, 5, 5, 7, 9, 10, 11], 5 --> 4`
 * `[1, 2, 3], 4 --> 0`
 * `[1, 10, 22, 59, 67, 72, 100], 13 --> 5`
 *
*/

public static int greaterValues(int[] arr, int target) {
  // YOUR WORK HERE
  return -1;
}


/*
 * Sorted and Rotated Array [Extra Credit]
 *
 * *Given an array that is sorted and rotated, find out if a target value exists in the array.*
 *
 * A sorted array is rotated by taking an unknown amount of values from the beginning and placing it at the end.
 *
 * `[3, 4, 5, 1, 2]` is rotated left by 2.
 * `[99, 14, 25, 78, 93]` is rotated to the right by 1.
 *
 * **Parameters**
 * Input: arr {Array of Integers}
 * Input: target {Integer}
 * Output: {Boolean}
 *
 * **Constraints**
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `[35, 46, 79, 102, 1, 14, 29, 31], 46 --> true`
 * `[35, 46, 79, 102, 1, 14, 29, 31], 47 --> false`
 * `[7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 9 --> true`
 */

public static boolean rotatedArraySearch(int[] nums, int target) {
  // YOUR WORK HERE
  return false;
}


private static boolean binarySearch(int[] nums, int start, int end, int target) {
  // YOUR WORK HERE
  return false;
}


/*
 * Multiplication Using Russian Peasant [Extra Credit]
 *
 * *Given two positive integers, return its product using Russian Peasant method of multiplication*
 *
 * Read up on how to apply the Russian Peasant method [here](https: *en.wikipedia.org/wiki/Ancient_Egyptian_multiplication). It is also referred to as the Egyptian multiplication.
 *
 * **Parameters**
 * Input: a {Integer}
 * Input: b {Integer}
 * Output: {Integer}
 *
 * **Constraints**
 * Assume a <= b, and the value of a is N.
 *
 * Time: O(logN)
 * Space: O(1)
 *
 * **Examples**
 * `487, 734 --> 357458`
 * `846, 908--> 768168`
 */

public static int multiplicationRussianPeasant(int a, int b) {
  // YOUR WORK HERE
  return -1;
}

}





////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class DecreaseAndConquerTests {

  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Number Of Ones Tests");

    // tests are in the form as shown
    assertTest(testCount, "should return correct number of ones for array with zeroes and ones", () -> {
        int output = DACProblems.numberOfOnes(new int[]{0, 0, 0, 1, 1, 1});
        return output == 3;
    });

    assertTest(testCount, "should return correct number of ones for array with all zeroes", () -> {
        int output = DACProblems.numberOfOnes(new int[]{0, 0, 0, 0, 0, 0});
        return output == 0;
    });

    assertTest(testCount, "should return correct number of ones for array with all ones", () -> {
        int output = DACProblems.numberOfOnes(new int[]{1, 1, 1, 1, 1});
        return output == 5;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Closest Value Tests");

    assertTest(testCount, "should return correct closest value for number in the middle range", () -> {
        int output = DACProblems.closestValue(new int[]{1, 2, 3, 5, 5, 7, 9, 10, 11}, 6);
        return output == 5;
    });

    assertTest(testCount, "should return closest value for highest number", () -> {
        int output = DACProblems.closestValue(new int[]{1, 2, 3}, 8);
        return output == 3;
    });

    assertTest(testCount, "should return closest value for lowest number", () -> {
        int output = DACProblems.closestValue(new int[]{-2, -1, 0}, -5);
        return output == -2;
    });


    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Square Root Tests");

    assertTest(testCount, "should return correct square root for number < 10", () -> {
        Double output = DACProblems.squareRoot(4.0);
        return output == 2.0;
    });

    assertTest(testCount, "should return correct square root for number between 10 and 100", () -> {
        Double output = DACProblems.squareRoot(98.0);
        return output == 9.899495;
    });

    assertTest(testCount, "should return correct square root for number over 10,000", () -> {
        Double output = DACProblems.squareRoot(14856.0);
        return output == 121.885192;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Greater Values Tests");

    assertTest(testCount, "should return greater values for number in the middle of the array", () -> {
        int output = DACProblems.greaterValues(new int[] {1, 2, 3, 5, 5, 7, 9, 10, 11}, 5);
        return output == 4;
    });

    assertTest(testCount, "should return 0 for number greater than largest in the array", () -> {
        int output = DACProblems.greaterValues(new int[] {1, 2, 3}, 4);
        return output == 0;
    });

    assertTest(testCount, "should return length of array for number less than least in the array", () -> {
        int output = DACProblems.greaterValues(new int[] {1, 10, 22, 59, 67, 72, 100}, -2);
        return output == 7;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Rotated Sorted Array Tests");

    assertTest(testCount, "returns true when target is in the array", () ->
            DACProblems.rotatedArraySearch(new int[] {35, 46, 79, 102, 1, 14, 29, 31}, 46));

    assertTest(testCount, "returns false when target is not in the array", () ->
            !DACProblems.rotatedArraySearch(new int[] {35, 46, 79, 102, 1, 14, 29, 31}, 47));

    assertTest(testCount, "returns true when target is the first number in the array", () ->
            DACProblems.rotatedArraySearch(new int[] {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 7));

    assertTest(testCount, "returns true when target is the last number in the array", () ->
            DACProblems.rotatedArraySearch(new int[] {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 6));

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Multiplication Russian Tests");

    assertTest(testCount, "returns correct value for two integers", () -> {
        int output = DACProblems.multiplicationRussianPeasant(487,734);
        return output == 357458;
    });

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
