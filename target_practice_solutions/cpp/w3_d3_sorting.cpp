/*
 *  Target Practice - Sorting
 *
 *  Problem 1: Quicksort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using quicksort.
 *
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */


#include <vector>
#include <iostream>
#include <algorithm> // for copy()
#include <iterator>
using namespace std;


 // Worse Time Complexity: O(N^2)
 // Worse Auxiliary Space Complexity: O(N)
 // Average Time Complexity: O(Nlog(N))
 // Average Auxiliary Space Complexity: O(log(N))


 void swap(vector<int> &arr, int i, int j){
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
 }

 void divide(vector<int> &input, int begin, int end) {
     int mid = begin;

     if (begin >= end) {
       return;
     }
     for(int i = begin; i < end; i++){
        if(input[i] < input[end]){
            swap(input, mid, i);
            mid++;
        }
     }

    swap(input, mid, end);
    divide(input, begin, mid - 1);
    divide(input, mid + 1, end);
 }




vector<int> quicksort(vector<int> input) {
    divide(input, 0, input.size() - 1);
    return input;
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
bool sortTest1(),sortTest2(),sortTest3(),sortTest4(),sortTest5();

int main() {
  int testCount[] = {0, 0};
  cout << "Quick Sort Tests" << endl;
  runTest(sortTest1, "should sort example input", testCount);
  runTest(sortTest2, "should return empty array for empty input", testCount);
  runTest(sortTest3, "should sort single-element input", testCount);
  runTest(sortTest4, "should sort moderate-sized input", testCount);
  runTest(sortTest5, "should sort large-sized input", testCount);
  printTestsPassed(testCount);
  return 0;
}

bool sortTest1() {
  return quicksort(vector<int>{3, 9, 1, 4, 7}) == (vector<int>{1, 3, 4, 7, 9});
}

bool sortTest2() {
  return quicksort(vector<int>{}) == (vector<int>{});
}

bool sortTest3() {
  return quicksort(vector<int>{10}) == (vector<int>{10});
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
  input = quicksort(input);
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
  input = quicksort(input);
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
