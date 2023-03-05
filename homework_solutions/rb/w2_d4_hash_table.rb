#  Homework - Hash Table
#
#  Problem: Hash Table
#
#  Prompt: Create a hash table class using separate chaining.
#
#  The HashTable will have the following properties:
#
#         storage:  {Array} - an array of arrays.
#         buckets:  {Integer} - the maximum number of buckets that your
#                   storage can contain. Initially set to 8.
#           size:   {Integer} count of key-value pairs in the storage
#
#  The HashTable will also have the following methods:
#
#           hash:   Method that takes a key and bucket number and provides a
#                   hashed value. The dbjb2 hashing function has been
#                   provided.
#
#                   Input:      key {String}
#                   Input:      buckets {Integer}
#                   Output:     index {Integer}
#
#            put:   Method that adds a key-value pair into the storage. If the
#                   key already exists, the value should be updated. Use
#                   separate chaining to handle collisions.
#
#                   Input:      key {String}
#                   Input:      value {String}
#                   Output:     {None}
#
#            get:   Method that given a key, return its corresponding value.
#                   If the key does not exist, return null.
#
#                   Input:      key {String}
#                   Output:     value {String}
#
#         remove:   Method that takes a key as its input, and looks for the
#                   and removes the key-value pair from the bucket.
#
#                   Input:      key {String}
#                   Output:     {None}
#
#         resize:   If the load factor reaches a critical 0.75 or higher,
#                   double the number of buckets. If the load factor is 0.25
#                   or less, half the number of buckets. Make sure the number
#                   of buckets do not fall below 8 and re-index all key-value
#                   pairs if bucket size is changed.
#
#                   Input:      key {String}
#                   Output:     {None}
#
#  Input: {Nil}
#  Output: {Hash Table}
#


class HashTable
  attr_accessor :storage, :buckets, :size
  def initialize
    @buckets = 8
    @size = 0
    @storage = []
  end

  # Time Complexity: O(K) - where K is the length of the key
  # Auxiliary Space Complexity: O(1)
  def hash(key, buckets)
    hash = 5381

    key.each_byte do |i|
      hash = ((hash << 5) + hash) + i
    end

    return hash % buckets
  end

  # Time Complexity (amortized): O(K+N) - where K is the length of the key
  # Auxiliary Space Complexity (amortized): O(1)
  def insert(key, value)
    index = hash(key, @buckets)

    if @storage[index] == nil
      @storage[index] = []
    end
    bucket = @storage[index]
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end
    bucket << [key, value]
    @size += 1
    resize()
  end

  # Time Complexity: O(K+N) - where K is the length of the key
  # Auxiliary Space Complexity: O(1)
  def get(key)
    index = hash(key, @buckets)
    bucket = @storage[index]
    return if bucket == nil

    bucket.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    return nil
  end

  # Time Complexity (amortized): O(K+N) - where K is the length of the key
  # Auxiliary Space Complexity (amortized): O(1)
  def remove(key)
    index = hash(key, @buckets)
    bucket = @storage[index]
    return if bucket == nil
    bucket.each_with_index do |pair, i|
      if pair[0] == key
        bucket.delete_at(i)
        @size -= 1
        resize()
      end
    end
  end

  # Time Complexity: O(N)
  # Auxiliary Space Complexity: O(N)
  def resize()
    load_factor = @size / @buckets.to_f
    return if load_factor > 0.25 and load_factor < 0.75
    return if load_factor <= 0.25 and @buckets == 8

    temp = @storage
    @buckets = load_factor >= 0.75 ? @buckets * 2 : @buckets / 2
    @storage = []
    temp.each do |bucket|
      if bucket != nil
        bucket.each do |pair|
          @size -= 1
          insert(pair[0], pair[1])
        end
      end
    end
  end

end


############################################################
###############  DO NOT TOUCH TEST BELOW!!!  ###############
############################################################

# custom assert function to handle tests
# input: count {Array} - keeps track out how many tests pass and how many total
#        in the form of a two item array i.e., [0, 0]
# input: name {String} - describes the test
# input: test {Function} - performs a set of operations and returns a boolean
#        indicating if test passed
# output: {None}
def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  errMsg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => err
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    errMsg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if errMsg != nil
    puts'       ' + errMsg + '\n'
  end
end


