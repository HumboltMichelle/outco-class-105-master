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
              previous: {Node*} (initially NULL)
              next: {Node*} (initially NULL)

         II.  LRUCache Class
              Create an LRUCache class

              The LRUCache class should contain the following properties:
              capacity: {Integer}
              count: {Integer} (initially 0)
              cache: {Hash Table} The keys represent unique ids of each node, and the values represent the node objects
                                that possess those keys.
              head: {Node*}
              tail: {Node*}

     Your LRU cache should have the following methods:

      get(key): Retreives a value from the cache (will always be positive) at
                the key if the key exists in the cache, otherwise returns empty string.

      set(key,value): Inserts the value at the key or creates a new key:value entry
                if key is not present. When the cache reaches its capacity, it
                should invalidate the least recently used item before
                inserting a new item.

          HINT: Consider what data structure(s) might be neccessary to
                implement the LRU Cache

     Example:
     lruCache = new LRUCache(03);
     lruCache->set('doc', 'david');
     lruCache->set('cpo', 'joshua');
     lruCache->set('ceo', 'andy');

     lruCache->get('doc'); => 'david'
     lruCache->set('swe', 'ron');
     lruCache->get('cpo'); => ''


*/

#include <string>
#include <iostream>
#include <unordered_map>
#include <typeinfo>
using namespace std;


class Node {
  public:
    string key;
    string value;
    Node *previous, *next;
};


class LRUCache {
  public:
    int capacity;
    int count;
    unordered_map<string, Node*> cache;
    Node *head, *tail;

    LRUCache(int capacity) {
      this->count = 0;
      this->capacity = capacity;
      this->head = new Node();
      this->tail = new Node();
      this->head->next = this->tail;
      this->tail->previous = this->head;
    }


    string get(string key) {
      Node *node = cache[key];
      if(node == NULL){
        return ""; // should raise exception here.
      }

      // move the accessed node to the head;
      this->moveToHead(node);

      return node->value;
    }

    void set(string key, string value) {
      Node *node = cache[key];

      if(node == NULL){

        Node *newNode = new Node();
        newNode->key = key;
        newNode->value = value;

        this->cache[key] = newNode;
        this->addNode(newNode);

        ++count;

        if(count > capacity){
          // pop the tail
          Node *tail = this->removeFromTail();
          this->cache.erase(tail->key);
          --count;
        }
      }else{
        // update the value.
        node->value = value;
        this->moveToHead(node);
      }
    }

  private:
    /*
    Following are helper methods that will aid in
    implementing the get and set methods for this
    LRU Cache data structure
    */

    /*
    Insert a new node immediately following the
    head node
    */
    void addNode(Node *node) {
      node->previous = head;
      node->next = head->next;

      head->next->previous = node;
      head->next = node;
    }

    /*
    Remove an existing node from the linked list
    */
    void removeNode(Node *node) {
      Node *previous = node->previous;
      Node *next = node->next;

      previous->next = next;
      next->previous = previous;
    }

    /*
    Move particular node from any position within
    the linked list to the head of the linked
    list
    */
    void moveToHead(Node *node) {
      this->removeNode(node);
      this->addNode(node);
    }

    /*
    Remove the current tail
    */
    Node* removeFromTail() {
      Node *res = tail->previous;
      this->removeNode(res);
      return res;
    }
};



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void nodeClassTests(),LRUCacheTests(),LRUCacheMethodsTests();

bool nodeClassTest1(),nodeClassTest2(),nodeClassTest3(),nodeClassTest4(),nodeClassTest5();
bool LRUCacheTest1(),LRUCacheTest2(),LRUCacheTest3(),LRUCacheTest4(),LRUCacheTest5(),
    LRUCacheTest6(),LRUCacheTest7(),LRUCacheTest8(),LRUCacheTest9(),LRUCacheTest10(),LRUCacheTest11();
bool LRUCacheMethodsTest1(),LRUCacheMethodsTest2(),LRUCacheMethodsTest3(),LRUCacheMethodsTest4(),LRUCacheMethodsTest5();


int main() {
  nodeClassTests();
  LRUCacheTests();
  LRUCacheMethodsTests();
  return 0;
}

void nodeClassTests() {
    int testCount[] = {0, 0};
    cout << "Node Class" << endl;
    runTest(nodeClassTest1, "able to create an instance", testCount);
    runTest(nodeClassTest2, "has key property", testCount);
    runTest(nodeClassTest3, "has value property", testCount);
    runTest(nodeClassTest4, "has next property", testCount);
    runTest(nodeClassTest5, "has previous property", testCount);
    printTestsPassed(testCount);
}

void LRUCacheTests() {
    int testCount[] = {0, 0};
    cout << "LRUCache Class" << endl;
    runTest(LRUCacheTest1, "able to create an instance", testCount);
    runTest(LRUCacheTest2, "has capacity property", testCount);
    runTest(LRUCacheTest3, "capacity property is an integer", testCount);
    runTest(LRUCacheTest4, "has count property", testCount);
    runTest(LRUCacheTest5, "count property is an integer", testCount);
    runTest(LRUCacheTest6, "has cache property", testCount);
    runTest(LRUCacheTest7, "cache property is a dictionary", testCount);
    runTest(LRUCacheTest8, "has head property", testCount);
    runTest(LRUCacheTest9, "head property is a Node pointer", testCount);
    runTest(LRUCacheTest10, "has head property", testCount);
    runTest(LRUCacheTest11, "head property is a Node pointer", testCount);
    printTestsPassed(testCount);
}

