/*
*  Target Practice - Dynamic Programming - Tabulation/Memoization
*
*          Given an array of coins and a target total, return how many
*          unique ways there are to use the coins to make up that total.
*
*  Input:  coins {Integer Array}, total {Integer}
*  Output: {Integer}
*
*
* Example:
*  Input:  [1,2,3], 4
*  Output: 4
*
*          1+1+1+1
*          1+3
*          1+1+2
*          2+2
*
*
*  Input:  [2,5,3,6], 10
*  Output: 5
*
*          2+3+5
*          5+5
*          2+3+2+3
*          2+2+6
*          2+2+2+2+2
*
*    Note: You have an unlimited number of each coin type. All coins in the
*          coin array will be unique
*          Order does not matter. Ex: One penny and one nickel to create six
*          cents is equivalent to one nickel and one penny
*
*/

#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;


// Time Complexity: O(NK)
// Auxiliary Space Complexity: O(N)
// where N refers to the target total, and K refers to the length of the coins
// array

int coinSum(vector<int> coins, int total) {
  vector<int> table(total+1,0);
  table[0] = 1;

  for (int i = 0; i < coins.size(); i++) {
    int coin = coins[i];
    for (int j = coin; j < table.size(); j++) {
      table[j] = table[j] + table[j - coin];
    }
  }
  return table[table.size() - 1];
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void coinSumTests();
bool coinSumTest1(),coinSumTest2(),coinSumTest3();

int main() {
  coinSumTests();
  return 0;
}

void coinSumTests() {
  int testCount[] = {0, 0};
  cout << "Coin Sum Tests" << endl;
  runTest(coinSumTest1, "should work for first example case", testCount);
  runTest(coinSumTest2, "should work for second example case", testCount);
  runTest(coinSumTest3, "should work for a single coin", testCount);
  printTestsPassed(testCount);
}


bool coinSumTest1() {
  return coinSum(vector<int>{1,2,3}, 4) == 4;
}
bool coinSumTest2() {
  return coinSum(vector<int>{2,5,3,6}, 10) == 5;
}
bool coinSumTest3() {
  return coinSum(vector<int>{2}, 10) == 1;
}

// DO NOT TOUCH FUNCTIONS BELOW
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
