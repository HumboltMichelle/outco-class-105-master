/*
 *  Target Practice - Sliding Window / Dynamic Programming 2
 */

#include <climits>
#include <vector>
#include <algorithm>
#include <iostream>
#include <unordered_map>
using namespace std;


/*
 * Minimum Window Substring (Sliding Window)
 *
 * Given a string, and a set of characters
 * return the substring representing the SMALLEST
 * window containing those characters.
 *
 * The characters needn't appear in the order in which they are given.
 *
 * If not all the characters are present in the string, return the empty string.
 *
 *
 * Input: str   (string)
 *        chars (string)
 *
 * Output: {string}
 *
 *
 * Example:
 *  Input: "ADOBECODEBANC", "ABC"
 *  Output: "BANC"
 *
 *  Input: "HELLO WORLD", "FOO"
 *  Output: ""
 *
 *
 * Explanation:
 *   Though there are many substrings containing all the characters
 *   "BANC" is the shortest.
 *
 * Assume that there won't be repeated characters in the second string input.
 *
 * Ignore capitalization.
 * (though taking it into account doesn't change the solution much)
 *
 * But as extra credit, how would you handle repeats?
 * Meaning if you were given two "A" characters, a valid window MUST
 * contain two "A"s
 *
 *
 */

// Time Complexity:
// Auxiliary Space Complexity:
string minimumWindowSubstring(string str, string targets) {
   //YOUR WORK HERE
   return "";
 }



/*
*  Problem: Dungeon Escape
*
*          Given a matrix of integers that represents rooms in a dungeon,
*          determine the minimum amount of health a adventurer must start with
*          in order to escape the dungeon
*
*          The adventurer starts at the upper left corner of the matrix, and
*          the exit is located at the bottom right corner.
*
*          The adventurer must leave the dungeon before sundown, so in the
*          interest of time, this brave adventurer decides to only travel
*          downwards and to the right
*
*          Negative integers represent rooms with monsters, so the adventurer
*          would lose health when going though these rooms. 0s represent empty
*          rooms, and positive integers represent rooms that contain health
*          pots that will increase the adventurer's health
*
*
*  Input:  dungeon {int[,]}
*  Output: {int}
*
*
* Example:
*  Input:  [[ -2, -5, 10],
*           [ -3,-10, 30],
*           [  3,  1, -5]]
*
*  Output: 7 (The steps to do this would be down, down, right, right)
*
*
*    Note: The initial health should be represented by a positve integers
*          If the health ever drops to zero or a negative integer, the
*          adventurer dies.
*          Every room will contain an integer. It will either be empty (0),
*          contain a monster (negative), or contain a health pot (positive).
*          You could create every single possible path, but there is of course
*          a dynamic programming approach to not go with this route.
*
*/



// Time Complexity:
// Auxiliary Space Complexity:

int escape(vector<vector<int>> dungeon) {
  //YOUR WORK HERE
  return -1;
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void minimumWindowSubstringTests(),dungeonEscapeTests();
bool minimumWindowSubstringTest1(),minimumWindowSubstringTest2();
bool dungeonEscapeTest1(),dungeonEscapeTest2(),dungeonEscapeTest3(),dungeonEscapeTest4(),
    dungeonEscapeTest5(),dungeonEscapeTest6(),dungeonEscapeTest7(),dungeonEscapeTest8(),
    dungeonEscapeTest9(),dungeonEscapeTest10(),dungeonEscapeTest11();

int main() {
  minimumWindowSubstringTests();
  dungeonEscapeTests();
  return 0;
}

void minimumWindowSubstringTests() {
  int testCount[] = {0, 0};
  cout << "Minimum Window Substring Tests" << endl;
  runTest(minimumWindowSubstringTest1, "should work for first example case", testCount);
  runTest(minimumWindowSubstringTest2, "should work for second example case", testCount);
  printTestsPassed(testCount);
}

void dungeonEscapeTests() {
  int testCount[] = {0, 0};
  cout << "Dungeon Escape Tests" << endl;
  runTest(dungeonEscapeTest1, "should work for first example case", testCount);
  runTest(dungeonEscapeTest2, "should work for dungeon filled solely with health potions", testCount);
  runTest(dungeonEscapeTest3, "should work for an empty dungeon", testCount);
  runTest(dungeonEscapeTest4, "should work for a dungeon filled only with monsters", testCount);
  runTest(dungeonEscapeTest5, "should work for a two-room dungeon starting with a monster", testCount);
  runTest(dungeonEscapeTest6, "should work for a two-room dungeon starting with a strong monster", testCount);
  runTest(dungeonEscapeTest7, "should work for a two-room dungeon starting with a health pot", testCount);
  runTest(dungeonEscapeTest8, "should work for a two-room dungeon ending in a strong monster", testCount);
  runTest(dungeonEscapeTest9, "should work a dungeon with only a monster", testCount);
  runTest(dungeonEscapeTest10, "should work a dungeon with only a health pot", testCount);
  runTest(dungeonEscapeTest11, "should work a dungeon with a single empty room", testCount);
  printTestsPassed(testCount);
}


bool minimumWindowSubstringTest1() {
  return minimumWindowSubstring("ADOBECODEBANC", "ABC") == ("BANC");
}

bool minimumWindowSubstringTest2() {
  return minimumWindowSubstring("HELLO WORLD", "FOO") == ("");
}


bool dungeonEscapeTest1() {
  vector<vector<int>>example{{ -2, -5, 10},
                    { -3,-10, 30},
                    {  3,  1, -5}};
  int test = escape(example);
  return test == 7;
}

bool dungeonEscapeTest2() {
  vector<vector<int>>example{{  5,  1, 10},
                          { 10,312, 30},
                          {  3,  1,  7}};
  int test = escape(example);
  return test == 1;
}

bool dungeonEscapeTest3() {
  vector<vector<int>>example{{  0,  0,  0},
                          {  0,  0,  0},
                          {  0,  0,  0}};
  int test = escape(example);
  return test == 1;
}

bool dungeonEscapeTest4() {
  vector<vector<int>>example{{ -3, -6,-13},
                          {-12, -1, -7},
                          { -5,-11, -2}};
  int test = escape(example);
  return test == 20;
}

bool dungeonEscapeTest5() {
  vector<vector<int>>example{{-2, 5}};
  int test = escape(example);
  return test == 3;
}

bool dungeonEscapeTest6() {
  vector<vector<int>>example{{-13, 5}};
  int test = escape(example);
  return test == 14;
}

bool dungeonEscapeTest7() {
  vector<vector<int>>example{{5, -2}};
  int test = escape(example);
  return test == 1;
}

bool dungeonEscapeTest8() {
  vector<vector<int>>example{{5, -8}};
  int test = escape(example);
  return test == 4;
}

bool dungeonEscapeTest9() {
  vector<vector<int>>example{{-14}};
  int test = escape(example);
  return test == 15;
}

bool dungeonEscapeTest10() {
  vector<vector<int>>example{{6}};
  int test = escape(example);
  return test == 1;
}

bool dungeonEscapeTest11() {
  vector<vector<int>>example{{0}};
  int test = escape(example);
  return test == 1;
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
