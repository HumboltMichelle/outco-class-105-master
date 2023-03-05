# Homework - Frequency Count
#
# Utilize the frequency count pattern to solve these problems.  Use a Hash Set
# or an Array instead of a Hash Table where applicable.

require 'set'

# 1. Unique

# Given an array of integers, return an array with all duplicates removed.*

# Parameters
# Input: arr {Array of Integers}
# Output: {Array of Integers}

# Constraints
# Time: O(N)
# Space: O(N)

# Examples
# [1, 2, 4, 4, 5, 6] --> [1, 2, 4, 5, 6]
# [1, 1, 2, 2, 3, 3] --> [1, 2, 3]
# [1, 2, 3, 1, 2] --> [1, 2, 3]


def unique(arr)
  count = Hash.new(0)
  result = []
  arr.each {|key|
    count[key] += 1
  }
  count.each_key {|num|
    result.push(num)
  }
  return result
end

# 2. Word Count

# Given an body of text, return a hash table of the frequency of each word.

# Parameters
# Input: text {String}
# Output: {Hash Table}

# Constraints
# Capital and lower case versions of the same word should be counted is the same word.
# Remove punctuations from all words.
# Time: O(N)
# Space: O(N)
# Where N is the number of characters in the string.

# Examples
# 'The cat and the hat.' --> '{ the: 2, cat: 1, and: 1, hat: 1 }'`
# 'As soon as possible.' --> '{ as: 2, soon: 1, possible: 1 }'`
# 'It's a man, it's a plane, it's superman!' --> '{ its: 3, a: 2, man: 1, plane: 1, superman: 1 }'`


def word_count(sentence)
  punctuations = Set.new ["?", "!", ".", "'", ","]
  filtered_sentence = ""
  char = 0
  word_counts = Hash.new(0)
  while char < sentence.length
    if !punctuations.member?(sentence[char])
      filtered_sentence  += sentence[char].downcase
    end
    char += 1
  end
  words = filtered_sentence.split(" ")
  words.each { |word|
    word_counts[word] += 1
  }
  return word_counts
end


# 3. RGB Set

# Given a string of characters where each character is either 'r', 'g', or 'b',
# determine the number of complete sets of 'rgb' that can be made with the
# characters.

# Parameters
# Input: str {String}
# Output: {Integer}

# Constraints
# Time: O(N)
# Space: O(1)

# Examples
#  `'rgbrgb' --> 2`
# `'rbgrbrgrgbgrrggbbbbrgrgrgrg' --> 7`
# `'bbrr' --> 0`


def rgb(string)
  count = Hash.new(0)
  string.each_char { |char|
    count[char] += 1
  }
  # initialize num_of_pairs to infinity
  num_of_pairs =  1.0/0
  if count.length < 3
    return 0
  end
  count.each_key { |char|
    if count[char] < num_of_pairs
      num_of_pairs = count[char]
    end
  }
  return num_of_pairs
end


# 4. Missing Number

# Given range of 1 to N and an array of unique integers that are within that
# range, return the missing integers not found in the array

#  Parameters
#  Input: n {Integer}
#  Input: arr {Array of Integers}
#  Output: {Array of Integers}

#  Constraints
#  Time: O(N)
#  Space: O(N)

#  Examples
#  `4, [1, 4, 2] --> [3]`
#  `8, [4, 7, 1, 6] --> [2, 3, 5, 8]`
#  `6, [6, 4, 2, 1] --> [3, 5]`


def missing_number(n, arr)
  count = Hash.new(0)
  result = []
  arr.each{ |item|
    count[item] += 1
  }
  for num in 1...n+1
    if !count.key?(num)
      result.push(num)
    end
  end
  return result
end


# 5. Letter Sort

#  Given a string of letters, return the letters in sorted order.

#  Parameters
#  Input: str {String}
#  Output: {String}

#  Constraints
#  Time: O(N)
#  Space: O(N)

#  Examples
#  `hello --> ehllo`
#  `whiteboard --> abdehiortw`
#  `one --> eno`


def letter_sort(string)
  chars = Array.new(26, 0)
  sorted_string = ""
  string.each_byte do |c|
    chars[c - 97] += 1
  end
  chars.each_index { |index|
    sorted_string += (index + 97).chr * (chars[index])
  }
  return sorted_string
end


# 6. Character Mode
# Given a string, find the most frequent occurring letter(s) in the string

# Parameters
# Input: str {String}
# Output: {String}

# Constraints
# If more than one letter is tied for the most frequent, return a string of all
# the letters in one string.

# Upper case characters should count as lower case, and do not include spaces
# ... as characters.

# Time: O(N)
# Space: O(N)

# Examples
# 'hello' --> 'l'
# 'A walk in the park' --> 'a'
# 'noon' --> 'no'

