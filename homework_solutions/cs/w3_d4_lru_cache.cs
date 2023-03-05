/*

  Homework - LRU Cache

  Problem: LRU Cache

  Instructions: LRU Cache is a popular and challenging algorithm question
                commonly asked during whiteboarding and tech screen sessions.

                While difficult, this exercise is a good problem to test your
                ability to build and manipulate data structures.

                Design and implement a data structure for a Least Recently
                Used (LRU) Cache.

                This implementation involves a doubly linked list and a hash map.

          NOTE: A LRU caching scheme is designed to remove the least recently
                used item when a new item is added to the cache which is
                currently at or has just reached capacity.

                An item is considered to be recently used if it has just been
                accessed or added.

          I.  Node Class
              Create a Node class

              The Node class should contain the following properties:
              key: {String}
              value: {String}
              previous: {Node} (initially null)
              next: {Node} (initially null)

         II.  LRUCache Class
              Create an LRUCache class

              The LRUCache class should contain the following properties:
              capacity: {Integer}
              count: {Integer} (initially 0)
              cache: {Hash Table} The keys represent unique ids of each node, and the values represent the node objects
                                that possess those keys.
              head: {Node}
              tail: {Node}

     Your LRU cache should have the following methods:

      get(key): Retreives a value from the cache (will always be positive) at
                the key if the key exists in the cache, otherwise returns null.

      set(key,value): Inserts the value at the key or creates a new key:value entry
                if key is not present. When the cache reaches its capacity, it
                should invalidate the least recently used item before
                inserting a new item.

          HINT: Consider what data structure(s) might be neccessary to
                implement the LRU Cache

     Example:
     lruCache = new LRUCache(03);
     lruCache.set('doc', 'david');
     lruCache.set('cpo', 'joshua');
     lruCache.set('ceo', 'andy');

     lruCache.get('doc'); => 'david'
     lruCache.set('swe', 'ron');
     lruCache.get('cpo'); => null


*/

using System;
using System.Collections.Generic;

class Node {
  public String key;
  public String value;
  public Node previous;
  public Node next;

  public Node(String key, String value) {
    this.key = key;
    this.value = value;
  }
}

class LRUCache {

  public int capacity;
  public int count = 0;
  public Dictionary<String, Node> cache = new Dictionary<String, Node>();
  public Node head;
  public Node tail;

  public LRUCache(int capacity) {
    this.count = 0;
    this.capacity = capacity;
    this.head = new Node(null, null);
    this.tail = new Node(null, null);
    this.head.next = this.tail;
    this.tail.previous = this.head;
  }

  /*
  Following are helper methods that will aid in
  implementing the get and set methods for this
  LRU Cache data structure
  */

  /*
  Insert a new node immediately following the
  head node
  */
  private void addNode(Node node) {
    node.previous = head;
    node.next = head.next;

    head.next.previous = node;
    head.next = node;
  }

  /*
  Remove an existing node from the linked list
  */
  private void removeNode(Node node) {
    Node previous = node.previous;
    Node next = node.next;

    previous.next = next;
    next.previous = previous;
  }

  /*
  Move particular node from any position within
  the linked list to the head of the linked
  list
  */
  private void moveToHead(Node node) {
    this.removeNode(node);
    this.addNode(node);
  }

  /*
  Remove the current tail
  */
  private Node removeFromTail() {
    Node res = tail.previous;
    this.removeNode(res);
    return res;
  }

  public String Get(String key) {
    if (cache.ContainsKey(key)) {
      Node node = cache[key];
      // move the accessed node to the head
      this.moveToHead(node);
      return node.value;
    } else {
      return null; // should raise exception here
    }
  }

