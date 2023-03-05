/*
  * Homework - Heap
  *
  *
  *  Prompt: Create a Heap class/constructor
  *
  *  The Heap will take in the following input:
  *
  *                type: argument should be either 'min' or 'max'. This will
  *                      dictate whether the heap will be a minheap or maxheap->
  *                      The comparator method will be affected by this
  *                      argument. See method description below
  *
  *  The Heap will have the following property:
  *
  *             storage: array/vector
  *
  *                type: property that will be either 'min' or 'max'. This will
  *                      be dictated by
  *
  *  The Heap will have the following methods:
  *
  *             compare: takes in two arguments (a and b). Depending on the heap
  *                      type (minheap or maxheap), the comparator will behave
  *                      differently. If the heap is a minheap, then the compare
  *                      function will return true if a is less than b, false
  *                      otherwise. If the heap is a maxheap, then the compare
  *                      function will return true if a is greater than b, false
  *                      otherwise.
  *
  *                swap: takes in two indexes and swaps the elements at the two
  *                      indexes in the storage array
  *
  *                peak: returns the peak element of the storage array. This
  *                      will be the most minimum and maximum element for a
  *                      minheap and maxheap respectively
  *
  *                size: returns the number of elements in the heap
  *
  *              insert: inserts a value into the heap-> Should begin by pushing
  *                      the value onto the end of the array, and then calling
  *                      the bubbleUp method from the last index of the array
  *
  *            bubbleUp: takes in an index, and considers the element at that
  *                      index to be a child. Continues to swap that child with
  *                      its parent value if the heap comparator condition is
  *                      not fulfilled
  *
  *          removePeak: removes the peak element from the heap and returns it.
  *                      Should begin by swapping the 0th-index element with the
  *                      last element in the storage array. Uses bubbleDown
  *                      method from the 0th index
  *
  *          bubbleDown: takes in an index, and considers the element at this
  *                      index to be the parent. Continues to swap this parent
  *                      element with its children if the heap comparator
  *                      condition is not fulfilled
  *
  *              remove: takes in a value and (if it exists in the heap),
  *                      removes that value from the heap data structure and
  *                      returns it. Should rearrange the rest of the heap to
  *                      ensure the heap comparator conditions are fulfilled
  *                      for all of its elements
  *
  *
  *
  *  Input:  N/A
  *  Output: A Heap instance
  *
  *  What are the time and auxilliary space complexities of the various methods?
  *
  */

#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
#include <typeinfo>
using namespace std;

class Heap {
  public:
    vector<int> storage;
    string type;

    Heap(string type) {
      //YOUR WORK HERE
    }


