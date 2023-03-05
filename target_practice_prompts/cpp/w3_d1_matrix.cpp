/*
 * Target Practice - Matrices
 *
 */

#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


/*
 *  Problem 1:  Robot Paths
 *
 *  Prompt:   Given a matrix of zeroes, determine how many unique paths exist
 *            from the top left corner to the bottom right corner
 *
 *  Input:    An Array of Array of ints (matrix)
 *  Output:   int
 *
 *  Example:  matrix = [[0,0,0,0],
 *                      [0,0,0,0],
 *                      [0,0,0,0]]
 *
 *            robotPaths(matrix) = 38
 *
 *
 *            matrix = [[0,0,0],
 *                      [0,0,0]]
 *
 *            robotPaths(matrix) = 4
 *
 *  Note:     From any point, you can travel in the four cardinal directions
 *            (north, south, east, west). A path is valid as long as it travels
 *            from the top left corner to the bottom right corner, does not go
 *            off of the matrix, and does not travel back on itself
 */


//DO NOT MODFIY THESE VARIABLES. They are global variables used to dynamically
// define the robot paths matrix dimensions and you should use them as
// boundaries in implementing your solution.
int nRows, nCols;

int traverse(int row, int col, int **matrix) {
  // YOUR WORK HERE
  return -1;
 }

int robotPaths(int **matrix) {
  // YOUR WORK HERE
  return -1;
}




/*
*  Problem 2: Matrix Spiral
*
*  Given an (MxN) matrix of integers, return an array in spiral order.
*
*
*  Input:  matrix {vector<vector<int>>}
*  Output: {int}
*
*
* Example:
*  Input:  [[ 1, 2, 3],
*           [ 4, 5, 6],
*           [ 7, 8, 9]]
*
*  Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
*
*/


// Time Complexity:
// Auxiliary Space Complexity:

vector<int> matrixSpiral(vector<vector<int>> &matrix) {
   //YOUR WORK HERE
   return vector<int>{};
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
void robotPathsTests(),matrixSpiralTests();

bool robotPathsTest1(),robotPathsTest2(),robotPathsTest3(),
    robotPathsTest4(),robotPathsTest5(),robotPathsTest6();
bool matrixSpiralTest1(),matrixSpiralTest2(),matrixSpiralTest3(),matrixSpiralTest4(),
    matrixSpiralTest5(),matrixSpiralTest6(),matrixSpiralTest7();


int main() {
  robotPathsTests();
  matrixSpiralTests();
  return 0;
}

void robotPathsTests() {
  int testCount[] = {0, 0};
  cout << "Robot Paths Tests" << endl;
  runTest(robotPathsTest1, "should work on example input", testCount);
  runTest(robotPathsTest2, "should work on second example input", testCount);
  runTest(robotPathsTest3, "should work on single-element input", testCount);
  runTest(robotPathsTest4, "should work on single-row input", testCount);
  runTest(robotPathsTest5, "should work on single-column input", testCount);
  runTest(robotPathsTest6, "should work on a 5 x 8 matrix input", testCount);
  printTestsPassed(testCount);
}

void matrixSpiralTests() {
  int testCount[] = {0, 0};
  cout << "Matrix Spiral Tests" << endl;
  runTest(matrixSpiralTest1, "should work for empty matrix input", testCount);
  runTest(matrixSpiralTest2, "should work for single element matrix input", testCount);
  runTest(matrixSpiralTest3, "should work for single column matrix input", testCount);
  runTest(matrixSpiralTest4, "should work for square matrix input", testCount);
  runTest(matrixSpiralTest5, "should work for single row matrix input", testCount);
  runTest(matrixSpiralTest6, "should work on 3 x 5 matrix input", testCount);
  runTest(matrixSpiralTest7, "should work on 5 x 3 matrix input", testCount);
  printTestsPassed(testCount);
}

int **createMatrix(int rows, int cols) {
  int **matrix = new int*[rows];
  for(int i=0; i<rows; i++) {
    matrix[i] = new int[cols];
    for(int j=0; j<cols; j++) {
      matrix[i][j] = 0;
    }
  }
  return matrix;
}

void deleteMatrix(int **matrix, int rows, int cols) {
  for(int i=0; i<rows; i++) {
    delete[] matrix[i];
  }
  delete[] matrix;
}


bool robotPathsTest1() {
  nRows = 3;
  nCols = 4;
  int **matrix = createMatrix(nRows,nCols);
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 38;
}

bool robotPathsTest2() {
  nRows = 2;
  nCols = 3;
  int **matrix = createMatrix(nRows,nCols);
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 4;
}

bool robotPathsTest3() {
  nRows = 1;
  nCols = 1;
  int **matrix = createMatrix(nRows,nCols);
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 1;
}

bool robotPathsTest4() {
  nRows = 1;
  nCols = 6;
  int **matrix = createMatrix(nRows,nCols);
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 1;
}

bool robotPathsTest5() {
  nRows = 5;
  nCols = 1;
  int **matrix = createMatrix(nRows,nCols);
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 1;
}

bool robotPathsTest6() {
  nRows = 5;
  nCols = 8;
  int **matrix = createMatrix(nRows,nCols);
  cout << "Please be patient, test 6 may take longer to run" << endl;
  int res = robotPaths(matrix);
  deleteMatrix(matrix,nRows,nCols);
  return res == 7110272;
}


bool matrixSpiralTest1() {
  vector<vector<int>> matrix{{}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{};
  return test == expected;
}

bool matrixSpiralTest2() {
  vector<vector<int>> matrix{{1}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1};
  return test == expected;
}

bool matrixSpiralTest3() {
  vector<vector<int>> matrix{{1},
                        {2},
                        {3},
                        {4},
                        {5}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1, 2, 3, 4, 5};
  return test == expected;
}

bool matrixSpiralTest4() {
  vector<vector<int>> matrix{{1, 2},
                        {4, 3}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1, 2, 3, 4};
  return test == expected;
}

bool matrixSpiralTest5() {
  vector<vector<int>> matrix{{1, 2, 3, 4}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1, 2, 3, 4};
  return test == expected;
}

bool matrixSpiralTest6() {
  vector<vector<int>> matrix{{1, 2, 3},
                    {4, 5, 6},
                    {7, 8, 9},
                    {10, 11, 12},
                    {13, 14, 15}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11};
  return test == expected;
}

bool matrixSpiralTest7() {
  vector<vector<int>> matrix{{1, 2, 3, 4, 5},
                    {12, 13, 14, 15, 6},
                    {11, 10, 9, 8, 7}};
  vector<int> test = matrixSpiral(matrix);
  vector<int> expected{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
  return test == expected;
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
