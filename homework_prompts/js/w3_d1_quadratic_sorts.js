/**
 *  Homework - Quadratic Sorts
 *
 *  Problem 1: Insertion Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array sorted
 *             using insertion sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 2: Selection Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using selection sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 *
 *
 *  Problem 3: Bubble Sort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using bubble sort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     input {Array}
 *  Output:    {Array}
 *
 *  Example:   [3,9,1,4,7] --> [1,3,4,7,9]
 */

'use strict';


// Time Complexity:
// Auxiliary Space Complexity:
function insertionSort(input) {
  // YOUR WORK HERE
}

// Time Complexity:
// Auxiliary Space Complexity:
function selectionSort(input){
  // YOUR WORK HERE
}


// Time Complexity:
// Auxiliary Space Complexity:
function bubbleSort(input){
  // YOUR WORK HERE
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


console.log('Insertion Sort Tests');
let testCount = [0, 0];

assert(testCount, 'should sort [3,9,1,4,7]', () => {
  let test = insertionSort([3,9,1,4,7]);
  return arraysEqual(test, [1,3,4,7,9]);
});

assert(testCount, 'should return empty array for empty input', () => {
  let test = insertionSort([]);
  return arraysEqual(test, []);
});

assert(testCount, 'should sort single-element input', () => {
  let test = insertionSort([10]);
  return arraysEqual(test, [10]);
});

assert(testCount, 'should sort moderate-sized input', () => {
  let sample = [];
  for (let i = 0; i < 1000; i++) {
    sample.push(Math.floor(Math.random() * 1000));
  }
  let test = insertionSort(sample.slice());
  return test.length === 1000 && arraysEqual(test, sample.sort((a, b) => a - b));
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Selection Sort Tests');
testCount = [0, 0];

assert(testCount, 'should sort [3,9,1,4,7]', () => {
  let test = selectionSort([3,9,1,4,7]);
  return arraysEqual(test, [1,3,4,7,9]);
});

assert(testCount, 'should return empty array for empty input', () => {
  let test = selectionSort([]);
  return arraysEqual(test, []);
});

assert(testCount, 'should sort single-element input', () => {
  let test = selectionSort([10]);
  return arraysEqual(test, [10]);
});

assert(testCount, 'should sort moderate-sized input', () => {
  let sample = [];
  for (let i = 0; i < 1000; i++) {
    sample.push(Math.floor(Math.random() * 1000));
  }
  let test = selectionSort(sample.slice());
  return test.length === 1000 && arraysEqual(test, sample.sort((a, b) => a - b));
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Bubble Sort Tests');
testCount = [0, 0];

assert(testCount, 'should sort [3,9,1,4,7]', () => {
  let test = bubbleSort([3,9,1,4,7]);
  return arraysEqual(test, [1,3,4,7,9]);
});

assert(testCount, 'should return empty array for empty input', () => {
  let test = bubbleSort([]);
  return arraysEqual(test, []);
});

assert(testCount, 'should sort single-element input', () => {
  let test = bubbleSort([10]);
  return arraysEqual(test, [10]);
});

assert(testCount, 'should sort moderate-sized input', () => {
  let sample = [];
  for (let i = 0; i < 1000; i++) {
    sample.push(Math.floor(Math.random() * 1000));
  }
  let test = bubbleSort(sample.slice());
  return test.length === 1000 && arraysEqual(test, sample.sort((a, b) => a - b));
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


// compare if two flat arrays are equal
function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) { return false; }
  for (let i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) { return false; }
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
function assert(count, name, test){
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
