/*
 * Homework - Frequency Count
 * Utilize the frequency count pattern to solve these problems.  Use a Hash Set
 * or an Array instead of a Hash Table where applicable.
 */

import java.util.*;

class FCProblems {
  /**
   *
   * Unique
   *
   * Given an array of integers, return an array with all duplicates removed.*
   *
   * Parameters
   * Input: arr {Array of Integers}
   * Output: {ArrayList of Integers}
   *
   * Constraints
   *
   * Time: O(N)
   * Space: O(N)
   *
   * Examples
   * [1, 2, 4, 4, 5, 6] --> [1, 2, 4, 5, 6]
   * [1, 1, 2, 2, 3, 3]' --> [1, 2, 3]
   * [1, 2, 3, 1, 2] --> [1, 2, 3]
   */

   public static ArrayList<Integer> unique(int[] arr) {
      // YOUR WORK HERE
      return new ArrayList<>();
   }

   /**
    * Word Count
    *
    * Given an body of text, return a hash table of the frequency of each word.
    *
    * Parameters
    * Input: sentence {String}
    * Output: {Hash Map <String, Integer>}
    *
    * Constraints
    *
    * Capital and lower case versions of the same word should be counted is the same word.
    *
    * Remove punctuations from all words.
    *
    * Time: O(N)
    * Space: O(N)
    * Where N is the number of characters in the string.
    *
    * **Examples**
    * 'The cat and the hat.' --> '{ the: 2, cat: 1, and: 1, hat: 1 }'`
    * 'As soon as possible.' --> '{ as: 2, soon: 1, possible: 1 }'`
    * 'It's a man, it's a plane, it's superman!' --> '{ its: 3, a: 2, man: 1, plane: 1, superman: 1 }'`
    */

    public static HashMap<String, Integer> wordCount(String sentence) {
      // YOUR WORK HERE
      return new HashMap<String, Integer>();
    }

  /**
   * RGB Set
   *
   * Given a string of characters where each character is either 'r', 'g', or 'b',
   * determine the number of complete sets of 'rgb' that can be made with the
   * characters.
   *
   * Parameters
   * Input: str {String}
   * Output: {Integer}
   *
   * Constraints
   * Time: O(N)
   * Space: O(1)
   *
   * Examples
   * `'rgbrgb' --> 2`
   * `'rbgrbrgrgbgrrggbbbbrgrgrgrg' --> 7`
   * `'bbrr' --> 0`
   */

     public static int rgb(String string) {
       // YOUR WORK HERE
       return -1;
     }

   /**
    * Missing Number
    *
    * Given range of 1 to N and an array of unique integers that are within that
    * range, return the missing integers not found in the array
    *
    * Parameters
    * Input: n {Integer}
    * Input: arr {Array of Integers}
    * Output: {ArrayList of Integers}
    *
    * Constraints
    * Time: O(N)
    * Space: O(N)
    *
    * Examples
    * `4, [1, 4, 2] --> [3]`
    * `8, [4, 7, 1, 6] --> [2, 3, 5, 8]`
    * `6, [6, 4, 2, 1] --> [3, 5]`
    */

    public static ArrayList<Integer> missingNumber(int n, int[] arr) {
      // YOUR WORK HERE
      return new ArrayList<>();
    }

  /**
   * Letter Sort
   *
   * Given a string of lowercase letters, return the letters in sorted order.
   *
   * Parameters
   * Input: str {String}
   * Output: {String}
   *
   * Constraints
   * Time: O(N)
   * Space: O(N)
   *
   * Examples
   * `hello --> ehllo`
   * `whiteboard --> abdehiortw`
   * `one --> eno`
   */

   public static String letterSort(String string) {
     // YOUR WORK HERE
     return "";
   }

   /**
    * Character Mode
    *
    * Given a string, find the most frequent occurring letter(s) in the string
    *
    * Parameters
    * Input: string {String}
    * Output: {String}
    *
    * Constraints
    * If more than one letter is tied for the most frequent, return a string of all
    * the letters in one string.
    *
    * Upper case characters should count as lower case, and do not include spaces
    * ... as characters.
    *
    * Time: O(N)
    * Space: O(N)
    *
    * Examples
    * 'hello' --> 'l'
    * 'A walk in the park' --> 'a'
    * 'noon' --> 'no'
    */

    public static String characterMode(String string) {
      // YOUR WORK HERE
      return "";
    }

  /**
   * Sort Digits
   *
   * Given an integer, sort the digits in ascending order and return the new integer.
   * Ignore leading zeros.
   *
   * Parameters
   * Input: num {Integer}
   * Output: {Integer}
   *
   * Constraints
   * Do not convert the integer into a string or other data type.
   *
   * Time: O(N) where N is the number of digits.
   * Space: O(1)
   *
   * Examples
   * 8970 --> 789
   * 32445 --> 23445
   * 10101 --> 111
   */

