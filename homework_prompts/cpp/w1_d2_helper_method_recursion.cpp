/*
 *  Homework - Helper Method Recursion
 *
 *  Instructions: Using the Helper Method Recursive Pattern work through the
 *  following problems.
 *
 */

 #include <cmath>
 #include <vector>
 #include <algorithm>
 #include <iostream>
 #include <sstream>
 using namespace std;

 /**
  * 1a. What is the term when the recursive call invokes itself more than once.
  *
  *
  */


 /**
  * 1b. List the steps involved to build a Helper Method Recursion algorithm.
  *
  *
  */


 /**
  * 1c. Should the recursive case or base case typically be tackled first?
  *
  *
  */


 /**
  *  2a. Print each integer in an array/vector in order using Helper Method Recursion
  *
  *  Input:   arr/vector {Array/vector of ints}
  *  Output:  {void}
  *
  *  Example: vector<int> nums{1, 2, 3};
  *
  *          printArray.compute(nums) =>
  *          1
  *          2
  *          3
  */

class PrintArray {

  public:
    static void compute(vector<int> arr) {
        // YOUR WORK HERE
    }

  private:
    static void computeHelper(vector<int> &arr, int index) {
        // YOUR WORK HERE
    }
};


/**
 *  2b. Given an integer array/vector, print each item backwards using Helper Method
 *      Recursion
 *
 *  Input:   arr/vector {Array/vector of ints}
 *  Output:  {void}
 *
 *  Example: vector<int> nums{1, 2, 3};
 *
 *          PrintReverse.compute(nums) =>
 *          3
 *          2
 *          1
 */
class PrintReverse {

  public:
    static void compute(vector<int> arr) {
      // YOUR WORK HERE
    }

  private:
    static void traverse(vector<int> &arr, int index) {
      // YOUR WORK HERE
    }
};



/**
 *  2c. Reverse a string using Helper Method Recursion
 *
 *  Input:   string
 *  Output:  string
 *
 *  Example: String greeting = 'hello';
 *          ReverseString.compute(greeting) => 'olleh'
 */
class ReverseString {

    public:
      string compute(string str) {
        // YOUR WORK HERE
        return "";
      }

};



/**
 * 2d. Given an array/vector of positive integers, create an array/vector of two-item integer
 *     arrays/vectors (two dimensional integer array/vector) using Helper Method Recursion
 *
 * Input:   Array/vector of int
 * Output:  two-dimensional int Array/vector
 *
 * Example: vector<int> nums{1, 2, 3, 4, 5, 6};
 *          ArrayPairs.compute(nums)  =>
 *          {{1,2}, {3,4}, {5,6}}
 *
 * Example: vector<int> nums2{1, 2, 3, 4, 5};
 *          ArrayPairs.compute(nums2)  =>
 *          {{1,2}, {3,4}, {5, -1}}
 */
class ArrayPairs {

    public:
      vector<vector<int>> compute(vector<int> arr) {
        // YOUR WORK HERE
        return new int[0,0];
      }



};



/**
 * 2e. Flatten a two dimensional integer array/vector using Helper Method of Recursion
 *
 * Input:   two-dimensional int Array/vector
 * Output:  Array/vector of ints
 *
 * Example: vector matrix{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
 *          Flatten.compute(matrix) =>
 *          {1, 2, 3, 4, 5, 6, 7, 8, 9}
 */
class Flatten {

    public:
      vector<int> compute(vector<vector<int>> matrix) {
        // YOUR WORK HERE
        return new int[0];
      }

};




/**
 * 2f. Given a base and an exponent, create a method to find the power using
 *     Helper Method Recursion
 *
 * Input:   Two ints, base and positive exponent
 * Output:  int
 *
 * Example: Power.compute(3, 4) => 81
 */
class Power {

    public:
      int compute(int a, int b) {
        // YOUR WORK HERE
        return -1;
      }

};




/**
 * 2g. Merge two sorted arrays using the Helper Method Recursion
 *
 * Input:   Two Integer Arrays, both sorted
 * Output:  Integer Array, sorted
 *
 * Example: vector<int> nums1{1, 4, 7};
 *          vector<int> nums2{2, 3, 6, 9};
 *
 *          Merge.compute(nums1, nums2) =>
 *          { 1, 2, 3, 4, 6, 7, 9 }
 */
class Merge {

