/**
 *  Homework - Binary Search Tree
 *
 *  Problem 1: TreeNode class
 *
 *  Prompt:    Create a TreeNode class
 *             The TreeNode class should contain the following public properties:
 *
 *                   value:   {Integer}
 *                    left:   {TreeNode} (initially NULL)
 *                   right:   {TreeNode} (initially NULL)
 *
 *                 Example:   var TreeNode sample = new TreeNode(1)
 *                            sample->value        // 1
 *                            sample->left         // NULL
 *                            sample->right        // NULL
 *
 *
 *  Problem 2: BinarySearchTree class.
 *
 *  Prompt:    Create a BinarySearchTree class
 *
 *             The BinarySearchTree class should contain the following public
 *             properties:
 *
 *                    root:   {TreeNode} (initially NULL)
 *                    size:   {Integer}
 *
 *             The BinarySearchTree class should also contain the following
 *             public methods:
 *
 *                  insert:   A method that takes takes an integer value, and
 *                            creates a node with the given input.  The method
 *                            will then find the correct place to add the new
 *                            node. Values larger than the current node node go
 *                            to the right, and smaller values go to the left.
 *
 *                            Input:     {Integer}
 *                            Output:    {Void}
 *
 *                  search:   A method that will search to see if a node with a
 *                            specified value exists and returns true or false
 *                            if found.
 *
 *                            Input:     {Integer}
 *                            Output:    {Boolean}
 */

#include <typeinfo>
#include <iostream>
using namespace std;

class TreeNode {
  public:
    int value;
    TreeNode *left;
    TreeNode *right;

    TreeNode(int val) {
      value = val;
      left = NULL;
      right = NULL;
    }
};


class BinarySearchTree {
  public:
    TreeNode *root;
    int size;

    BinarySearchTree() {
      root = NULL;
      size = 0;
    }


    // Time Complexity: O(log(N))
    // Auxiliary Space Complexity: O(1)
    void insert(int value) {
        TreeNode *newNode = new TreeNode(value);
        if(root == NULL){
            root = newNode;
            size++;
            return;
        }

        TreeNode *parent = NULL;
        TreeNode *child = root;
        while (child != NULL) {
            parent = child;
            child = parent->value > value ? parent->left : parent->right;
        }
        if (parent->value > value) {
            parent->left = newNode;
        } else {
            parent->right = newNode;
        }
        size++;
    }


    // Time Complexity: O(log(N))
    // Auxiliary Space Complexity: O(1)
    bool search(int value) {
        TreeNode *current = root;
        while (current != NULL) {
            if (current->value == value) {
                return true;
            }
            current = current->value > value ? current->left : current->right;
        }
        return false;
    }

};


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void treeNodeClassTests(),binarySearchTreeClassTests(),bstInsertMethodTests(),bstSearchMethodTests();

bool treeNodeClassTest1(), treeNodeClassTest2(), treeNodeClassTest3(), treeNodeClassTest4(),
    treeNodeClassTest5(), treeNodeClassTest6(), treeNodeClassTest7(), treeNodeClassTest8();
bool binarySearchTreeClassTest1(), binarySearchTreeClassTest2(), binarySearchTreeClassTest3(),
    binarySearchTreeClassTest4(), binarySearchTreeClassTest5();

bool bstInsertMethodTest1(), bstInsertMethodTest2(), bstInsertMethodTest3(),
    bstInsertMethodTest4(), bstInsertMethodTest5(), bstInsertMethodTest6();

bool bstSearchMethodTest1(), bstSearchMethodTest2(), bstSearchMethodTest3();

int main() {
  treeNodeClassTests();
  binarySearchTreeClassTests();
  bstInsertMethodTests();
  bstSearchMethodTests();
  return 0;
}


void treeNodeClassTests() {
  int testCount[] = {0, 0};
  cout << "TreeNode Class" << endl;
  runTest(treeNodeClassTest1, "able to create an instance", testCount);
  runTest(treeNodeClassTest2, "has value field", testCount);
  runTest(treeNodeClassTest3, "has left field", testCount);
  runTest(treeNodeClassTest4, "has right field", testCount);
  runTest(treeNodeClassTest5, "able to assign a value upon instantiation", testCount);
  runTest(treeNodeClassTest6, "able to reassign a value", testCount);
  runTest(treeNodeClassTest7, "able to point to left child node", testCount);
  runTest(treeNodeClassTest8, "able to point to right child node", testCount);
  printTestsPassed(testCount);
}

void binarySearchTreeClassTests() {
  int testCount[] = {0, 0};
  cout << "Binary Search Tree Class" << endl;
  runTest(binarySearchTreeClassTest1, "able to create an instance", testCount);
  runTest(binarySearchTreeClassTest2, "has root field", testCount);
  runTest(binarySearchTreeClassTest3, "has size field", testCount);
  runTest(binarySearchTreeClassTest4, "default root set to null", testCount);
  runTest(binarySearchTreeClassTest5, "default size set to zero", testCount);
  printTestsPassed(testCount);
}

