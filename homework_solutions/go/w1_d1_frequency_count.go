/*
 * Homework - Frequency Count
 * Utilize the frequency count pattern to solve these problems.  Use a Hash Set
 * or an Array instead of a Hash Table where applicable.
 */

package main
import (
  "fmt"
  "strconv"
  "strings"
  "math"
)

/**
 *
 * Unique
 *
 * Given an array/vector of integers, return an array/vector with all duplicates removed.*
 *
 * Parameters
 * Input: arr {array of Integers}
 * Output: {array of Integers}
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

func unique(arr []int) []int {
  seen := make(map[int]bool)
  results := []int{}
  for _,val := range arr {
    if !seen[val] {
      results = append(results, val)
      seen[val] = true
    }
  }
  return results
}


/**
* Word Count
*
* Given a body of text, return a hash table of the frequency of each word.
*
* Parameters
* Input: sentence {string}
* Output: {map <string, int>}
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

func wordCount(sentence string) map[string]int {
  sentence = strings.ToLower(sentence)
  wordCounts := make(map[string]int)
  punctuations := make(map[rune]bool)
  punctuations['?'] = true
  punctuations['!'] = true
  punctuations['.'] = true
  punctuations['\''] = true
  punctuations[','] = true
  if len(sentence) > 0 {
    filteredSentence := ""
    for _, char := range sentence {
      if !punctuations[char] {
          filteredSentence += string(char)
      }
    }
    var words []string = strings.Split(filteredSentence, " ")
    for _,word := range words {
      wordCounts[word] += 1
    }

  }
  return wordCounts
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

func rgb(str string) int {
  counts := make(map[rune]int)
  for _, ch := range str {
      counts[ch]++
  }
  if len(counts) < 3 { return 0 }

  result := math.MaxInt64

  for c := range counts  {
    if counts[c] < result {
      result = counts[c]
    }
  }
  return result
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

func missingNumber(n int, arr []int) []int {
  nums := make(map[int]bool)
  result := []int{}
  for _,i := range arr {
      nums[i] = true
  }
  for i := 1; i <= n; i++ {
    if !nums[i] {
      result = append(result, i)
    }
  }
  return result
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

func letterSort(str string ) string {
  str = strings.ToLower(str)
  chars := make([]int, 26)
  result := ""
  var charIndex int
  for _,c := range str {
     charIndex = int(c) - 97
     chars[charIndex]++
  }
  for i := 0; i < 26; i++ {
     for chars[i] > 0 {
         letter := string(rune(i + 97))
         result += letter
         chars[i]--
     }
  }
  return result
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

func characterMode(str string) string {
  str = strings.ToLower(str)
  chars := make([]int, 26)
  result := ""
  var charIndex int
  for _,ch := range str {
    if ch != ' ' {
      charIndex = int(ch) - 97
      chars[charIndex]++
    }
  }
  max_frequency := 0

  for c := 0; c < 26; c++ {
    if chars[c] > max_frequency {
      max_frequency = chars[c]
    }
  }
  for c := 0; c < 26; c++ {
    if chars[c] == max_frequency {
      result += string(rune(c + 97))
    }
  }
  return result
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

func sortDigits(n int) int {
  digitCounts := make(map[int]int)
  result := 0
  var digit int
  for n > 0 {
    digit = n % 10
    digitCounts[digit]++
    n = n/10
  }
  power := 0;
  for i := 9; i > 0; i-- {
    for digitCounts[i] >= 1 {
      result += i * int(math.Pow10(power))
      power++
      digitCounts[i]--
    }
  }
  return result
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

func getDuplicates(arr []int) []int {
  dups := make(map[int]bool)
  seen := make(map[int]bool)

  for _,i := range arr {
    if !seen[i] {
      seen[i] = true
    } else {
      dups[i] = true
    }
  }
  dupList := make([]int, 0, len(dups))
  for k := range dups { dupList = append(dupList, k) }
  return dupList
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

func anagramPair(str1 string, str2 string) bool {
  str1 = strings.ToLower(str1)
  str2 = strings.ToLower(str2)
  chars := make([]int, 26)
  var charIndex int
  for _,c1 := range str1 {
    charIndex = int(c1) - 97
    chars[charIndex]++
  }

  for _,c2 := range str2 {
    charIndex = int(c2) - 97
    chars[charIndex]--
  }

  for c := 0; c < 26; c++ {
    if chars[c] != 0 {
      return false
    }
  }

  return true
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

func anagramPalindrome(str string) bool {
  counts := make(map[rune]int)
  for _,c := range str {
    counts[c]++
  }

  odds := 0
  for key := range counts {
    if counts[key] % 2 != 0 {
       odds++
    }
  }
  return odds < 2
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  uniqueTests()
  wordCountTests()
  rgbCountTests()
  missingNumberTests()
  letterSortTests()
  characterModeTests()
  sortDigitTests()
  getDuplicatesTests()
  anagramPairTests()
  anagramPalindromeTests()
}

func uniqueTests(){
  testCount := []int{0, 0}
  fmt.Println("Unique Tests")
  runTest(uniqueTest1, "should return unique values from sorted list with duplicates", testCount)
  runTest(uniqueTest2, "should return single value for list with all duplicates", testCount)
  runTest(uniqueTest3, "should return unique values from unsorted list with duplicates", testCount)
  runTest(uniqueTest4, "should return an empty list from empty input", testCount)
  printTestsPassed(testCount)
}

func wordCountTests() {
  testCount := []int{0, 0}
  fmt.Println("Word Count Tests")
  runTest(wordCountTest1, "should return an object with each word and its frequency", testCount)
  runTest(wordCountTest2, "should return object with each word excluding punctuations", testCount)
  runTest(wordCountTest3, "should return empty object for empty string input", testCount)
  printTestsPassed(testCount)
}

func rgbCountTests() {
  testCount := []int{0, 0}
  fmt.Println("rgb Count Tests")
  runTest(rgbCountTest1, "should return number correct number of rgb from input", testCount)
  runTest(rgbCountTest2, "should return correct number of rgb from input despite characters out of sequence", testCount)
  runTest(rgbCountTest3, "should return 0 as output for no number of rgb", testCount)
  runTest(rgbCountTest4, "should return 0 for empty input", testCount)
  printTestsPassed(testCount)
}

func missingNumberTests() {
  testCount := []int{0, 0}
  fmt.Println("Missing Number Tests")
  runTest(missingNumberTest1, "should return [3] for input of [1, 4, 2]", testCount)
  runTest(missingNumberTest2, "should return [2, 3, 5, 8] for input of [4, 7, 1, 6]", testCount)
  runTest(missingNumberTest3, "should return [3, 5] for input of [6, 4, 2, 1]", testCount)
  printTestsPassed(testCount)
}

func letterSortTests() {
  testCount := []int{0, 0}
  fmt.Println("Letter Sort Tests")
  runTest(letterSortTest1, "should return 'ehllo' for input 'hello'", testCount)
  runTest(letterSortTest2, "should return 'abdehiortw' for input of 'whiteboard'", testCount)
  runTest(letterSortTest3, "should return 'eno' for input 'one'", testCount)
  printTestsPassed(testCount)
}

func characterModeTests() {
  testCount := []int{0, 0}
  fmt.Println("Character Mode Tests")
  runTest(characterModeTest1, "should return 'l' for input 'hello'", testCount)
  runTest(characterModeTest2, "should return 'a' when input is 'A walk in the park'", testCount)
  runTest(characterModeTest3, "should return 'no' when input is 'noon'", testCount)
  printTestsPassed(testCount)
}

func sortDigitTests() {
  testCount := []int{0, 0}
  fmt.Println("Sort Digits Tests")
  runTest(sortDigitTest1, "should return '789' when input is '8970'", testCount)
  runTest(sortDigitTest2, "should return '23445' when input is '32445'", testCount)
  runTest(sortDigitTest3, "should return '111' when input is '10101'", testCount)
  printTestsPassed(testCount)
}

func getDuplicatesTests() {
  testCount := []int{0, 0}
  fmt.Println("Get Duplicates Tests")
  runTest(getDuplicatesTest1, "should return '[2]' when input is '[1, 2, 4, 2]'", testCount)
  runTest(getDuplicatesTest2, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'", testCount)
  runTest(getDuplicatesTest3, "should return '[]' when input is '[1, 2, 3, 4]'", testCount)
  printTestsPassed(testCount)
}

func anagramPairTests() {
  testCount := []int{0, 0}
  fmt.Println("Anagram Pair Tests")
  runTest(anagramPairTest1, "should return true when input is 'cat, act'", testCount)
  runTest(anagramPairTest2, "should return false when input is 'cat, dog'", testCount)
  runTest(anagramPairTest3, "should return false when input is 'racecar, aaccrres'", testCount)
  printTestsPassed(testCount)
}

func anagramPalindromeTests() {
  testCount := []int{0, 0}
  fmt.Println("Anagram Palindrome Tests")
  runTest(anagramPalindromeTest1, "should return true when input is 'carrace'", testCount)
  runTest(anagramPalindromeTest2, "should return false when input is 'cat'", testCount)
  printTestsPassed(testCount)
}


func uniqueTest1() bool {
  var output []int = unique([]int{1, 2, 4, 4, 5, 6})
  test := []int{1, 2, 4, 5, 6}
  return areEqual(output, test)
}

func uniqueTest2() bool {
  var output []int = unique([]int{2, 2, 2, 2, 2, 2})
  test := []int{2}
  return areEqual(output, test)
}

func uniqueTest3() bool {
  var output []int = unique([]int{1,2,3,1,2})
  test := []int{1,2,3}
  return areEqual(output, test)
}

func uniqueTest4() bool {
  var output []int = unique([]int{})
  test := []int{}
  return areEqual(output, test)
}



func wordCountTest1() bool {
    var output map[string]int = wordCount("The cat and the hat.")
    return output["the"] == 2 && output["hat"] == 1 && output["cat"] == 1 && output["and"] == 1
}

func wordCountTest2() bool {
    var output map[string]int = wordCount("It's a man, it's a plane, it's superman!")
    return output["its"] == 3 && output["a"] == 2 && output["man"] == 1 && output["plane"] == 1 && output["superman"] == 1
}

func wordCountTest3() bool {
    var output map[string]int = wordCount("")
    return len(output) == 0
}



func rgbCountTest1() bool {
    return rgb("rgbrgb") == 2
}

func rgbCountTest2() bool {
    return rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg") == 7
}

func rgbCountTest3() bool {
    return rgb("bbrr") == 0
}

func rgbCountTest4() bool {
    return rgb("") == 0
}


func missingNumberTest1() bool {
    var output []int = missingNumber(4, []int{1,4,2})
    test := []int{3}
    return areEqual(output, test)
}

func missingNumberTest2() bool {
    var output []int = missingNumber(8, []int{4, 7, 1, 6})
    test := []int{2, 3, 5, 8}
    return areEqual(output, test)
}

func missingNumberTest3() bool {
    var output []int = missingNumber(6, []int{6, 4, 2, 1})
    test := []int{3, 5}
    return areEqual(output, test)
}



func letterSortTest1() bool {
    return letterSort("hello") == "ehllo"
}

func letterSortTest2() bool {
    return letterSort("whiteboard") == "abdehiortw"
}

func letterSortTest3() bool {
    return letterSort("one") == "eno"
}



func characterModeTest1() bool {
    return characterMode("hello") == ("l")
}

func characterModeTest2() bool {
    return characterMode("A walk in the park") == ("a")
}

func characterModeTest3() bool {
    return characterMode("noon") == ("no")
}


func sortDigitTest1() bool {
    return sortDigits(8970) == 789
}

func sortDigitTest2() bool {
    return sortDigits(32445) == 23445
}

func sortDigitTest3() bool {
    return sortDigits(10101) == 111
}

func getDuplicatesTest1() bool {
    var output []int = getDuplicates([]int{1, 2, 4, 2})
    test := []int{2}
    return areEqual(output, test)
}

func getDuplicatesTest2() bool {
    var output []int = getDuplicates([]int{3, 2, 3, 2, 3, 3, 4})
    test1 := []int{2, 3}
    test2 := []int{3, 2}
    return areEqual(output, test1) || areEqual(output, test2)
}

func getDuplicatesTest3() bool {
    var output []int = getDuplicates([]int{1, 2, 3, 4})
    return len(output) == 0
}



func anagramPairTest1() bool {
    return anagramPair("cat", "act")
}

func anagramPairTest2() bool {
    return !anagramPair("cat", "dog")
}

func anagramPairTest3() bool {
    return !anagramPair("racecar", "aaccrres")
}



func anagramPalindromeTest1() bool {
    return anagramPalindrome("carrace")
}

func anagramPalindromeTest2() bool {
    return !anagramPalindrome("cat")
}


/*** Utility Functions ***/
func areEqual(list1 []int, list2 []int) bool {
  if(len(list1) != len(list2)) {
    return false
  }
  for i := 0; i < len(list1) ; i++ {
    if(list1[i] != list2[i]) {
      return false
    }
  }
  return true
}

func runTest(test func() bool, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = test()
  if(testPassed) {testCount[0]++}
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
  fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