  public:
    vector<int> compute(vector<int> arr1, vector<int> arr2) {
      // YOUR WORK HERE
      return new int[0];
    }

};




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void printArrayTests(),printReverseTests(),reverseStringTests();
void arrayPairsTests(),flattenTests(),powerTests(),mergeTests();

bool printArrayTest1(), printArrayTest2(), printArrayTest3();
bool printReverseTest1(), printReverseTest2(), printReverseTest3();
bool reverseStringTest1(), reverseStringTest2(), reverseStringTest3();
bool arrayPairsTest1(), arrayPairsTest2(), arrayPairsTest3();
bool flattenTest1(), flattenTest2();
bool powerTest1(), powerTest2(), powerTest3();
bool mergeTest1(), mergeTest2(), mergeTest3(), mergeTest4();


int main(){
  printArrayTests();
  printReverseTests();
  reverseStringTests();
  arrayPairsTests();
  flattenTests();
  powerTests();
  mergeTests();
  return 0;
}


void printArrayTests() {
    int testCount[] = {0, 0};
    cout << "PrintArray tests" << endl;
    runTest(printArrayTest1, "able to print the elements of [1,2,3] forwards", testCount);
    runTest(printArrayTest2, "does not print for an empty array", testCount);
    runTest(printArrayTest3, "able to print a single element array [5]", testCount);
    printTestsPassed(testCount);
}

void printReverseTests() {
    int testCount[] = {0, 0};
    cout << "PrintReverse tests" << endl;
    runTest(printReverseTest1, "able to print the elements of [1,2,3] backwards", testCount);
    runTest(printReverseTest2, "does not print for an empty array", testCount);
    runTest(printReverseTest3, "able to print a single element array [5]", testCount);
    printTestsPassed(testCount);
}

void reverseStringTests() {
    int testCount[] = {0, 0};
    cout << "ReverseString tests" << endl;
    runTest(reverseStringTest1, "able to reverse string 'hello'", testCount);
    runTest(reverseStringTest2, "able to return an empty string for empty string input", testCount);
    runTest(reverseStringTest3, "able to return the same character for a single-character input string", testCount);
    printTestsPassed(testCount);
}

void arrayPairsTests() {
    int testCount[] = {0, 0};
    cout << "ArrayPairs tests" << endl;
    runTest(arrayPairsTest1, "should return [[1,2],[3,4],[5,6]] output for [1,2,3,4,5,6] input", testCount);
    runTest(arrayPairsTest2, "should return [[1,2],[3,4],[5,-1]] output for [1,2,3,4,5] input", testCount);
    runTest(arrayPairsTest3, "should return [] output for [] input", testCount);
    printTestsPassed(testCount);
}

void flattenTests() {
    int testCount[] = {0, 0};
    cout << "Flatten tests" << endl;
    runTest(flattenTest1, "should return [1,2,3,4,5,6,7,8,9] output for [[1, 2, 3],[4, 5, 6],[7, 8, 9]] input", testCount);
    runTest(flattenTest2, "should return [] output for [] input", testCount);
    printTestsPassed(testCount);
}

void powerTests() {
    int testCount[] = {0, 0};
    cout << "Power tests" << endl;
    runTest(powerTest1, "should return 81 for 3 to the 4th power", testCount);
    runTest(powerTest2, "should return 1 for 5 to the 0th power", testCount);
    runTest(powerTest3, "should return 1 for 1 to the 100th power", testCount);
    printTestsPassed(testCount);
}

void mergeTests() {
    int testCount[] = {0, 0};
    cout << "Merge tests" << endl;
    runTest(mergeTest1, "should return [1, 2, 3, 4, 6, 7, 9] when merging [1, 4, 7] and [2, 3, 6, 9]", testCount);
    runTest(mergeTest2, "should handle inputs when left argument is empty array", testCount);
    runTest(mergeTest3, "should handle inputs when right argument is empty array", testCount);
    runTest(mergeTest4, "should handle two empty arrays as inputs", testCount);
    printTestsPassed(testCount);
}



// // This function is used to capture stdout into a string
string stdOutCapture(void test(vector<int>), vector<int> input) {
  std::stringstream buffer;
  std::streambuf * old = std::cout.rdbuf( buffer.rdbuf() ); // change output stream to buffer
  test(input); // run test which uses stdout
  string res = buffer.str(); // capture output from buffer
  std::cout.rdbuf( old ); // reset output stream;
  return res; // Show what happened
}

bool printArrayTest1() {
    vector<int> input{1,2,3};
    PrintArray printArray;
    string result = stdOutCapture(printArray.compute, input);
    return result == ("1\n2\n3\n");
}

