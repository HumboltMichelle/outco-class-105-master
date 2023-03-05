/**
//  Homework - LRU Cache
//
//  Instructions: LRU Cache is a popular and challenging algorithm question
//                commonly asked during whiteboarding and tech screen sessions.
//
//                While difficult, this exercise is a good problem to test your
//                ability to build and manipulate data structures.
//
//
//  LRU Cache
//
//                Design and implement a data structure for a Least Recently
//                Used (LRU) Cache.
//
//                This implementation involves a doubly linked list and a hash map.
//
//          NOTE: A LRU caching scheme is designed to remove the least recently
//                used item when a new item is added to the cache which is
//                currently at or has just reached capacity.
//
//                An item is considered to be recently used if it has just been
//                accessed or added.
//
//          I.  Node Class
//              Create a Node class
//
//              The Node class should contain the following properties:
//              key: {String}
//              value: {String}
//              previous: {Node} (initially None)
//              next: {Node} (initially None)
//
//         II.  LRUCache Class
//              Create an LRUCache class
//
//              The LRUCache class should contain the following properties:
//              capacity: {Integer}
//              count: {Integer} (initially 0)
//              cache: {Hash Table} The keys represent unique ids of each node, and the values represent the node objects
//                                that possess those keys.
//              head: {Node}
//              tail: {Node}
//
//     Your LRU cache should have the following methods:
//
//      get(key): Retreives a value from the cache (will always be positive) at
//                the key if the key exists in the cache, otherwise returns nil.
//
// set(key,value): Inserts the value at the key or creates a new key:value entry
//                if key is not present. When the cache reaches its capacity, it
//                should invalidate the least recently used item before
//                inserting a new item.
//
//          HINT: Consider what data structure(s) might be neccessary to
//                implement the LRU Cache
//
//     Example:
//     lruCache = new LRUCache(3);
//     lruCache.set('doc', 'david');
//     lruCache.set('cpo', 'joshua');
//     lruCache.set('ceo', 'andy');
//
//     lruCache.get('doc'); => 'david'
//     lruCache.set('swe', 'ron');
//     lruCache.get('cpo'); => nil
//
*/


class Node {
  // YOUR WORK HERE
}


class LRUCache {
  // YOUR WORK HERE

  init (_ capacity: Int) {
    // YOUR WORK HERE
  }

  func addNode(_ node: Node) {
    // YOUR WORK HERE
  }

  func removeNode(_ node: Node) {
    // YOUR WORK HERE
  }

  func moveToHead(_ node: Node) {
    // YOUR WORK HERE
  }

  func removeFromTail() -> Node? {
    // YOUR WORK HERE
    return nil
  }

  func get(_ key: String) -> String? {
    // YOUR WORK HERE
    return nil
  }

  func set(_ key: String, _ value: String) {
    // YOUR WORK HERE
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

print("LRU Cache tests")

assert(&testCount, "should be able to set and get key-value pairs",  {
  let lruCache = LRUCache(3)
  lruCache.set("doc", "david")
  lruCache.set("cpo", "joshua")
  lruCache.set("ceo", "andy")
  let example1 = lruCache.get("doc")
  let example2 = lruCache.get("cpo")
  let example3 = lruCache.get("ceo")
  return example1 == "david" && example2 == "joshua" && example3 == "andy"
})

assert(&testCount, "should be able overwrite values with same keys when using set method",  {
  let lruCache = LRUCache(3)
  lruCache.set("student", "henry")
  lruCache.set("student", "eliza")
  let example = lruCache.get("student")
  return example == "eliza"
})

assert(&testCount, "old key value pairs should be removed when capacity has been exceeded",  {
  let lruCache = LRUCache(3)
  lruCache.set("dentist", "akali")
  lruCache.set("doctor", "swain")
  lruCache.set("lawyer", "kennan")
  lruCache.set("judge", "leona")
  return lruCache.get("dentist") == nil
})

assert(&testCount, "most recently modified/viewed items should be moved to front of LRU cache while stale items are moved to end",  {
  let lruCache = LRUCache(3)
  lruCache.set("doc", "david")
  lruCache.set("cpo", "joshua")
  lruCache.set("ceo", "andy")
  let _ = lruCache.get("doc")
  lruCache.set("swe", "ron")
  return lruCache.get("cpo") == nil
})

assert(&testCount, "should be able to replace multiple stale items",  {
  let lruCache = LRUCache(3)
  lruCache.set("one", "1")
  lruCache.set("two", "2")
  lruCache.set("three", "3")
  lruCache.set("four", "4")
  lruCache.set("five", "5")
  lruCache.set("six", "6")
  let ex1 = lruCache.get("one")
  let ex2 = lruCache.get("two")
  let ex3 = lruCache.get("three")
  let ex4 = lruCache.get("four")
  let ex5 = lruCache.get("five")
  let ex6 = lruCache.get("six")
  return ex1 == nil && ex2 == nil && ex3 == nil && ex4 == "4" && ex5 == "5" && ex6 == "6"
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
