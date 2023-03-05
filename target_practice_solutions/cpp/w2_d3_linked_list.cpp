/**
 *  Target Practice - Linked List
 *
 *  Solve the following problems involving linked lists.
 */

#include <vector>
#include <algorithm> // for copy()
#include <iostream>
#include <sstream>
#include <typeinfo>
using namespace std;

// DO NOT EDIT
// ListNode *class for a linked list node
class ListNode {
  public:
    int value;
    ListNode *next;

  ListNode(int value){
    this->value = value;
    this->next = NULL;
  }
};


// DO NOT EDIT
// Generate a linked list from an array
ListNode *generateList(vector<int> arr) {
  if(arr.size() == 0){
    return NULL;
  }
  ListNode *head = new ListNode(arr[0]);
  ListNode *current = head;
  for(int i = 1; i < arr.size(); i++){
    current->next = new ListNode(arr[i]);
    current = current->next;
  }
  return head;
}


/**
 * 1a. Create a method which prints the value of each node until the tail
 *
 * Input: node {ListNode}
 * Output: void
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *          Head                    Tail
 *          1
 *          5
 *          7
 *          10
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
void printForward(ListNode *node) {
  ListNode *current = node;

  while (current != NULL) {
    cout << current->value << endl;
    current = current->next;
  }
}


/**
 * 1b. Given a node, print the value of each node backwards from the tail to the
 * input node using recursion.
 *
 * Input: node {ListNode}
 * Output: void
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *          Head                    Tail
 *          10
 *          7
 *          5
 *          1
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)
void printBackward(ListNode *node) {
  if (node == NULL) {
    return;
  }
  printBackward(node->next);
  cout << node->value << endl;
}


/**
 * 1c. Create a public method on the singly LinkedList class that reverses the
 *     order of the nodes in the linked list
 *
 * Input: node {ListNode}
 * Output: {ListNode}
 *
 * Example: (1) --> (5) --> (7) --> (10) .reverse()
 *          Head                    Tail
 *
 *          (10) --> (7) --> (5) --> (1)
 *          Head                    Tail
 *
 * What is the time and auxiliary space complexity of your solution?
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
ListNode *reverse(ListNode *node) {
  if (node == NULL) {
    return node;
  }
  ListNode *prev = NULL;
  ListNode *current = node;
  ListNode *next;
  while(current != NULL) {
    next = current->next;
    current->next = prev;
    prev = current;
    current = next;
  }

  return prev;
}


/**
 * 1d. Create a method which swaps the first occurance of the locations of two
 *     nodes in the linked list.
 *
 * Input: head {ListNode},
 * Input: a {Integer}
 * Input: b {Integer}
 * Output: {ListNode}
 *
 * Example:
 * ListNode head = Problems.generateList({1, 5, 7, 10});
 * head = swap(head, 5, 10);
 *
 *          (1) --> (5) --> (7) --> (10)
 *          Head
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)

vector<ListNode*> locate(ListNode *node, int target) {
  ListNode *prev = NULL;
  ListNode *current = node;
  vector<ListNode*> results;
  while (current != NULL) {
    if(current->value == target){
        results.push_back(prev);
        results.push_back(current);
        return results;
    }
    prev = current;
    current = current->next;
  }
  return results;
}

ListNode *swap(ListNode *head, int a, int b) {
  if (head == NULL || a == b) {
    return head;
  }

  vector<ListNode*>location1 = locate(head, a);
  vector<ListNode*>location2 = locate(head, b);
  ListNode *prev1 = location1[0];
  ListNode *current1 = location1[1];
  ListNode *prev2 = location2[0];
  ListNode *current2 = location2[1];

  if (current1 == NULL || current2 == NULL) { return head; }
  if (prev1 != NULL) {
    prev1->next = current2;
  }
  if (prev2 != NULL) {
    prev2->next = current1;
  }
  ListNode *temp = current1->next;
  current1->next = current2->next;
  current2->next = temp;

  if (prev1 == NULL) {
    return current2;
  }
  if (prev2 == NULL) {
    return current1;
  }
  return head;
}


/**
 *  Extra Credit 1:
 *
 *  Given an input of a ListNode, return true if the ListNode is in a circular
 *  linked list, and false if the linked list that terminates.
*/
bool isCircular(ListNode *node){
 ListNode *tortoise = node;
 ListNode *hare = node;

 while (hare != NULL && hare->next != NULL) {
   hare = hare->next->next;
   tortoise = tortoise->next;
   if (tortoise == hare) {
     return true;
   }
 }
 return false;
}








