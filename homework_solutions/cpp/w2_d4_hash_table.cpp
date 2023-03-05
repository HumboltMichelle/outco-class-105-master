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
 *                                   key-value pairs are string[]{key, value}
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
 *                   Input:      key {string}
 *                   Input:      buckets {Integer}
 *                   Output:     index {Integer}
 *
 *         insert:   Method that adds a key-value pair into the storage. If the
 *                   key already exists, the value should be updated. Use
 *                   separate chaining to handle collisions.
 *
 *                   Input:      key {string}
 *                   Input:      value {string}
 *                   Output:     {Void}
 *
 *            get:   Method that given a key, return its corresponding value.
 *                   If the key does not exist, return NULL.
 *
 *                   Input:      key {string}
 *                   Output:     value {string}
 *
 *         remove:   Method that takes a key as its input, and looks for the
 *                   and removes the key-value pair from the bucket.
 *
 *                   Input:      key {string}
 *                   Output:     {Void}
 *
 *         resize:   If the load factor reaches a critical 0.75 or higher,
 *                   double the number of buckets. If the load factor is 0.25
 *                   or less, half the number of buckets. Make sure the number
 *                   of buckets do not fall below 8 and re-index all key-value
 *                   pairs if bucket size is changed.
 *
 *                   Input:      key {string}
 *                   Output:     {Void}
 *
 *  Input: N/A
 *  Output: A HashTable instance
 */

#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
#include <typeinfo>
using namespace std;

class HashTable {
  public:
    int buckets = 8;
    int size = 0;
    vector<vector<vector<string>>> storage;

    HashTable() {
      _initStorage();
    }


    // Time Complexity: O(K) - where K is the length of the key
    // Auxiliary Space Complexity: O(1)
    int hash(string key, int buckets) {
      int hash = 5381;
      for (int i = 0; i < key.size(); i++) {
        hash = ((hash << 5) + hash) + key[i];
      }
      return hash % buckets;
    }

    // Time Complexity (amortized): O(K+N) - where K is the length of the key
    // Auxiliary Space Complexity (amortized): O(1)
    void insert(string key, string value) {
      int index = hash(key, this->buckets);
      if(index > this->storage.size()) return;

      vector<vector<string>> &bucket = this->storage[index];
      for (int i = 0; i < bucket.size(); i++) {
        if (bucket[i][0] == key) {
          bucket[i][1] = value;
          return;
        }
      }
      bucket.push_back(vector<string>{key, value});
      this->size++;
      resize();
    }


    // Time Complexity: O(K+N) - where K is the length of the key
    // Auxiliary Space Complexity: O(1)
    string get(string key) {
      int index = hash(key, this->buckets);
      if(index > this->storage.size()) return "";

      vector<vector<string>> &bucket = this->storage[index];
      for (int i = 0 ; i < bucket.size() ; i++) {
        if (bucket[i][0] == key) {
          return bucket[i][1];
        }
      }
      return "";
    }


    // Time Complexity (amortized): O(K+N) - where K is the length of the key
    // Auxiliary Space Complexity (amortized): O(1)
    void remove(string key) {
      int index = hash(key, this->buckets);
      if(index > this->storage.size()) return;

      vector<vector<string>> &bucket = this->storage[index];
      for (int i = 0; i < bucket.size(); i++) {
        if (bucket[i][0] == key) {
          bucket.erase(bucket.begin() + i);
          this->size--;
          resize();
          return;
        }
      }
    }


    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(N)
    void resize() {
      float loadFactor = this->size / (float)this->buckets;
      if (loadFactor > 0.25 && loadFactor < 0.75) { return; }
      if (loadFactor <= 0.25 && this->buckets == 8) { return; }

      vector<vector<vector<string>>> temp = this->storage;
      this->buckets = loadFactor >= 0.75 ? this->buckets * 2 : this->buckets / 2;
      _initStorage();

      for (int i = 0; i < temp.size(); i++) {
        vector<vector<string>> bucket = temp[i];
        for (int j = 0 ; j < bucket.size(); j++) {
          this->size--;
          this->insert(bucket[j][0], bucket[j][1]);
        }
      }
    }
  private:
    void _initStorage() {
      this->storage = vector<vector<vector<string>>>(this->buckets);
      for(int i=0; i<this->buckets; i++){
        this->storage.push_back(vector<vector<string>>{});
      }
    }

};



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void hashTableClassTests(),hashTableHashMethodTests(),hashTableInsertMethodTests(),
    hashTableGetMethodTests(),hashTableRemoveMethodTests(),hashTableResizeMethodTests();

bool hashTableClassTest1(),hashTableClassTest2(),hashTableClassTest3(),hashTableClassTest4(),
    hashTableClassTest5(),hashTableClassTest6(),hashTableClassTest7();
