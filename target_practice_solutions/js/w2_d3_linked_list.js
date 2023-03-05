/*
 *  Target Practice - Linked List
 */

'use strict';

// DO NOT EDIT
// Node class for a linked list node
class ListNode {
  constructor(value = null) {
    this.value = value;
    this.next = null;
  }
}


// DO NOT EDIT
// Generate a linked list from an array
function generateList(arr) {
  if (arr.length === 0) { return null; }
  let head = new ListNode(arr[0]);
  let current = head;
  for (let i = 1; i < arr.length; i++) {
    current.next = new ListNode(arr[i]);
    current = current.next;
  }
  return head;
}


/**
 * Create a method which prints the value of each node until the tail
 *
 * Input: node {ListNode}
 * Output: {undefined}
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          1
 *          5
 *          7
 *          10
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
function printForward(node) {
  let current = node;
  while (current !== null) {
    console.log(current.value);
    current = current.next;
  }
}

/**
 * Print the value of each node backwards from the tail to the input node
 * using recursion.
 *
 * Input: node {ListNode}
 * Output: {undefined}
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          10
 *          7
 *          5
 *          1
 */

 // Time Complexity: O(N)
 // Auxiliary Space Complexity: O(N)
function printBackward(node) {
  if (node === null) { return; }
  printBackward(node.next);
  console.log(node.value);
}

/**
 * Given a node in a linked list, reverse the order of the nodes in that
 * list.
 *
 * Input: node {ListNode}
 * Output: {ListNode}
 *
 * Example: (1) --> (5) --> (7) --> (10)
 *
 *          (10) --> (7) --> (5) --> (1)
 */

 // Time Complexity: O(N)
 // Auxiliary Space Complexity: O(1)
function reverse(node) {
  if (node === null) { return node; }
  let prev = null;
  let current = node;
  let next;
  while (current) {
    next = current.next;
    current.next = prev;
    [prev, current] = [current, next];
  }

  return prev;

}

function reverse(node) {

  let head;

  function transform(current) {
    if (current.next === null) {
      head = current;
      return current;
    }

    let ref = transform(current.next);

    ref.next = current;

    return current;
  }

  transform(node);

  return head;
}

/**
 * Create a method which swaps the first occurance of the locations of two
 * nodes in the linked list.
 *
 * Input: head {ListNode},
 * Input: a {Integer}
 * Input: b {Integer}
 * Output: {ListNode}
 *
 * Example:
 * let head = generateList([1, 5, 7, 10]);
 * head = swap(head, 5, 10);
 *
 *          (1) --> (5) --> (7) --> (10)
 *          Head
 *
 *          (1) --> (10) --> (7) --> (5)
 *          Head
 */

// Time Complexity: O(N)
// Auxiliary Space Complexity: O(1)
function swap(head, a, b) {
  if(!head || a === b) { return head; }

  function locate(node, target) {
    let prev = null;
    let current = node;
    while(current) {
      if(current.value === target){
        return [prev, current];
      }
      prev = current;
      current = current.next;
    }
    return [null, null];
  }

  let [prev1, current1] = locate(head, a);
  let [prev2, current2] = locate(head, b);
  if(!current1 || !current2) { return head; }
  if(prev1) { prev1.next = current2; }
  if(prev2) { prev2.next = current1; }
  [current1.next, current2.next] = [current2.next, current1.next];
  if(prev1 === null) { return current2; }
  if(prev2 === null) { return current1; }
  return head;
}

/**
 * Extra Credit 1:
 *
 * Given an input of a ListNode, return true if the ListNode is in a circular
 * linked list, and false if the linked list that terminates.
 */

// DO NOT EDIT
// setup of node in a circular linked list
let circularNode = new ListNode(Math.floor(Math.random() * 10000));
let current = circularNode;
let size = Math.floor(Math.random() * (10000 - 100) + 100);
for (let i = 0; i < size; i++) {
  current.next = new ListNode(Math.floor(Math.random() * 10000));
  current = current.next;
  if (i === (size - 1)) {
    // connects the last node to the original circularNode
    current.next = circularNode;
  }
}

// DO NOT EDIT
// setup of a node in a linked list that terminates
let terminalNode = new ListNode(Math.floor(Math.random() * 10000));
current = terminalNode;
size = Math.floor(Math.random() * (10000 - 100) + 100);
for (let i = 0; i < size; i++) {
  current.next = new ListNode(Math.floor(Math.random() * 10000));
  current = current.next;
}


