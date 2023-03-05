/**
 *  Homework - Hash Table
 *
 *  Problem: Hash Table
 *
 *  Prompt: Create a hash table class using separate chaining.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  {ArrayList[]} - an array of array lists containing key-value pairs
 *                                   key-value pairs are String[]{key, value}
 *         buckets:  {Integer} - the maximum number of buckets that your
 *                   storage can contain. Initially set to 8.
 *           size:   {Integer} count of key-value pairs in the storage
 *
 *  The HashTable will also have the following methods:
 *
 *           hash:   Method that takes a key and bucket number and provides a
 *                   hashed value. The dbjb2 hashing function has been
 *                   provided.
 *
 *                   Input:      key {String}
 *                   Input:      buckets {Integer}
 *                   Output:     index {Integer}
 *
 *         insert:   Method that adds a key-value pair into the storage. If the
 *                   key already exists, the value should be updated. Use
 *                   separate chaining to handle collisions.
 *
 *                   Input:      key {String}
 *                   Input:      value {String}
 *                   Output:     {Void}
 *
 *            get:   Method that given a key, return its corresponding value.
 *                   If the key does not exist, return null.
 *
 *                   Input:      key {String}
 *                   Output:     value {String}
 *
 *         remove:   Method that takes a key as its input, and looks for the
 *                   and removes the key-value pair from the bucket.
 *
 *                   Input:      key {String}
 *                   Output:     {Void}
 *
 *         resize:   If the load factor reaches a critical 0.75 or higher,
 *                   double the number of buckets. If the load factor is 0.25
 *                   or less, half the number of buckets. Make sure the number
 *                   of buckets do not fall below 8 and re-index all key-value
 *                   pairs if bucket size is changed.
 *
 *                   Input:      key {String}
 *                   Output:     {Void}
 *
 *  Input: N/A
 *  Output: A HashTable instance
 */


using System;
using System.Collections.Generic;

class HashTable {

  public int buckets = 8;
  public int size = 0;
  public List<string[]>[] storage;

