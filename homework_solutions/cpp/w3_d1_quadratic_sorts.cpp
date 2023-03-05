/**
 *  Homework - Quadratic Sorts
 *
 *  Problem 1: Insertion Sort
 *
 *  Prompt:    Given an unsorted array/vector of integers, return the array/vector sorted
 *             using insertion sort.
 *
 *  Input:     {Array/vector}
 *  Output:    {Array/vector}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 2: Selection Sort
 *
 *  Prompt:    Given an unsorted array/vector of integers, return the array/vector
 *             sorted using selection sort.
 *
 *  Input:     {Array/vector}
 *  Output:    {Array/vector}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 3: Bubble Sort
 *
 *  Prompt:    Given an unsorted array/vector of integers, return the array/vector
 *             sorted using bubble sort.
 *
 *  Input:     {Array/vector}
 *  Output:    {Array/vector}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

#include <vector>
#include <ctime>
#include <cstdlib>
#include <iostream>
#include <algorithm>
using namespace std;

// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
vector<int> insertion(vector<int> input) {
  for (int i = 1; i < input.size(); i++) {
    int temp = input[i];
    int j = i;
    while (j > 0 && temp < input[j-1]) {
      input[j] = input[j-1];
      j--;
    }
    input[j] = temp;
  }
  return input;
}


// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
vector<int> selection(vector<int> input) {
  int minIndex;
  int temp;
  for(int i = 0; i < input.size(); i++){
    minIndex = i;
    for(int j = i + 1; j < input.size(); j++){
      if(input[j] < input[minIndex]){
        minIndex = j;
      }
    }
    temp = input[minIndex];
    input[minIndex] = input[i];
    input[i] = temp;
  }
  return input;
}


// Time Complexity: O(N^2)
// Auxiliary Space Complexity: O(1)
vector<int> bubble(vector<int> input) {
  int temp;
  for(int i = input.size() - 1; i >= 0; i--){
    for(int j = 0; j < i; j++){
      if(input[j] > input[j+1]){
        temp = input[j+1];
        input[j+1] = input[j];
        input[j] = temp;
      }
    }
  }
  return input;
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void sortTests(vector<int> sorter(vector<int>), string testName);
bool sortTest1(vector<int> sorter(vector<int>));
bool sortTest2(vector<int> sorter(vector<int>));
bool sortTest3(vector<int> sorter(vector<int>));
void runTest(bool test (vector<int> sorter(vector<int>)), vector<int> sorter(vector<int>), string testName,int testCount[]);
void printTestsPassed(int testCount[]);


int main(){
  sortTests(insertion, "Insertion Sort Tests");
  sortTests(selection, "Selection Sort Tests");
  sortTests(bubble, "Bubble Sort Tests");
  return 0;
}


void sortTests(vector<int> sorter(vector<int>), string testName){
  int testCount[] = {0, 0};
  cout << testName << endl;
  runTest(sortTest1, sorter, "should sort example input", testCount);
  runTest(sortTest2, sorter, "should sort single-element input", testCount);
  runTest(sortTest3, sorter, "should sort moderate-sized input", testCount);
  printTestsPassed(testCount);
}


bool sortTest1(vector<int> sorter(vector<int>)) {
    return sorter(vector<int>{3, 9, 1, 4, 7}) == (vector<int>{1, 3, 4, 7, 9});
}

bool sortTest2(vector<int> sorter(vector<int>)) {
    return sorter(vector<int>{10}) == (vector<int>{10});
}

// checks if array is sorted in linear time
bool isSorted(vector<int> input) {
    for (int i = 1 ; i < input.size() ; i++) {
        if (input[i-1] > input[i]) {
            return false;
        }
    }
    return true;
}

bool sortTest3(vector<int> sorter(vector<int>)) {
    vector<int> input(1000);
    vector<int> solution(1000);
    int randNum;
    srand(time(NULL));
    for (int i = 0 ; i < input.size() ; i++) {
      randNum = std::rand(); // rand() return a number between ​0​ and RAND_MAX
      input[i] =  randNum;
      solution[i] =  randNum;
    }
    input = sorter(input);
    std::sort(solution.begin(), solution.end());
    return isSorted(input) && input == solution;
}

// this is to wrap the test and check for exceptions
void runTest(bool test (vector<int> sorter(vector<int>)), vector<int> sorter(vector<int>), string testName,int testCount[]) {
  testCount[1]++;
  bool testPassed = test(sorter);
  if(testPassed) testCount[0]++;
  string result = "  " + (to_string(testCount[1]) + ")   ") + (testPassed ? "true" : "false") + " : " + testName;
  cout << result << endl;
}

// this is to print the number of test cases passed for a test suite function
void printTestsPassed(int testCount[]) {
  cout << "PASSED: " + to_string(testCount[0]) + " / " + to_string(testCount[1]) + "\n\n" <<endl;
}
