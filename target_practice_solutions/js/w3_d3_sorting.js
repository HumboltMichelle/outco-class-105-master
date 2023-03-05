/*
 *  Target Practice - Sorting
 */

'use strict';

/*
 *  Quicksort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using quicksort.
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

// Worse Time Complexity: O(N^2)
// Worse Auxiliary Space Complexity: O(N)
// Average Time Complexity: O(Nlog(N))
// Average Auxiliary Space Complexity: O(log(N))
function quicksort(input) {
  function divide(start, end) {
    if (start >= end) { return; }
    let mid = start;
    let pivot = end;
    for (let i = start; i < end; i++) {
      if (input[i] < input[pivot]) {
        [input[i], input[mid]] = [input[mid], input[i]];
        mid++;
      }
    }
    [input[mid], input[pivot]] = [input[pivot], input[mid]];
    divide(start, mid - 1);
    divide(mid + 1, end);
  }

  divide(0, input.length - 1);
  return input;
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


// custom assert function to handle tests
// input: count {Array} - keeps track out how many tests pass and how many total
//        in the form of a two item array i.e., [0, 0]
// input: name {String} - describes the test
// input: test {Function} - performs a set of operations and returns a boolean
//        indicating if test passed
// output: {undefined}
function assert(count, name, test) {
  if(!count || !Array.isArray(count) || count.length !== 2) {
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


// check if an array is sorted in linear time
function isSorted(arr) {
  if (arr.length < 2){ return true; }
  for (let i = 1; i < arr.length; i++){
    if (arr[i-1] > arr[i]) { return false; }
  }
  return true;
}


// compare if two flat arrays are equal
function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) { return false; }
  for (let i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) { return false; }
  }
  return true;
}

console.log('Quicksort Tests');
let testCount = [0, 0];

assert(testCount, 'should sort example input', () => {
  let example = quicksort([3,9,1,4,7]);
  return arraysEqual(example, [1,3,4,7,9]);
});

assert(testCount, 'should return empty array for empty input', () => {
  let example = quicksort([]);
  return arraysEqual(example, []);
});

assert(testCount, 'should sort single-element input', () => {
  let example = quicksort([10]);
  return arraysEqual(example, [10]);
});

assert(testCount, 'should sort moderate-sized input', () => {
  let work = [];
  for (let i = 0; i < 1000; i++){
    work.push(Math.floor(Math.random() * 1000));
  }
  let example = quicksort(work);
  return example.length === 1000 && isSorted(example);
});

assert(testCount, 'should sort large input', () => {
  let work = [];
  for (let i = 0; i < 1000000; i++){
    work.push(Math.floor(Math.random() * 1000000));
  }
  let example = quicksort(work);
  return example.length === 1000000 && isSorted(example);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');
