/**
 *  Homework - Linked List
 *
 *  Problem 1: ListNode class
 *
 *  Prompt:    Create a ListNode class
 *
 *             The ListNode class should contain the following public properties:
 *
 *                 value:   {Integer}
 *                  next:   {ListNode} (initially NULL)
 *
 *               Example:   ListNode *sample = new ListNode(1)
 *                          sample->value     // 1
 *                          sample->next      // NULL
 *
 *
 *  Problem 2: LinkedList class
 *
 *  Prompt:    Create a LinkedList class
 *
 *             The LinkedList class should contain the following public
 *             properties:
 *
 *                length:   {Integer}
 *                  head:   {ListNode}
 *                  tail:   {ListNode}
 *
 *              The LinkedList class should also contain the following public
 *              methods:
 *
 *                append:   A method that appends a value to the end of the
 *                          LinkedList.
 *
 *                          Input:     {Integer}
 *                          Output:    {Void}
 *
 *                insert:   A method that inserts an integer value at a set
 *                          index in the LinkedList (assume head index is 0).
 *
 *                          Input:     value {Integer}
 *                          Input:     index {Integer}
 *                          Output:    {Void}
 *
 *                delete:   A method that removes a node at a specified index.
 *
 *                          Input:     index {Integer}
 *                          Output:    {Void}
 *
 *              contains:   A method that checks to see if a value is contained
 *                          in the list.
 *
 *                          Input:     value {Integer}
 *                          Output:    {Boolean}
 */

#include <typeinfo>
#include <type_traits>
#include <iostream>
using namespace std;


class ListNode {
   public:
     int value;
     ListNode* next;

     ListNode(int input) {
       this->value = input;
       this->next = NULL;
     }
};


class LinkedList {
  public:
    int length = 0;
    ListNode *head;
    ListNode *tail;

    LinkedList() {
      this->head = NULL;
      this->tail = NULL;
    }

    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(1)
    void insert_value(int value, int index){
      if(index < 0 || index > length){
       return;
      }
      ListNode *newNode = new ListNode(value);

      if(length == 0){
        head = newNode;
        tail = newNode;
      } else if(index == 0){
        newNode->next = head;
        head = newNode;
      } else if(index == length){

        tail->next = newNode;
        tail = newNode;
      } else {
        ListNode *prev = head;
        for(int i = 0; i < index-1; i++){
          prev = prev->next;
        }
        newNode->next = prev->next;
        prev->next = newNode;
      }
      length++;
    }


    // Time Complexity: O(1)
    // Auxiliary Space Complexity: O(1)
    void append_value(int value){
      insert_value(value, length);
    }


    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(1)

    void delete_node(int index){
      if(index < 0 || index >= length){
        return;
      }

      if(length == 1){
        head = NULL;
        tail = NULL;
      } else if (index == 0){
        head = head->next;
      } else {
        ListNode *prev = head;
        for(int i = 0; i < index-1; i++){
          prev = prev->next;
        }
        prev->next = prev->next->next;
        if(index == length-1){
          tail = prev;
        }
      }
      length--;
    }


    // Time Complexity: O(N)
    // Auxiliary Space Complexity: O(1)
    bool contains_value(int value){
      ListNode *current = head;
      while(current != NULL){
        if(current->value == value){
          return true;
        }
        current = current->next;
      }
      return false;
    }
 };


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void listNodeClassTests(),linkedListClassTests(),linkedListInsertMethodTests();
void linkedListAppendMethodTests(),linkedListDeleteMethodTests(),linkedListContainsMethodTests();

bool listNodeClassTest1(),listNodeClassTest2(),listNodeClassTest3(),listNodeClassTest4(),listNodeClassTest5();
bool linkedListClassTest1(),linkedListClassTest2(),linkedListClassTest3(),linkedListClassTest4(),
    linkedListClassTest5(),linkedListClassTest6(),linkedListClassTest7();
bool linkedListInsertMethodTest1(), linkedListInsertMethodTest2(), linkedListInsertMethodTest3(),
    linkedListInsertMethodTest4(), linkedListInsertMethodTest5();
bool linkedListAppendMethodTest1(), linkedListAppendMethodTest2(), linkedListAppendMethodTest3(), linkedListAppendMethodTest4();
bool linkedListDeleteMethodTest1(), linkedListDeleteMethodTest2(), linkedListDeleteMethodTest3(),
    linkedListDeleteMethodTest4(), linkedListDeleteMethodTest5();
bool linkedListContainsMethodTest1(), linkedListContainsMethodTest2(), linkedListContainsMethodTest3();

