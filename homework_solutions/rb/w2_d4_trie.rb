#  Homework - Trie
#
#  Problem 1: TrieNode class
#
#  Prompt:    Create a TrieNode class
#             The TrieNode class should contain the following properties:
#
#                 value:   {Character} - default None
#                  next:   {HashTable}
#                   end:   {Boolean}
#
#
#               Example:   sample = TrieNode.new('b')
#                          sample.value     # 'b'
#                          sample.end       # False
#
#  Problem 2:  Trie class
#
#  Prompt:     Create a Trie class
#              The Trie class should contain the following properties:
#
#                  root:   {TrieNode}
#
#              The Trie class should also contain the following methods:
#
#                insert:   A method that adds a word.
#
#                          Input:     word {String}
#                          Output:    {None}
#
#                isWord:   A method that checks whether a word is in the trie.
#
#                          Input:     word {String}
#                          Output:    {Boolean}
#
#              isPrefix:   A method that checks whether an input is a prefix of
#                          a word in the string.
#
#                          Input:     prefix {String}
#                          Output:    {Boolean}
#
#            startsWith:   A method that returns all words that starts with an
#                          input prefix.
#
#                          Input:     prefix {String}
#                          Output:    {List of Strings}
#
#          EXTRA CREDIT:
#                remove:   Removes a word from the trie.
#
#                          Input:     word {String}
#                          Output:    {None}
#


class TrieNode

  def initialize(value = nil)
    @value = value
    @end = false
    @next = Hash.new
  end
  attr_accessor :value
  attr_accessor :end
  attr_accessor :next
end


class Trie

    def initialize
      @root = TrieNode.new()
    end

    attr_accessor :root

    def insert(word)
      current = @root
      for i in 0 ... word.length
        letter = word[i]
        if(current.next[letter] == nil)
          current.next[letter] = TrieNode.new(letter)
        end
        current = current.next[letter]
      end
      current.end = true
    end

    def is_word(word)
      current = _search(word)
      return current != nil && current.end
    end

    def is_prefix(prefix)
    end

    def starts_with(prefix)
      current = _search(prefix)
      if current == nil
        return []
      end
      results = _traverse(current)
      for i in 0 ... results.length
        results[i] = prefix + results[i]
      end
      return results
    end

    def remove(word)
      if word == ''
        return
      end
      current = @root
      stack = []

      for i in 0 ... word.length
        stack.push(current)
        current = current.next[word[i]]
        if current == nil
          return
        end
      end

      current.end = false

      if current.next.length > 0
        return
      end

      while !current.end && stack.length > 0
        previousletter = current.value
        current = stack.pop()
        current.next.delete(previousletter)
      end
    end

    def _search(word)
      current = @root
      for i in 0 ... word.length
        letter = word[i]
        if current.next[letter] == nil
          return
        end
        current = current.next[letter]
      end
      return current
    end

    def _traverse(node)
      results = []

      dfs = lambda do |current, path|
        if current == nil
          return
        end
        if current.end
          results.push(path)
        end
        current.next.each do |key, array|
          dfs.call(current.next[key], path + key)
        end
      end

      dfs.call(node, '')
      return results
    end

end


############################################################
###############  DO NOT TOUCH TEST BELOW!!!  ###############
############################################################

# custom expect function to handle tests
# List count : keeps track out how many tests pass and how many total
#   in the form of a two item array i.e., [0, 0]
# String name : describes the test
# Function test : performs a set of operations and returns a boolean
#   indicating if test passed
def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  errMsg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    errMsg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if errMsg != nil
    puts'       ' + errMsg + '\n'
  end
end

# code for capturing puts output
require 'stringio'
require 'ostruct'

class Capture

  def self.capture &block

    # redirect output to StringIO objects
    stdout = StringIO.new
    $stdout = stdout

    result = block.call

    # restore normal output
    $stdout = STDOUT

    OpenStruct.new result: result, stdout: stdout.string
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
  return true
end

# code for checking if array is sorted (linear runtime)
def is_sorted(input)
  if (input.length < 2)
    return true
  end
  for i in 1..input.length - 1
    if (input[i-1] > input[i])
      return false
    end
  end
  return true
end



puts 'TrieNode Class'
test_count = [0, 0]

def test()
  trieNode = TrieNode.new()
  return trieNode.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  trieNode = TrieNode.new()
  return trieNode.instance_variable_defined?(:@value)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has value property', test)

def test()
  trieNode = TrieNode.new()
  return trieNode.instance_variable_defined?(:@value) && trieNode.value == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has default value set to nil', test)

def test()
  trieNode = TrieNode.new()
  if trieNode.instance_variable_defined?(:@value)
    trieNode.value = 'a'
  end
  return trieNode.instance_variable_defined?(:@value) && trieNode.value == 'a'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to assign a value upon instantiation', test)