    // Time Complexity:
    // Auxiliary Space Complexity:
    bool compare(int a, int b){
      //YOUR WORK HERE
      return false;
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    void swap(int index1, int index2){
      //YOUR WORK HERE
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    int peak(){
      //YOUR WORK HERE
      return -1;
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    int size(){
      //YOUR WORK HERE
      return -1;
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    void insert(int value){
      //YOUR WORK HERE
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    void bubbleUp(int index){
      //YOUR WORK HERE
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    int removePeak(){
      //YOUR WORK HERE
      return -1;
    }

    // Time Complexity:
    // Auxiliary Space Complexity:
    void bubbleDown(int index){
      //YOUR WORK HERE
    }


    // Time Complexity:
    // Auxiliary Space Complexity:
    bool remove(int value){
      //YOUR WORK HERE
      return false;
    }



};



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void heapClassTests(),heapCompareMethodTests(),heapSwapMethodTests(),heapPeakMethodTests(),
    heapSizeMethodTests(),heapInsertMethodTests(),heapBubbleUpMethodTests(),
    heapRemovePeakMethodTests(),heapBubbleDownMethodTests(),heapRemoveMethodTests();

bool heapClassTest1(),heapClassTest2(),heapClassTest3(),heapClassTest4(),
    heapClassTest5(),heapClassTest6();
bool heapCompareMethodTest1(),heapCompareMethodTest2(),heapCompareMethodTest3(),
    heapCompareMethodTest4(),heapCompareMethodTest5();
bool heapSwapMethodTest1(),heapSwapMethodTest2();
bool heapPeakMethodTest1(),heapPeakMethodTest2(),heapPeakMethodTest3(),heapPeakMethodTest4();
bool heapSizeMethodTest1(),heapSizeMethodTest2();
bool heapInsertMethodTest1(),heapInsertMethodTest2(),heapInsertMethodTest3(),heapInsertMethodTest4();
bool heapBubbleUpMethodTest1(),heapBubbleUpMethodTest2(),heapBubbleUpMethodTest3(),
    heapBubbleUpMethodTest4(),heapBubbleUpMethodTest5();
bool heapRemovePeakMethodTest1(),heapRemovePeakMethodTest2(),heapRemovePeakMethodTest3(),heapRemovePeakMethodTest4();
bool heapBubbleDownMethodTest1(),heapBubbleDownMethodTest2(),heapBubbleDownMethodTest3(),
    heapBubbleDownMethodTest4(),heapBubbleDownMethodTest5();
bool heapRemoveMethodTest1(),heapRemoveMethodTest2(),heapRemoveMethodTest3(),heapRemoveMethodTest4(),
    heapRemoveMethodTest5(),heapRemoveMethodTest6(),heapRemoveMethodTest7();


int main() {
  heapClassTests();
  heapCompareMethodTests();
  heapSwapMethodTests();
  heapPeakMethodTests();
  heapSizeMethodTests();
  heapInsertMethodTests();
  heapBubbleUpMethodTests();
  heapRemovePeakMethodTests();
  heapBubbleDownMethodTests();
  heapRemoveMethodTests();
  return 0;
}



void heapClassTests() {
  int testCount[] = {0, 0};
  cout << "Heap Class" << endl;
  runTest(heapClassTest1, "able to create an instance", testCount);
  runTest(heapClassTest2, "has storage field", testCount);
  runTest(heapClassTest3, "has type field", testCount);
  runTest(heapClassTest4, "default storage set to an array", testCount);
  runTest(heapClassTest5, "default type property is set to \'min\'", testCount);
  runTest(heapClassTest6, "default type property is set to \'max\'", testCount);
  printTestsPassed(testCount);
}

void heapCompareMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap compare method" << endl;
  runTest(heapCompareMethodTest1, "has compare method", testCount);
  runTest(heapCompareMethodTest2, "returns true for minheap if element at first argument index is less than element at second argument index", testCount);
  runTest(heapCompareMethodTest3, "returns false for minheap if element at first argument index is greater than element at second argument index", testCount);
  runTest(heapCompareMethodTest4, "return true for maxheap if element at first argument index is greater than element at second argument index", testCount);
  runTest(heapCompareMethodTest5, "return false for maxheap if element at first argument index is less than element at second argument index", testCount);
  printTestsPassed(testCount);
}

void heapSwapMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap swap method" << endl;
  runTest(heapSwapMethodTest1, "has swap method", testCount);
  runTest(heapSwapMethodTest2, "should be able to swap the locations of two elements given two indices", testCount);
  printTestsPassed(testCount);
}

void heapPeakMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap peak method" << endl;
  runTest(heapPeakMethodTest1, "has peak method", testCount);
  runTest(heapPeakMethodTest2, "should return the 0th element of the storage array", testCount);
  runTest(heapPeakMethodTest3, "upon building out your insert method, should return the smallest element for a minheap", testCount);
  runTest(heapPeakMethodTest4, "upon building out your insert method, should return the largest element for a maxheap", testCount);
  printTestsPassed(testCount);
}

void heapSizeMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap size method" << endl;
  runTest(heapSizeMethodTest1, "has size method", testCount);
  runTest(heapSizeMethodTest2, "returns number of elements in the storage array", testCount);
  printTestsPassed(testCount);
}

void heapInsertMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap insert method" << endl;
  runTest(heapInsertMethodTest1, "has insert method", testCount);
  runTest(heapInsertMethodTest2, "should be able to insert a single element", testCount);
  runTest(heapInsertMethodTest3, "should be able to insert multiple elements into a minheap and have peak element be smallest element", testCount);
  runTest(heapInsertMethodTest4, "should be able to insert multiple elements into a maxheap and have peak element be largest element", testCount);
  printTestsPassed(testCount);
}

void heapBubbleUpMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap bubbleUp method" << endl;
  runTest(heapBubbleUpMethodTest1, "has bubbleUp method", testCount);
  runTest(heapBubbleUpMethodTest2, "should be able to \'bubble up\' an element if its minheap condition is not fulfilled", testCount);
  runTest(heapBubbleUpMethodTest3, "should be able to \'bubble up\' an element if its maxheap condition is not fulfilled", testCount);
  runTest(heapBubbleUpMethodTest4, "should not perform bubbling up if minheap conditions are fulfilled", testCount);
  runTest(heapBubbleUpMethodTest5, "should not perform bubbling up if maxheap conditions are fulfilled", testCount);
  printTestsPassed(testCount);
}

void heapRemovePeakMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap removePeak method" << endl;
  runTest(heapRemovePeakMethodTest1, "has removePeak method", testCount);
  runTest(heapRemovePeakMethodTest2, "should be able to remove a single element", testCount);
  runTest(heapRemovePeakMethodTest3, "should be able to remove and return peak element for a minheap and rearrange minheap accordingly", testCount);
  runTest(heapRemovePeakMethodTest4, "should be able to remove and return peak element for a maxheap and rearrange maxheap accordingly", testCount);
  printTestsPassed(testCount);
}

void heapBubbleDownMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap bubbleDown method" << endl;
  runTest(heapBubbleDownMethodTest1, "has bubbleDown method", testCount);
  runTest(heapBubbleDownMethodTest2, "should be able to \'bubble down\' an element if its minheap condition is not fulfilled", testCount);
  runTest(heapBubbleDownMethodTest3, "should be able to \'bubble down\' an element if its maxheap condition is not fulfilled", testCount);
  runTest(heapBubbleDownMethodTest4, "should not perform bubbling down if minheap conditions are fulfilled", testCount);
  runTest(heapBubbleDownMethodTest5, "should not perform bubbling down if maxheap conditions are fulfilled", testCount);
  printTestsPassed(testCount);
}

void heapRemoveMethodTests() {
  int testCount[] = {0, 0};
  cout << "Heap remove method" << endl;
  runTest(heapRemoveMethodTest1, "has remove method", testCount);
  runTest(heapRemoveMethodTest2, "is able to remove specified value from minheap", testCount);
  runTest(heapRemoveMethodTest3, "is able to remove specified value from maxheap", testCount);
  runTest(heapRemoveMethodTest4, "is able to remove last value from minheap", testCount);
  runTest(heapRemoveMethodTest5, "is able to remove last value from maxheap", testCount);
  runTest(heapRemoveMethodTest6, "does not remove anything from minheap if value does not exist", testCount);
  runTest(heapRemoveMethodTest7, "does not remove anything from maxheap if value does not exist", testCount);
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
class HasType{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::type) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasCompare{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::compare) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasSwap{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::swap) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasPeak{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::peak) ) ;
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
class HasBubbleUp{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::bubbleUp) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRemovePeak{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::removePeak) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasBubbleDown{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::bubbleDown) ) ;
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


bool heapClassTest1() {
  Heap *heap = new Heap("max");
  bool typeMatched = typeid(*heap).name() == typeid(Heap).name();
  delete(heap);
  return typeMatched;
}
bool heapClassTest2() {
  return HasStorage<Heap>::value;
}
bool heapClassTest3() {
  return HasType<Heap>::value;
}

bool heapClassTest4() {
  Heap *heap = new Heap("max");
  bool isVector = typeid(heap->storage).name() == typeid(vector<int>).name();
  delete(heap);
  return isVector;
}

bool heapClassTest5() {
  Heap *heap = new Heap("min");
  bool testVal = heap->type == ("min");
  delete(heap);
  return testVal;
}