bool printArrayTest2() {
    vector<int> input{};
    PrintArray printArray;
    string result = stdOutCapture(printArray.compute, input);
    return result == ("");
}

bool printArrayTest3() {
    vector<int> input{5};
    PrintArray printArray;
    string result = stdOutCapture(printArray.compute, input);
    return result == ("5\n");
}


bool printReverseTest1() {
    vector<int> input{1,2,3};
    PrintReverse printReverse;
    string result = stdOutCapture(printReverse.compute, input);
    return result == ("3\n2\n1\n");
}

bool printReverseTest2() {
    vector<int> input{};
    PrintReverse printReverse;
    string result = stdOutCapture(printReverse.compute, input);
    return result == ("");
}

bool printReverseTest3() {
    vector<int> input{5};
    PrintReverse printReverse;
    string result = stdOutCapture(printReverse.compute, input);
    return result == ("5\n");
}

bool reverseStringTest1() {
    ReverseString reverseString;
    return reverseString.compute("hello") == ("olleh");
}

bool reverseStringTest2() {
    ReverseString reverseString;
    return reverseString.compute("") == ("");
}

bool reverseStringTest3() {
    ReverseString reverseString;
    return reverseString.compute("b") == ("b");
}


bool arrayPairsTest1() {
    vector<int> input{1,2,3,4,5,6};
    ArrayPairs arrayPairs;
    vector<vector<int>> output = arrayPairs.compute(input);
    return output.size() == 3 &&
              output[0][0] == 1 && output[0][1] == 2 &&
              output[1][0] == 3 && output[1][1] == 4 &&
              output[2][0] == 5 && output[2][1] == 6;
}

bool arrayPairsTest2() {
    vector<int> input{1,2,3,4,5};
    ArrayPairs arrayPairs;
    vector<vector<int>> output = arrayPairs.compute(input);
    return output.size() == 3 &&
              output[0][0] == 1 && output[0][1] == 2 &&
              output[1][0] == 3 && output[1][1] == 4 &&
              output[2][0] == 5 && output[2][1] == -1;
}

bool arrayPairsTest3() {
    vector<int> input{};
    ArrayPairs arrayPairs;
    vector<vector<int>> output = arrayPairs.compute(input);
    return output.size() == 0;
}

bool flattenTest1() {
    vector<vector<int>> input = {{1, 2, 3} ,{4, 5, 6}, {7, 8, 9}};
    Flatten flatten;
    vector<int> output = flatten.compute(input);

    return output.size() == 9 &&
              output[0] == 1 && output[1] == 2 &&
              output[2] == 3 && output[3] == 4 &&
              output[4] == 5 && output[5] == 6 &&
              output[6] == 7 && output[7] == 8 &&
              output[8] == 9;
}

bool flattenTest2() {
    vector<vector<int>> input = {};
    Flatten flatten;
    vector<int> output = flatten.compute(input);
    return output.size() == 0;
}


bool powerTest1() {
    Power power;
    return power.compute(3,4) == 81;
}

bool powerTest2() {
    Power power;
    return power.compute(5,0) == 1;
}

bool powerTest3() {
    Power power;
    return power.compute(1,100) == 1;
}


bool mergeTest1() {
    vector<int> input1{1,4,7};
    vector<int> input2{2,3,6,9};
    Merge merge;
    vector<int> output = merge.compute(input1, input2);

    return output.size() == 7 &&
              output[0] == 1 &&
              output[1] == 2 &&
              output[2] == 3 &&
              output[3] == 4 &&
              output[4] == 6 &&
              output[5] == 7 &&
              output[6] == 9;
}

bool mergeTest2() {
    vector<int> input1{};
    vector<int> input2{2,3,6,9};
    Merge merge;
    vector<int> output = merge.compute(input1, input2);

    return output.size() == 4 &&
              output[0] == 2 &&
              output[1] == 3 &&
              output[2] == 6 &&
              output[3] == 9;
}

bool mergeTest3() {
    vector<int> input1{1,4,7};
    vector<int> input2{};
    Merge merge;
    vector<int> output = merge.compute(input1, input2);

    return output.size() == 3 &&
              output[0] == 1 &&
              output[1] == 4 &&
              output[2] == 7;
}

bool mergeTest4() {
    vector<int> input1{};
    vector<int> input2{};
    Merge merge;
    vector<int> output = merge.compute(input1, input2);

    return output.size() == 0;
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