////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void linkedListInstantiationTests(),printForwardTests(),printBackwardTests(),
    reverseListTests(),swapNodesTests(),isCircularTests();

bool linkedListInstantiationTest1();
bool printForwardTest1(),printForwardTest2(),printForwardTest3();
bool printBackwardTest1(),printBackwardTest2(),printBackwardTest3();
bool reverseListTest1(),reverseListTest2();
bool swapNodesTest1(),swapNodesTest2(),swapNodesTest3(),swapNodesTest4();
bool isCircularTest1(),isCircularTest2();


int main() {
  linkedListInstantiationTests();
  printForwardTests();
  printBackwardTests();
  reverseListTests();
  swapNodesTests();
  isCircularTests();
  return 0;
}


void linkedListInstantiationTests() {
      int testCount[] = {0, 0};
      cout << "linked list instantiation tests" << endl;
      runTest(linkedListInstantiationTest1, "able to create a linked list instance", testCount);
      printTestsPassed(testCount);
}

void printForwardTests() {
      int testCount[] = {0, 0};
      cout << "printForward tests" << endl;
      runTest(printForwardTest1, "should be able to print forward 1 --> 5 --> 7 --> 10", testCount);
      runTest(printForwardTest2, "should be able to print forward with single element", testCount);
      runTest(printForwardTest3, "should print nothing for empty list node", testCount);
      printTestsPassed(testCount);
}

void printBackwardTests() {
      int testCount[] = {0, 0};
      cout << "printBackward tests" << endl;
      runTest(printBackwardTest1, "should be able to print backward elements of linked list 1 --> 5 --> 7 --> 10", testCount);
      runTest(printBackwardTest2, "should be able to print backward with single element linked list 1", testCount);
      runTest(printBackwardTest3, "should print nothing for empty linked list", testCount);
      printTestsPassed(testCount);
}

void reverseListTests() {
      int testCount[] = {0, 0};
      cout << "reverse tests" << endl;
      runTest(reverseListTest1, "should be able to reverse 1 --> 5 --> 7 --> 10 to be 10 --> 7 --> 5 --> 1", testCount);
      runTest(reverseListTest2, "should be able to handle single element linked lists", testCount);
      printTestsPassed(testCount);
}

void swapNodesTests() {
      int testCount[] = {0, 0};
      cout << "swap tests" << endl;
      runTest(swapNodesTest1, "should be able to swap 1 and 5 to change 1 --> 5 --> 7 --> 10 linked list to look like 5 --> 1 --> 7 --> 10", testCount);
      runTest(swapNodesTest2, "should be able to swap 1 and 7 to change 1 --> 5 --> 7 --> 10 linked list to look like 7 --> 5 --> 1 --> 10", testCount);
      runTest(swapNodesTest3, "should be able to swap 1 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 10 --> 5 --> 7 --> 1", testCount);
      runTest(swapNodesTest4, "should be able to swap 5 and 10 to change 1 --> 5 --> 7 --> 10 linked list to look like 1 --> 10 --> 7 --> 5", testCount);
      printTestsPassed(testCount);
}

void isCircularTests() {
      int testCount[] = {0, 0};
      cout << "isCircular tests" << endl;;
      runTest(isCircularTest1, "should return true for circular linked list", testCount);
      runTest(isCircularTest2, "should return false for terminal linked list", testCount);
      printTestsPassed(testCount);
}



// This function is used to capture stdout into a string
string stdOutCapture(void test(ListNode*), ListNode *input) {
  std::stringstream buffer;
  std::streambuf *old = std::cout.rdbuf( buffer.rdbuf() ); // change output stream to buffer
  test(input); // run test which uses stdout
  string res = buffer.str(); // capture output from buffer
  std::cout.rdbuf(old); // reset output stream;
  return res; // Show what happened
}

