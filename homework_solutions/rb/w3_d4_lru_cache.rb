#  Homework - LRU Caceh
#
#  Instructions: LRU Cache is a popular and challenging algorithm question
#                commonly asked during whiteboarding and tech screen sessions.
#
#                While difficult, this exercise is a good problem to test your
#                ability to build and manipulate data structures.
#
#
#  LRU Cache
#
#                Design and implement a data structure for a Least Recently
#                Used (LRU) Cache.
#
#                This implementation involves a doubly linked list and a hash map.
#
#          NOTE: A LRU caching scheme is designed to remove the least recently
#                used item when a new item is added to the cache which is
#                currently at or has just reached capacity.
#
#                An item is considered to be recently used if it has just been
#                accessed or added.
#
#          I.  Node Class
#              Create a Node class
#
#              The Node class should contain the following properties:
#              key: {String}
#              value: {String}
#              previous: {Node} (initially None)
#              next: {Node} (initially None)
#
#         II.  LRUCache Class
#              Create an LRUCache class
#
#              The LRUCache class should contain the following properties:
#              capacity: {Integer}
#              count: {Integer} (initially 0)
#              cache: {Hash Table} The keys represent unique ids of each node, and the values represent the node objects
#                                that possess those keys.
#              head: {Node}
#              tail: {Node}
#
#     Your LRU cache should have the following methods:
#
#      get(key): Retreives a value from the cache (will always be positive) at
#                the key if the key exists in the cache, otherwise returns -1.
#
# set(key,value): Inserts the value at the key or creates a new key:value entry
#                if key is not present. When the cache reaches its capacity, it
#                should invalidate the least recently used item before
#                inserting a new item.
#
#          HINT: Consider what data structure(s) might be neccessary to
#                implement the LRU Cache
#
#     Example:
#     lruCache = new LRUCache(3);
#     lruCache.set('doc', 'david');
#     lruCache.set('cpo', 'joshua');
#     lruCache.set('ceo', 'andy');
#
#     lruCache.get('doc'); => 'david'
#     lruCache.set('swe', 'ron');
#     lruCache.get('cpo'); => -1
#

class Node
  def initialize(key = nil, value = nil)
    @key = key
    @value = value
    @next = nil
    @previous = nil
  end

  attr_accessor :key,:value,:next,:previous
end

class LRUCache
  def initialize(capacity = 0)
    @capacity = capacity
    @count = 0
    @ref = {}
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.previous = @head
  end

  attr_accessor :capacity,:count,:ref,:head,:tail

  def add_node(node)
    node.previous = @head
    node.next = @head.next
    @head.next.previous = node
    @head.next = node
  end

  def remove_node(node)
    prev_node = node.previous
    next_node = node.next
    prev_node.next = next_node
    next_node.previous = prev_node
  end

  def move_to_head(node)
    remove_node(node)
    add_node(node)
  end

  def remove_from_tail()
    c_node = @tail.previous
    remove_node(c_node)
    return c_node
  end

  def get(key)
    if @ref.key?(key)
      c_node = @ref[key]
      move_to_head(c_node)
      return c_node.value
    end
    return -1
  end

  def set(key, value)
    if @ref.key?(key)
      c_node = @ref[key]
      c_node.value = value
      move_to_head(c_node)
    else
      new_node = Node.new(key, value)
      @ref[key] = new_node
      add_node(new_node)

      @count += 1

      if (@count > @capacity)
        remove_node = remove_from_tail()
        @ref.delete(remove_node.key)
        @count -= 1
      end
    end
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
  err_msg = nil
  begin
    if test()
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

# #use this code to capture puts output
# c = Capture.capture do
#   # PERFORM OPERATIONS IN HERE
# end

# puts c.stdout
def str_to_array(input)
  input = input.split('\n')
  return input[:input.length-1]
end

puts 'LRU Cache tests'
test_count = [0, 0]

def test()
  lru_cache = LRUCache.new(3)
  lru_cache.set('doc', 'david')
  lru_cache.set('cpo', 'joshua')
  lru_cache.set('ceo', 'andy')
  example1 = lru_cache.get('doc')
  example2 = lru_cache.get('cpo')
  example3 = lru_cache.get('ceo')
  return example1 == 'david' && example2 == 'joshua' && example3 == 'andy'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to set and get key-value pairs', test)

def test()
  lru_cache = LRUCache.new(3)
  lru_cache.set('student', 'henry')
  lru_cache.set('student', 'eliza')
  example = lru_cache.get('student')
  return example == 'eliza'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able overwrite values with same keys when using set method', test)

def test()
  lru_cache = LRUCache.new(3)
  lru_cache.set('dentist', 'akali')
  lru_cache.set('doctor', 'swain')
  lru_cache.set('lawyer', 'kennan')
  lru_cache.set('judge', 'leona')
  return lru_cache.get('dentist') == -1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'old key value pairs should be removed when capacity has been exceeded', test)

def test()
  lru_cache = LRUCache.new(3)
  lru_cache.set('doc', 'david')
  lru_cache.set('cpo', 'joshua')
  lru_cache.set('ceo', 'andy')
  lru_cache.get('doc')
  lru_cache.set('swe', 'ron')
  return lru_cache.get('cpo') == -1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'most recently modified/viewed items should be moved to front of LRU cache while stale items are moved to end', test)

def test()
  lru_cache = LRUCache.new(3)
  lru_cache.set('one', 1)
  lru_cache.set('two', 2)
  lru_cache.set('three', 3)
  lru_cache.set('four', 4)
  lru_cache.set('five', 5)
  lru_cache.set('six', 6)
  ex1 = lru_cache.get('one')
  ex2 = lru_cache.get('two')
  ex3 = lru_cache.get('three')
  ex4 = lru_cache.get('four')
  ex5 = lru_cache.get('five')
  ex6 = lru_cache.get('six')
  return ex1 == -1 && ex2 == -1 && ex3 == -1 && ex4 == 4 && ex5 == 5 && ex6 == 6
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should be able to replace multiple stale items', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