  public void Set(String key, String value) {
    if (this.cache.ContainsKey(key)) {
      Node node = this.cache[key];
      node.value = value;
      this.moveToHead(node);
    } else {
      Node newNode = new Node(key, value);
      cache.Add(key, newNode);
      addNode(newNode);

      count++;

      if (count > capacity) {
        // pop the tail;
        Node tail = removeFromTail();
        cache.Remove(tail.key);
        count--;
      }
    }
  }

}

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

    public static void Main() {
        nodeClassTests();
        LRUCacheTests();
        LRUCacheMethodsTests();
    }

    private static void nodeClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Node Class");
        runTest(nodeClassTest1, "able to create an instance", testCount);
        runTest(nodeClassTest2, "has key property", testCount);
        runTest(nodeClassTest3, "has value property", testCount);
        runTest(nodeClassTest4, "has next property", testCount);
        runTest(nodeClassTest5, "has previous property", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void LRUCacheTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("LRUCache Class");
        runTest(LRUCacheTest1, "able to create an instance", testCount);
        runTest(LRUCacheTest2, "has capacity property", testCount);
        runTest(LRUCacheTest3, "capacity property is an integer", testCount);
        runTest(LRUCacheTest4, "has count property", testCount);
        runTest(LRUCacheTest5, "count property is an integer", testCount);
        runTest(LRUCacheTest6, "has cache property", testCount);
        runTest(LRUCacheTest7, "cache property is a dictionary", testCount);
        runTest(LRUCacheTest8, "has head property", testCount);
        runTest(LRUCacheTest9, "head property is a Node", testCount);
        runTest(LRUCacheTest10, "has head property", testCount);
        runTest(LRUCacheTest11, "head property is a Node", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void LRUCacheMethodsTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("LRUCache Methods Tests");
        runTest(LRUCacheMethodsTest1, "should be able to set and get key-value pairs", testCount);
        runTest(LRUCacheMethodsTest2, "should be able to overwrite values with same keys when using set method", testCount);
        runTest(LRUCacheMethodsTest3, "old key value pairs should be removed when capacity has been exceeded", testCount);
        runTest(LRUCacheMethodsTest4, "most recently modified/viewed items should be moved to front of LRU cache while stale items are moved to end", testCount);
        runTest(LRUCacheMethodsTest5, "should be able to replace multiple stale items", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static bool nodeClassTest1() {
        Node node = new Node("hello", "foo");
        return node.GetType() == typeof(Node);
    }

    private static bool nodeClassTest2() {
        Node node = new Node("hello", "foo");
        return node.GetType().GetField("key") != null;
    }

    private static bool nodeClassTest3() {
        Node node = new Node("hello", "foo");
        return node.GetType().GetField("value") != null;
    }

    private static bool nodeClassTest4() {
        Node node = new Node("hello", "foo");
        return node.next == null;
    }

    private static bool nodeClassTest5() {
        Node node = new Node("hello", "foo");
        return node.previous == null;
    }


    private static bool LRUCacheTest1() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.GetType() == typeof(LRUCache);
    }

    private static bool LRUCacheTest2() {
        return new LRUCache(0).GetType().GetField("capacity") != null;
    }

    private static bool LRUCacheTest3() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.capacity.GetType() == typeof(int);
    }

    private static bool LRUCacheTest4() {
        return new LRUCache(0).GetType().GetField("count") != null;
    }

    private static bool LRUCacheTest5() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.count.GetType() == typeof(int);
    }

    private static bool LRUCacheTest6() {
        return new LRUCache(0).GetType().GetField("cache") != null;
    }

    private static bool LRUCacheTest7() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.cache.GetType() == typeof(Dictionary<String, Node>);
    }

    private static bool LRUCacheTest8() {
        return new LRUCache(0).GetType().GetField("head") != null;
    }

    private static bool LRUCacheTest9() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.head.GetType() == typeof(Node);
    }

    private static bool LRUCacheTest10() {
        return new LRUCache(0).GetType().GetField("tail") != null;
    }

    private static bool LRUCacheTest11() {
        LRUCache lruCache = new LRUCache(0);
        return lruCache.tail.GetType() == typeof(Node);
    }

    private static bool LRUCacheMethodsTest1() {
      LRUCache lruCache = new LRUCache(3);
      lruCache.Set("doc", "david");
      lruCache.Set("cpo", "joshua");
      lruCache.Set("ceo", "andy");
      String example1 = lruCache.Get("doc");
      String example2 = lruCache.Get("cpo");
      String example3 = lruCache.Get("ceo");
      return example1 == "david" && example2 == "joshua" && example3 == "andy";
    }

    private static bool LRUCacheMethodsTest2() {
      LRUCache lruCache = new LRUCache(3);
      lruCache.Set("student", "henry");
      lruCache.Set("student", "eliza");
      String example = lruCache.Get("student");
      return example == "eliza";
    }

    private static bool LRUCacheMethodsTest3() {
      LRUCache lruCache = new LRUCache(3);
      lruCache.Set("dentist", "akali");
      lruCache.Set("doctor", "swain");
      lruCache.Set("lawyer", "kennan");
      lruCache.Set("judge", "leona");
      return lruCache.Get("dentist") == null && lruCache.Get("doctor") == "swain";
    }

    private static bool LRUCacheMethodsTest4() {
      LRUCache lruCache = new LRUCache(3);
      lruCache.Set("doc", "david");
      lruCache.Set("cpo", "joshua");
      lruCache.Set("ceo", "andy");
      lruCache.Get("doc");
      lruCache.Set("swe", "ron");
      return lruCache.Get("cpo") == null && lruCache.Get("swe") == "ron";
    }

    private static bool LRUCacheMethodsTest5() {
      LRUCache lruCache = new LRUCache(3);
      lruCache.Set("one", "hello");
      lruCache.Set("two", "bye");
      lruCache.Set("three", "blah");
      lruCache.Set("four", "foo");
      lruCache.Set("five", "fum");
      lruCache.Set("six", "great");
      String ex1 = lruCache.Get("one");
      String ex2 = lruCache.Get("two");
      String ex3 = lruCache.Get("three");
      String ex4 = lruCache.Get("four");
      String ex5 = lruCache.Get("five");
      String ex6 = lruCache.Get("six");
      return ex1 == null && ex2 == null && ex3 == null && ex4 == "foo" && ex5 == "fum" && ex6 == "great";
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
