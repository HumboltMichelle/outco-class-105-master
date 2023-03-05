/*
*  Homework - Matrices
*
*  Prompt: Create a Matrix class
*
*  The Matrix will take in the following input:
*
*               m:    {Integer} - represents the number of ROWS
*               n:    {Integer} - represent the number of COLUMNS
*
*  The Matrix will have the following properties:
*
*         storage:    {Array of Arrays of Integers} - stores of numbers within matrix
*               m:    {Integer} - represents the number of ROWS
*               n:    {Integer} - represent the number of COLUMNS
*
*  The Matrix will have the following methods:
*
*          isValid:   checks whether given coordinates are within the matrix
*
*                   Input:      i {Integer} - row index
*                   Input:      j {Integer} - column index
*                  Output:        {Boolean}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->isValid(1, 1)
*
*                 result == true
*
*                 matrix->isValid(100, 1)
*
*                 result == false
*
*
*       initialize:   takes in a valid array/vector of arrayOfArrays, and
*
*                   Input: arrayOfArrays {Array/vector of Arrays/vectors of Integers}
*
*                  Output:        {undefined / void}
*
*                 Example:
*
*                 matrix->intitialize([[0, 1, 2],
*                                     [3, 4, 5],
*                                     [6, 7, 8]])
*
*
*                 result:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->m == 3
*
*                 matrix->n == 3
*
*
*            print:   optional method to print the contents of a matrix's storage
*                     prints each row of the matrix on a new line.
*
*                   Input: N/A {undefined / void}
*
*                  Output:        {undefined / void}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*
*                 console:
*
*                 [0, 1, 2]
*                 [3, 4, 5]
*                 [6, 7, 8]
*
*
*           insert:   inserts an integer into the given coordinates
*                    returns true if insertion was successful
*                    returns false otherwise
*
*                   Input:      i {Integer}
*                   Input:      j {Integer}
*                   Input:    val {Integer}
*                  Output:        {Boolean}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->insert(1, 1, 400)
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 400, 5],
*                                    [6, 7, 8]]
*
*                 result == true
*
*
*                 matrix->insert(100, 1, 400)
*
*                 matrix->storage = [[0, 1, 2],
*                                   [3, 4, 5],
*                                   [6, 7, 8]]
*
*                 result == false
*
*
*         retrieve:   returns value stored at given coordinates
*                     returns -Infinity/INT_MIN if coordinates are invalid
*
*                   Input:      i {Integer} - row index
*                   Input:      j {Integer} - column index
*                  Output:        {Integer}
*
*                  Example:
*
*                  matrix->storage == [[0, 1, 2],
*                                     [3, 4, 5],
*                                     [6, 7, 8]]
*
*                  matrix->retrieve(1, 1)
*
*                  result == 4
*
*
*            scale:   multiplies every value in the matrix by some constant factor
*                     returns undefined / void
*
*                    Input:  factor {Integer} - amount each entry will be multiplied by
*                    Output:         {undefined}
*
*                   Example:
*
*                   matrix->storage == [[1, 1, 1],
*                                      [1, 1, 1],
*                                      [1, 1, 1]]
*
*                   matrix->scale(5)
*
*                   matrix->storage == [[5, 5, 5],
*                                      [5, 5, 5],
*                                      [5, 5, 5]]
*
*
*             fill:   sets every entry in the matrix equal to input value
*                     returns undefined / void
*
*                   Input:     val {Integer} - value to be inserted throughout matrix
*                  Output:         {undefined}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->fill(1)
*
*                 matrix->storage == [[1, 1, 1],
*                                    [1, 1, 1],
*                                    [1, 1, 1]]
*
*
*          flatten:   returns an array/vector containing all the elements in the matrix if traversed row by row
*
*                   Input:      N/A
*                  Output:     {Array/vector of Integers}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->flatten()
*
*                 result == [0, 1, 2, 3, 4, 5, 6, 7, 8]
*
*
*            slice:   returns a new Matrix representing a subset of the original matrix
*                     it's rows are bounded by the first two-element array input
*                     it's columns are bounded by the second two-element array input
*
*                     NOTE: If the rowRange or colRange is larger than the original matrix
*                           just return the bounds of the original matrix
*
*                     NOTE: Think about how much you'll have to offset insertions into the new matrix
*
*                    Input:      rowRange {Array of Two Integers}
*                    Input:      colRange {Array of Two Integers}
*                   Output:     {Matrix}
*
*                 Example:
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5],
*                                    [6, 7, 8]]
*
*                 matrix->slice([0, 2], [0, 2])
*
*                 result == [[0, 1],
*                            [3, 4]]
*
*
*        transpose:   returns a new Matrix representing the transpose of the original matrix
*                     The transpose of a matrix is like flipping a matrix along its diagonal axis
*
*                     Link to Wikipedia:
*                     NOTE: if the original matrix was M x N, the new one will be N x M
*
*                    Input:      N/A
*                   Output:     {Matrix}
*
*                 matrix->storage == [[0, 1, 2],
*                                    [3, 4, 5]]
*
*                 matrix->transpose()
*
*                 result == [[0, 3],
*                            [1, 4],
*                            [2, 5]]
*
*
*
*         mulitply:   returns a new Matrix representing the matrix multiplication of original matrix
*                     by the input matrix
*
*                     Link to Wikipedia:
*                     NOTE: if the original matrix was M x N, the input one MUST be N x K
*                           the result matrix will then be M x K dimensions
*
*                    Input:      matrix {Matrix}
*                   Output:     {Matrix}
*
*                 matrix->storage == [[4, 1, 3],
*                                    [3, 2, 5]]
*
*                 matrix->multiply([[8, 9],
*                                  [7, 10],
*                                  [0, 6]])
*
*                 result == [[39, 64],
*                            [38, 77]]
*
*                 Reasoning:
*                          [[(4 * 8) + (1 * 7) + (3 * 0),    (4 * 9) + (1 * 10) + (3 * 6)],
*
*                           [(3 * 8) + (2 * 7) + (5 * 0),    (3 * 9) + (2 * 10) + (5 * 6)]]
*
*
*                      =>  [[32 + 7 + 0,   36 + 10 + 18],
*
*                           [24 + 14 + 0,  27 + 20 + 30]]
*
*
*                      =>  [[39, 64],
*                           [38, 77]]
*/


