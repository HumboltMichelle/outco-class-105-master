/*
 * Homework - Frequency Count
 * Utilize the frequency count pattern to solve these problems.  Use a Hash Set
 * or an Array instead of a Hash Table where applicable.
 */

using System;
using System.Linq;
using System.Collections.Generic;

class Problems {
 /**
   *
   * Unique
   *
   * Given an array of integers, return a list with all duplicates removed.*
   *
   * Parameters
   * Input: arr {Array of Integers}
   * Output: {List of Integers}
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

    public static List<int> unique(int[] arr) {
        HashSet<int> seen = new HashSet<int>();
        List<int> results = new List<int>();
        for(int i = 0; i < arr.Length; i++) {
            if(!seen.Contains(arr[i])){
                seen.Add(arr[i]);
                results.Add(arr[i]);
            }
        }
        return results;
    }


  /**
    * Word Count
    *
    * Given a body of text, return a dictionary/hash table of the frequency of each word.
    *
    * Parameters
    * Input: sentence {string}
    * Output: {Dictionary <string, int>}
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

    public static Dictionary<string, int> wordCount(string sentence) {
        Dictionary<string, int> wordCounts = new Dictionary<string, int>();
        if(sentence.Length > 0) {
            HashSet<char> punctuations = new HashSet<char>(){'?', '!', '.', '\'',','};
            string filteredSentence = "";
            foreach(char ch in sentence) {
                if(punctuations.Contains(ch) == false) {
                    filteredSentence += Char.ToLower(ch);
                }
            }

            string[] words = filteredSentence.Split();
            foreach(string word in words) {
                if(wordCounts.ContainsKey(word)){
                    wordCounts[word] += 1;
                } else {
                    wordCounts[word] = 1;
                }
            }
        }
        return wordCounts;


    }


 /**
   * RGB Set
   *
   * Given a string of characters where each character is either 'r', 'g', or 'b',
   * determine the number of complete sets of 'rgb' that can be made with the
   * characters.
   *
   * Parameters
   * Input: str {string}
   * Output: {int}
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

    public static int rgb(string str) {
        Dictionary<char, int> counts = new Dictionary<char, int>();
        foreach(char ch in str) {
            int count;
            counts.TryGetValue(ch, out count);
            counts[ch] = count + 1;
        }
        if(counts.Count < 3) return 0;

        int result = int.MaxValue;
        foreach(char c in counts.Keys)  {
            result = counts[c] < result ? counts[c] : result;
        }
        return result;
    }


  /**
    * Missing Number
    *
    * Given range of 1 to N and an array of unique integers that are within that
    * range, return the missing integers not found in the array
    *
    * Parameters
    * Input: n {int}
    * Input: arr {Array of ints}
    * Output: {List of ints}
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

    public static List<int> missingNumber(int n, int[] arr) {
        HashSet<int> nums = new HashSet<int>();
        List<int> result = new List<int>();
        foreach(int i in arr) {
            nums.Add(i);
        }
        for(int i = 1; i <= n; i++) {
            if(!nums.Contains(i)) {
                result.Add(i);
            }
        }
        return result;
    }


 /**
   * Letter Sort
   *
   * Given a string of lowercase letters, return the letters in sorted order.
   *
   * Parameters
   * Input: str {string}
   * Output: {string}
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

   public static string letterSort(string str) {
        int[] chars = new int[26];
        string result = "";
        foreach(char c in str) {
            int charIndex = (int)char.ToLower(c) - 97;
            chars[charIndex] += 1;
        }
        for(int i = 0; i < chars.Length; i++) {
            while(chars[i] > 0) {
                char letter = (char) (i + 97);
                result += letter;
                chars[i] -= 1;
            }
        }
        return result;
   }


  /**
    * Character Mode
    *
    * Given a string, find the most frequent occurring letter(s) in the string
    *
    * Parameters
    * Input: string {string}
    * Output: {string}
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

    public static string characterMode(string str) {
        int[] chars = new int[26];
        string result = "";
        foreach(char ch in str) {
            if(ch != ' ') {
                int charIndex = (int)char.ToLower(ch) - 97;
                chars[charIndex] += 1;
            }
        }
        int max_frequency = 0;

        for(int c = 0; c < chars.Length; c++) {
            max_frequency = Math.Max(max_frequency, chars[c]);
        }
        for(int c = 0; c < chars.Length; c++) {
            if (chars[c] == max_frequency) {
                result += (char) (c + 97);
            }
        }
        return result;
    }


 /**
   * Sort Digits
   *
   * Given an integer, sort the digits in ascending order and return the new integer.
   * Ignore leading zeros.
   *
   * Parameters
   * Input: num {int}
   * Output: {int}
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
        Dictionary<int, int> digitCounts = new Dictionary<int, int>();
        int result = 0;
        while(n > 0) {
            int digit = n % 10;
            if(!digitCounts.ContainsKey(digit)) {
                digitCounts[digit] = 1;
            } else {
                digitCounts[digit]++;
            }
            n = n/10;
        }
        int power = 0;
        for(int i = 9; i > 0; i--) {
            if(digitCounts.ContainsKey(i)) {
                while(digitCounts[i] >= 1) {
                    result += (int)(i * Math.Pow(10, power));
                    power += 1;
                    digitCounts[i]--;
                }
            }
        }
        return result;
   }


  /**
    *  Get Duplicates
    *
    *  Given an array of values, return only the values that have duplicates in the
    *  array
    *
    *  Parameters
    *  Input: arr {int array}
    *  Output: {List of ints}
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

    public static List<int> getDuplicates(int[] arr) {
        HashSet<int> dups = new HashSet<int>();
        HashSet<int> seen = new HashSet<int>();

        foreach(int i in arr) {
            if(!seen.Contains(i)) {
                seen.Add(i);
            } else {
                dups.Add(i);
            }
        }
        return dups.ToList();
    }


  /**
    *  Anagram Pair
    *
    *  Given two strings, determine if the strings are anagrams of one another.
    *
    *  Two words are anagrams of one another if they contain the same letters.
    *
    *  Parameters
    *  Input: str1 {string}
    *  Input: str2 {string}
    *  Output: {bool}
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

    public static bool anagramPair(string str1, string str2) {
        int[] chars = new int[26];

        foreach(char c1 in str1) {
            int charIndex = (int)char.ToLower(c1) - 97;
            chars[charIndex]++;
        }

        foreach(char c2 in str2) {
            int charIndex = (int)char.ToLower(c2) - 97;
            chars[charIndex]--;
        }

        for(int c = 0; c < chars.Length; c++) {
            if(chars[c] != 0) {
                return false;
            }
        }

        return true;
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
     *  Input: str {string}
     *  Output: {bool}
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

    public static bool anagramPalindrome(string str) {
        Dictionary<char, int> counts = new Dictionary<char, int>();
        foreach(char c in str) {
            if(counts.ContainsKey(c)) {
                counts[c]++;
            } else {
                counts[c] = 1;
            }
        }

        int odds = 0;
        foreach(char c in counts.Keys) {
            if(counts[c] % 2 != 0) {
                odds++;
            }
        }
        return odds < 2;
    }

}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{
    public static void Main() {
        uniqueTests();
        wordCountTests();
        rgbCountTests();
        missingNumberTests();
        letterSortTests();
        characterModeTests();
        sortDigitTests();
        getDuplicatesTests();
        anagramPairTests();
        anagramPalindromeTests();
	}

    private static void uniqueTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Unique Tests");
        runTest(uniqueTest1, "should return unique values from sorted list with duplicates", testCount);
        runTest(uniqueTest2, "should return single value for list with all duplicates", testCount);
        runTest(uniqueTest3, "should return unique values from unsorted list with duplicates", testCount);
        runTest(uniqueTest4, "should return an empty list from empty input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void wordCountTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Word Count Tests");
        runTest(wordCountTest1, "should return an object with each word and its frequency", testCount);
        runTest(wordCountTest2, "should return object with each word excluding punctuations", testCount);
        runTest(wordCountTest3, "should return empty object for empty string input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void rgbCountTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("rgb Count Tests");
        runTest(rgbCountTest1, "should return number correct number of rgb from input", testCount);
        runTest(rgbCountTest2, "should return correct number of rgb from input despite characters out of sequence", testCount);
        runTest(rgbCountTest3, "should return 0 as output for no number of rgb", testCount);
        runTest(rgbCountTest4, "should return 0 for empty input", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void missingNumberTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Missing Number Tests");
        runTest(missingNumberTest1, "should return [3] for input of [1, 4, 2]", testCount);
        runTest(missingNumberTest2, "should return [2, 3, 5, 8] for input of [4, 7, 1, 6]", testCount);
        runTest(missingNumberTest3, "should return [3, 5] for input of [6, 4, 2, 1]", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void letterSortTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Letter Sort Tests");
        runTest(letterSortTest1, "should return 'ehllo' for input 'hello'", testCount);
        runTest(letterSortTest2, "should return 'abdehiortw' for input of 'whiteboard'", testCount);
        runTest(letterSortTest3, "should return 'eno' for input 'one'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void characterModeTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Character Mode Tests");
        runTest(characterModeTest1, "should return 'l' for input 'hello'", testCount);
        runTest(characterModeTest2, "should return 'a' when input is 'A walk in the park'", testCount);
        runTest(characterModeTest3, "should return 'no' when input is 'noon'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void sortDigitTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Sort Digits Tests");
        runTest(sortDigitTest1, "should return '789' when input is '8970'", testCount);
        runTest(sortDigitTest2, "should return '23445' when input is '32445'", testCount);
        runTest(sortDigitTest3, "should return '111' when input is '10101'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void getDuplicatesTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Get Duplicates Tests");
        runTest(getDuplicatesTest1, "should return '[2]' when input is '[1, 2, 4, 2]'", testCount);
        runTest(getDuplicatesTest2, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'", testCount);
        runTest(getDuplicatesTest3, "should return '[]' when input is '[1, 2, 3, 4]'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void anagramPairTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Anagram Pair Tests");
        runTest(anagramPairTest1, "should return true when input is 'cat, act'", testCount);
        runTest(anagramPairTest2, "should return false when input is 'cat, dog'", testCount);
        runTest(anagramPairTest3, "should return false when input is 'racecar, aaccrres'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void anagramPalindromeTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Anagram Palindrome Tests");
        runTest(anagramPalindromeTest1, "should return true when input is 'carrace'", testCount);
        runTest(anagramPalindromeTest2, "should return false when input is 'cat'", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }



    private static bool uniqueTest1() {
        List<int> output = Problems.unique(new int[]{1, 2, 4, 4, 5, 6});
        List<int> test = new List<int>() {1, 2, 4, 5, 6};
        return output.SequenceEqual(test);
    }

    private static bool uniqueTest2() {
        List<int> output = Problems.unique(new int[]{2, 2, 2, 2, 2, 2});
        List<int> test = new List<int>() {2};
        return output.SequenceEqual(test);
    }

    private static bool uniqueTest3() {
        List<int> output = Problems.unique(new int[]{1,2,3,1,2});
        List<int> test = new List<int>() {1,2,3};
        return output.SequenceEqual(test);
    }

    private static bool uniqueTest4() {
        List<int> output = Problems.unique(new int[]{});
        List<int> test = new List<int>() {};
        return output.SequenceEqual(test);
    }

    private static bool wordCountTest1() {
        Dictionary<string, int> output = Problems.wordCount("The cat and the hat.");
        return output["the"] == 2 && output["hat"] == 1 && output["cat"] == 1 && output["and"] == 1;
    }

    private static bool wordCountTest2() {
        Dictionary<string, int> output = Problems.wordCount("It's a man, it's a plane, it's superman!");
        return output["its"] == 3 && output["a"] == 2 && output["man"] == 1 && output["plane"] == 1 && output["superman"] == 1;
    }

    private static bool wordCountTest3() {
        Dictionary<string, int> output = Problems.wordCount("");
        return output.Count == 0;
    }

    private static bool rgbCountTest1() {
        int output = Problems.rgb("rgbrgb");
        return output == 2;
    }

    private static bool rgbCountTest2() {
        int output = Problems.rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg");
        return output == 7;
    }

    private static bool rgbCountTest3() {
        int output = Problems.rgb("bbrr");
        return output == 0;
    }

    private static bool rgbCountTest4() {
        int output = Problems.rgb("");
        return output == 0;
    }

    private static bool missingNumberTest1() {
        List<int> output = Problems.missingNumber(4, new int[]{1,4,2});
        List<int> test = new List<int>(){3};
        return output.SequenceEqual(test);
    }

    private static bool missingNumberTest2() {
        List<int> output = Problems.missingNumber(8, new int[]{4, 7, 1, 6});
        List<int> test = new List<int>(){2, 3, 5, 8};
        return output.SequenceEqual(test);
    }

    private static bool missingNumberTest3() {
        List<int> output = Problems.missingNumber(6, new int[]{6, 4, 2, 1});
        List<int> test = new List<int>(){3, 5};
        return output.SequenceEqual(test);
    }

    private static bool letterSortTest1() {
        string output = Problems.letterSort("hello");
        return output.Equals("ehllo");
    }

    private static bool letterSortTest2() {
        string output = Problems.letterSort("whiteboard");
        return output.Equals("abdehiortw");
    }

    private static bool letterSortTest3() {
        string output = Problems.letterSort("one");
        return output.Equals("eno");
    }

    private static bool characterModeTest1() {
        string output = Problems.characterMode("hello");
        return output.Equals("l");
    }

    private static bool characterModeTest2() {
        string output = Problems.characterMode("A walk in the park");
        return output.Equals("a");
    }

    private static bool characterModeTest3() {
        string output = Problems.characterMode("noon");
        return output.Equals("no");
    }

    private static bool sortDigitTest1() {
        int output = Problems.sortDigits(8970);
        return output == 789;
    }

    private static bool sortDigitTest2() {
        int output = Problems.sortDigits(32445);
        return output == 23445;
    }

    private static bool sortDigitTest3() {
        int output = Problems.sortDigits(10101);
        return output == 111;
    }

    private static bool getDuplicatesTest1() {
        List<int> output = Problems.getDuplicates(new int[] {1, 2, 4, 2});
        List<int> test = new List<int>() {2};
        return output.SequenceEqual(test);
    }

    private static bool getDuplicatesTest2() {
        List<int> output = Problems.getDuplicates(new int[] {3, 2, 3, 2, 3, 3, 4});
        List<int> test1 = new List<int>() {2, 3};
        List<int> test2 = new List<int>() {3, 2};
        return output.SequenceEqual(test1) || output.SequenceEqual(test2);
    }

    private static bool getDuplicatesTest3() {
        List<int> output = Problems.getDuplicates(new int[] {1, 2, 3, 4});
        return output.Count == 0;
    }

    private static bool anagramPairTest1() {
        return Problems.anagramPair("cat", "act");
    }

    private static bool anagramPairTest2() {
        return !Problems.anagramPair("cat", "dog");
    }

    private static bool anagramPairTest3() {
        return !Problems.anagramPair("racecar", "aaccrres");
    }

    private static bool anagramPalindromeTest1() {
        return Problems.anagramPalindrome("carrace");
    }

    private static bool anagramPalindromeTest2() {
        return !Problems.anagramPalindrome("cat");
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
