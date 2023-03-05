/*
 *  Target Practice - Recursion
 *
 *  Problem 1:  Powerset - Helper Method Recursion
 *
 *  Prompt:   Given a set S, return the powerset P(S), which is
 *            a set of all subsets of S.
 *
 *  Input:    {string}
 *  Output:   {Array}
 *
 *  Example:  S = "abc", P(S) = ['', 'a', 'b','c','ab','ac','bc','abc']
 *
 *  Notes:     The input string will not contain duplicate characters
 *            The letters in the subset string must be in the same order
 *            as the original input.
 *
 *  Hints:
 *
 *  From Cracking the Coding Interview, by Gayle Laakmann McDowell. 8.4: Powerset
 *
 *  #273. How can you build all subsets of {a , b, c} from the subsets of {a , b}?
 *
 *  #290. Anything that is a subset of {a , b} is also a subset of {a , b , c}. Which sets are
 *  subsets of {a , b , c} but not {a , b}?
 *
 *  #338. Subsets that contain c will be subsets {a , b , c} but not {a , b}. Can you build these
 *  subsets from the subsets of (a , b}?
 *
 *  #354. You can build the remaining subsets by adding c to all the subsets of {a , b).
 *
 *  #373. You can also do this by mapping each subset to a binary number. The i th bit could
 *  represent a "boolean" flag for whether an element is in the set.
 *
 */

#include <vector>
#include <string>
#include <algorithm>
#include <iostream>

using namespace std;

vector<string> results;
string input;

void traverse(string buildUp, int depth) {
  if(depth == input.size()) {
    results.push_back(buildUp);
    return;
  }

  traverse(buildUp, depth + 1);
  traverse(buildUp + input.substr(depth, 1), depth + 1);
}

vector<string> powerset(string str) {
  results.clear();
  input = str;

  traverse("", 0);

  return results;
}



/*
*  Problem: Lattice Paths - Pure Recursion
*
*  Prompt:  Count the number of unique paths to travel from the top left
*           corder to the bottom right corner of a lattice of M x N squares.
*
*           When moving through the lattice, one can only travel to the adjacent
*           corner on the right or down.
*
*  Input:   m {Integer} - rows of squares
*  Input:   n {Integer} - column of squares
*  Output:  {Integer}
*
*  Example: input: (2, 3)
*
*           (2 x 3 lattice of squares)
*            __ __ __
*           |__|__|__|
*           |__|__|__|
*
*           output: 10 (number of unique paths from top left corner to bottom right)
*
*  Resource: https://projecteuler.net/problem=15
*
*/

// Time Complexity: O(2^(M+N))
// Auxiliary Space Complexity: O(M+N)
int latticePaths(int m, int n) {
  if (m == 0 && n == 0) {
    return 1;
  }
  if (m < 0 || n < 0) {
    return 0;
  }
  return latticePaths(m - 1, n) + latticePaths(m, n - 1);
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TESTS BELOW!!!  //////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void powerSetTests(), latticePathsTests();
bool powerSetTest1(), powerSetTest2(),powerSetTest3(),powerSetTest4();
bool latticePathsTest1(),latticePathsTest2(),latticePathsTest3(),latticePathsTest4();


int main() {
  powerSetTests();
  latticePathsTests();
  return 0;
}


void powerSetTests() {
  int testCount[] = {0, 0};
  cout << "Power Set Tests" << endl;
  runTest(powerSetTest1, "should work on example input", testCount);
  runTest(powerSetTest2, "should work on empty input", testCount);
  runTest(powerSetTest3, "should work on two-letter input", testCount);
  runTest(powerSetTest4, "should work on longer input", testCount);
  printTestsPassed(testCount);
}

void latticePathsTests() {
  int testCount[] = {0, 0};
  cout << "Lattice Paths Tests" << endl;
  runTest(latticePathsTest1, "should work on example case", testCount);
  runTest(latticePathsTest2, "should return 1 for 0 x 0 lattice", testCount);
  runTest(latticePathsTest3, "should return 2496144 for 13 x 11 lattice", testCount);
  printTestsPassed(testCount);
}

bool powerSetTest1() {
  vector<string> result = powerset("abc");
  vector<string> answer = vector<string>{"", "c", "b", "bc", "a", "ac", "ab", "abc"};
  sort(result.begin(), result.end());
  sort(answer.begin(), answer.end());
  return result == answer;
}

bool powerSetTest2() {
  vector<string> result = powerset("");
  vector<string> answer = vector<string>{""};
  sort(result.begin(), result.end());
  sort(answer.begin(), answer.end());
  return result == answer;
}

bool powerSetTest3() {
  vector<string> result = powerset("ab");
  vector<string> answer = vector<string>{"","a","b","ab"};
  sort(result.begin(), result.end());
  sort(answer.begin(), answer.end());
  return result == (answer);
}

bool powerSetTest4() {
  vector<string> result = powerset("abcdefg");
  vector<string> answer = vector<string>{"","g","f","fg","e","eg","ef","efg","d",
              "dg","df","dfg","de","deg","def","defg","c","cg","cf","cfg","ce","ceg",
              "cef","cefg","cd","cdg","cdf","cdfg","cde","cdeg","cdef","cdefg","b","bg",
              "bf","bfg","be","beg","bef","befg","bd","bdg","bdf","bdfg","bde","bdeg",
              "bdef","bdefg","bc","bcg","bcf","bcfg","bce","bceg","bcef","bcefg","bcd",
              "bcdg","bcdf","bcdfg","bcde","bcdeg","bcdef","bcdefg","a","ag","af","afg",
              "ae","aeg","aef","aefg","ad","adg","adf","adfg","ade","adeg","adef",
              "adefg","ac","acg","acf","acfg","ace","aceg","acef","acefg","acd","acdg",
              "acdf","acdfg","acde","acdeg","acdef","acdefg","ab","abg","abf","abfg",
              "abe","abeg","abef","abefg","abd","abdg","abdf","abdfg","abde","abdeg",
              "abdef","abdefg","abc","abcg","abcf","abcfg","abce","abceg","abcef",
              "abcefg","abcd","abcdg","abcdf","abcdfg","abcde","abcdeg","abcdef","abcdefg"};
  sort(result.begin(), result.end());
  sort(answer.begin(), answer.end());
  return result == (answer);
}

bool latticePathsTest1() {
  return latticePaths(2, 3) == 10;
}

bool latticePathsTest2() {
  return latticePaths(0, 0) == 1;
}

bool latticePathsTest3() {
  return latticePaths(13, 11) == 2496144;
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