// For your input, use circularNode as a node in a circular linked list and
// terminalNode as a node in a terminating linked list
function isCircular(node) {
  let tortoise = node;
  let hare = node;

  while (hare !== null && hare.next !== null) {
    hare = hare.next.next;
    tortoise = tortoise.next;
    if (tortoise === hare) { return true; }
  }
  return false;
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////
let testCount;

console.log('Linked List instantiation tests');
testCount = [0, 0];

assert(testCount, 'able to create a linked list instance', () => {
  let test = generateList([1, 5, 7, 10]);
  return test !== undefined &&
    test.value === 1 &&
    test.next.next.next.value === 10;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('printForward tests');
testCount = [0, 0];

assert(testCount, 'should be able to print forward ' +
  'elements of linked list 1 --> 5 --> 7 --> 10', () => {
  let record = captureLog(printForward, generateList([1, 5, 7, 10]));

  return record.length === 4 &&
    record[0] === 1 &&
    record[1] === 5 &&
    record[2] === 7 &&
    record[3] === 10;
});

assert(testCount, 'should be able to print forward with single element' +
  ' linked list 1', () => {
  let record = captureLog(printForward, generateList([1]));
  return record.length === 1 &&
    record[0] === 1;
});

assert(testCount, 'should print nothing for empty list node', () => {
  let record = captureLog(printForward, generateList([]));
  return record.length === 0;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');

console.log('printBackward tests');
testCount = [0, 0];

assert(testCount, 'should be able to print backward ' +
  'elements of linked list 1 --> 5 --> 7 --> 10', () => {
  let record = captureLog(printBackward, generateList([1, 5, 7, 10]));
  return record.length === 4 &&
    record[0] === 10 &&
    record[1] === 7 &&
    record[2] === 5 &&
    record[3] === 1;
});

assert(testCount, 'should be able to print backward with single element' +
  ' linked list 1', () => {
  let record = captureLog(() => {
    let test = new ListNode(1);
    printBackward(test);
  });
  return record.length === 1 &&
    record[0] === 1;
});

assert(testCount, 'should print nothing for empty list node', () => {
  let record = captureLog(printBackward, null);
  return record.length === 0;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('reverse tests');
testCount = [0, 0];

assert(testCount, 'should be able to reverse 1 --> 5 --> 7 --> 10 ' +
  'to be 10 --> 7 --> 5 --> 1', () => {
  let test = generateList([1, 5, 7, 10]);
  test = reverse(test);
  return test.value === 10 &&
         test.next.value === 7 &&
         test.next.next.value === 5 &&
         test.next.next.next.value === 1;
});

assert(testCount, 'should be able to handle single element linked lists', () => {
  let test = new ListNode(1);
  test = reverse(test);
  return test.value === 1 && test.next === null;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('swap tests');
testCount = [0, 0];

assert(testCount, 'should be able to swap 1 and 5 to change 1 --> 5 --> 7 -->' +
' 10 linked list to look like 5 --> 1 --> 7 --> 10', () => {
  let test = generateList([1, 5, 7, 10]);
  test = swap(test, 1, 5);
  return test.value === 5 &&
    test.next.value === 1 &&
    test.next.next.value === 7 &&
    test.next.next.next.value === 10;
});

assert(testCount, 'should be able to swap 1 and 7 to change 1 --> 5 --> 7 -->' +
' 10 linked list to look like 7 --> 5 --> 1 --> 10', () => {
  let test = generateList([1, 5, 7, 10]);
  test = swap(test, 1, 7);
  return test.value === 7 &&
    test.next.value === 5 &&
    test.next.next.value === 1 &&
    test.next.next.next.value === 10;
});

assert(testCount, 'should be able to swap 1 and 10 to change 1 --> 5 --> 7 -->' +
' 10 linked list to look like 10 --> 5 --> 7 --> 1', () => {
  let test = generateList([1, 5, 7, 10]);
  test = swap(test, 1, 10);
  return test.value === 10 &&
    test.next.value === 5 &&
    test.next.next.value === 7 &&
    test.next.next.next.value === 1;
});

assert(testCount, 'should be able to swap 5 and 7 to change 1 --> 5 --> 7 -->' +
' 10 linked list to look like 1 --> 7 --> 5 --> 10', () => {
  let test = generateList([1, 5, 7, 10]);
  test = swap(test, 5, 7);
  return test.value === 1 &&
    test.next.value === 7 &&
    test.next.next.value === 5 &&
    test.next.next.next.value === 10;
});

assert(testCount, 'should be able to swap 5 and 10 to change 1 --> 5 --> 7 -->' +
' 10 linked list to look like 1 --> 10 --> 7 --> 5', () => {
  let test = generateList([1, 5, 7, 10]);
  test = swap(test, 5, 10);
  return test.value === 1 &&
    test.next.value === 10 &&
    test.next.next.value === 7 &&
    test.next.next.next.value === 5;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('isCircular tests');
testCount = [0, 0];

assert(testCount, 'should return true for circular linked list', () => {
  let test = isCircular(circularNode);
  return test === true;
});

assert(testCount, 'should return false for terminal linked list', () => {
  let test = isCircular(terminalNode);
  return test === false;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


// captures all elements that were printed to the console
//
// input: method {Function} - function to execute
// input: {Array} - parameters for the function
// output: {Array} - array of all the captured logs
function captureLog(method, ...params) {
  let record = [];
  const log = console.log;
  console.log = (...args) => {
    record = record.concat(...args);
  };
  if (params[0] === null) {
    console.log = log;
    return [];
  }
  method(...params);
  console.log = log;
  return record;
}


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