   public static int sortDigits(int n) {
    // YOUR WORK HERE
    return -1;
   }

   /**
    *  Get Duplicates
    *
    *  Given an array of values, return only the values that have duplicates in the
    *  array
    *
    *  Parameters
    *  Input: arr {Array}
    *  Output: {ArrayList}
    *
    *  Constraints
    *  Time: O(N)
    *  Space: O(N)
    *
    *  Examples
    *  [1, 2, 4, 2] --> [2]
    *  [3, 2, 3, 2, 3, 3, 4] --> [3, 2]
    *  [1, 2, 3, 4] --> []
    */

   public static ArrayList<Integer> getDuplicates(int[] arr) {
     // YOUR WORK HERE
     return new ArrayList<>();
   }

   /**
    *  Anagram Pair
    *
    *  Given two strings, determine if the strings are anagrams of one another.
    *
    *  Two words are anagrams of one another if they contain the same letters.
    *
    *  Parameters
    *  Input: str1 {String}
    *  Input: str2 {String}
    *  Output: {Boolean}
    *
    *  Constraints
    *  With N as the length of the first string, and M as the length of the second string.
    *
    *  Time: O(N)
    *  Space: O(N)
    *
    *  Examples
    *  "cat", "act" --> true
    *  "cat", "dog" --> false
    *  "racecar", "aaccrres" --> false
    */

    public static boolean anagramPair(String string1, String string2) {
      // YOUR WORK HERE
      return false;
    }

    /**
     *  Anagram Palindrome
     *
     *  Given a string, determine if the string can be rearranged to form a palindrome.
     *
     *  A palindrome is a word that is the same as its reversed. For example: "racecar"
     *  and "noon" are palindromes because they match their reversed version
     *  respectively. On the other hand, "cat" is not a palindrome because "cat"
     *  does not equal "tac".
     *
     *  Parameters
     *  Input: str {String}
     *  Output: {Boolean}
     *
     *  Constraints
     *
     *  Assume the string only contains lowercase letters and no spaces.
     *
     *  Time: O(N)
     *  Space: O(1)
     *
     *  Examples
     *  `"carrace" --> true ("carrace" can be rearranged to "racecar")`
     *  `"cat" --> false`
     */

