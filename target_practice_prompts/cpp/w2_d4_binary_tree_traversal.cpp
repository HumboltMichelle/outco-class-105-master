/**
 *  Target Practice - Binary Tree Traversal
 *
 *  Solve the following problems involving binary tree traversals.
 */

#include <vector>
#include <algorithm> // for copy()
#include <iostream>
#include <queue>
using namespace std;

// DO NOT EDIT
// TreeNode class for a binary tree node
class TreeNode {
  public:
    int value;
    TreeNode *left, *right;

  TreeNode(int value){
    this->value = value;
    this->left = NULL;
    this->right = NULL;
  }
};


// DO NOT EDIT
// generate tree from array, NULL value are represented as -1
TreeNode *deserialize(vector<int> arr) {
  if (arr.size() == 0) {
    return NULL;
  }
  TreeNode *root = new TreeNode(arr[0]);
  queue<TreeNode*> queue;
  queue.push(root);
  TreeNode *current;
  for (int i = 1; i < arr.size(); i += 2) {
    current = queue.front();
    queue.pop();
    if (arr[i] != -1) {
      current->left = new TreeNode(arr[i]);
      queue.push(current->left);
    }
    if (arr[i + 1] != -1 && (i + 1) < arr.size()) {
      current->right = new TreeNode(arr[i + 1]);
      queue.push(current->right);
    }
  }
  return root;
}

/**
 *
 * Deserialize operates by building out the tree in a breadth-first
 * manner. One only needs to build down to the lowest row where there
 * exists nodes. For example, in this tree,
 *
 *          1
 *            \
 *              3
 *   				  /
 *   				 2
 *
 * The array that you would pass in to the deserialize function would
 * be [1,NULL,3,2,NULL]. The first NULL represents the left child of
 * the 1 node, and the second NULL represents the right child of the 3 node.
 *
 *  1. Here, we have built out the following tree using deserialize:
 *
 *              4
 *            /   \
 *          2       5
 *        /   \       \
 *      1       3       7
 *                    /   \
 *                  6      8
 */

 // DO NOT EDIT
vector<int> arr{4, 2, 5, 1, 3, -1, 7, -1, -1, -1, -1, 6, 8};

TreeNode *sampleTree = deserialize(arr);


/**
 *  2. Given the example output binary search tree from Problem 1, what would
 *     the order of values printed be if we used:
 *
 *     a. BREADTH FIRST traversal:
 *     b. PRE-ORDER DEPTH first traversal:
 *     c. IN-ORDER DEPTH first traversal:
 *     d. POST-ORDER DEPTH first traversal:
 */

 /**
  *  3a. Using a queue and while loop write a function that takes the root of a
  *      binary tree node and outputs an array of values ordered by BREADTH
  *      FIRST.
  *
  *  Input: node {TreeNode}
  *  Output: {vector}
  *
  *  NOTE: You may use an array or linked list for your queue.
  *  NOTE: Confirm with your answer from Problem 2a.
  */
vector<int> bfs(TreeNode *node) {
  // YOUR WORK HERE
  return new vector<int>{};
}


/**
 *  3b. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */


vector<int> dfsPre (TreeNode *node) {
  // YOUR WORK HERE
  return vector<int>();
}



/**
 *  3c. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by IN-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */


vector<int> dfsIn(TreeNode *node) {
  // YOUR WORK HERE
  return vector<int>();
}



/**
 *  3d. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by POST-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {vector}
 *
 *      NOTE: Confirm with your answer from problem 2d.
 */


vector<int> dfsPost (TreeNode *node) {
  // YOUR WORK HERE
  return vector<int>();
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void problem1Tests(),bfsTests(),dfsPreTests(),dfsInTests(),dfsPostTests();

bool problem1Test1(),bfsTest1(),bfsTest2(),dfsPreTest1(),dfsPreTest2(),
    dfsInTest1(),dfsInTest2(),dfsPostTest1(),dfsPostTest2();


TreeNode *emptyTreeExample = deserialize(vector<int>{});

int main() {
  problem1Tests();
  bfsTests();
  dfsPreTests();
  dfsInTests();
  dfsPostTests();
  return 0;
}

void problem1Tests() {
  int testCount[] = {0, 0};
  cout << "Problem 1 tests" << endl;
  runTest(problem1Test1, "able to build tree as indicated in diagram", testCount);
  printTestsPassed(testCount);
}

void bfsTests() {
  int testCount[] = {0, 0};
  cout << "breadth first search tests" << endl;
  runTest(bfsTest1, "able to return values of BST in breadth first manner - [4,2,5,1,3,7,6,8]", testCount);
  runTest(bfsTest2, "able to return empty array for an empty BST", testCount);
  printTestsPassed(testCount);
}

void dfsPreTests() {
  int testCount[] = {0, 0};
  cout << "dfsPre tests" << endl;
  runTest(dfsPreTest1, "able to return values of BST in pre-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
  runTest(dfsPreTest2, "able to return empty array for an empty BST", testCount);
  printTestsPassed(testCount);
}

void dfsInTests() {
  int testCount[] = {0, 0};
  cout << "dfsIn tests" << endl;
  runTest(dfsInTest1, "able to return values of BST in in-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
  runTest(dfsInTest2, "able to return empty array for an empty BST", testCount);
  printTestsPassed(testCount);
}

void dfsPostTests() {
  int testCount[] = {0, 0};
  cout << "dfsPost tests" << endl;
  runTest(dfsPostTest1, "able to return values of BST in post-order depth first manner - [4,2,1,3,5,7,6,8]", testCount);
  runTest(dfsPostTest2, "able to return empty array for an empty BST", testCount);
  printTestsPassed(testCount);
}


bool problem1Test1() {
  return sampleTree->value == 4 &&
              sampleTree->left->value == 2 &&
              sampleTree->left->left->value == 1 &&
              sampleTree->left->right->value == 3 &&
              sampleTree->right->value == 5 &&
              sampleTree->right->right->value == 7 &&
              sampleTree->right->right->left->value == 6 &&
              sampleTree->right->right->right->value == 8;
}



bool bfsTest1() {
  return bfs(sampleTree) == (vector<int>{4,2,5,1,3,7,6,8});
}

bool bfsTest2() {
  return bfs(emptyTreeExample).size() == 0;
}


bool dfsPreTest1() {
  return dfsPre(sampleTree) == (vector<int>{4,2,1,3,5,7,6,8});
}
bool dfsPreTest2() {
  return dfsPre(emptyTreeExample).size() == 0;
}


bool dfsInTest1() {
  return dfsIn(sampleTree) == (vector<int>{1,2,3,4,5,6,7,8});
}
bool dfsInTest2() {
  return dfsIn(emptyTreeExample).size() == 0;
}



bool dfsPostTest1() {
  return dfsPost(sampleTree) == (vector<int>{1,3,2,6,8,7,5,4});
}
bool dfsPostTest2() {
  return dfsPost(emptyTreeExample).size() == 0;
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