void bstInsertMethodTests() {
  int testCount[] = {0, 0};
  cout << "BinarySearchTree Insert Method" << endl;
  runTest(bstInsertMethodTest1, "has insert method", testCount);
  runTest(bstInsertMethodTest2, "able to insert a node into empty binary search tree", testCount);
  runTest(bstInsertMethodTest3, "able to insert node to left of root node", testCount);
  runTest(bstInsertMethodTest4, "able to insert node to right of node left of root node", testCount);
  runTest(bstInsertMethodTest5, "able to insert node to right of root node", testCount);
  runTest(bstInsertMethodTest6, "able to insert node to left of node right of root node", testCount);
  printTestsPassed(testCount);
}

void bstSearchMethodTests() {
  int testCount[] = {0, 0};
  cout << "BinarySearchTree Search Method" << endl;
  runTest(bstSearchMethodTest1, "has search method", testCount);
  runTest(bstSearchMethodTest2, "returns true when element exists in binary search tree", testCount);
  runTest(bstSearchMethodTest3, "returns true when element does not exist in binary search tree", testCount);
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

// SFINAE test
template <typename T>
class HasLeft{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::left) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRight{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::right) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRoot{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::root) ) ;
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
class HasSearch{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::search) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};



bool treeNodeClassTest1() {
  TreeNode *node = new TreeNode(0);
  bool typeMatched = typeid(*node).name() == typeid(TreeNode).name();
  delete(node);
  return typeMatched;
}

bool treeNodeClassTest2() {
    return HasValue<TreeNode>::value;
}

bool treeNodeClassTest3() {
    return HasLeft<TreeNode>::value;
}

bool treeNodeClassTest4() {
    return HasRight<TreeNode>::value;
}

bool treeNodeClassTest5() {
    TreeNode *node = new TreeNode(5);
    bool testVal = node->value == 5;
    delete(node);
    return testVal;
}

bool treeNodeClassTest6() {
    TreeNode *node = new TreeNode(5);
    node->value = 0;
    bool testVal = node->value == 0;
    delete(node);
    return testVal;
}

bool treeNodeClassTest7() {
    TreeNode *node1 = new TreeNode(5);
    TreeNode *node2 = new TreeNode(10);
    node1->left = node2;
    int testVal = node1->left->value;
    delete(node1);
    delete(node2);
    return testVal == 10;
}

bool treeNodeClassTest8() {
    TreeNode *node1 = new TreeNode(5);
    TreeNode *node2 = new TreeNode(10);
    node1->right = node2;
    bool testVal = node1->right->value == 10;
    delete(node1);
    delete(node2);
    return testVal;
}

bool binarySearchTreeClassTest1() {
    BinarySearchTree node;
    bool typeMatched = typeid(node).name() == typeid(BinarySearchTree).name();
    return typeMatched;
}

bool binarySearchTreeClassTest2() {
    return HasRoot<BinarySearchTree>::value;
}

bool binarySearchTreeClassTest3() {
    return HasSize<BinarySearchTree>::value;
}

bool binarySearchTreeClassTest4() {
    BinarySearchTree *bst = new BinarySearchTree();
    bool testVal = bst->root == NULL;
    delete(bst);
    return testVal;
}

bool binarySearchTreeClassTest5() {
    BinarySearchTree *bst = new BinarySearchTree();
    bool testVal = bst->size == 0;
    delete(bst);
    return testVal;
}



bool bstInsertMethodTest1() {
    return HasInsert<BinarySearchTree>::value;
}

bool bstInsertMethodTest2() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bool testVal = bst->size == 1 && bst->root->value == 5;
    delete(bst);
    return testVal;
}

bool bstInsertMethodTest3() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(3);
    bool testVal = bst->size == 2 && bst->root->value == 5 && bst->root->left->value == 3;
    delete(bst);
    return testVal;
}

bool bstInsertMethodTest4() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(3);
    bst->insert(4);
    bool testVal = bst->size == 3 && bst->root->value == 5 && bst->root->left->value == 3 && bst->root->left->right->value == 4;
    delete(bst);
    return testVal;
}

bool bstInsertMethodTest5() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(8);
    bool testVal = bst->size == 2 && bst->root->value == 5 && bst->root->right->value == 8;
    delete(bst);
    return testVal;
}

bool bstInsertMethodTest6() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(8);
    bst->insert(7);
    bool testVal = bst->size == 3 && bst->root->value == 5 && bst->root->right->value == 8 && bst->root->right->left->value == 7;
    delete(bst);
    return testVal;
}



bool bstSearchMethodTest1() {
    return HasSearch<BinarySearchTree>::value;
}

bool bstSearchMethodTest2() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(3);
    bst->insert(8);
    bst->insert(4);
    bst->insert(7);
    bool testVal = bst->search(4);
    delete(bst);
    return testVal;
}

bool bstSearchMethodTest3() {
    BinarySearchTree *bst = new BinarySearchTree();
    bst->insert(5);
    bst->insert(3);
    bst->insert(8);
    bst->insert(4);
    bst->insert(7);
    bool testVal = bst->search(10) == false;
    delete(bst);
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