bool hashTableHashMethodTest1(), hashTableHashMethodTest2();
bool hashTableInsertMethodTest1(),hashTableInsertMethodTest2(),hashTableInsertMethodTest3(),
    hashTableInsertMethodTest4();
bool hashTableGetMethodTest1(), hashTableGetMethodTest2(), hashTableGetMethodTest3();
bool hashTableRemoveMethodTest1(),hashTableRemoveMethodTest2(),hashTableRemoveMethodTest3();
bool hashTableResizeMethodTest1(), hashTableResizeMethodTest2(),hashTableResizeMethodTest3();

int main() {
  hashTableClassTests();
  hashTableHashMethodTests();
  hashTableInsertMethodTests();
  hashTableGetMethodTests();
  hashTableRemoveMethodTests();
  hashTableResizeMethodTests();
  return 0;
}


void hashTableClassTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Class" << endl;
  runTest(hashTableClassTest1, "able to create an instance", testCount);
  runTest(hashTableClassTest2, "has storage field", testCount);
  runTest(hashTableClassTest3, "has buckets field", testCount);
  runTest(hashTableClassTest4, "has size field", testCount);
  runTest(hashTableClassTest5, "default storage set to a list", testCount);
  runTest(hashTableClassTest6, "default buckets set to 8", testCount);
  runTest(hashTableClassTest7, "default size set to 0", testCount);
  printTestsPassed(testCount);
}

void hashTableHashMethodTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Hash method" << endl;
  runTest(hashTableHashMethodTest1, "has hash method", testCount);
  runTest(hashTableHashMethodTest2, "should hash a string in to a number less than bucket size", testCount);
  printTestsPassed(testCount);
}

void hashTableInsertMethodTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Insert method" << endl;
  runTest(hashTableInsertMethodTest1, "has insert method", testCount);
  runTest(hashTableInsertMethodTest2, "can insert a key-value pair into hash table", testCount);
  runTest(hashTableInsertMethodTest3, "can insert a second key-value pair into hashtable", testCount);
  runTest(hashTableInsertMethodTest4, "can overwrite value if key already exists", testCount);
  printTestsPassed(testCount);
}

void hashTableGetMethodTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Get method" << endl;
  runTest(hashTableGetMethodTest1, "has get method", testCount);
  runTest(hashTableGetMethodTest2, "should return correct value for existing input key", testCount);
  runTest(hashTableGetMethodTest3, "should return NULL if key does not exist", testCount);
  printTestsPassed(testCount);
}

void hashTableRemoveMethodTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Remove method" << endl;
  runTest(hashTableRemoveMethodTest1, "has remove method", testCount);
  runTest(hashTableRemoveMethodTest2, "can remove a key-value pair", testCount);
  runTest(hashTableRemoveMethodTest3, "does not remove a key-pair that does not exist", testCount);
  printTestsPassed(testCount);
}

void hashTableResizeMethodTests() {
  int testCount[] = {0, 0};
  cout << "HashTable Resize method" << endl;
  runTest(hashTableResizeMethodTest1, "has resize method", testCount);
  runTest(hashTableResizeMethodTest2, "doubles hashtable number of buckets if size exceeds 75% of the number of buckets", testCount);
  runTest(hashTableResizeMethodTest3, "halves hashtable number of buckets if size drops below 25% of the number of buckets", testCount);
  printTestsPassed(testCount);
}


// SFINAE test
template <typename T>
class HasStorage{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::storage) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasBuckets{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::buckets) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasSize{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::size) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasHash{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::hash) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasInsert{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::insert) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasGet{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::get) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRemove{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::remove) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasResize{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::resize) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};



bool hashTableClassTest1() {
  HashTable *hashTable = new HashTable();
  bool typeMatched = typeid(*hashTable).name() == typeid(HashTable).name();
  delete(hashTable);
  return typeMatched;
}

bool hashTableClassTest2() {
  return HasStorage<HashTable>::value;
}

bool hashTableClassTest3() {
  return HasBuckets<HashTable>::value;
}

bool hashTableClassTest4() {
  return HasSize<HashTable>::value;
}

bool hashTableClassTest5() {
  HashTable *hashTable = new HashTable();
  bool isVector = typeid(hashTable->storage).name() == typeid(vector<vector<vector<string>>>).name();
  delete(hashTable);
  return isVector;
}

bool hashTableClassTest6() {
  HashTable *hashTable = new HashTable();
  bool testVal = hashTable->buckets == 8;
  delete(hashTable);
  return testVal;
}

bool hashTableClassTest7() {
  HashTable *hashTable = new HashTable();
  bool testVal = hashTable->size == 0;
  delete(hashTable);
  return testVal;
}


bool hashTableHashMethodTest1() {
  return HasHash<HashTable>::value;
}

