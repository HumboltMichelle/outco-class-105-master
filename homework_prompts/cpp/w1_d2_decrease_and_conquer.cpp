/*
 * Homework - Decrease and Conquer
 * Utilize the decrease and conquer pattern to solve these problems.
 */

#include <cmath>
#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;

 /*
  *
  *  Number of Ones
  *
  * *Given a sorted bit array/vector (values of either 0 or 1), determine the number of 1's in the array.*
  *
  * **Parameters**
  * Input: arr {Array/vector of Integers}
  * Output: {Integer}
  *
  * **Constraints**
  * Time: O(logN)
  * Space: O(1)
  *
  * **Examples**
  * `[0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1] --> 8`
  * `[0, 0, 0] --> 0`
  * `[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1] --> 7`
  */

 int numberOfOnes(vector<int> arr) {
   // YOUR WORK HERE
   return -1;
 }

/*
* Closest Value
*
* Given a sorted bit array/vector of integers, and a target value, find the number in the array that is closest to the target.*
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Integer}
*
* **Constraints**
* If there are two numbers tied for the closest value, return the lowest value.
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[1, 2, 3, 5, 5, 7, 9, 10, 11], 6 --> 5`
* `[1, 2, 3], 8 --> 3`
* `[1, 10, 22, 59, 67, 72, 100], 70 --> 72`
*/

int closestValue(vector<int> arr, int target) {
 // YOUR WORK HERE
 return -1;
}


/*
* Square Root
*
* Given a positive integer, find the square root.*
*
* **Parameters**
* Input: value {Double}
* Output: {Double}
*
* **Constraints**
* Do not use a native built in method.
* Ensure the result is accurate to 6 decimal places (0.000001)
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `4 --> 2.0`
* `98 --> 9.899495`
* `14856 --> 121.885192
*/


double squareRoot(double n) {
 // YOUR WORK HERE
 return -1.0;
}


/*
* Greater Values
*
* *Given a sorted array/vector of integers, and a target value return the number of values greater the target.*
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Integer}
*
* **Constraints**
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[1, 2, 3, 5, 5, 7, 9, 10, 11], 5 --> 4`
* `[1, 2, 3], 4 --> 0`
* `[1, 10, 22, 59, 67, 72, 100], 13 --> 5`
*
*/

int greaterValues(vector<int> arr, int target) {
 // YOUR WORK HERE
 return -1;
}


/*
* Sorted and Rotated Array [Extra Credit]
*
* *Given an array/vector that is sorted and rotated, find out if a target value exists in the array.*
*
* A sorted array is rotated by taking an unknown amount of values from the beginning and placing it at the end.
*
* `[3, 4, 5, 1, 2]` is rotated left by 2.
* `[99, 14, 25, 78, 93]` is rotated to the right by 1.
*
* **Parameters**
* Input: arr {Array/vector of Integers}
* Input: target {Integer}
* Output: {Boolean}
*
* **Constraints**
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `[35, 46, 79, 102, 1, 14, 29, 31], 46 --> true`
* `[35, 46, 79, 102, 1, 14, 29, 31], 47 --> false`
* `[7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 9 --> true`
*/

bool binarySearch(vector<int> nums, int start, int end, int target) {
 // YOUR WORK HERE
 return false;
}

bool rotatedArraySearch(vector<int> nums, int target) {
 // YOUR WORK HERE
 return false;
}



/*
* Multiplication Using Russian Peasant [Extra Credit]
*
* *Given two positive integers, return its product using Russian Peasant method of multiplication*
*
* Read up on how to apply the Russian Peasant method [here](https: *en.wikipedia.org/wiki/Ancient_Egyptian_multiplication). It is also referred to as the Egyptian multiplication.
*
* **Parameters**
* Input: a {Integer}
* Input: b {Integer}
* Output: {Integer}
*
* **Constraints**
* Assume a <= b, and the value of a is N.
*
* Time: O(logN)
* Space: O(1)
*
* **Examples**
* `487, 734 --> 357458`
* `846, 908--> 768168`
*/