def character_mode(string)
  chars = Array.new(26, 0)
  result = ""
  string.each_char{ |char|
    if char != " "
      chars[char.downcase.ord - 97] += 1
    end
  }
  max_frequency = 0
  chars.each_index { |index|
    if chars[index] > max_frequency
      max_frequency = chars[index]
    end
  }
  chars.each_index { |index|
    if chars[index] == max_frequency
      result += (index + 97).chr
    end
  }
  return result
end


# 7. Sort Digits

# Given an integer, sort the digits in ascending order and return the new integer.
# Ignore leading zeros.

# Parameters
# Input: num {Integer}
# Output: {Integer}

# Constraints
# Do not convert the integer into a string or other data type.

# Time: O(N) where N is the number of digits.
# Space: O(1)

# Examples
# 8970 --> 789
# 32445 --> 23445
# 10101 --> 111


def sort_digits(n)
  digit_counts = Hash.new(0)
  result = 0

  while n > 0
    digit = n % 10
    digit_counts[digit] += 1
    n /= 10
  end
  power = 0
  10.step(0, -1) do |num|
    if digit_counts.has_key?(num)
      while digit_counts[num] >= 1
        result += num * ( 10 ** (power))
        power += 1
        digit_counts[num] -= 1
      end
    end
  end
  return result
end

# 8. Get Duplicates

# Given an array of values, return only the values that have duplicates in the
# array

# Parameters
# Input: arr {Array}
# Output: {Array}

# Constraints
# Time: O(N)
# Space: O(N)

# Examples
# [1, 2, 4, 2] --> [2]
# [3, 2, 3, 2, 3, 3, 4] --> [3, 2]
# [1, 2, 3, 4] --> []

def get_duplicates(arr)
  count = Hash.new(0)
  result = []
  arr.each { |num|
    count[num] += 1
  }
  count.each_key { |num|
    if count[num] > 1
      result.push(num)
    end
  }
  return result
end

# 9. Anagram Pair

# Given two strings, determine if the strings are anagrams of one another.

# Two words are anagrams of one another if they contain the same letters.

# Parameters
# Input: str1 {String}
# Input: str2 {String}
# Output: {Boolean}

# Constraints
# With N as the length of the first string, and M as the length of the second string.
# Time: O(N)
# Space: O(N)

# Examples
# "cat", "act" --> true
# "cat", "dog" --> false
# "racecar", "aaccrres" --> false

def anagram_pair(string1, string2)
  letters = Array.new(26, 0)
  string1.each_char { |char|
    letters[char.ord - 97] += 1
  }
  string2.each_char { |char|
    letters[char.ord - 97] -= 1
  }
  letters.each_index { |char|
    if letters[char] != 0
      return false
    end
  }
  return true
end

# 10. Anagram Palindrome

# Given a string, determine if the string can be rearranged to form a palindrome.

# A palindrome is a word that is the same as its reversed. For example: "racecar"
# and "noon" are palindromes because they match their reversed version
# respectively. On the other hand, "cat" is not a palindrome because "cat"
# does not equal "tac".

# Parameters
# Input: str {String}
# Output: {Boolean}

# Constraints
# Assume the string only contains lowercase letters and no spaces.
# Time: O(N)
# Space: O(1)

# Examples
# `"carrace" --> true ("carrace" can be rearranged to "racecar")`
# `"cat" --> false`

def anagram_palindrome(string)
  arr = Array.new(26, 0)
  string.each_char {|char|
    arr[char.ord - 97] += 1
  }
  num_of_odds = 0
  arr.each_index { |index|
    if arr[index] % 2 != 0
      num_of_odds += 1
    end
  }
  return num_of_odds < 2
end

#############################################
########  DO NOT TOUCH TEST BELOW!!!  #######
#############################################


# custom expect function to handle tests
# List count : keeps track out how many tests pass and how many total
#   in the form of a two item array i.e., [0, 0]
# String name : describes the test
# Function test : performs a set of operations and returns a boolean
#   indicating if test passed

def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  err_msg = nil
  begin
    if test
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    err_msg = err.message
  end
  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if err_msg != nil
    puts'       ' + err_msg + '\n'
  end
end