bool hashTableHashMethodTest2() {
  HashTable *hashTable = new HashTable();
  bool testVal = true;
  for(int i = 1; i < 100; i++) {
    int index = hashTable->hash("hello", i);
    if(index >= i) {
      testVal = false;
    }
  }
  delete(hashTable);
  return testVal;
}


bool hashTableInsertMethodTest1() {
  return HasInsert<HashTable>::value;
}

bool hashTableInsertMethodTest2() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  int index = hashTable->hash("hello", hashTable->buckets);
  bool isList = typeid(hashTable->storage[index]).name() == typeid(vector<vector<string>>).name();
  bool testVal = hashTable->size == 1 && isList && hashTable->storage[index].size() == 1;
  delete(hashTable);
  return testVal;
}

bool hashTableInsertMethodTest3() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  hashTable->insert("foo", "bar");
  int index1 = hashTable->hash("hello", hashTable->buckets);
  int index2 = hashTable->hash("foo", hashTable->buckets);
  bool isList = typeid(hashTable->storage[index1]).name() == typeid(vector<vector<string>>).name();
  isList &= typeid(hashTable->storage[index2]).name() == typeid(vector<vector<string>>).name();
  bool testVal = hashTable->size == 2 && isList;
  delete(hashTable);
  return testVal;
}

bool hashTableInsertMethodTest4() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  hashTable->insert("hello", "universe");
  int index = hashTable->hash("hello", hashTable->buckets);
  bool isList = typeid(hashTable->storage[index]).name() == typeid(vector<vector<string>>).name();
  bool testVal = hashTable->size == 1 && isList;
  delete(hashTable);
  return testVal;
}


bool hashTableGetMethodTest1() {
  return HasGet<HashTable>::value;
}

bool hashTableGetMethodTest2() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  bool testVal = hashTable->get("hello") == "world";
  delete(hashTable);
  return testVal;
}

bool hashTableGetMethodTest3() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  bool testVal = hashTable->get("cat").size() == 0;
  delete(hashTable);
  return testVal;
}


bool hashTableRemoveMethodTest1() {
  return HasRemove<HashTable>::value;
}

bool hashTableRemoveMethodTest2() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  hashTable->remove("hello");
  int index = hashTable->hash("hello", hashTable->buckets);
  bool isList = typeid(hashTable->storage[index]).name() == typeid(vector<vector<string>>).name();
  bool testVal = hashTable->size == 0 && isList && hashTable->storage[index].size() == 0;
  delete(hashTable);
  return testVal;
}

bool hashTableRemoveMethodTest3() {
  HashTable *hashTable = new HashTable();
  hashTable->insert("hello", "world");
  hashTable->remove("cat");
  int index = hashTable->hash("hello", hashTable->buckets);
  bool isList = typeid(hashTable->storage[index]).name() == typeid(vector<vector<string>>).name();
  bool testVal = hashTable->size == 1 && isList;
  delete(hashTable);
  return testVal;
}


bool hashTableResizeMethodTest1() {
  return HasResize<HashTable>::value;
}

bool hashTableResizeMethodTest2() {
  HashTable *hashTable = new HashTable();
  string keys[] = {"zero", "one", "two", "three", "four", "five", "six"};
  string values[] = {"0", "1", "2", "3", "4", "5", "6"};
  bool testVal;
  for (int i = 0; i < 5; i++) {
    hashTable->insert(keys[i], values[i]);
    if (hashTable->buckets != 8) {
      testVal = false;
      delete(hashTable);
      return testVal;
    }
  }
  hashTable->insert(keys[5], values[5]);
  if (hashTable->buckets != 16) {
    testVal = false;
    delete(hashTable);
    return testVal;
  }
  hashTable->insert(keys[6], values[6]);
  testVal = hashTable->buckets == 16;
  delete(hashTable);
  return testVal;
}

bool hashTableResizeMethodTest3() {
  HashTable *hashTable = new HashTable();
  string keys[] = {"zero", "one", "two", "three", "four", "five", "six"};
  string values[] = {"0", "1", "2", "3", "4", "5", "6"};
  for(int i = 0; i < 6; i++) {
    hashTable->insert(keys[i], values[i]);
  }
  int buckets = hashTable->buckets;
  hashTable->remove("four");
  hashTable->remove("five");
  hashTable->remove("six");
  bool testVal = buckets == hashTable->buckets * 2;
  delete(hashTable);
  return testVal;
}


// this is to wrap the test and check for exceptions
void runTest (bool test(), string testName, int testCount[]){
  testCount[1]++;
  bool testPassed = test();
  if(testPassed) testCount[0]++;
  string result = "  " + (to_string(testCount[1]) + ")   ") + (testPassed ? "true" : "false") + " : " + testName;
  cout << result << endl;
}

// this is to print the number of test cases passed for a test suite function
void printTestsPassed(int testCount[]) {
  cout << "PASSED: " + to_string(testCount[0]) + " / " + to_string(testCount[1]) + "\n\n" <<endl;
}