int multiplicationRussianPeasant(int a, int b) {
 // YOUR WORK HERE
 return -1;
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void numberOfOnesTests(),closestValueTests(),squareRootTests();
void greaterValuesTests(),rotatedSortedArrayTests(),multiplicationRussianTests();

bool numberOfOnesTest1(), numberOfOnesTest2(), numberOfOnesTest3();
bool closestValueTest1(), closestValueTest2(), closestValueTest3();
bool squareRootTest1(), squareRootTest2(), squareRootTest3();
bool greaterValuesTest1(), greaterValuesTest2(), greaterValuesTest3();
bool rotatedSortedArrayTest1(), rotatedSortedArrayTest2(), rotatedSortedArrayTest3(), rotatedSortedArrayTest4();
bool multiplicationRussianTest1();



int main(){
  numberOfOnesTests();
  closestValueTests();
  squareRootTests();
  greaterValuesTests();
  rotatedSortedArrayTests();
  multiplicationRussianTests();
  return 0;
}

void numberOfOnesTests() {
    int testCount[] = {0, 0};
    cout << "Number Of Ones Tests" << endl;
    runTest(numberOfOnesTest1, "should return correct number of ones for array with zeroes and ones", testCount);
    runTest(numberOfOnesTest2, "should return correct number of ones for array with all zeroes", testCount);
    runTest(numberOfOnesTest3, "should return correct number of ones for array with all ones", testCount);
    printTestsPassed(testCount);
}

void closestValueTests() {
    int testCount[] = {0, 0};
    cout << "Closest Value Tests" << endl;
    runTest(closestValueTest1, "should return correct closest value for number in the middle range", testCount);
    runTest(closestValueTest2, "should return closest value for highest number", testCount);
    runTest(closestValueTest3, "should return closest value for lowest number", testCount);
    printTestsPassed(testCount);
}

void squareRootTests() {
    int testCount[] = {0, 0};
    cout << "Square Root Tests" << endl;
    runTest(squareRootTest1, "should return correct square root for number < 10", testCount);
    runTest(squareRootTest2, "should return correct square root for number between 10 and 100", testCount);
    runTest(squareRootTest3, "should return correct square root for number over 10,000", testCount);
    printTestsPassed(testCount);
}

void greaterValuesTests() {
    int testCount[] = {0, 0};
    cout << "Greater Values Tests" << endl;
    runTest(greaterValuesTest1, "should return greater values for number in the middle of the array", testCount);
    runTest(greaterValuesTest2, "should return 0 for number greater than largest in the array", testCount);
    runTest(greaterValuesTest3, "should return length of array for number less than least in the array", testCount);
    printTestsPassed(testCount);
}

void rotatedSortedArrayTests() {
    int testCount[] = {0, 0};
    cout << "Rotated Sorted Array Tests" << endl;
    runTest(rotatedSortedArrayTest1, "returns true when target is in the array", testCount);
    runTest(rotatedSortedArrayTest2, "returns false when target is not in the array", testCount);
    runTest(rotatedSortedArrayTest3, "returns true when target is the first number in the array", testCount);
    runTest(rotatedSortedArrayTest4, "returns true when target is the last number in the array", testCount);
    printTestsPassed(testCount);
}

void multiplicationRussianTests() {
    int testCount[] = {0, 0};
    cout << "Multiplication Russian Tests" << endl;
    runTest(multiplicationRussianTest1, "returns correct value for two integers", testCount);
    printTestsPassed(testCount);
}


bool numberOfOnesTest1() {
    int output = numberOfOnes(vector<int>{0, 0, 0, 1, 1, 1});
    return output == 3;
}

bool numberOfOnesTest2() {
    int output = numberOfOnes(vector<int>{0, 0, 0, 0, 0, 0});
    return output == 0;
}

bool numberOfOnesTest3() {
    int output = numberOfOnes(vector<int>{1, 1, 1, 1, 1});
    return output == 5;
}


bool closestValueTest1() {
    int output = closestValue(vector<int>{1, 2, 3, 5, 5, 7, 9, 10, 11}, 6);
    return output == 5;
}

bool closestValueTest2() {
    int output = closestValue(vector<int>{1, 2, 3}, 8);
    return output == 3;
}

bool closestValueTest3() {
    int output = closestValue(vector<int>{-2, -1, 0}, -5);
    return output == -2;
}

bool squareRootTest1() {
    double output = squareRoot(4.0);
    return output == 2.0;
}

bool squareRootTest2() {
    double output = squareRoot(98.0);
    return output == 9.899495;
}

bool squareRootTest3() {
    double output = squareRoot(14856.0);
    return output == 121.885192;
}


bool greaterValuesTest1() {
    int output = greaterValues(vector<int> {1, 2, 3, 5, 5, 7, 9, 10, 11}, 5);
    return output == 4;
}

bool greaterValuesTest2() {
    int output = greaterValues(vector<int> {1, 2, 3}, 4);
    return output == 0;
}

bool greaterValuesTest3() {
    int output = greaterValues(vector<int> {1, 10, 22, 59, 67, 72, 100}, -2);
    return output == 7;
}


bool rotatedSortedArrayTest1() {
    bool output = rotatedArraySearch(vector<int> {35, 46, 79, 102, 1, 14, 29, 31}, 46);
    return output == true;
}

bool rotatedSortedArrayTest2() {
    bool output = rotatedArraySearch(vector<int> {35, 46, 79, 102, 1, 14, 29, 31}, 47);
    return output == false;
}

bool rotatedSortedArrayTest3() {
    bool output = rotatedArraySearch(vector<int> {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 7);
    return output == true;
}

bool rotatedSortedArrayTest4() {
    bool output = rotatedArraySearch(vector<int> {7, 8, 9, 10, 1, 2, 3, 4, 5, 6}, 6);
    return output == true;
}


bool multiplicationRussianTest1() {
    int output = multiplicationRussianPeasant(487,734);
    return output == 357458;
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
