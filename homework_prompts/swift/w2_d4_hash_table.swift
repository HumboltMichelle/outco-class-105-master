/**
 *  Homework - Hash Table
 *
 *  Problem: Hash Table
 *
 *  Prompt: Create a hash table class using separate chaining.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  [[String]] - an array of arrays.
 *         buckets:  Int - the maximum number of buckets that your
 *                   storage can contain. Initially set to 8.
 *           size:   Int - count of key-value pairs in the storage
 *
 *  The HashTable will also have the following methods:
 *
 *           hash:   Method that takes a key and bucket number and provides a
 *                   hashed value. The dbjb2 hashing function has been
 *                   provided.
 *
 *                   Input:      key: String
 *                   Input:      buckets: Int
 *                   Output:     index: Int
 *
 *         insert:   Method that adds a key-value pair into the storage. If the
 *                   key already exists, the value should be updated. Use
 *                   separate chaining to handle collisions.
 *
 *                   Input:      key: String
 *                   Input:      value: String
 *                   Output:     Void
 *
 *            get:   Method that given a key, return its corresponding value.
 *                   If the key does not exist, return null.
 *
 *                   Input:      key: String
 *                   Output:     String
 *
 *         remove:   Method that takes a key as its input, and looks for the
 *                   and removes the key-value pair from the bucket.
 *
 *                   Input:      key: String
 *                   Output:     Void
 *
 *         resize:   If the load factor reaches a critical 0.75 or higher,
 *                   double the number of buckets. If the load factor is 0.25
 *                   or less, half the number of buckets. Make sure the number
 *                   of buckets do not fall below 8 and re-index all key-value
 *                   pairs if bucket size is changed.
 *
 *                   Input:      key String
 *                   Output:     Void
 *
 *  Input: N/A
 *  Output: A HashTable instance
 */


class HashTable {
 var storage: [[[String]]]
 var buckets: Int
 var size: Int

 init() {
   self.buckets = 8
   self.storage = Array(repeating: [], count: self.buckets)
   self.size = 0
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 func hash(_ key: String, _ buckets: Int) -> Int {
   var hash = 5381
   for char in key.unicodeScalars {
      hash = ((hash << 5) &+ hash) &+ Int(char.value)
   }
   return hash % buckets
 }

 // Amortized Time Complexity (amortized):
 // Auxiliary Space Complexity (amortized):
 func insert(_ key: String, _ value: String) {
 }


 // Time Complexity:
 // Auxiliary Space Complexity:
 func get(_ key: String) -> String? {
   return nil
 }


 // Amortized Time Complexity (amortized):
 // Auxiliary Space Complexity (amortized):
 func remove(_ key: String) {
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 func resize() {
 }
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


print("HashTable Class")

assert(&testCount, "able to create an instance",  {
  let h = HashTable()
  return h is HashTable
})

assert(&testCount, "has storage property",  {
  let h = HashTable()
  return h.storage.count == h.buckets && h.storage[0].count == 0
})

assert(&testCount, "has buckets property",  {
  let h = HashTable()
  return h.buckets == 8
})

assert(&testCount, "has buckets property",  {
  let h = HashTable()
  return h.size == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("HashTable Hash method")

assert(&testCount, "has hash method",  {
  let h = HashTable()
  return h.hash is (String, Int) -> (Int)
})

assert(&testCount, "should hash a string in to a number less than bucket size",  {
  let h = HashTable()
  return h.hash("abcdefghijklmnopqrstuvwxyz", h.buckets) < h.buckets
})

assert(&testCount, "should hash same key-bucket combination to the same index",  {
  let h = HashTable()
  return h.hash("abc", 8) == h.hash("abc", h.buckets)
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("HashTable Insert method")

assert(&testCount, "has insert method",  {
  let h = HashTable()
  return h.insert is (String, String) -> ()
})

assert(&testCount, "can insert a key-value pair into hash table",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  let index:Int = h.hash("city", h.buckets)
  if h.storage[index].indices.contains(0) {
    return h.storage[index][0][1] == "san francisco" && h.size == 1
  } else {
    return false
  }
})

assert(&testCount, "can insert a second key-value pair into hashtable",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  h.insert("country", "USA")
  let index1:Int = h.hash("city", h.buckets)
  let index2:Int = h.hash("country", h.buckets)
  if h.storage[index1].indices.contains(0) {
    return h.storage[index1][0][1] == "san francisco" && h.storage[index2][0][1] == "USA" && h.size == 2
  } else {
    return false
  }
})

assert(&testCount, "can overwrite value if key already exists",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  h.insert("city", "los angeles")
  let index:Int = h.hash("city", h.buckets)
  if h.storage[index].indices.contains(0) {
    return h.storage[index][0][1] == "los angeles" && h.size == 1
  } else {
    return false
  }
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("HashTable Get method")

assert(&testCount, "has get method",  {
  let h = HashTable()
  return h.get is (String) -> (String?)
})

assert(&testCount, "should return correct value for existing input key",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  return h.get("city") == "san francisco"
})

assert(&testCount, "should return null if key does not exist",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  return h.get("country") == nil
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("HashTable Remove method")

assert(&testCount, "has remove method",  {
  let h = HashTable()
  return h.remove is (String) -> ()
})

assert(&testCount, "can remove a key-value pair",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  h.remove("city")
  return h.size == 0 && h.get("city") == nil
})

assert(&testCount, "does not remove a key-value pair that does not exist",  {
  let h = HashTable()
  h.insert("city", "san francisco")
  h.remove("country")
  return h.size == 1 && h.get("city") == "san francisco"
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]



print("HashTable Remove method")

assert(&testCount, "has resize method",  {
  let h = HashTable()
  return h.resize is () -> ()
})

assert(&testCount, "doubles hashtable number of buckets if load factor is equal to or larger than 0.75",  {
  let h = HashTable()
  h.insert("1", "1")
  h.insert("2", "2")
  h.insert("3", "3")
  h.insert("4", "4")
  h.insert("5", "5")
  h.insert("6", "6")
  h.insert("7", "7")
  return h.buckets == 16 && h.size == 7
})

assert(&testCount, "halves buckets if load factor drops equal to or below 25% and bucket length is greater than 8",  {
  let h = HashTable()
  h.insert("1", "1")
  h.insert("2", "2")
  h.insert("3", "3")
  h.insert("4", "4")
  h.insert("5", "5")
  h.insert("6", "6")
  h.insert("7", "7")
  h.remove("7")
  h.remove("6")
  h.remove("5")
  return h.buckets == 8 && h.size == 4
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
