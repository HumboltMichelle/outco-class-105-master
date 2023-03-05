/*
 *  Homework - Dynamic Programming - Moving Window
 *
 */

#include <cmath>
#include <vector>
#include <iostream>
using namespace std;

 /*  Problem 1: Max Consecutive Sum
  *
  *  Prompt:    Given an array of integers find the sum of consecutive
  *             values in the array that produces the maximum value.
  *
  *  Input:     Unsorted array of positive and negative integers
  *  Output:    Integer (max consecutive sum)
  *
  *  Example:   input = [6, -1, 3, 5, -10]
  *             output = 13 (6 + -1 + 3 + 5 = 13)
  *
  */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
int maxConsecutiveSum(vector<int> arr) {
   if (arr.size() == 0) {
       return 0;
   }

   int localMax = arr[0];
   int ultimateMax = arr[0];

   for (int i = 1 ; i < arr.size() ; i++) {
       localMax = max(localMax + arr[i], arr[i]);
       ultimateMax = max(localMax, ultimateMax);
   }
   return ultimateMax;
}


 /*
 *  Problem 2: Bit Flip
 *
 *     Given an array of binary values (0 and 1) and N number of flips (convert
 *     a 0 to a 1), determine the maximum number of consecutive 1's that can be
 *     made.
 *
 *  Input: An Array of 1's and 0's, and an Integer N denoting the number of
 *         flips
 *  Output: Integer
 *
 *  Example: bitFlip([0,1,1,1,0,1,0,1,0,0], 2)
 *  Result: 7
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(N)
int BitFlip(vector<int> arr, int N) {
   int maximum = 0;
   int streak = 0;
   int start = 0;

   for (int i = 0 ; i < arr.size() ; i++) {
       if (arr[i] == 0) {
           if (N > 0) {
           N--;
           } else {
           int subtract = 1;
           while (arr[start] == 1) {
               start++;
               subtract++;
           }
           start++;
           streak -= subtract;
           }
       }
       streak++;
       maximum = max(maximum, streak);
   }
   return maximum;
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void maxConsecutiveSumTests(),bitFlipTests();

bool maxConsecutiveSumTest1(), maxConsecutiveSumTest2(), maxConsecutiveSumTest3(), maxConsecutiveSumTest4();
bool bitFlipTest1(), bitFlipTest2(), bitFlipTest3();


int main(){
  maxConsecutiveSumTests();
  bitFlipTests();
  return 0;
}

void maxConsecutiveSumTests() {
    int testCount[] = {0, 0};
    cout << "maxConsecutiveSum Tests" << endl;
    runTest(maxConsecutiveSumTest1, "should work on example input", testCount);
    runTest(maxConsecutiveSumTest2, "should work on single-element input", testCount);
    runTest(maxConsecutiveSumTest3, "should return 0 for empty input", testCount);
    runTest(maxConsecutiveSumTest4, "should work on longer input", testCount);
    printTestsPassed(testCount);
}

void bitFlipTests() {
    int testCount[] = {0, 0};
    cout << "Bit Flip Tests" << endl;
    runTest(bitFlipTest1, "should handle example case", testCount);
    runTest(bitFlipTest2, "should handle smaller edge case where flip is allowed", testCount);
    runTest(bitFlipTest3, "should handle smaller edge case where flip is not allowed", testCount);
    printTestsPassed(testCount);
}

bool maxConsecutiveSumTest1() {
    return maxConsecutiveSum(vector<int>{6, -1, 3, 5, -10}) == 13;
}

bool maxConsecutiveSumTest2() {
    return maxConsecutiveSum(vector<int>{5}) == 5;
}

bool maxConsecutiveSumTest3() {
    return maxConsecutiveSum(vector<int>{}) == 0;
}

bool maxConsecutiveSumTest4() {
    return maxConsecutiveSum(vector<int>{-2, 1, -3, 4, -1, 2, 1, -5, 4}) == 6;
}


bool bitFlipTest1() {
    vector<int> input{0,1,1,1,0,1,0,1,0,0};
    int output = BitFlip(input, 2);
    return output == 7;
}

bool bitFlipTest2() {
    vector<int> input{0};
    int output = BitFlip(input, 1);
    return output == 1;
}

bool bitFlipTest3() {
    vector<int> input{0};
    int output = BitFlip(input, 0);
    return output == 0;
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
