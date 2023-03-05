import Foundation

/**
 * Homework - Frequency Count
 *
 * Utilize the frequency count pattern to solve these problems.  Use a Hash Set
 * or an Array instead of a Hash Table where applicable.
 *
 * 1. Unique
 *
 * Given an array of integers, return an array with all duplicates removed.*
 *
 * Parameters
 * Input: arr {Array of Integers}
 * Output: {Array of Integers}
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

 func unique(_ arr:[Int]) -> [Int] {
   var seen:[Int:Int] = [:]
   var results:[Int] = []
   for i in 0..<arr.count {
       seen[arr[i]] = 1
   }
   for i in 0..<arr.count {
     if(seen[arr[i]]! == 1) {
       results.append(arr[i])
       seen[arr[i]]! = 0
     }
   }
   return results
 }



/**
 * 2. Word Count
 *
 * Given an body of text, return a hash table of the frequency of each word.
 *
 * Parameters
 * Input: text {String}
 * Output: {Hash Table}
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

 func wordCount(_ sentence: String) -> [String: Int] {
   let punctuations: [String] = ["?", "!", ".", "'", ","]
   var filteredSentence: String = ""
   var wordCounts: [String: Int] = [:]
   if sentence.count == 0 {
     return wordCounts
   }
   for i in sentence.indices {
     if(punctuations.firstIndex(of: String(sentence[i])) == nil) {
       filteredSentence += String(sentence[i]).lowercased()
     }
   }
   let words:[String] = filteredSentence.components(separatedBy : " ")

   for i in 0..<words.count {
     if (wordCounts[words[i]] == nil) {
       wordCounts[words[i]] = 1
     } else {
       wordCounts[words[i]] = wordCounts[words[i]]! + 1
     }
   }
   return wordCounts
 }



/**
* 3. RGB Set
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

func rgb(_ str: String) -> Int {
  var count : [String : Int] = [:]
  let letters : [String] = ["r", "g", "b"]

  for i in str.indices {
    if(count[String([str[i]])] == nil) {
      count[String([str[i]])] = 1
    } else {
      count[String([str[i]])] = count[String([str[i]])]! + 1
    }
  }
  var numOfPairs = Int.max
  if(count.count < 3) {
    return 0
  }
  for i in 0..<letters.count {
    if(count[letters[i]]! < numOfPairs) {
      numOfPairs = count[letters[i]]!
    }
  }
  return numOfPairs
}




/**
 * 4. Missing Number
 *
 * Given range of 1 to N and an array of unique integers that are within that
 * range, return the missing integers not found in the array
 *
 * Parameters
 * Input: n {Integer}
 * Input: arr {Array of Integers}
 * Output: {Array of Integers}
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

 func missingNumber(_ n: Int, _ arr: [Int]) -> [Int] {
   var count : [Int:Int] = [:]
   var result : [Int] = []
   for i in 0..<arr.count {
     if(count[arr[i]] == nil) {
       count[arr[i]] = 1
     }
   }

   for i in 1..<n+1 {
     if count[i] == nil {
       result.append(i)
     }
   }
   return result
 }



/**
 * 5. Letter Sort
 *
 * Given a string of letters, return the letters in sorted order.
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

 func letterSort(_ string: String) -> String {
   var chars = [Int](repeating: 0, count: 26)
   var sortedString : String = ""

   for i in string.utf16 {
     chars[Int(i) - 97] += 1
   }

   for i in 0..<chars.count {
     while(chars[i] > 0) {
       sortedString += String(UnicodeScalar(i + 97)!)
       chars[i] -= 1
     }
   }

   return sortedString
 }



/**
* 6. Character Mode
*
* Given a string, find the most frequent occurring letter(s) in the string
*
* Parameters
* Input: str {String}
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

func characterMode(_ string: String) -> String {
  var lowercase : String = ""
  for i in string.indices {
    lowercase += String(string[i]).lowercased()
  }

  var chars = [Int](repeating: 0, count: 26)
  var result : String = ""

  for i in lowercase.utf16 {
    if(Int(i) >= 97 && Int(i) < 123) {
      chars[Int(i) - 97] += 1
    }
  }

  var max_frequency = 0

  for i in 0..<chars.count {
    if (chars[i] > max_frequency) {
      max_frequency = chars[i]
    }
  }

  for i in 0..<chars.count {
    if (chars[i] == max_frequency) {
      result += String(UnicodeScalar(i + 97)!)
    }
  }

  return result
}



/**
 * 7. Sort Digits
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


func sortDigits(_ n : Int) -> Int {
  var digitCounts:[Int:Int] = [:]
  var result: Int = 0
  var digit: Int
  var n: Int = n
  while n > 0 {
    digit = n % 10
    if digitCounts[digit] == nil {
      digitCounts[digit] = 1
    } else {
      digitCounts[digit] = digitCounts[digit]! + 1
    }
    n = n/10
  }
  var power = 0
  for i in (0...10).reversed() {
    if digitCounts[i] != nil {
      while digitCounts[i]! >= 1 {
        result += i * Int(pow(Double(10), Double(power)))
        power += 1
        digitCounts[i]! = digitCounts[i]! - 1
      }
    }
  }
  return result
}



/**
 *  8. Get Duplicates
 *
 *  Given an array of values, return only the values that have duplicates in the
 *  array
 *
 *  Parameters
 *  Input: arr {Array}
 *  Output: {Array}
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

 func getDuplicates(_ arr: [Int]) -> [Int] {
   var count : [Int : Int] = [:]
   var result: [Int] = []
   for i in 0..<arr.count {
     if(count[arr[i]] == nil) {
       count[arr[i]] = 1
     } else {
       count[arr[i]] = count[arr[i]]! + 1
     }
   }
   for i in 0..<arr.count {
     if(count[arr[i]]! > 1) {
       result.append(arr[i])
       count[arr[i]]! = 0
     }
   }
   return result
 }



/**
 *  9. Anagram Pair
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

 func anagramPair(_ string1: String, _ string2: String) -> Bool {
   var letters = [Int](repeating: 0, count: 26)

   for i in string1.utf16 {
     letters[Int(i) - 97] += 1
   }

   for i in string2.utf16 {
     letters[Int(i) - 97] -= 1
   }

   for i in 0..<letters.count {
     if(letters[i] != 0) {
       return false
     }
   }

   return true
 }



/**
 *  10. Anagram Palindrome
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

 func anagramPalindrome (_ string : String) -> Bool {
   var letters = [Int](repeating: 0, count: 26)

   for i in string.utf16 {
     letters[Int(i) - 97] += 1
   }

   var numOfOdds: Int = 0

   for i in 0..<letters.count {
     if(letters[i] % 2 != 0) {
       numOfOdds += 1
     }
   }
   return numOfOdds < 2
 }




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}

var testCount: [Int] = [0, 0]


print("Unique Tests")

assert(&testCount, "should return unique values from sorted list with duplicates",  {
  let test:[Int] = unique([1, 2, 4, 4, 5, 6])
  return test.sorted() == [1, 2, 4, 5, 6]
})

assert(&testCount, "should return single value for list with all duplicates",  {
  let test:[Int] = unique([2, 2, 2, 2, 2, 2, 2])
  return test.sorted() == [2]
})

assert(&testCount, "should return unique values from unsorted list with duplicates",  {
  let test:[Int] = unique([1, 2, 3, 1, 2])
  return test.sorted() == [1, 2, 3]
})

assert(&testCount, "should return an empty list from empty input",  {
  let test:[Int] = unique([])
  return test.sorted() == []
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Word Count Tests")

assert(&testCount, "should return a dictionary with each word and its frequency",  {
  let test:[String: Int] = wordCount("The cat and the hat.")
  let expected: [String: Int] = ["the": 2, "cat": 1, "and": 1, "hat": 1]
  return NSDictionary(dictionary: test).isEqual(expected)
})

assert(&testCount, "should return dictionary with each word excluding punctuations",  {
  let test:[String: Int] = wordCount("It's a man, it's a plane, it's superman!")
  let expected: [String: Int] = ["its": 3, "a": 2, "man": 1, "plane": 1, "superman": 1]
  return NSDictionary(dictionary: test).isEqual(expected)
})

assert(&testCount, "should return empty dictionary for empty string input",  {
  let test:[String: Int] = wordCount("")
  let expected: [String: Int] = [:]
  return NSDictionary(dictionary: test).isEqual(expected)
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("rgb Tests")

assert(&testCount, "should return number correct number of rgb from input",  {
  let example:Int = rgb("rgbrgb")
  return example == 2
})

assert(&testCount, "should return correct number of rgb from input despite characters out of sequence",  {
  let example:Int = rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg")
  return example == 7
})

assert(&testCount, "should return 0 as output for no number of rgb",  {
  let example:Int = rgb("bbrr")
  return example == 0
})

assert(&testCount, "should return 0 for empty input",  {
  let example:Int = rgb("")
  return example == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Missing Number Tests")

assert(&testCount, "should return [3] for input of [1, 4, 2]",  {
  let example:[Int] = missingNumber(4, [1, 4, 2])
  return example.sorted() == [3]
})

assert(&testCount, "should return [2, 3, 5, 8] for input of [4, 7, 1, 6]",  {
  let example:[Int] = missingNumber(8, [4, 7, 1, 6])
  return example.sorted() == [2, 3, 5, 8]
})

assert(&testCount, "should return [3, 5] for input of [6, 4, 2, 1]",  {
  let example:[Int] = missingNumber(6, [6, 4, 2, 1])
  return example.sorted() == [3, 5]
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Letter Sort Tests")

assert(&testCount, "should return 'ehllo' for input 'hello'",  {
  let example:String = letterSort("hello")
  return example == "ehllo"
})

assert(&testCount, "should return 'abdehiortw' for input of 'whiteboard'",  {
  let example:String = letterSort("whiteboard")
  return example == "abdehiortw"
})

assert(&testCount, "should return 'eno' for input 'one'",  {
  let example:String = letterSort("one")
  return example == "eno"
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Character Mode Tests")

assert(&testCount, "should return 'l' for input 'hello'",  {
  let example:String = characterMode("hello")
  return example == "l"
})

assert(&testCount, "should return 'a' when input is 'A walk in the park'",  {
  let example:String = characterMode("A walk in the park")
  return example == "a"
})

assert(&testCount, "should return 'no' when input is 'noon'",  {
  let example:String = characterMode("noon")
  return example == "no"
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Sort Digits Tests")

assert(&testCount, "should return '789' when input is '8970'",  {
  let example:Int = sortDigits(8970)
  return example == 789
})

assert(&testCount, "should return '23445' when input is '32445'",  {
  let example:Int = sortDigits(32445)
  return example == 23445
})

assert(&testCount, "should return '111' when input is '10101'",  {
  let example:Int = sortDigits(10101)
  return example == 111
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Get Duplicates Tests")

assert(&testCount, "should return '[2]' when input is '[1, 2, 4, 2]'",  {
  let example:[Int] = getDuplicates([1, 2, 4, 2])
  return example == [2]
})

assert(&testCount, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'",  {
  let example:[Int] = getDuplicates([3, 2, 3, 2, 3, 3, 4])
  return example == [2, 3] || example == [3, 2]
})

assert(&testCount, "should return '[]' when input is '[1, 2, 3, 4]'",  {
  let example:[Int] = getDuplicates([1, 2, 3, 4])
  return example == []
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Anagram Pair Tests")

assert(&testCount, "should return true when input is 'cat, act'",  {
  let example:Bool = anagramPair("cat", "act")
  return example == true
})

assert(&testCount, "should return false when input is 'cat, dog'",  {
  let example:Bool = anagramPair("cat", "dog")
  return example == false
})

assert(&testCount, "should return false when input is 'racecar, aaccrres'",  {
  let example:Bool = anagramPair("racecar", "aaccrres")
  return example == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Anagram Palindrome Tests")

assert(&testCount, "should return true when input is 'carrace'",  {
  let example:Bool = anagramPalindrome("carrace")
  return example == true
})

assert(&testCount, "should return false when input is 'cat'",  {
  let example:Bool = anagramPalindrome("cat")
  return example == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]