void LRUCacheMethodsTests() {
    int testCount[] = {0, 0};
    cout << "LRUCache Methods Tests" << endl;
    runTest(LRUCacheMethodsTest1, "should be able to set and get key-value pairs", testCount);
    runTest(LRUCacheMethodsTest2, "should be able to overwrite values with same keys when using set method", testCount);
    runTest(LRUCacheMethodsTest3, "old key value pairs should be removed when capacity has been exceeded", testCount);
    runTest(LRUCacheMethodsTest4, "most recently modified/viewed items should be moved to front of LRU cache while stale items are moved to end", testCount);
    runTest(LRUCacheMethodsTest5, "should be able to replace multiple stale items", testCount);
    printTestsPassed(testCount);
}

// SFINAE test
template <typename T>
class HasKey{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::key) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasValue{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::value) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasCapacity{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::capacity) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasCount{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::count) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasHead{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::head) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasCache{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::cache) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasTail{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::tail) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};


bool nodeClassTest1() {
  Node *node = new Node();
  bool typeMatched = typeid(*node).name() == typeid(Node).name();
  delete(node);
  return typeMatched;
}

bool nodeClassTest2() {
  return HasKey<Node>::value;
}

bool nodeClassTest3() {
  return HasValue<Node>::value;
}

bool nodeClassTest4() {
  Node *node = new Node();
  bool testVal = node->next == NULL;
  delete(node);
  return testVal;
}

bool nodeClassTest5() {
  Node *node = new Node();
  bool testVal = node->previous == NULL;
  delete(node);
  return testVal;
}


bool LRUCacheTest1() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(*lruCache).name() == typeid(LRUCache).name();
  delete(lruCache);
  return typeMatched;
}

bool LRUCacheTest2() {
    return HasCapacity<LRUCache>::value;
}

bool LRUCacheTest3() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(lruCache->capacity).name() == typeid(int).name();
  delete(lruCache);
  return typeMatched;
}

bool LRUCacheTest4() {
    return HasCount<LRUCache>::value;
}

bool LRUCacheTest5() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(lruCache->count).name() == typeid(int).name();
  delete(lruCache);
  return typeMatched;
}

bool LRUCacheTest6() {
    return HasCache<LRUCache>::value;
}

bool LRUCacheTest7() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(lruCache->cache).name() == typeid(unordered_map<string, Node*>).name();
  delete(lruCache);
  return typeMatched;
}

bool LRUCacheTest8() {
    return HasHead<LRUCache>::value;
}

bool LRUCacheTest9() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(lruCache->head).name() == typeid(Node*).name();
  delete(lruCache);
  return typeMatched;
}

bool LRUCacheTest10() {
    return HasTail<LRUCache>::value;
}

bool LRUCacheTest11() {
  LRUCache *lruCache = new LRUCache(0);
  bool typeMatched = typeid(lruCache->tail).name() == typeid(Node*).name();
  delete(lruCache);
  return typeMatched;
}



bool LRUCacheMethodsTest1() {
  LRUCache *lruCache = new LRUCache(3);
  lruCache->set("doc", "david");
  lruCache->set("cpo", "joshua");
  lruCache->set("ceo", "andy");
  string example1 = lruCache->get("doc");
  string example2 = lruCache->get("cpo");
  string example3 = lruCache->get("ceo");
  return example1 == "david" && example2 == "joshua" && example3 == "andy";
}

bool LRUCacheMethodsTest2() {
  LRUCache *lruCache = new LRUCache(3);
  lruCache->set("student", "henry");
  lruCache->set("student", "eliza");
  string example = lruCache->get("student");
  return example == "eliza";
}

bool LRUCacheMethodsTest3() {
  LRUCache *lruCache = new LRUCache(3);
  lruCache->set("dentist", "akali");
  lruCache->set("doctor", "swain");
  lruCache->set("lawyer", "kennan");
  lruCache->set("judge", "leona");
  return lruCache->get("dentist") == "" && lruCache->get("doctor") == "swain";
}

bool LRUCacheMethodsTest4() {
  LRUCache *lruCache = new LRUCache(3);
  lruCache->set("doc", "david");
  lruCache->set("cpo", "joshua");
  lruCache->set("ceo", "andy");
  lruCache->get("doc");
  lruCache->set("swe", "ron");
  return lruCache->get("cpo").empty() && lruCache->get("swe") == "ron";
}

bool LRUCacheMethodsTest5() {
  LRUCache *lruCache = new LRUCache(3);
  lruCache->set("one", "hello");
  lruCache->set("two", "bye");
  lruCache->set("three", "blah");
  lruCache->set("four", "foo");
  lruCache->set("five", "fum");
  lruCache->set("six", "great");
  string ex1 = lruCache->get("one");
  string ex2 = lruCache->get("two");
  string ex3 = lruCache->get("three");
  string ex4 = lruCache->get("four");
  string ex5 = lruCache->get("five");
  string ex6 = lruCache->get("six");
  return ex1.empty() && ex2.empty() && ex3.empty() && ex4 == "foo" && ex5 == "fum" && ex6 == "great";
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