#include <climits>
#include <string>
#include <vector>
#include <algorithm>
#include <iostream>
#include <typeinfo>
using namespace std;


class Matrix {
public:

  Matrix(int m, int n) {
    this->m = m;
    this->n = n;
    this->storage = vector<vector<int>>(m, vector<int>(n));
  }

  int getM() {return this->m;}

  int getN() {return this->n;}

  vector<vector<int>> getStorage(){return this->storage;}

  void print() {
    for(int i = 0; i < this->m; i++) {
      for(int j = 0; j < this->n; j++) {
        cout << to_string(storage[i][j]) + "\t" << endl;
      }
      cout << endl;
    }
    /*
    // YOUR WORK HERE
}


bool isValid(int i, int j) {
  if(i < 0 || j < 0 || i >= this->m || j >= this->n) {
    return false;
  }
  return true;
}


void initialize(vector<vector<int>> arrayOfArrays) {
  this->storage = arrayOfArrays;
  this->m = arrayOfArrays.size();
  if(this->m > 0) this->n = arrayOfArrays[0].size();
  /*
  // YOUR WORK HERE
}


bool insert(int i, int j, int val) {
  if(this->isValid(i, j)) {
    this->storage[i][j] = val;
    return true;
  }
  return false;
}


int retrieve(int i, int j) {
  if(this->isValid(i, j)) {
    return this->storage[i][j];
  }
  return INT_MIN;
}


void scale(int factor) {
  int newVal;
  for(int i = 0; i < this->m; i++) {
    for(int j = 0; j < this->n; j++) {
      newVal = this->retrieve(i, j) * factor;
      this->insert(i, j, newVal);
    }
  }
}


void fill(int val) {
  for(int i = 0; i < this->m; i++) {
    for(int j = 0; j < this->n; j++) {
      this->insert(i, j, val);
    }
  }
}


vector<int> flatten() {
  vector<int> result = vector<int>(m*n,0);
  int counter = 0;
  for(int i = 0; i < this->m; i++) {
    for(int j = 0; j < this->n; j++) {
      result[counter++] = this->storage[i][j];
    }
  }
  return result;
}

Matrix *slice(vector<int> rowRange, vector<int> colRange) {
  int rowMin = max(0, rowRange[0]);
  int rowMax = min(rowRange[1], this->m);
  int colMin = max(0, colRange[0]);
  int colMax = min(colRange[1], this->n);

  Matrix *newMatrix = new Matrix(rowMax - rowMin, colMax - colMin);
  int newVal;
  for(int i = rowMin; i < rowMax; i++) {
    for(int j = colMin; j < colMax; j++) {
      newVal = this->retrieve(i, j);
      newMatrix->insert(i - rowMin, j - colMin, newVal);
    }
  }
  return newMatrix;
}


Matrix *transpose() {
  Matrix *newMatrix = new Matrix(this->n, this->m);
  int val;
  for(int i = 0; i < this->m; i++) {
    for(int j = 0; j < this->n; j++) {
      val = this->retrieve(i, j);
      newMatrix->insert(j, i, val);
    }
  }
  return newMatrix;
}


Matrix *multiply(Matrix *matrix) {
  if(this->n != matrix->m) {
    return NULL;
  }
  Matrix *newMatrix = new Matrix(this->m, matrix->n);
  int newVal;
  for(int i = 0; i < newMatrix->m; i++) {
    for(int j = 0; j < newMatrix->n; j++) {
      newVal = 0;
      for(int k = 0; k < this->n; k++) {
        newVal += this->retrieve(i, k) * matrix->retrieve(k, j);
      }
      newMatrix->insert(i, j, newVal);
    }
  }

  return newMatrix;
}

private:
  int m,n;
  vector<vector<int>> storage;
};


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void isValidTests(),initializeTests(),insertTests(),retrieveTests(),scaleTests(),
fillTests(),flattenTests(),sliceTests(),transposeTests(),multiplyTests();

bool isValidTest1(), isValidTest2(), isValidTest3();
bool initializeTest1(),initializeTest2();
bool insertTest1(),insertTest2(),insertTest3();
bool retrieveTest1(),retrieveTest2();
bool scaleTest1(),scaleTest2();
bool fillTest1();
bool flattenTest1(),flattenTest2(),flattenTest3();
bool sliceTest1(),sliceTest2(),sliceTest3();
bool transposeTest1(),transposeTest2(),transposeTest3(),transposeTest4();
bool multiplyTest1(),multiplyTest2(),multiplyTest3(),multiplyTest4();



int main() {
  isValidTests();
  initializeTests();
  insertTests();
  retrieveTests();
  scaleTests();
  fillTests();
  flattenTests();
  sliceTests();
  transposeTests();
  multiplyTests();
  return 0;
}


void isValidTests() {
  int testCount[] = {0, 0};
  cout << "IsValid Tests"<< endl;
  runTest(isValidTest1, "should return true for a valid set of coordinates", testCount);
  runTest(isValidTest2, "should return false for a set of coordinates off the matrix", testCount);
  runTest(isValidTest3, "should return false for a negative set of coordinates", testCount);
  printTestsPassed(testCount);
}

void initializeTests() {
  int testCount[] = {0, 0};
  cout << "Initialize Tests"<< endl;
  runTest(initializeTest1, "should override m and n values in old matrix", testCount);
  runTest(initializeTest2, "should override contents of old matrix", testCount);
  printTestsPassed(testCount);
}

void insertTests() {
  int testCount[] = {0, 0};
  cout << "Insert Tests"<< endl;
  runTest(insertTest1, "should return true if given valid coordinates", testCount);
  runTest(insertTest2, "should override old value in matrix given valid coordinates", testCount);
  runTest(insertTest3, "should return false if given invalid coordinates", testCount);
  printTestsPassed(testCount);
}

void retrieveTests() {
  int testCount[] = {0, 0};
  cout << "Retrieve Tests"<< endl;
  runTest(retrieveTest1, "should return correct value if given valid coordinates", testCount);
  runTest(retrieveTest2, "should return int.MinValue if given invalid coordinates", testCount);
  printTestsPassed(testCount);
}

void scaleTests() {
  int testCount[] = {0, 0};
  cout << "Scale Tests"<< endl;
  runTest(scaleTest1, "should scale values in matrix by amount given", testCount);
  runTest(scaleTest2, "should scale values in matrix by amount given", testCount);
  printTestsPassed(testCount);
}

void fillTests() {
  int testCount[] = {0, 0};
  cout << "Fill Tests"<< endl;
  runTest(fillTest1, "should set all values in the matrix to given amount", testCount);
  printTestsPassed(testCount);
}

void flattenTests() {
  int testCount[] = {0, 0};
  cout << "Flatten Tests"<< endl;
  runTest(flattenTest1, "should work for a single column matrix", testCount);
  runTest(flattenTest2, "should work for a single row matrix", testCount);
  runTest(flattenTest3, "should work for example matrix", testCount);
  printTestsPassed(testCount);
}

void sliceTests() {
  int testCount[] = {0, 0};
  cout << "Slice Tests"<< endl;
  runTest(sliceTest1, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [0,2] and colRange is [0,2]", testCount);
  runTest(sliceTest2, "should return 2x2 matrix slice from a 3x3 matrix when rowRange is [1,3] and colRange is [1,3]", testCount);
  runTest(sliceTest3, "should return copy of original matrix if rowRange and colRange are larger than original", testCount);
  printTestsPassed(testCount);
}

void transposeTests() {
  int testCount[] = {0, 0};
  cout << "Transpose Tests"<< endl;
  runTest(transposeTest1, "should work correctly on a 1x1 matrix", testCount);
  runTest(transposeTest2, "should work correctly on a 2x2 matrix", testCount);
  runTest(transposeTest3, "should work correctly on a 3x2 matrix", testCount);
  runTest(transposeTest4, "should work correctly on a 2x3 matrix", testCount);
  printTestsPassed(testCount);
}

void multiplyTests() {
  int testCount[] = {0, 0};
  cout << "Multiply Tests"<< endl;
  runTest(multiplyTest1, "should work correctly on example matrix with valid input", testCount);
  runTest(multiplyTest2, "should work correctly on example matrix with invalid input of wrong dimensions", testCount);
  runTest(multiplyTest3, "should work correctly on example matrix when multiplied by 3x1 matrix", testCount);
  runTest(multiplyTest4, "should work correctly when 1x2 matrix is multiplied by example matrix", testCount);
  printTestsPassed(testCount);
}

bool isValidTest1() {
  Matrix *matrix = new Matrix(3, 4);
  bool testVal = matrix->isValid(1, 1) == true;
  delete(matrix);
  return testVal;
}


bool isValidTest2() {
  Matrix *matrix = new Matrix(3, 4);
  bool testVal = matrix->isValid(5, 1) == false;
  delete(matrix);
  return testVal;
}

bool isValidTest3() {
  Matrix *matrix = new Matrix(3, 4);
  bool testVal = matrix->isValid(-4, 1) == false;
  delete(matrix);
  return testVal;
}


bool initializeTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1, 2, 3}, {4, 5, 6}});
  bool testVal = matrix->getM() == 2 && matrix->getN() == 3;
  delete(matrix);
  return testVal;
}

bool initializeTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1, 2}, {3, 4}});
  vector<vector<int>> storage = matrix->getStorage();
  bool testVal = storage.size() == 2 && storage[0].size() == 2
  && storage[0][0] == 1 && storage[0][1] == 2 && storage[1][0] == 3 && storage[1][1] == 4;
  delete(matrix);
  return testVal;
}


bool insertTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1, 2, 3}, {4, 5, 6}});
  bool testVal = matrix->insert(1, 1, 50) == true;
  delete(matrix);
  return testVal;
}

bool insertTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1, 2, 3}, {4, 5, 6}});
  bool testVal = matrix->insert(1, 1, 50) == true && matrix->getStorage()[1][1] == 50;
  delete(matrix);
  return testVal;
}

bool insertTest3() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1, 2, 3}, {4, 5, 6}});
  bool testVal = matrix->insert(5, 5, 10) == false;
  delete(matrix);
  return testVal;
}



bool retrieveTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2},{3, 4, 5},{6, 7, 8}});
  bool testVal = matrix->retrieve(1, 1) == 4;
  delete(matrix);
  return testVal;
}

bool retrieveTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2},{3, 4, 5},{6, 7, 8}});
  bool testVal = matrix->retrieve(10, 10) == INT_MIN;
  delete(matrix);
  return testVal;
}



bool scaleTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1},{3, 4}});
  matrix->scale(2);
  vector<vector<int>> storage = matrix->getStorage();
  bool testVal = storage[0][0] == 0 &&  storage[0][1] == 2 &&
  storage[1][0] == 6 &&  storage[1][1] == 8;
  delete(matrix);
  return testVal;
}

bool scaleTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1},{3, 4}});
  matrix->scale(-3);
  vector<vector<int>> storage = matrix->getStorage();
  bool testVal = storage[0][0] == 0 && storage[0][1] == -3 &&
  storage[1][0] == -9 && storage[1][1] == -12;
  delete(matrix);
  return testVal;
}



bool fillTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1},{3, 4}});
  matrix->fill(2);
  vector<vector<int>> storage = matrix->getStorage();
  bool testVal = storage[0][0] == 2 &&  storage[0][1] == 2 &&
  storage[1][0] == 2 &&  storage[1][1] == 2;
  delete(matrix);
  return testVal;
}



bool flattenTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0}, {1}, {3}, {4}});
  bool testVal = matrix->flatten() == vector<int>{0, 1, 3, 4};
  delete(matrix);
  return testVal;
}

bool flattenTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 3, 4}});
  bool testVal = matrix->flatten() == vector<int>{0, 1, 3, 4};
  delete(matrix);
  return testVal;
}

bool flattenTest3() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
  bool testVal = matrix->flatten() == vector<int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
  delete(matrix);
  return testVal;
}



bool sliceTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
  Matrix *newMatrix = matrix->slice(vector<int>{0,2}, vector<int>{0,2});
  bool testVal;
  if(newMatrix == NULL){
    testVal = false;
    delete(matrix);
    return testVal;
  }
  vector<vector<int>> newMatrixStorage = newMatrix->getStorage();
  testVal = newMatrix->getM() == 2 && newMatrix->getN() == 2 &&
    newMatrixStorage[0][0] == 0 && newMatrixStorage[0][1] == 1 &&
    newMatrixStorage[1][0] == 3 && newMatrixStorage[1][1] == 4;
  delete(matrix);
  delete(newMatrix);
  return testVal;
}

bool sliceTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
  Matrix *newMatrix = matrix->slice(vector<int>{1,3}, vector<int>{1,3});
  bool testVal;
  if(newMatrix == NULL){
    testVal = false;
    delete(matrix);
    return testVal;
  }
  vector<vector<int>> newMatrixStorage = newMatrix->getStorage();
  testVal = newMatrix->getM() == 2 && newMatrix->getN() == 2 &&
    newMatrixStorage[0][0] == 4 && newMatrixStorage[0][1] == 5 &&
    newMatrixStorage[1][0] == 7 && newMatrixStorage[1][1] == 8;
  delete(matrix);
  delete(newMatrix);
  return testVal;
}

bool sliceTest3() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}});
  Matrix *newMatrix = matrix->slice(vector<int>{-5,20}, vector<int>{-2,6});
  bool testVal = newMatrix != NULL && matrix->getStorage() == newMatrix->getStorage();
  delete(matrix);
  return testVal;
}



bool transposeTest1() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{1}});
  Matrix *newMatrix = matrix->transpose();
  bool testVal = newMatrix != NULL && newMatrix->getM() == 1 && newMatrix->getN() == 1 &&
      newMatrix->getStorage()[0][0] == 1;
  delete(matrix);
  return testVal;
}

bool transposeTest2() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1}, {2, 3}});
  Matrix *newMatrix = matrix->transpose();
  vector<vector<int>> storage = newMatrix->getStorage();
  bool testVal = newMatrix != NULL && newMatrix->getM() == 2 && newMatrix->getN() == 2 &&
        storage[0][0] == 0 && storage[0][1] == 2 &&
        storage[1][0] == 1 && storage[1][1] == 3;
  delete(matrix);
  return testVal;
}

bool transposeTest3() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1}, {3, 4}, {6, 7}});
  Matrix *newMatrix = matrix->transpose();
  vector<vector<int>> storage = newMatrix->getStorage();
  bool testVal = newMatrix != NULL && newMatrix->getM() == 2 && newMatrix->getN() == 3 &&
        storage[0][0] == 0 && storage[0][1] == 3 &&
        storage[0][2] == 6 && storage[1][0] == 1 &&
        storage[1][1] == 4 && storage[1][2] == 7;
  delete(matrix);
  return testVal;
}

bool transposeTest4() {
  Matrix *matrix = new Matrix(1, 1);
  matrix->initialize(vector<vector<int>>{{0, 1, 3}, {4, 6, 7}});
  Matrix *newMatrix = matrix->transpose();
  vector<vector<int>> storage = newMatrix->getStorage();
  bool testVal = newMatrix != NULL && newMatrix->getM() == 3 && newMatrix->getN() == 2 &&
        storage[0][0] == 0 && storage[0][1] == 4 &&
        storage[1][0] == 1 && storage[1][1] == 6 &&
        storage[2][0] == 3 && storage[2][1] == 7;
  delete(matrix);
  return testVal;
}



bool multiplyTest1() {
  Matrix *matrix1 = new Matrix(1, 1);
  Matrix *matrix2 = new Matrix(1, 1);
  matrix1->initialize(vector<vector<int>>{{4, 1, 3},
                                {3, 2, 5}});
  matrix2->initialize(vector<vector<int>>{{8, 9},
                                {7, 10},
                                {0, 6}});
  Matrix *newMatrix = matrix1->multiply(matrix2);
  bool testVal;
  if(newMatrix == NULL){
    testVal = false;
    delete(matrix1);
    delete(matrix2);
    return testVal;
  }
  vector<vector<int>> newMatrixstorage = newMatrix->getStorage();
  testVal = newMatrix->getM() == 2 && newMatrix->getN() == 2 &&
        newMatrixstorage[0][0] == 39 && newMatrixstorage[0][1] == 64 &&
        newMatrixstorage[1][0] == 38 && newMatrixstorage[1][1] == 77;
  delete(matrix1);
  delete(matrix2);
  delete(newMatrix);
  return testVal;
}

bool multiplyTest2() {
  Matrix *matrix1 = new Matrix(1, 1);
  Matrix *matrix2 = new Matrix(1, 1);
  matrix1->initialize(vector<vector<int>>{{4, 1, 3},
                                {3, 2, 5}});
  matrix2->initialize(vector<vector<int>>{{8}});
  Matrix *newMatrix = matrix1->multiply(matrix2);
  bool testVal = newMatrix == NULL;
  delete(matrix1);
  delete(matrix2);
  delete(newMatrix);
  return testVal;
}

bool multiplyTest3() {
  Matrix *matrix1 = new Matrix(1, 1);
  Matrix *matrix2 = new Matrix(1, 1);
  matrix1->initialize(vector<vector<int>>{{4, 1, 3},
                                {3, 2, 5}});
  matrix2->initialize(vector<vector<int>>{{8}, {1}, {2}});
  Matrix *newMatrix = matrix1->multiply(matrix2);
  bool testVal;
  if(newMatrix == NULL){
    testVal = false;
    delete(matrix1);
    delete(matrix2);
    return testVal;
  }
  vector<vector<int>> newMatrixstorage = newMatrix->getStorage();
  testVal = newMatrix->getM()== 2 && newMatrix->getN() == 1 &&
       newMatrixstorage[0][0] == 39 && newMatrixstorage[1][0] == 36;
  delete(matrix1);
  delete(matrix2);
  delete(newMatrix);
  return testVal;
}

bool multiplyTest4() {
  Matrix *matrix1 = new Matrix(1, 1);
  Matrix *matrix2 = new Matrix(1, 1);
  matrix1->initialize(vector<vector<int>>{{4, 1, 3},
                                {3, 2, 5}});
  matrix2->initialize(vector<vector<int>>{{3, 5}});
  Matrix *newMatrix = matrix2->multiply(matrix1);
  bool testVal;
  if(newMatrix == NULL){
    testVal = false;
    delete(matrix1);
    delete(matrix2);
    return testVal;
  }
  vector<vector<int>> newMatrixstorage = newMatrix->getStorage();
  testVal = newMatrix->getM() == 1 && newMatrix->getN() == 3 &&
       newMatrixstorage[0][0] == 27 && newMatrixstorage[0][1] == 13 &&
       newMatrixstorage[0][2] == 34;
  delete(matrix1);
  delete(matrix2);
  delete(newMatrix);
  return testVal;
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