puts 'HashTable Tests'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  return hash_table.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  hash_table = HashTable.new()
  hash_table.instance_variable_defined?(:@storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has storage property', test)

def test()
  hash_table = HashTable.new()
  hash_table.instance_variable_defined?(:@buckets)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has buckets property', test)

def test()
  hash_table = HashTable.new()
  hash_table.instance_variable_defined?(:@size)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has size property', test)

def test()
  hash_table = HashTable.new()
  return hash_table.respond_to?(:storage) && hash_table.storage.kind_of?(Array)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default storage set to a array', test)

def test()
  hash_table = HashTable.new()
  return hash_table.respond_to?(:buckets) && hash_table.buckets == 8
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default buckets set to 8', test)

def test()
  hash_table = HashTable.new()
  return hash_table.respond_to?(:size) && hash_table.size == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'default size set to 0', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'HashTable Hash method'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  hash_table.respond_to?(:hash)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has hash method', test)

def test()
  hash_table = HashTable.new()
  (1..100).each do |i|
    index = hash_table.hash('hello', i)
    return index.is_a?(Integer) && index < i
  end
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should hash a string in to a number less than bucket size', test)

def test()
  hash_table = HashTable.new()
  index = hash_table.hash('hello', 100000)
  return index.is_a?(Integer) && index == hash_table.hash('hello', 100000)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should hash same key-bucket combination to the same index', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'HashTable Insert Method'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  return hash_table.respond_to?(:insert)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has insert method', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  if !hash_table.respond_to?(:buckets)
    return false
  end
  index = hash_table.hash('hello', hash_table.buckets)
  return hash_table.size == 1 &&
         hash_table.storage[index].kind_of?(Array) &&
         hash_table.storage[index].length == 1 &&
         hash_table.storage[index][0][0] == 'hello' &&
         hash_table.storage[index][0][1] == 'world'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'can insert a key-value pair into hashtable', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  hash_table.insert('foo', 'bar')
  if !hash_table.respond_to?(:buckets)
    return false
  end
  index1 = hash_table.hash('hello', hash_table.buckets)
  index2 = hash_table.hash('foo', hash_table.buckets)
  return hash_table.size == 2 &&
         hash_table.storage[index1].kind_of?(Array) &&
         hash_table.storage[index2].kind_of?(Array)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'can insert a second key-value pair into hashtable', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  hash_table.insert('hello', 'universe')
  if !hash_table.respond_to?(:buckets)
    return false
  end
  index = hash_table.hash('hello', hash_table.buckets)
  return hash_table.size == 1 &&
         hash_table.storage[index].kind_of?(Array) &&
         hash_table.storage[index][0][0] == 'hello' &&
         hash_table.storage[index][0][1] == 'universe'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'can overwrite value if key already exists', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'HashTable Retrieve Method'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  hash_table.respond_to?(:get)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has get method', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  return hash_table.get('hello') == 'world'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return value for inputted key if it exists', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  return hash_table.get('bye') == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return nil for inputted key if it does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'HashTable Remove Method'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  hash_table.respond_to?(:remove)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove method', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  hash_table.remove('hello')
  return hash_table.respond_to?(:size) && hash_table.size == 0 &&
      hash_table.get('hello') == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'can remove a key-value pair', test)

def test()
  hash_table = HashTable.new()
  hash_table.insert('hello', 'world')
  hash_table.remove('cat')
  if !hash_table.respond_to?(:buckets)
    return false
  end
  index = hash_table.hash('hello', hash_table.buckets)
  return hash_table.size == 1 &&
         hash_table.storage[index][0][0] == 'hello' &&
         hash_table.storage[index][0][1] == 'world'
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove a key-value pair that does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'HashTable Resize Method'
test_count = [0, 0]

def test()
  hash_table = HashTable.new()
  hash_table.respond_to?(:resize)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has resize method', test)

def test()
  hash_table = HashTable.new()
  keys = ['zero', 'one', 'two', 'three', 'four', 'five', 'six']
  values = ['0', '1', '2', '3', '4', '5', '6']
  if !hash_table.respond_to?(:buckets)
    return false
  end
  5.times do |i|
    hash_table.insert(keys[i], values[i])
    return false if hash_table.buckets != 8
  end
  hash_table.insert(keys[5], values[5])
  return false if hash_table.buckets != 16
  hash_table.insert(keys[6], values[6])
  return hash_table.respond_to?(:buckets) && hash_table.buckets == 16
rescue StandardError => err
  puts err.message
end
expect(test_count, 'doubles hashtable number of buckets if load factor is ' +
      'equal to or larger than 0.75', test)

def test()
  hash_table = HashTable.new()
  keys = ['zero', 'one', 'two', 'three', 'four', 'five', 'six']
  values = ['0', '1', '2', '3', '4', '5', '6']
  (0..6).each do |i|
    hash_table.insert(keys[i], values[i])
  end
  if !hash_table.respond_to?(:buckets)
    return false
  end
  buckets = hash_table.buckets
  hash_table.remove('four')
  hash_table.remove('five')
  hash_table.remove('six')
  return buckets == hash_table.buckets * 2
rescue StandardError => err
  puts err.message
end
expect(test_count, 'halves buckets if load factor drops equal to or below ' +
       '0.25 and bucket length is greater than 8', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
