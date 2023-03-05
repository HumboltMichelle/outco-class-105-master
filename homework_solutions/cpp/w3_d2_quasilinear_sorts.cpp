/**
 *  Homework - Quasilinear Sorts
 *
 *
 *  Problem 1: Mergesort
 *
 *  Prompt:    Given an unsorted array/vector of integers, return the array/vector
 *             sorted using mergesort.
 *
 *  Input:     {Array/vector}
 *  Output:    {Array/vector}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

#include <vector>
#include <iostream>
#include <algorithm> // for copy()
#include <iterator>
using namespace std;

 // Worst Time Complexity: O(N * log(N))
 // Worst Total (Call Stack + Auxiliary) Space Complexity: O(N)
 // Average Time Complexity: O(N * log(N))
 // Average Total (Call Stack + Auxiliary) Space Complexity: O(N)
 // Stability: Stable
vector<int> mergeSort(vector<int> input), merge(vector<int> array1, vector<int> array2);

void printArr(vector<int> input) {
  for(int i=0; i<input.size(); i++) cout << to_string(input[i])+",";
  cout << endl;
}

vector<int> mergeSort(vector<int> input) {
  if (input.size() < 2) {
   return input;
  }
  int mid = input.size() / 2;
  vector<int> leftArray(mid);
  vector<int> rightArray(input.size() - mid);

  copy(input.begin(), input.begin()+mid, leftArray.begin());
  copy(input.begin() + mid, input.end(), rightArray.begin());

  return merge(mergeSort(leftArray), mergeSort(rightArray));
}

vector<int> merge(vector<int> array1, vector<int> array2){
  vector<int> result(array1.size() + array2.size());

  for (int i = 0, j = 0; i + j < result.size();) {
   if (j >= array2.size() || (i < array1.size() && array1[i] < array2[j])) {
     result[i + j] = array1[i];
     i++;
   } else {
     result[i + j] = array2[j];
     j++;
   }
  }
  return result;
}

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
bool sortTest1(),sortTest2(),sortTest3(),sortTest4(),sortTest5();

int main() {
  int testCount[] = {0, 0};
  cout << "Merge Sort Tests" << endl;
  runTest(sortTest1, "should sort example input", testCount);
  runTest(sortTest2, "should return empty array for empty input", testCount);
  runTest(sortTest3, "should sort single-element input", testCount);
  runTest(sortTest4, "should sort moderate-sized input", testCount);
  runTest(sortTest5, "should sort large-sized input", testCount);
  printTestsPassed(testCount);
  return 0;
}

bool sortTest1() {
  return mergeSort(vector<int>{3, 9, 1, 4, 7}) == (vector<int>{1, 3, 4, 7, 9});
}

bool sortTest2() {
  return mergeSort(vector<int>{}) == (vector<int>{});
}

bool sortTest3() {
  return mergeSort(vector<int>{10}) == (vector<int>{10});
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

bool sortTest4() {
  vector<int> input(1000);
  vector<int> solution(1000);
  int randNum;
  srand(time(NULL));
  for (int i = 0 ; i < input.size() ; i++) {
    randNum = std::rand(); // rand() return a number between ​0​ and RAND_MAX
    input[i] =  randNum;
    solution[i] =  randNum;
  }
  input = mergeSort(input);
  std::sort(solution.begin(), solution.end());
  return isSorted(input) && input == solution;
}

bool sortTest5() {
  vector<int> input(1000000);
  vector<int> solution(1000000);
  int randNum;
  srand(time(NULL));
  for (int i = 0 ; i < input.size() ; i++) {
    randNum = std::rand(); // rand() return a number between ​0​ and RAND_MAX
    input[i] =  randNum;
    solution[i] =  randNum;
  }
  input = mergeSort(input);
  std::sort(solution.begin(), solution.end());
  return isSorted(input) && input == solution;
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