# code for checking if lists are equal
def arrays_equal(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  for i in 0..arr1.length-1
    if arr1[i] != arr2[i]
      return false
    end
  end
  true
end


puts "\nUnique"
test_count = [0, 0]

def test()
  example = unique([1, 2, 4, 4, 5, 6])
  return example != nil && arrays_equal(example.sort, [1, 2, 4, 5, 6])
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return unique values from sorted list with duplicates", test)

def test()
  example = unique([2, 2, 2, 2, 2, 2, 2])
  return example != nil && arrays_equal(example, [2])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return single value for list with all duplicates', test)

def test()
  example = unique([1, 2, 3, 1, 2])
  return example != nil && arrays_equal(example.sort, [1, 2, 3])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return unique values from unsorted', test)

def test()
  example = unique([])
  return example != nil && arrays_equal(example.sort, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return an empty list from empty input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nWord Count"
test_count = [0, 0]

def test()
  example = word_count("The cat and the hat")
  return example != nil && example == {"the" => 2, "cat" => 1, "and" => 1, "hat" => 1}
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return a dictionary with each word and its frequency', test)

def test()
  example = word_count("It's a man, it's a plane, it's superman!")
  return example != nil && example == {"its" => 3, "a" => 2, "man" => 1, "plane" => 1, "superman" => 1}
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return dictionary with each word excluding punctuations', test)

def test()
  example = word_count("")
  return example != nil && example == {}
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return empty dictionary for empty string input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



print("\nRGB\n")
test_count = [0, 0]

def test()
  example = rgb("rgbrgb")
  return example != nil && example == 2
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return number correct number of rgb from input', test)

def test()
  example = rgb("rbgrbrgrgbgrrggbbbbrgrgrgrg")
  return example != nil && example == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return number correct number of rgb from input despite characters out of sequence', test)

def test()
  example = rgb("bbrr")
  return example != nil && example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 0 as output for no number of rgb', test)

def test()
  example = rgb("")
  return example != nil && example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 0 for empty input', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nMissing Number"
test_count = [0, 0]

def test()
  example = missing_number(4, [1, 4, 2])
  return example != nil && arrays_equal(example, [3])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return [3] for input of [1, 4, 2]', test)

def test()
  example = missing_number(8, [4, 7, 1, 6])
  return example != nil && arrays_equal(example, [2, 3, 5, 8])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return [2, 3, 5, 8] for input of [4, 7, 1, 6]', test)

def test()
  example = missing_number(6, [6, 4, 2, 1])
  return example != nil && arrays_equal(example, [3, 5])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return [3, 5] for input of [6, 4, 2, 1]', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nLetter Sort"
test_count = [0, 0]

def test()
  example = letter_sort("hello")
  return example != nil && example == "ehllo"
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return 'ehllo' for input 'hello'", test)

def test()
  example = letter_sort("whiteboard")
  return example != nil && example == "abdehiortw"
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return 'abdehiortw' for input 'whiteboard'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nCharacter Mode"
test_count = [0, 0]

def test()
  example = character_mode("hello")
  return example != nil && example == "l"
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return 'l' for input 'hello'", test)

def test()
  example = character_mode("A walk in the park")
  return example != nil && example == "a"
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return 'a' when input is 'A walk in the park'", test)

def test()
  example = character_mode("noon")
  return example != nil && example == "no"
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return 'no' when input is 'noon'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nSort Digits"
test_count = [0, 0]

def test()
  example = sort_digits(8970)
  return example != nil && example == 789
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '789' when input is '8970'", test)

def test()
  example = sort_digits(32445)
  return example != nil && example == 23445
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '23445' when input is '32445'", test)

def test()
  example = sort_digits(10101)
  return example != nil && example == 111
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '111' when input is '10101'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts "\nGet Duplicates"
test_count = [0, 0]

def test()
  example = get_duplicates([1, 2, 4, 2])
  return example != nil && arrays_equal(example, [2])
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '[2]' when input is '[1, 2, 4, 2]'", test)


def test()
  example = get_duplicates([3, 2, 3, 2, 3, 3, 4])
  return example != nil && arrays_equal(example, [3, 2]) || arrays_equal(example, [2, 3])
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '[3, 2]' or '[2, 3]' when input is '[3, 2, 3, 2, 3, 3, 4]'", test)


def test()
  example = get_duplicates([1, 2, 3, 4])
  return example != nil && arrays_equal(example, [])
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return '[]' when input is '[1, 2, 3, 4]'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nAnagram Pair"
test_count = [0, 0]

def test()
  example = anagram_pair("cat", "act")
  return example != nil && example == true
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return true when input is 'cat', 'act'", test)

def test()
  example = anagram_pair("cat", "dog")
  return example != nil && example == false
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return false when input is 'cat', 'dog'", test)


def test()
  example = anagram_pair("racecar", "aaccrres")
  return example != nil && example == false
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return false when input is 'racecar', 'aaccrres'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts "\nAnagram Palindrome"
test_count = [0, 0]

def test()
  example = anagram_palindrome("carrace")
  return example != nil && example == true
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return false when input is 'cat'", test)


def test()
  example = anagram_palindrome("cat")
  return example != nil && example == false
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return false when input is 'cat'", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