int main(){
  listNodeClassTests();
  linkedListClassTests();
  linkedListInsertMethodTests();
  linkedListAppendMethodTests();
  linkedListDeleteMethodTests();
  linkedListContainsMethodTests();
  return 0;
}

void listNodeClassTests() {
  int testCount[] = {0, 0};
  cout << "ListNode Class"<< endl;
  runTest(listNodeClassTest1, "able to create an instance", testCount);
  runTest(listNodeClassTest2, "has value field", testCount);
  runTest(listNodeClassTest3, "able to assign a value upon instantiation", testCount);
  runTest(listNodeClassTest4, "able to reassign a value", testCount);
  runTest(listNodeClassTest5, "able to point to another node", testCount);
  printTestsPassed(testCount);
}

void linkedListClassTests() {
  int testCount[] = {0, 0};
  cout << "LinkedList Class"<< endl;
  runTest(linkedListClassTest1, "able to create an instance", testCount);
  runTest(linkedListClassTest2, "has head field", testCount);
  runTest(linkedListClassTest3, "has tail field", testCount);
  runTest(linkedListClassTest4, "has length field", testCount);
  runTest(linkedListClassTest5, "default head set to NULL", testCount);
  runTest(linkedListClassTest6, "default tail set to NULL", testCount);
  runTest(linkedListClassTest7, "default length set to 0", testCount);
  printTestsPassed(testCount);
}

void linkedListInsertMethodTests() {
  int testCount[] = {0, 0};
  cout << "LinkedList Insert Method"<< endl;
  runTest(linkedListInsertMethodTest1, "has insert method", testCount);
  runTest(linkedListInsertMethodTest2, "able to insert a node into empty linked list", testCount);
  runTest(linkedListInsertMethodTest3, "able to insert a node after another node", testCount);
  runTest(linkedListInsertMethodTest4, "able to insert a node before another node", testCount);
  runTest(linkedListInsertMethodTest5, "does not insert a node if index is out of bounds linked list", testCount);
  printTestsPassed(testCount);
}

void linkedListAppendMethodTests() {
  int testCount[] = {0, 0};
  cout << "LinkedList Append Method"<< endl;
  runTest(linkedListAppendMethodTest1, "has append method", testCount);
  runTest(linkedListAppendMethodTest2, "able to append a node into empty linked list", testCount);
  runTest(linkedListAppendMethodTest3, "able to append a second node into a linked list", testCount);
  runTest(linkedListAppendMethodTest4, "able to append a third node into a linked list", testCount);
  printTestsPassed(testCount);
}

void linkedListDeleteMethodTests() {
  int testCount[] = {0, 0};
  cout << "LinkedList Delete Method"<< endl;
  runTest(linkedListDeleteMethodTest1, "has delete method", testCount);
  runTest(linkedListDeleteMethodTest2, "able to delete a node from the head", testCount);
  runTest(linkedListDeleteMethodTest3, "able to delete a node in between two nodes", testCount);
  runTest(linkedListDeleteMethodTest4, "able to delete the only node in a linked list", testCount);
  runTest(linkedListDeleteMethodTest5, "does not delete a node when the index is out of bounds", testCount);
  printTestsPassed(testCount);
}

void linkedListContainsMethodTests() {
  int testCount[] = {0, 0};
  cout << "LinkedList Contains Method"<< endl;
  runTest(linkedListContainsMethodTest1, "has contains method", testCount);
  runTest(linkedListContainsMethodTest2, "returns true if linked list contains value", testCount);
  runTest(linkedListContainsMethodTest3, "returns false if linked list does not contains value", testCount);
  printTestsPassed(testCount);
}

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

template <typename T>
class HasAppend{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::append_value) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

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

template <typename T>
class HasLength{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::length) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

template <typename T>
class HasInsertValue{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::insert_value) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

template <typename T>
class HasDeleteNode{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::delete_node) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};


template <typename T>
class HasContains{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::contains_value) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};


bool listNodeClassTest1() {
    ListNode *node = new ListNode(0);
    bool typeMatched = typeid(*node).name() == typeid(ListNode).name();
    delete(node);
    return typeMatched;
}

bool listNodeClassTest2() {
  return HasValue<ListNode>::value;
}

bool listNodeClassTest3() {
  ListNode *node = new ListNode(5);
  bool testVal = node->value == 5;
  delete(node);
  return testVal;
}

bool listNodeClassTest4() {
  ListNode *node = new ListNode(5);
  node->value = 1;
  bool testVal = node->value == 1;
  delete(node);
  return testVal;
}

bool listNodeClassTest5() {
  ListNode *node1 = new ListNode(5);
  ListNode *node2 = new ListNode(10);
  node1->next = node2;
  bool testVal = node1->next->value == 10;
  delete(node1);
  delete(node2);
  return testVal;
}