bool heapClassTest6() {
  Heap *heap = new Heap("max");
  bool testVal = heap->type == ("max");
  delete(heap);
  return testVal;
}



bool heapCompareMethodTest1() {
  return HasCompare<Heap>::value;
}

bool heapCompareMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage.push_back(1);
  heap->storage.push_back(10);
  bool testVal = heap->compare(0, 1) == true;
  delete(heap);
  return testVal;
}

bool heapCompareMethodTest3() {
  Heap *heap = new Heap("min");
  heap->storage.push_back(10);
  heap->storage.push_back(1);
  bool testVal = heap->compare(0, 1) == false;
  delete(heap);
  return testVal;
}

bool heapCompareMethodTest4() {
  Heap *heap = new Heap("max");
  heap->storage.push_back(10);
  heap->storage.push_back(1);
  bool testVal = heap->compare(0, 1) == true;
  delete(heap);
  return testVal;
}

bool heapCompareMethodTest5() {
  Heap *heap = new Heap("max");
  heap->storage.push_back(1);
  heap->storage.push_back(10);
  bool testVal = heap->compare(0, 1) == false;
  delete(heap);
  return testVal;
}


bool heapSwapMethodTest1() {
  return HasSwap<Heap>::value;
}

bool heapSwapMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage.push_back(1);
  heap->storage.push_back(5);
  heap->storage.push_back(10);
  heap->swap(0, 2);
  bool testVal = heap->storage[0] == 10 && heap->storage[2] == 1;
  delete(heap);
  return testVal;
}


bool heapPeakMethodTest1() {
  return HasPeak<Heap>::value;
}

bool heapPeakMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage.push_back(1);
  heap->storage.push_back(5);
  heap->storage.push_back(10);
  bool testVal = heap->peak() == 1;
  delete(heap);
  return testVal;
}

bool heapPeakMethodTest3() {
  Heap *heap = new Heap("min");
  heap->insert(2);
  heap->insert(5);
  heap->insert(10);
  heap->insert(1);
  bool testVal = heap->peak() == 1;
  delete(heap);
  return testVal;
}

bool heapPeakMethodTest4() {
  Heap *heap = new Heap("max");
  heap->insert(2);
  heap->insert(5);
  heap->insert(10);
  heap->insert(1);
  bool testVal = heap->peak() == 10;
  delete(heap);
  return testVal;
}



bool heapSizeMethodTest1() {
  return HasSize<Heap>::value;
}

bool heapSizeMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage.push_back(1);
  heap->storage.push_back(5);
  heap->storage.push_back(10);
  bool testVal = heap->size() == 3;
  delete(heap);
  return testVal;
}


bool heapInsertMethodTest1() {
  return HasInsert<Heap>::value;
}

bool heapInsertMethodTest2() {
  Heap *heap = new Heap("min");
  heap->insert(5);
  bool testVal = heap->storage[0] == 5;
  delete(heap);
  return testVal;
}

bool heapInsertMethodTest3() {
  Heap *heap = new Heap("min");
  heap->insert(5);
  heap->insert(10);
  heap->insert(7);
  heap->insert(1);
  heap->insert(8);
  heap->insert(6);
  bool testVal = heap->peak() == 1;
  delete(heap);
  return testVal;
}

bool heapInsertMethodTest4() {
  Heap *heap = new Heap("max");
  heap->insert(5);
  heap->insert(10);
  heap->insert(7);
  heap->insert(1);
  heap->insert(8);
  heap->insert(6);
  bool testVal = heap->peak() == 10;
  delete(heap);
  return testVal;
}



bool heapBubbleUpMethodTest1() {
  return HasBubbleUp<Heap>::value;
}

bool heapBubbleUpMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{2,4,7,6,9,10,8,1};
  heap->bubbleUp(7);
  bool testVal = heap->storage == vector<int>{1,2,7,4,9,10,8,6};
  delete(heap);
  return testVal;
}

