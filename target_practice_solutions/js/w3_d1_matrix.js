/*
 *  Target Practice - Matrix
 */

'use strict';

/*
 *  Problem:  Robot Paths
 *
 *  Prompt:   Given a matrix of zeroes, determine how many unique paths exist
 *            from the top left corner to the bottom right corner
 *
 *  Input:    An Array of Array of Integers (matrix)
 *  Output:   Integer
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

function robotPaths(matrix) {
  function traverse(x, y) {
    if (x < 0 || y < 0 || x >= matrix[0].length || y >= matrix.length) {
      // refers to when we are out of bounds
      return 0;
    } else if (matrix[y][x] === 1) {
      // when we hit a wall
      return 0;
    } else if (x === matrix[0].length - 1 && y === matrix.length - 1) {
      // reached the destination
      return 1;
    }

    matrix[y][x] = 1;
    let sum = 0;
    sum += traverse(x+1, y);
    sum += traverse(x-1, y);
    sum += traverse(x, y+1);
    sum += traverse(x, y-1);
    matrix[y][x] = 0;
    return sum;
  }
  return traverse(0, 0);
}


/*
 *  Matrix Spiral
 *
 *  Given an (MxN) matrix of integers, return an array in spiral order.
 *
 *
 *  Input:  matrix {Integer[][]}
 *  Output: {Integer}
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


// Time Complexity: O(MN)
// Auxiliary Space Complexity: O(MN)

function matrix_spiral(matrix) {
  if(!matrix.length) {return []; }
  var yMin = 0;
  var xMin = 0;
  var yMax = matrix.length - 1;
  var xMax = matrix[0].length - 1;
  var results = [];

  while (xMin <= xMax && yMin <= yMax) {
      for(var i = xMin; i <= xMax; i++){
          results.push(matrix[yMin][i]);
      }
      yMin++;
      for(i = yMin; i <= yMax; i++){
          results.push(matrix[i][xMax]);
      }
      xMax--;
      if(yMin <= yMax){
          for(i = xMax; i >= xMin; i--){
              results.push(matrix[yMax][i]);
          }
          yMax--;
      }
      if(xMin <= xMax){
          for(i = yMax; i >= yMin; i--){
              results.push(matrix[i][xMin]);
          }
          xMin++;
      }
  }
  return results;
};

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

console.log('Robot Paths Tests');
let testCount = [0, 0];

assert(testCount, 'should work on first example input', function(){
  let test = [[0,0,0,0],
              [0,0,0,0],
              [0,0,0,0]];
  var example = robotPaths(test);
  return example === 38;
});

assert(testCount, 'should work on second example input', function(){
  let test = [[0,0,0],
              [0,0,0]];
  var example = robotPaths(test);
  return example === 4;
});

assert(testCount, 'should work on single-element input', function(){
  let test = [[0]];
  var example = robotPaths(test);
  return example === 1;
});

assert(testCount, 'should work on single-row input', function(){
  let test = [[0,0,0,0,0,0]];
  var example = robotPaths(test);
  return example === 1;
});

assert(testCount, 'should work on single-column input', function(){
  let test = [[0],
              [0],
              [0],
              [0],
              [0]];
  var example = robotPaths(test);
  return example === 1;
});

assert(testCount, 'should work on a 5 x 8 matrix input', function(){
  let test = [[0,0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0,0]];
  console.log("  Please be patient, test 6 may take longer to run");
  var example = robotPaths(test);
  return example === 7110272;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Matrix Spiral Tests');
testCount = [0, 0];

assert(testCount, 'should work for empty matrix input', () => {
  let example = [[]];
  let test = matrix_spiral(example);
  return arraysEqual(test, []);
});

assert(testCount, 'should work for single element matrix input', () => {
  let example = [[1]];
  let test = matrix_spiral(example);
  return arraysEqual(test, [1]);
});

assert(testCount, 'should work on single column matrix input', () => {
  let example = [[1],
                 [2],
                 [3],
                 [4],
                 [5]]
  let test = matrix_spiral(example);
  return arraysEqual(test, [1, 2, 3, 4, 5]);
});

assert(testCount, 'should work on square matrix input', () => {
  let example = [[1, 2],
                 [4, 3]];
  let test = matrix_spiral(example);
  return arraysEqual(test, [1, 2, 3, 4]);
});

assert(testCount, 'should work on single row matrix input', () => {
  let example = [[1, 2, 3, 4]];
  let test = matrix_spiral(example);
  return arraysEqual(test, [1, 2, 3, 4]);
});

assert(testCount, 'should work on 3 x 5 matrix input', () => {
  let example = [[ 1,  2,  3],
                 [ 4,  5,  6],
                 [ 7,  8,  9],
                 [10, 11, 12],
                 [13, 14, 15]]
  let test = matrix_spiral(example);
  return arraysEqual(test, [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]);
});

assert(testCount, 'should work on a 5 x 3 matrix input', () => {
  let example =  [[  1,  2,  3,  4, 5],
                  [ 12, 13, 14, 15, 6],
                  [ 11, 10,  9,  8, 7]]
  let test = matrix_spiral(example);
  return arraysEqual(test, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');




// function for checking if arrays contain same elements
// (do not need to be in the same order)
function arraysMatching(arr1, arr2) {
  if (arr1.length !== arr2.length) { return false; }

  let cache = {};
  for (let i = 0; i < arr1.length; i++) {
    if (cache[arr1[i]] === undefined) {
      cache[arr1[i]] = 1;
    } else {
      cache[arr1[i]]++;
    }
  }

  for (let j = 0; j < arr2.length; j++) {
    if (cache[arr2[j]] === undefined || cache[arr2[j]] === 0) { return false; }
    cache[arr2[j]]--;
  }
  return true;
}

// function for checking if arrays are equal
function arraysEqual(arr1, arr2) {
  if(arr1.length !== arr2.length)
    return false;
  for(let i = arr1.length; i--;) {
    if(arr1[i] !== arr2[i])
      return false;
  }
  return true;
}


// custom assert function to handle tests
// input: count {Array} - keeps track out how many tests pass and how many total
//        in the form of a two item array i.e., [0, 0]
// input: name {String} - describes the test
// input: test {Function} - performs a set of operations and returns a boolean
//        indicating if test passed
// output: {undefined}
function assert(count, name, test) {
  if (!count || !Array.isArray(count) || count.length !== 2) {
    count = [0, '*'];
  } else {
    count[1]++;
  }

  let pass = 'false';
  let errMsg = null;
  try {
    if (test()) {
      pass = ' true';
      count[0]++;
    }
  } catch(e) {
    errMsg = e;
  }
  console.log('  ' + (count[1] + ')   ').slice(0,5) + pass + ' : ' + name);
  if (errMsg !== null) {
    console.log('       ' + errMsg + '\n');
  }
}
