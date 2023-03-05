/*
 * Homework - Frequency Count
 * Utilize the frequency count pattern to solve these problems.  Use a Hash Set
 * or an Array instead of a Hash Table where applicable.
 */

#include <cmath>
#include <string>
#include <vector>
#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <iostream>
using namespace std;

/**
 *
 * Unique
 *
 * Given an array/vector of integers, return an array/vector with all duplicates removed.*
 *
 * Parameters
 * Input: arr {array/vector of Integers}
 * Output: {array/vector of Integers}
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

vector<int> unique(vector<int> arr) {
  unordered_set<int> seen;
  vector<int> results;
  for(int i=0; i<arr.size(); i++) {
    if(seen.find(arr[i]) == seen.end()) {
      seen.insert(arr[i]);
      results.push_back(arr[i]);
    }
  }
  return results;
}


/**
* Word Count
*
* Given a body of text, return a hash table of the frequency of each word.
*
* Parameters
* Input: sentence {string}
* Output: {unordered_map <string, int>}
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

unordered_map<string, int> wordCount(string sentence) {
  unordered_map<string, int> wordCounts;
  if(sentence.length() > 0) {
    unordered_set<char> punctuations{'?', '!', '.', '\'',','};
    string filteredSentence = "";
    for(char ch: sentence) {
      if(punctuations.find(ch) == punctuations.end()) {
          filteredSentence += tolower(ch);
      }
    }

    int start = 0;
    int end = filteredSentence.find(' ');
    string currWord;
    while (start != -1){
      if(end == string::npos) {
        currWord = filteredSentence.substr(start, end);
        start = -1;
      } else {
        currWord = filteredSentence.substr(start, end - start);
        start = end + 1;
        end = filteredSentence.find(' ', start);
      }
      wordCounts[currWord]++;
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

int rgb(string str) {
  unordered_map<char, int> counts;
  for(char ch: str) {
      counts[ch]++;
  }
  if(counts.size() < 3) return 0;

  int result = numeric_limits<int>::max();
  for(auto map_pair: counts)  {
      result = map_pair.second < result ? map_pair.second : result;
  }
  return result;
}



/**
* Missing Number
*
* Given range of 1 to N and an array/vector of unique integers that are within that
* range, return the missing integers not found in the array
*
* Parameters
* Input: n {int}
* Input: arr {Array/vector of ints}
* Output: {Array/vector of ints}
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

vector<int> missingNumber(int n, vector<int> arr) {
  unordered_set<int> nums;
  vector<int> result;
  for(int i: arr) {
      nums.insert(i);
  }
  for(int i = 1; i <= n; i++) {
      if(nums.find(i) == nums.end()) {
          result.push_back(i);
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

string letterSort(string str) {
  int chars[26] = {0};
  string result = "";
  int charIndex;
  for(char c: str) {
     charIndex = (int)tolower(c) - 97;
     chars[charIndex]++;
  }
  for(int i = 0; i < 26; i++) {
     while(chars[i] > 0) {
         char letter = (char) (i + 97);
         result += letter;
         chars[i]--;
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

string characterMode(string str) {
  int chars[26] = {0};
  string result = "";
  for(char ch: str) {
    if(ch != ' ') {
        int charIndex = (int)tolower(ch) - 97;
        chars[charIndex]++;
    }
  }
  int max_frequency = 0;

  for(int c = 0; c < 26; c++) {
    max_frequency = max(max_frequency, chars[c]);
  }
  for(int c = 0; c < 26; c++) {
    if (chars[c] == max_frequency) {
        result += (char) (c + 97);
    }
  }
  return result;
}



/**
* Sort Digits
*
* Given an integer, sort the digits in ascending order and return the integer.
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

int sortDigits(int n) {
  unordered_map<int, int> digitCounts;
  int result = 0;
  int digit;
  while(n > 0) {
    digit = n % 10;
    digitCounts[digit]++;
    // if(digitCounts.find(digit) == digitCounts.end()) {
    //   digitCounts[digit] = 1;
    // } else {
    //   digitCounts[digit]++;
    // }
    n = n/10;
  }
  int power = 0;
  for(int i = 9; i > 0; i--) {
    if(digitCounts.find(i) != digitCounts.end()) {
      while(digitCounts[i] >= 1) {
        result += (int)(i * pow(10, power));
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

vector<int> getDuplicates(vector<int> arr) {
  unordered_set<int> dups;
  unordered_set<int> seen;

  for(int i: arr) {
    if(seen.find(i) == seen.end()) {
      seen.insert(i);
    } else {
      dups.insert(i);
    }
  }
  return vector<int>(dups.begin(), dups.end());
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

bool anagramPair(string str1, string str2) {
  int chars[26] = {0};
  int charIndex;
  for(char c1: str1) {
    charIndex = (int)tolower(c1) - 97;
    chars[charIndex]++;
  }

  for(char c2: str2) {
    charIndex = (int)tolower(c2) - 97;
    chars[charIndex]--;
  }

  for(int c = 0; c < 26; c++) {
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

bool anagramPalindrome(string str) {
  unordered_map<char, int> counts;
  for(char c: str) {
    counts[c]++;
  }

  int odds = 0;
  for(auto counts_pair: counts) {
    if(counts_pair.second % 2 != 0) {
       odds++;
    }
  }
  return odds < 2;
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void uniqueTests(), wordCountTests(), rgbCountTests(), missingNumberTests(), letterSortTests();
void characterModeTests(), sortDigitTests(), getDuplicatesTests(), anagramPairTests(), anagramPalindromeTests();

bool uniqueTest1(), uniqueTest2(), uniqueTest3(), uniqueTest4();
bool wordCountTest1(), wordCountTest2(), wordCountTest3();
bool rgbCountTest1(), rgbCountTest2(), rgbCountTest3(), rgbCountTest4();
bool missingNumberTest1(), missingNumberTest2(), missingNumberTest3();
bool letterSortTest1(), letterSortTest2(), letterSortTest3();
bool characterModeTest1(), characterModeTest2(), characterModeTest3();
bool sortDigitTest1(), sortDigitTest2(), sortDigitTest3();
bool getDuplicatesTest1(), getDuplicatesTest2(), getDuplicatesTest3();
bool anagramPairTest1(), anagramPairTest2(), anagramPairTest3();
bool anagramPalindromeTest1(), anagramPalindromeTest2();



int main() {
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
	return 0;

}

void uniqueTests(){
  int testCount[] = {0, 0};
  cout << "Unique Tests" << endl;
  runTest(uniqueTest1, "should return unique values from sorted list with duplicates", testCount);
  runTest(uniqueTest2, "should return single value for list with all duplicates", testCount);
  runTest(uniqueTest3, "should return unique values from unsorted list with duplicates", testCount);
  runTest(uniqueTest4, "should return an empty list from empty input", testCount);
  printTestsPassed(testCount);
}

void wordCountTests() {
  int testCount[] = {0, 0};
  cout << "Word Count Tests" << endl;
  runTest(wordCountTest1, "should return an object with each word and its frequency", testCount);
  runTest(wordCountTest2, "should return object with each word excluding punctuations", testCount);
  runTest(wordCountTest3, "should return empty object for empty string input", testCount);
  printTestsPassed(testCount);
}

void rgbCountTests() {
  int testCount[] = {0, 0};
  cout << "rgb Count Tests" << endl;
  runTest(rgbCountTest1, "should return number correct number of rgb from input", testCount);
  runTest(rgbCountTest2, "should return correct number of rgb from input despite characters out of sequence", testCount);
  runTest(rgbCountTest3, "should return 0 as output for no number of rgb", testCount);
  runTest(rgbCountTest4, "should return 0 for empty input", testCount);
  printTestsPassed(testCount);
}

void missingNumberTests() {
  int testCount[] = {0, 0};
  cout << "Missing Number Tests" << endl;
  runTest(missingNumberTest1, "should return [3] for input of [1, 4, 2]", testCount);
  runTest(missingNumberTest2, "should return [2, 3, 5, 8] for input of [4, 7, 1, 6]", testCount);
  runTest(missingNumberTest3, "should return [3, 5] for input of [6, 4, 2, 1]", testCount);
  printTestsPassed(testCount);
}

void letterSortTests() {
  int testCount[] = {0, 0};
  cout << "Letter Sort Tests" << endl;
  runTest(letterSortTest1, "should return 'ehllo' for input 'hello'", testCount);
  runTest(letterSortTest2, "should return 'abdehiortw' for input of 'whiteboard'", testCount);
  runTest(letterSortTest3, "should return 'eno' for input 'one'", testCount);
  printTestsPassed(testCount);
}

void characterModeTests() {
  int testCount[] = {0, 0};
  cout << "Character Mode Tests" << endl;
  runTest(characterModeTest1, "should return 'l' for input 'hello'", testCount);
  runTest(characterModeTest2, "should return 'a' when input is 'A walk in the park'", testCount);
  runTest(characterModeTest3, "should return 'no' when input is 'noon'", testCount);
  printTestsPassed(testCount);
}

void sortDigitTests() {
  int testCount[] = {0, 0};
  cout << "Sort Digits Tests" << endl;
  runTest(sortDigitTest1, "should return '789' when input is '8970'", testCount);
  runTest(sortDigitTest2, "should return '23445' when input is '32445'", testCount);
  runTest(sortDigitTest3, "should return '111' when input is '10101'", testCount);
  printTestsPassed(testCount);
}

void getDuplicatesTests() {
  int testCount[] = {0, 0};
  cout << "Get Duplicates Tests" << endl;
  runTest(getDuplicatesTest1, "should return '[2]' when input is '[1, 2, 4, 2]'", testCount);
  runTest(getDuplicatesTest2, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'", testCount);
  runTest(getDuplicatesTest3, "should return '[]' when input is '[1, 2, 3, 4]'", testCount);
  printTestsPassed(testCount);
}

void anagramPairTests() {
  int testCount[] = {0, 0};
  cout << "Anagram Pair Tests" << endl;
  runTest(anagramPairTest1, "should return true when input is 'cat, act'", testCount);
  runTest(anagramPairTest2, "should return false when input is 'cat, dog'", testCount);
  runTest(anagramPairTest3, "should return false when input is 'racecar, aaccrres'", testCount);
  printTestsPassed(testCount);
}

void anagramPalindromeTests() {
  int testCount[] = {0, 0};
  cout << "Anagram Palindrome Tests" << endl;
  runTest(anagramPalindromeTest1, "should return true when input is 'carrace'", testCount);
  runTest(anagramPalindromeTest2, "should return false when input is 'cat'", testCount);
  printTestsPassed(testCount);
}


bool uniqueTest1() {
  vector<int> output = unique(vector<int>{1, 2, 4, 4, 5, 6});
  vector<int> test{1, 2, 4, 5, 6};
  return output == test;
}

bool uniqueTest2() {
  vector<int> output = unique(vector<int>{2, 2, 2, 2, 2, 2});
  vector<int> test{2};
  return output == test;
}

bool uniqueTest3() {
  vector<int> output = unique(vector<int>{1,2,3,1,2});
  vector<int> test{1,2,3};
  return output == test;
}

bool uniqueTest4() {
  vector<int> output = unique(vector<int>{});
  vector<int> test{};
  return output == test;
}



bool wordCountTest1() {
    unordered_map<string, int> output = wordCount("The cat and the hat.");
    return output["the"] == 2 && output["hat"] == 1 && output["cat"] == 1 && output["and"] == 1;
}

bool wordCountTest2() {
    unordered_map<string, int> output = wordCount("It's a man, it's a plane, it's superman!");
    return output["its"] == 3 && output["a"] == 2 && output["man"] == 1 && output["plane"] == 1 && output["superman"] == 1;
}

bool wordCountTest3() {
    unordered_map<string, int> output = wordCount("");
    return output.size() == 0;
}



bool rgbCountTest1() {
    int output = rgb("rgbrgb");
    return output == 2;
}

bool rgbCountTest2() {
    int output = rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg");
    return output == 7;
}

bool rgbCountTest3() {
    int output = rgb("bbrr");
    return output == 0;
}

bool rgbCountTest4() {
    int output = rgb("");
    return output == 0;
}


bool missingNumberTest1() {
    vector<int> output = missingNumber(4, vector<int>{1,4,2});
    vector<int> test{3};
    return output == test;
}

bool missingNumberTest2() {
    vector<int> output = missingNumber(8, vector<int>{4, 7, 1, 6});
    vector<int> test{2, 3, 5, 8};
    return output == test;
}

bool missingNumberTest3() {
    vector<int> output = missingNumber(6, vector<int>{6, 4, 2, 1});
    vector<int> test{3, 5};
    return output == test;
}



bool letterSortTest1() {
    string output = letterSort("hello");
    // cout << output << endl;
    return output == "ehllo";
}

bool letterSortTest2() {
    string output = letterSort("whiteboard");
    return output == "abdehiortw";
}

bool letterSortTest3() {
    string output = letterSort("one");
    return output == "eno";
}



bool characterModeTest1() {
    string output = characterMode("hello");
    return output == ("l");
}

bool characterModeTest2() {
    string output = characterMode("A walk in the park");
    return output == ("a");
}

bool characterModeTest3() {
    string output = characterMode("noon");
    return output == ("no");
}


bool sortDigitTest1() {
    int output = sortDigits(8970);
    return output == 789;
}

bool sortDigitTest2() {
    int output = sortDigits(32445);
    return output == 23445;
}

bool sortDigitTest3() {
    int output = sortDigits(10101);
    return output == 111;
}

bool getDuplicatesTest1() {
    vector<int> output = getDuplicates(vector<int>{1, 2, 4, 2});
    vector<int> test = vector<int>{2};
    return output == test;
}

bool getDuplicatesTest2() {
    vector<int> output = getDuplicates(vector<int>{3, 2, 3, 2, 3, 3, 4});
    vector<int> test1 = vector<int>{2, 3};
    vector<int> test2 = vector<int>{3, 2};
    return output == test1 || output == test2;
}

bool getDuplicatesTest3() {
    vector<int> output = getDuplicates(vector<int>{1, 2, 3, 4});
    return output.size() == 0;
}



bool anagramPairTest1() {
    return anagramPair("cat", "act");
}

bool anagramPairTest2() {
    return !anagramPair("cat", "dog");
}

bool anagramPairTest3() {
    return !anagramPair("racecar", "aaccrres");
}



bool anagramPalindromeTest1() {
    return anagramPalindrome("carrace");
}

bool anagramPalindromeTest2() {
    return !anagramPalindrome("cat");
}


// this is to wrap the test and check for exceptions
void runTest (bool test(), string testName, int testCount[]){
  testCount[1]++;
  bool testPassed = test();
  if(testPassed) testCount[0]++;
  string result = "  " + (to_string(testCount[1]) + ")   ") + (testPassed ? "true" : "false") + " : " + testName;
  cout << result << endl;
}

// this is to print the number of test cases passed for a test suite function
void printTestsPassed(int testCount[]) {
  cout << "PASSED: " + to_string(testCount[0]) + " / " + to_string(testCount[1]) + "\n\n" <<endl;
}