  public static boolean anagramPalindrome(String str) {
    // YOUR WORK HERE
    return false;
  }
}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class FreqCountTests {

  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    // instantiate the testing of each module by resetting count and printing title of module
    int[] testCount = {0, 0};
    System.out.println("Unique Tests");

    // tests are in the form as shown
    assertTest(testCount, "should return unique values from sorted list with duplicates", () -> {
      ArrayList<Integer> output = FCProblems.unique(new int[]{1, 2, 4, 4, 5, 6});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
        add(1);
        add(2);
        add(4);
        add(5);
        add(6);
      }};
      return arrayListsEqual(output, test);
    });

    assertTest(testCount, "should return single value for list with all duplicates", () -> {
      ArrayList<Integer> output = FCProblems.unique(new int[]{2, 2, 2, 2, 2, 2});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
        add(2);
      }};
      return arrayListsEqual(output, test);
    });

    assertTest(testCount, "should return unique values from unsorted list with duplicates", () -> {
      ArrayList<Integer> output = FCProblems.unique(new int[]{1,2,3,1,2});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
        add(1);
        add(2);
        add(3);
      }};
      return arrayListsEqual(output, test);
    });

    assertTest(testCount, "should return an empty list from empty input", () -> {
      ArrayList<Integer> output = FCProblems.unique(new int[]{});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
      }};
      return arrayListsEqual(output, test);
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Word Count Tests");

    // tests are in the form as shown
    assertTest(testCount, "should return an object with each word and its frequency", () -> {
      HashMap<String, Integer> output = FCProblems.wordCount("The cat and the hat.");

      return output.get("the") == 2 && output.get("hat") == 1 && output.get("cat") == 1 && output.get("and") == 1;
    });

    assertTest(testCount, "should return object with each word excluding punctuations", () -> {
      HashMap<String, Integer> output = FCProblems.wordCount("It's a man, it's a plane, it's superman!");

      return output.get("its") == 3 && output.get("a") == 2 && output.get("man") == 1 && output.get("plane") == 1 && output.get("superman") == 1;
    });

    assertTest(testCount, "should return empty object for empty string input", () -> {
      HashMap<String, Integer> output = FCProblems.wordCount("");
      return output.isEmpty();
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("rgb Count Tests");

    // tests are in the form as shown
    assertTest(testCount, "should return number correct number of rgb from input", () -> {
      int output = FCProblems.rgb("rgbrgb");
      return output == 2;
    });

    assertTest(testCount, "should return correct number of rgb from input despite characters out of sequence", () -> {
      int output = FCProblems.rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg");
      return output == 7;
    });

    assertTest(testCount, "should return 0 as output for no number of rgb", () -> {
      int output = FCProblems.rgb("bbrr");
      return output == 0;
    });

    assertTest(testCount, "should return 0 for empty input", () -> {
      int output = FCProblems.rgb("");
      return output == 0;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Missing Number Tests");

    // tests are in the form as shown
    assertTest(testCount, "should return [3] for input of [1, 4, 2]", () -> {
      ArrayList<Integer> output = FCProblems.missingNumber(4, new int[]{1, 4, 2});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
        add(3);
      }};
      return arrayListsEqual(output, test);
    });


    assertTest(testCount, "should return [2, 3, 5, 8] for input of [4, 7, 1, 6]", () -> {
      ArrayList<Integer> output = FCProblems.missingNumber(8, new int[]{4, 7, 1, 6});
      ArrayList<Integer> test = new ArrayList<Integer>() {{
        add(2);
        add(3);
        add(5);
        add(8);
      }};
      return arrayListsEqual(output, test);
    });

    assertTest(testCount, "should return [3, 5] for input of [6, 4, 2, 1]", () -> {
        ArrayList<Integer> output = FCProblems.missingNumber(6, new int[]{6, 4, 2, 1});
        ArrayList<Integer> test = new ArrayList<Integer>() {{
          add(3);
          add(5);
        }};
        return arrayListsEqual(output, test);
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Letter Sort Tests");

    assertTest(testCount, "should return 'ehllo' for input 'hello'", () -> {
        String output = FCProblems.letterSort("hello");
        return output.equals("ehllo");
    });

    assertTest(testCount, "should return 'abdehiortw' for input of 'whiteboard'", () -> {
        String output = FCProblems.letterSort("whiteboard");
        return output.equals("abdehiortw");
    });

    assertTest(testCount, "should return 'eno' for input 'one'", () -> {
        String output = FCProblems.letterSort("one");
        return output.equals("eno");
    });


    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Character Mode Tests");

    assertTest(testCount, "should return 'l' for input 'hello'", () -> {
        String output = FCProblems.characterMode("hello");
        return output.equals("l");
    });

    assertTest(testCount, "should return 'a' when input is 'A walk in the park'", () -> {
        String output = FCProblems.characterMode("A walk in the park");
        return output.equals("a");
    });

    assertTest(testCount, "should return 'no' when input is 'noon'", () -> {
        String output = FCProblems.characterMode("noon");
        return output.equals("no");
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Sort Digits Tests");

    assertTest(testCount, "should return '789' when input is '8970'", () -> {
        int output = FCProblems.sortDigits(8970);
        return output == 789;
    });

    assertTest(testCount, "should return '23445' when input is '32445'", () -> {
        int output = FCProblems.sortDigits(32445);
        return output == 23445;
    });

    assertTest(testCount, "should return '111' when input is '10101'", () -> {
        int output = FCProblems.sortDigits(10101);
        return output == 111;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Get Duplicates Tests");

    assertTest(testCount, "should return '[2]' when input is '[1, 2, 4, 2]'", () -> {
        ArrayList<Integer> output = FCProblems.getDuplicates(new int[] {1, 2, 4, 2});
        ArrayList<Integer> test = new ArrayList<Integer>() {{
          add(2);
        }};
        return arrayListsEqual(output, test);
    });

    assertTest(testCount, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'", () -> {
        ArrayList<Integer> output = FCProblems.getDuplicates(new int[] {3, 2, 3, 2, 3, 3, 4});
        ArrayList<Integer> test1 = new ArrayList<Integer>() {{
          add(2);
          add(3);
        }};

        ArrayList<Integer> test2 = new ArrayList<Integer>() {{
          add(3);
          add(2);
        }};
        return arrayListsEqual(output, test1) || arrayListsEqual(output, test2);
    });

    assertTest(testCount, "should return '[]' when input is '[1, 2, 3, 4]'", () -> {
        ArrayList<Integer> output = FCProblems.getDuplicates(new int[] {1, 2, 3, 4});
        return output.size() == 0;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Anagram Pair Tests");

    assertTest(testCount, "should return true when input is 'cat, act'", () ->
            FCProblems.anagramPair("cat", "act"));

    assertTest(testCount, "should return false when input is 'cat, dog'", () ->
            !FCProblems.anagramPair("cat", "dog"));

    assertTest(testCount, "should return false when input is 'racecar, aaccrres'", () ->
            !FCProblems.anagramPair("racecar", "aaccrres"));

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Anagram Palindrome Tests");

    assertTest(testCount, "should return true when input is 'carrace'", () ->
            FCProblems.anagramPalindrome("carrace"));

    assertTest(testCount, "should return false when input is 'cat'", () ->
            !FCProblems.anagramPalindrome("cat"));

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static boolean arrayListsEqual(ArrayList<Integer> arr1, ArrayList<Integer> arr2) {
    if(arr1.size() != arr2.size()) {
      return false;
    }

    for(int i = 0; i < arr1.size(); i++) {
      if(!arr1.get(i).equals(arr2.get(i))) {
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