  public HashTable() {
    this.storage = new List<string[]>[buckets];
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  public int hash(string key, int buckets) {
    int hash = 5381;
    for (int i = 0; i < key.Length; i++) {
      hash = ((hash << 5) + hash) + key[i];
    }
    return hash % buckets;
  }

  // Amortized Time Complexity (amortized):
  // Auxiliary Space Complexity (amortized):
  public void insert(string key, string value) {
    // YOUR WORK HERE
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  public string get(string key) {
    // YOUR WORK HERE
    return null;
  }

  // Amortized Time Complexity (amortized):
  // Auxiliary Space Complexity (amortized):
  public void remove(string key) {
    // YOUR WORK HERE
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  public void resize() {
    // YOUR WORK HERE
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    hashTableClassTests();
    hashTableHashMethodTests();
    hashTableInsertMethodTests();
    hashTableGetMethodTests();
    hashTableRemoveMethodTests();
    hashTableResizeMethodTests();
  }

  private static void hashTableClassTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Class");
    runTest(hashTableClassTest1, "able to create an instance", testCount);
    runTest(hashTableClassTest2, "has storage field", testCount);
    runTest(hashTableClassTest3, "has buckets field", testCount);
    runTest(hashTableClassTest4, "has size field", testCount);
    runTest(hashTableClassTest5, "default storage set to a list", testCount);
    runTest(hashTableClassTest6, "default buckets set to 8", testCount);
    runTest(hashTableClassTest7, "default size set to 0", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void hashTableHashMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Hash method");
    runTest(hashTableHashMethodTest1, "has hash method", testCount);
    runTest(hashTableHashMethodTest2, "should hash a string in to a number less than bucket size", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void hashTableInsertMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Insert method");
    runTest(hashTableInsertMethodTest1, "has insert method", testCount);
    runTest(hashTableInsertMethodTest2, "can insert a key-value pair into hash table", testCount);
    runTest(hashTableInsertMethodTest3, "can insert a second key-value pair into hashtable", testCount);
    runTest(hashTableInsertMethodTest4, "can overwrite value if key already exists", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void hashTableGetMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Get method");
    runTest(hashTableGetMethodTest1, "has get method", testCount);
    runTest(hashTableGetMethodTest2, "should return correct value for existing input key", testCount);
    runTest(hashTableGetMethodTest3, "should return null if key does not exist", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void hashTableRemoveMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Remove method");
    runTest(hashTableRemoveMethodTest1, "has remove method", testCount);
    runTest(hashTableRemoveMethodTest2, "can remove a key-value pair", testCount);
    runTest(hashTableRemoveMethodTest3, "does not remove a key-pair that does not exist", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void hashTableResizeMethodTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("HashTable Resize method");
    runTest(hashTableResizeMethodTest1, "has resize method", testCount);
    runTest(hashTableResizeMethodTest2, "doubles hashtable number of buckets if size exceeds 75% of the number of buckets", testCount);
    runTest(hashTableResizeMethodTest3, "halves hashtable number of buckets if size drops below 25% of the number of buckets", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static bool hashTableClassTest1() {
    return new HashTable().GetType() == typeof(HashTable);
  }

  private static bool hashTableClassTest2() {
    return new HashTable().GetType().GetField("storage") != null;
  }

  private static bool hashTableClassTest3() {
    return new HashTable().GetType().GetField("buckets") != null;
  }

  private static bool hashTableClassTest4() {
    return new HashTable().GetType().GetField("size") != null;
  }

  private static bool hashTableClassTest5() {
    HashTable hashTable = new HashTable();
    return hashTable.storage.GetType().IsArray;
  }

  private static bool hashTableClassTest6() {
    HashTable hashTable = new HashTable();
    return hashTable.buckets == 8;
  }

  private static bool hashTableClassTest7() {
    HashTable hashTable = new HashTable();
    return hashTable.size == 0;
  }



  private static bool hashTableHashMethodTest1() {
    return new HashTable().GetType().GetMethod("hash") != null;
  }

  private static bool hashTableHashMethodTest2() {
    HashTable hashTable = new HashTable();
    for(int i = 1; i < 100; i++) {
      int index = hashTable.hash("hello", i);
      if(index >= i) {
        return false;
      }
    }
    return true;
  }


  private static bool hashTableInsertMethodTest1() {
    return new HashTable().GetType().GetMethod("insert") != null;
  }

  private static bool hashTableInsertMethodTest2() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    int index = hashTable.hash("hello", hashTable.buckets);
    return hashTable.size == 1 && isList(hashTable.storage[index]) && hashTable.storage[index].Count == 1;
  }

  private static bool hashTableInsertMethodTest3() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    hashTable.insert("foo", "bar");
    int index1 = hashTable.hash("hello", hashTable.buckets);
    int index2 = hashTable.hash("foo", hashTable.buckets);
    return hashTable.size == 2 && isList(hashTable.storage[index1]) && isList(hashTable.storage[index2]);
  }

  private static bool hashTableInsertMethodTest4() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    hashTable.insert("hello", "universe");
    int index = hashTable.hash("hello", hashTable.buckets);
    return hashTable.size == 1 && isList(hashTable.storage[index]);
  }


  private static bool hashTableGetMethodTest1() {
    return new HashTable().GetType().GetMethod("get") != null;
  }

  private static bool hashTableGetMethodTest2() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    return hashTable.get("hello").Equals("world");
  }

  private static bool hashTableGetMethodTest3() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    return hashTable.get("cat") == null;
  }


  private static bool hashTableRemoveMethodTest1() {
    return new HashTable().GetType().GetMethod("remove") != null;
  }

  private static bool hashTableRemoveMethodTest2() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    hashTable.remove("hello");
    int index = hashTable.hash("hello", hashTable.buckets);
    return hashTable.size == 0 && isList(hashTable.storage[index]) &&
        hashTable.storage[index].Count == 0;
  }

  private static bool hashTableRemoveMethodTest3() {
    HashTable hashTable = new HashTable();
    hashTable.insert("hello", "world");
    hashTable.remove("cat");
    int index = hashTable.hash("hello", hashTable.buckets);
    return hashTable.size == 1 && isList(hashTable.storage[index]);
  }


  private static bool hashTableResizeMethodTest1() {
    return new HashTable().GetType().GetMethod("resize") != null;
  }

  private static bool hashTableResizeMethodTest2() {
    HashTable hashTable = new HashTable();
    string[] keys = {"zero", "one", "two", "three", "four", "five", "six"};
    string[] values = {"0", "1", "2", "3", "4", "5", "6"};
    for (int i = 0; i < 5; i++) {
      hashTable.insert(keys[i], values[i]);
      if (hashTable.buckets != 8) { return false; }
    }
    hashTable.insert(keys[5], values[5]);
    if (hashTable.buckets != 16) { return false; }
    hashTable.insert(keys[6], values[6]);
    return hashTable.buckets == 16;
  }

  private static bool hashTableResizeMethodTest3() {
    HashTable hashTable = new HashTable();
    string[] keys = {"zero", "one", "two", "three", "four", "five", "six"};
    string[] values = {"0", "1", "2", "3", "4", "5", "6"};
    for (int i = 0; i < keys.Length; i++) {
      hashTable.insert(keys[i], values[i]);
    }
    int buckets = hashTable.buckets;
    hashTable.remove("four");
    hashTable.remove("five");
    hashTable.remove("six");
    return buckets == hashTable.buckets * 2;
  }


  private static bool isList(Object o) {
    Type listType = o.GetType();
    bool isList = listType.IsGenericType;
    isList = isList && (listType.GetGenericTypeDefinition() == typeof(List<>) ||
        listType.GetGenericTypeDefinition() == typeof(IList<>));
    return isList;
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