bool linkedListInstantiationTest1() {
  vector<int> arr{1, 5, 7, 10};
  ListNode *test = generateList(arr);
  bool typeMatched = test->value == 1 &&
    test->next->next->next->value == 10 &&
    typeid(*test).name() == typeid(ListNode).name();
  delete(test);
  return typeMatched;
}


bool printForwardTest1() {
  vector<int> arr{1, 5, 7, 10};
  ListNode *test = generateList(arr);
  string result = stdOutCapture(printForward, test);
  return result == ("1\n5\n7\n10\n");
}

bool printForwardTest2() {
      vector<int> arr{1};
      ListNode *test = generateList(arr);
      string result = stdOutCapture(printForward, test);
      return result == ("1\n");
}

bool printForwardTest3() {
      vector<int> arr{};
      ListNode *test = generateList(arr);
      string result = stdOutCapture(printForward, test);
      return result == ("");
}



bool printBackwardTest1() {
      vector<int> arr{1, 5, 7, 10};
      ListNode *test = generateList(arr);
      string result = stdOutCapture(printBackward, test);
      return result == ("10\n7\n5\n1\n");
}

bool printBackwardTest2() {
      vector<int> arr{1};
      ListNode *test = generateList(arr);
      string result = stdOutCapture(printBackward, test);
      return result == ("1\n");
}

bool printBackwardTest3() {
      vector<int> arr{};
      ListNode *test = generateList(arr);
      string result = stdOutCapture(printBackward, test);
      return result == ("");
}

bool reverseListTest1() {
      vector<int> arr{1, 5, 7, 10};
      ListNode *test = generateList(arr);
      test = reverse(test);

      return test->value == 10 &&
        test->next->value == 7 &&
        test->next->next->value == 5 &&
        test->next->next->next->value == 1;
}

bool reverseListTest2() {
      vector<int> arr{10};
      ListNode *test = generateList(arr);
      test = reverse(test);

      return test->value == 10;
}

bool swapNodesTest1() {
  vector<int> arr{1, 5, 7, 10};
  ListNode *test = generateList(arr);
  test = swap(test, 1, 5);

  return test->value == 5 &&
    test->next->value == 1 &&
    test->next->next->value == 7 &&
    test->next->next->next->value == 10;

}

bool swapNodesTest2() {
  vector<int> arr{1, 5, 7, 10};
      ListNode *test = generateList(arr);
      test = swap(test, 1, 7);

      return test->value == 7 &&
        test->next->value == 5 &&
        test->next->next->value == 1 &&
        test->next->next->next->value == 10;

}

bool swapNodesTest3() {
  vector<int> arr{1, 5, 7, 10};
  ListNode *test = generateList(arr);
  test = swap(test, 1, 10);

  return test->value == 10 &&
    test->next->value == 5 &&
    test->next->next->value == 7 &&
    test->next->next->next->value == 1;

}

bool swapNodesTest4() {
  vector<int> arr{1, 5, 7, 10};
  ListNode *test = generateList(arr);
  test = swap(test, 5, 10);

  return test->value == 1 &&
    test->next->value == 10 &&
    test->next->next->value == 7 &&
    test->next->next->next->value == 5;

}


bool isCircularTest1() {
  // setup of node in a circular linkedList
   ListNode *work;
   srand(time(NULL));
   ListNode *node = new ListNode(std::rand());
   work = node;
   int circleSize = 10000; //std::rand();

   for (int i = 0; i < circleSize; i++){
     work->next = new ListNode(std::rand());
     work = work->next;
     if (i == (circleSize - 1)){
       // connects the last node to the original nodeA
       work->next = node;
     }
   }

   return isCircular(node);
}

bool isCircularTest2() {
  // setup of a node in a linkedList that terminates
    ListNode *work;
    srand(time(NULL));
    ListNode *node = new ListNode(std::rand());
    work = node;
    int listSize = 100000; //std::rand();
    for (int i = 0; i < listSize; i++){
      work->next = new ListNode(std::rand());
      work = work->next;
    }

    return isCircular(work) == false;

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