bool heapBubbleUpMethodTest3() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{9,8,6,7,3,5,2,10};
  heap->bubbleUp(7);
  bool testVal = heap->storage == vector<int>{10,9,6,8,3,5,2,7};
  delete(heap);
  return testVal;
}

bool heapBubbleUpMethodTest4() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  heap->bubbleUp(7);
  bool testVal = heap->storage == vector<int>{1,2,7,4,9,10,8,6};
  delete(heap);
  return testVal;
}

bool heapBubbleUpMethodTest5() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  heap->bubbleUp(7);
  bool testVal = heap->storage == vector<int>{10,9,6,8,3,5,2,7};
  delete(heap);
  return testVal;
}


bool heapRemovePeakMethodTest1() {
  return HasRemovePeak<Heap>::value;
}

bool heapRemovePeakMethodTest2() {
  Heap *heap = new Heap("min");
  heap->insert(5);
  heap->removePeak();
  bool testVal = heap->storage.size() == 0;
  delete(heap);
  return testVal;
}

bool heapRemovePeakMethodTest3() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  int peak = heap->removePeak();
  bool testVal = peak == 1 && heap->storage == vector<int>{2,4,7,6,9,10,8};
  delete(heap);
  return testVal;
}

bool heapRemovePeakMethodTest4() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  int peak = heap->removePeak();
  bool testVal = peak == 10 && heap->storage == vector<int>{9,8,6,7,3,5,2};
  delete(heap);
  return testVal;
}


bool heapBubbleDownMethodTest1() {
  return HasBubbleDown<Heap>::value;
}

bool heapBubbleDownMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{10,1,2,6,4,9,8,7};
  heap->bubbleDown(0);
  bool testVal = heap->storage == vector<int>{1,4,2,6,10,9,8,7};
  delete(heap);
  return testVal;
}

bool heapBubbleDownMethodTest3() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{2,10,9,5,8,3,6,7};
  heap->bubbleDown(0);
  bool testVal = heap->storage == vector<int>{10,8,9,5,2,3,6,7};
  delete(heap);
  return testVal;
}

bool heapBubbleDownMethodTest4() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  heap->bubbleDown(0);
  bool testVal = heap->storage == vector<int>{1,2,7,4,9,10,8,6};
  delete(heap);
  return testVal;
}

bool heapBubbleDownMethodTest5() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  heap->bubbleDown(0);
  bool testVal = heap->storage == vector<int>{10,9,6,8,3,5,2,7};
  delete(heap);
  return testVal;
}


bool heapRemoveMethodTest1() {
  return HasRemove<Heap>::value;
}

bool heapRemoveMethodTest2() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  bool removed = heap->remove(10);
  bool testVal = removed && heap->storage == vector<int>{1,2,6,4,9,7,8};
  delete(heap);
  return testVal;
}

bool heapRemoveMethodTest3() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  bool removed = heap->remove(6);
  bool testVal = removed && heap->storage == vector<int>{10,9,7,8,3,5,2};
  delete(heap);
  return testVal;
}

bool heapRemoveMethodTest4() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  bool removed = heap->remove(6);
  bool testVal = removed && heap->storage == vector<int>{1,2,7,4,9,10,8};
  delete(heap);
  return testVal;
}

bool heapRemoveMethodTest5() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  bool removed = heap->remove(7);
  bool testVal = removed && heap->storage == vector<int>{10,9,6,8,3,5,2};
  delete(heap);
  return testVal;
}

bool heapRemoveMethodTest6() {
  Heap *heap = new Heap("min");
  heap->storage = vector<int>{1,2,7,4,9,10,8,6};
  heap->remove(3);
  bool testVal = heap->storage == vector<int>{1,2,7,4,9,10,8,6};
  delete(heap);
  return testVal;
}

bool heapRemoveMethodTest7() {
  Heap *heap = new Heap("max");
  heap->storage = vector<int>{10,9,6,8,3,5,2,7};
  heap->remove(4);
  bool testVal = heap->storage == vector<int>{10,9,6,8,3,5,2,7};
  delete(heap);
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