def test()
  trieNode = TrieNode.new()
  trieNode.instance_variable_defined?(:@end)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has an end property', test)

def test()
  trieNode = TrieNode.new()
  return trieNode.instance_variable_defined?(:@end) && trieNode.end == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to assign a value upon instantiation', test)

def test()
  trieNode = TrieNode.new()
  if trieNode.instance_variable_defined?(:@end)
    trieNode.end = true
  end
  return trieNode.instance_variable_defined?(:@end) && trieNode.end == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to assign a value upon instantiation', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Trie Class'
test_count = [0, 0]

def test()
  trie = Trie.new()
  return trie.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  trie = Trie.new()
  trie.instance_variable_defined?(:@root)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has root property', test)

def test()
  trie = Trie.new()
  return trie.instance_variable_defined?(:@root) && trie.root.is_a?(TrieNode)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'root property is a TrieNode', test)

def test()
  trie = Trie.new()
  return trie.instance_variable_defined?(:@root) && trie.root.value == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'root node value is set to nil', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Trie Insert Method'
test_count = [0, 0]

def test()
  trie = Trie.new()
  trie.respond_to?(:insert)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has insert method', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  if trie.instance_variable_defined?(:@root)
    c = trie.root.next['c']
    a = c.next['a']
    t = a.next['t']
  end
  return trie.instance_variable_defined?(:@root) && c && a && t && t.end
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert a word into empty trie', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  if trie.instance_variable_defined?(:@root)
    c = trie.root.next['c']
    a = c.next['a']
    t = a.next['t']
    s = t.next['s']
  end
  return trie.instance_variable_defined?(:@root) && c && a && t && t.end && s && s.end
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to insert words that overlap into trie', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Trie IsWord Method'
test_count = [0, 0]

def test()
  trie = Trie.new()
  trie.respond_to?(:is_word)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has is_word method', test)

def test()
  trie = Trie.new()
  return trie.is_word('') == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return false for an empty string as input', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  return trie.is_word('cat') == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return true for a word that exists', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  return trie.is_word('ca') == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return false for a word that does not exist', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  return trie.is_word('cat') == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return true for a word that exists within larger word', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  return trie.is_word('cats') == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return true for a word that is a larger word', test)

def test()
  trie = Trie.new()
  trie.insert('cats')
  return trie.is_word('cat') == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return false if a smaller word was not added, but exists in a larger word', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Trie StartsWith Method'
test_count = [0, 0]

def test()
  trie = Trie.new()
  trie.respond_to?(:starts_with)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has starts_with method', test)

def test()
  trie = Trie.new()
  result = trie.starts_with('cat')
  return result != nil && result.length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty array if no words start with input', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  trie.insert('catnip')
  trie.insert('car')
  trie.insert('cars')
  result = trie.starts_with('car')
  return result != nil && result.length == 2 && arrays_equal(result, ['car', 'cars'])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns correct prefixes including input that is a word', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  trie.insert('catnip')
  trie.insert('car')
  trie.insert('cars')
  result = trie.starts_with('ca')
  return result != nil && result.length == 5 && arrays_equal(result, ['cat', 'cats', 'catnip', 'car', 'cars'])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns the correct prefixes', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  trie.insert('catnip')
  trie.insert('foo')
  trie.insert('hello')
  trie.insert('hell')
  trie.insert('he')
  result = trie.starts_with('')
  return result != nil && result.length == 7 && arrays_equal(result, ['cat', 'cats', 'catnip', 'foo', 'he', 'hell', 'hello'])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns all words if input is empty string', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Trie Remove Method'
test_count = [0, 0]

def test()
  trie = Trie.new()
  trie.respond_to?(:remove)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove method', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.remove('cat')
  return trie.is_word('cat') == false && trie.root.next['c'] == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'removes a word that exists', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.remove('c')
  return trie.is_word('cat') == true
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove a word that does not exist', test)

def test()
  trie = Trie.new()
  trie.insert('hello')
  trie.insert('hell')
  trie.insert('he')
  trie.remove('hell')
  return trie.is_word('he') == true && trie.is_word('hello') == true && trie.is_word('hell') == false
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove letters that belong to a longer word', test)

def test()
  trie = Trie.new()
  trie.insert('cat')
  trie.insert('cats')
  trie.insert('catnip')
  trie.remove('catnip')
  return trie.is_word('cat') == true && trie.is_word('cats') == true && trie.is_word('catnip') == false && trie.root.next['c'].next['a'].next['t'].next['n'] == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'removes letters from longer word and keeps shorter letters', test)