bool linkedListClassTest1() {
  LinkedList node;
  return typeid(node).name() == typeid(LinkedList).name();
}

bool linkedListClassTest2() {
  return HasHead<LinkedList>::value;
}

bool linkedListClassTest3() {
  return HasTail<LinkedList>::value;
}

bool linkedListClassTest4() {
  return HasLength<LinkedList>::value;
}

bool linkedListClassTest5() {
  LinkedList *linkedList = new LinkedList();
  bool testVal = linkedList->head == NULL;
  delete(linkedList);
  return testVal;
}

bool linkedListClassTest6() {
  LinkedList *linkedList = new LinkedList();
  bool testVal = linkedList->tail == NULL;
  delete(linkedList);
  return testVal;
}

bool linkedListClassTest7() {
  LinkedList *linkedList = new LinkedList();
  bool testVal = linkedList->length == 0;
  delete(linkedList);
  return testVal;
}


bool linkedListInsertMethodTest1() {
  return HasInsertValue<LinkedList>::value;
}

bool linkedListInsertMethodTest2() {
  LinkedList *linkedList = new LinkedList();
  linkedList->insert_value(5,0);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
        linkedList->length == 1 && linkedList->head->value == 5 && linkedList->tail->value == 5;
  delete(linkedList);
  return testVal;
}

bool linkedListInsertMethodTest3() {
  LinkedList *linkedList = new LinkedList();
  linkedList->insert_value(5,0);
  linkedList->insert_value(10, 1);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
        linkedList->length == 2 && linkedList->head->value == 5 && linkedList->tail->value == 10;
  delete(linkedList);
  return testVal;
}

bool linkedListInsertMethodTest4() {
  LinkedList *linkedList = new LinkedList();
  linkedList->insert_value(5,0);
  linkedList->insert_value(10,0);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 2 && linkedList->head->value == 10 && linkedList->tail->value == 5;
  delete(linkedList);
  return testVal;
}

bool linkedListInsertMethodTest5() {
  LinkedList *linkedList = new LinkedList();
  linkedList->insert_value(5,-1);
  linkedList->insert_value(10,3);
  bool testVal = linkedList->length == 0 && linkedList->head == NULL && linkedList->tail == NULL;
  delete(linkedList);
  return testVal;
}


bool linkedListAppendMethodTest1() {
  return HasAppend<LinkedList>::value;
}

bool linkedListAppendMethodTest2() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 1 && linkedList->head->value == 5 && linkedList->tail->value == 5;
  delete(linkedList);
  return testVal;
}

bool linkedListAppendMethodTest3() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 2 && linkedList->head->value == 5 && linkedList->tail->value == 10;
  delete(linkedList);
  return testVal;
}

bool linkedListAppendMethodTest4() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  linkedList->append_value(15);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 3 && linkedList->head->value == 5 && linkedList->tail->value == 15;
  delete(linkedList);
  return testVal;
}



bool linkedListDeleteMethodTest1() {
  return HasDeleteNode<LinkedList>::value;
}

bool linkedListDeleteMethodTest2() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  linkedList->delete_node(0);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 1 && linkedList->head->value == 10 && linkedList->tail->value == 10;
  delete(linkedList);
  return testVal;
}

bool linkedListDeleteMethodTest3() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  linkedList->append_value(15);
  linkedList->delete_node(1);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 2 && linkedList->head->value == 5 && linkedList->tail->value == 15;
  delete(linkedList);
  return testVal;
}

bool linkedListDeleteMethodTest4() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->delete_node(0);
  bool testVal = linkedList->length == 0 && linkedList->head == NULL && linkedList->tail == NULL;
  delete(linkedList);
  return testVal;
}

bool linkedListDeleteMethodTest5() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->delete_node(-1);
  linkedList->delete_node(2);
  bool testVal = linkedList->head != NULL && linkedList->tail != NULL &&
      linkedList->length == 1 && linkedList->head->value == 5 && linkedList->tail->value == 5;
  delete(linkedList);
  return testVal;
}



bool linkedListContainsMethodTest1() {
  return HasContains<LinkedList>::value;
}

bool linkedListContainsMethodTest2() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  linkedList->append_value(15);
  bool testVal = linkedList->contains_value(15);
  delete(linkedList);
  return testVal;
}

bool linkedListContainsMethodTest3() {
  LinkedList *linkedList = new LinkedList();
  linkedList->append_value(5);
  linkedList->append_value(10);
  linkedList->append_value(15);
  bool testVal = !linkedList->contains_value(8);
  delete(linkedList);
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
