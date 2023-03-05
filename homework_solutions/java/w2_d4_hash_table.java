/*
 *  Homework - Hash Table
 *
 *  Problem: Hash Table
 *
 *  Prompt: Create a hash table class using separate chaining.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  {List<List<String[]>>} - an arraylist of arraylists (buckets) containing
                           key-value pairs: key-value pairs are String[]{key, value}
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

import java.util.*;
import java.lang.reflect.Method;


class HashTable {

  public int buckets = 8;
  public int size = 0;
  public List<List<String[]>> storage;


  public HashTable() {
    _initStorage();
  }

  private void _initStorage() {
    this.storage = new ArrayList<>(this.buckets);
    for(int i=0; i<this.buckets; i++){
      this.storage.add(new ArrayList<>());
    }
  }

  // Time Complexity: O(K) - where K is the length of the key
  // Auxiliary Space Complexity: O(1)
  public int hash(String key, int buckets) {
    int hash = 5381;
    for (int i = 0; i < key.length(); i++) {
      hash = ((hash << 5) + hash) + key.charAt(i);
    }
    return hash % buckets;
  }

  // Time Complexity (amortized): O(K+N) - where K is the length of the key
  // Auxiliary Space Complexity (amortized): O(1)
  public void insert(String key, String value) {
    int index = hash(key, this.buckets);
    if(index >= this.storage.size()) return;

    List<String[]> bucket = this.storage.get(index);
    for (String[] bucketPair : bucket) {
      if (bucketPair[0].equals(key)) {
        bucketPair[1] = value;
        return;
      }
    }
    bucket.add(new String[]{key, value});
    this.size++;
    resize();
  }

  // Time Complexity: O(K+N) - where K is the length of the key
  // Auxiliary Space Complexity: O(1)
  public String get(String key) {
    int index = hash(key, this.buckets);
    if(index >= this.storage.size()) return null;

    List<String[]> bucket = this.storage.get(index);
    for (String[] bucketPair : bucket) {
      if (bucketPair[0].equals(key)) {
        return bucketPair[1];
      }
    }
    return null;
  }

  // Time Complexity (amortized): O(K+N) - where K is the length of the key
  // Auxiliary Space Complexity (amortized): O(1)
  public void remove(String key) {
    int index = hash(key, this.buckets);
    if(index >= this.storage.size()) return;

    List<String[]> bucket = this.storage.get(index);
    for (int i = 0; i < bucket.size(); i++) {
      if (bucket.get(i)[0].equals(key)) {
        bucket.remove(i);
        this.size--;
        resize();
        return;
      }
    }
  }

  // Time Complexity: O(N)
  // Auxiliary Space Complexity: O(N)
  public void resize() {
    float loadFactor = this.size / (float)this.buckets;
    if (loadFactor > 0.25 && loadFactor < 0.75) { return; }
    if (loadFactor <= 0.25 && this.buckets == 8) { return; }

    List<List<String[]>> temp = this.storage;
    this.buckets = loadFactor >= 0.75 ? this.buckets * 2 : this.buckets / 2;
    _initStorage();


    for (List<String[]> bucket : temp) {
      if (bucket != null) {
        for (String[] bucketPair : bucket) {
          this.size--;
          this.insert(bucketPair[0], bucketPair[1]);
        }
      }
    }
  }
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

class HashTableTests {

  public interface Test {
    boolean execute();
  }

  public static boolean hasMethod(String methodName) {
    HashTable hashTable = new HashTable();
    Method[] methods = hashTable.getClass().getMethods();
    for (Method m : methods) {
      if (m.getName().equals(methodName)) {
        return true;
      }
    }
    return false;
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("HashTable Class");

    assertTest(testCount, "has storage field", () -> {
      HashTable hashTable = new HashTable();
      try {
        hashTable.getClass().getDeclaredField("storage");
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "has buckets field", () -> {
      HashTable hashTable = new HashTable();
      try {
        hashTable.getClass().getDeclaredField("buckets");
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "has size field", () -> {
      HashTable hashTable = new HashTable();
      try {
        hashTable.getClass().getDeclaredField("size");
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    assertTest(testCount, "default storage set to an ArrayList", () -> {
      HashTable hashTable = new HashTable();
      return hashTable.storage instanceof ArrayList;
    });

    assertTest(testCount, "default buckets set to 8", () -> {
      HashTable hashTable = new HashTable();
      return hashTable.buckets == 8;
    });

    assertTest(testCount, "default size set to 0", () -> {
      HashTable hashTable = new HashTable();
      return hashTable.size == 0;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("HashTable Hash method");

    assertTest(testCount, "has hash method", () -> hasMethod("hash"));

    assertTest(testCount, "should hash a string in to a number less than bucket size", () -> {
      HashTable hashTable = new HashTable();
      try {
        for(int i = 1; i < 100; i++) {
          int index = hashTable.hash("hello", i);
          if(index >= i) {
            return false;
          }
        }
        return true;
      } catch (Exception e) {
        e.printStackTrace();
        return false;
      }
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("HashTable Insert method");

    assertTest(testCount, "has insert method", () -> hasMethod("insert"));

    assertTest(testCount, "can insert a key-value pair into hash table", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      int index = hashTable.hash("hello", hashTable.buckets);
      return hashTable.size == 1 &&
             hashTable.storage.get(index) instanceof ArrayList &&
             hashTable.storage.get(index).size() == 1;
    });

    assertTest(testCount, "can insert a second key-value pair into hashtable", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      hashTable.insert("foo", "bar");
      int index1 = hashTable.hash("hello", hashTable.buckets);
      int index2 = hashTable.hash("foo", hashTable.buckets);
      return hashTable.size == 2 && hashTable.storage.get(index1) instanceof ArrayList && hashTable.storage.get(index2) instanceof ArrayList;
    });

    assertTest(testCount, "can overwrite value if key already exists", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      hashTable.insert("hello", "universe");
      int index = hashTable.hash("hello", hashTable.buckets);
      return hashTable.size == 1 &&
             hashTable.storage.get(index) instanceof ArrayList;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("HashTable Get method");

    assertTest(testCount, "has get method", () -> hasMethod("get"));

    assertTest(testCount, "should return correct value for existing input key", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      return hashTable.get("hello").equals("world");
    });

    assertTest(testCount, "should return null if key does not exist", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      return hashTable.get("cat") == null;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("HashTable Remove method");

    assertTest(testCount, "has remove method", () -> hasMethod("remove"));

    assertTest(testCount, "can remove a key-value pair", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      hashTable.remove("hello");
      int index = hashTable.hash("hello", hashTable.buckets);
      return hashTable.size == 0 &&
        hashTable.storage.get(index) instanceof ArrayList &&
        hashTable.storage.get(index).size() == 0;
    });

    assertTest(testCount, "does not remove a key-pair that does not exist", () -> {
      HashTable hashTable = new HashTable();
      hashTable.insert("hello", "world");
      hashTable.remove("cat");
      int index = hashTable.hash("hello", hashTable.buckets);
      return hashTable.size == 1 &&
        hashTable.storage.get(index) instanceof ArrayList;
    });

    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("HashTable Resize method");

    assertTest(testCount, "has resize method", () -> hasMethod("resize"));

    assertTest(testCount, "doubles hashtable number of buckets if size exceeds 75% of the number of buckets", () -> {
      HashTable hashTable = new HashTable();
      String[] keys = {"zero", "one", "two", "three", "four", "five", "six"};
      String[] values = {"0", "1", "2", "3", "4", "5", "6"};
      for (int i = 0; i < 5; i++) {
        hashTable.insert(keys[i], values[i]);
        if (hashTable.buckets != 8) { return false; }
      }
      hashTable.insert(keys[5], values[5]);
      if (hashTable.buckets != 16) { return false; }
      hashTable.insert(keys[6], values[6]);
      return hashTable.buckets == 16;
    });

    assertTest(testCount, "halves hashtable number of buckets if size drops below 25% of the number of buckets", () -> {
      HashTable hashTable = new HashTable();
      String[] keys = {"zero", "one", "two", "three", "four", "five", "six"};
      String[] values = {"0", "1", "2", "3", "4", "5", "6"};
      for (int i = 0; i < keys.length; i++) {
        hashTable.insert(keys[i], values[i]);
      }
      int buckets = hashTable.buckets;
      hashTable.remove("four");
      hashTable.remove("five");
      hashTable.remove("six");
      return buckets == hashTable.buckets * 2;
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

  }

  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) { }
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
