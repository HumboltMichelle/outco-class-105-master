/*
 *  Target Practice - BST Traversal
 */

'use strict';

// DO NOT EDIT
// Node class for a binary tree node
class TreeNode {
  constructor(value){
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

// DO NOT EDIT
// generate tree from array
function deserialize(arr) {
  if (arr.length === 0) { return null; }
  let root = new TreeNode(arr[0]);
  let queue = [root];
  for(let i = 1; i < arr.length; i += 2) {
    let current = queue.shift();
    if (arr[i] !== null) {
      current.left = new TreeNode(arr[i]);
      queue.push(current.left);
    }
    if (arr[i + 1] !== null && arr[i + 1] !== undefined) {
      current.right = new TreeNode(arr[i + 1]);
      queue.push(current.right);
    }
  }
  return root;
}


/**
 *
 * Deserialize operates by building out the tree in a breadth-first
 * manner. One only needs to build down to the lowest row where there
 * exists nodes. For example, in this tree,
 *
 *          1
 *            \
 *              3
 *   				  /
 *   				 2
 *
 * The array that you would pass in to the deserialize function would
 * be [1,null,3,2,null]. The first null represents the left child of
 * the 1 node, and the second null represents the right child of the 3 node.
 *
 *  1. Here, we have built out the following tree using deserialize:
 *
 *              4
 *            /   \
 *          2       5
 *        /   \       \
 *      1       3       7
 *                    /   \
 *                  6      8
 */

 // DO NOT EDIT
const arr = [4, 2, 5, 1, 3, null, 7, null, null, null, null, 6, 8];

const sampleTree = deserialize(arr);


/**
 *  2. Given the example output binary search tree from Problem 1, what would
 *     the order of values printed be if we used:
 *
 *     a. BREADTH FIRST traversal:
 *     b. PRE-ORDER DEPTH first traversal:
 *     c. IN-ORDER DEPTH first traversal:
 *     d. POST-ORDER DEPTH first traversal:
 */


/**
 *  3a. Using a queue and while loop write a function that takes the root of a
 *      binary tree node and outputs an array of values ordered by BREADTH
 *      FIRST.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *  NOTE: You may use an array or linked list for your queue.
 *  NOTE: Confirm with your answer from Problem 2a.
 */

function bfs(node) {
  // YOUR WORK HERE
}


/*
 *  3b. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */
function dfsPre(node) {
  // YOUR WORK HERE
}


/**
 *  3c. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by IN-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */
function dfsIn(node) {
  // YOUR WORK HERE
}


/**
 *  3d. Using recursion, write a function that takes in a tree node and outputs
 *      an array of values ordered by POST-ORDER DEPTH FIRST traversal.
 *
 *  Input: node {TreeNode}
 *  Output: {Array}
 *
 *      NOTE: Confirm with your answer from problem 2d.
 */
 function dfsPost(node) {
   // YOUR WORK HERE
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


 // compare if two flat arrays are equal
 function arraysEqual(arr1, arr2) {
   if (arr1.length !== arr2.length) { return false; }
   for (let i = 0; i < arr1.length; i++) {
     if (arr1[i] !== arr2[i]) { return false; }
   }
   return true;
 }


 // generate test tree for the rest of the tests
 const test = new TreeNode(4);
 test.left = new TreeNode(2);
 test.left.left = new TreeNode(1);
 test.left.right = new TreeNode(3);
 test.right = new TreeNode(5);
 test.right.right = new TreeNode(7);
 test.right.right.left = new TreeNode(6);
 test.right.right.right = new TreeNode(8);


 console.log('Problem 1 tests');
 let testCount = [0, 0];

 assert(testCount, 'able to build tree as indicated in diagram', () => {
   return sampleTree !== null &&
     sampleTree.value === 4 &&
     sampleTree.left.value === 2 &&
     sampleTree.left.left.value === 1 &&
     sampleTree.left.right.value === 3 &&
     sampleTree.right.value === 5 &&
     sampleTree.right.right.value === 7 &&
     sampleTree.right.right.left.value === 6 &&
     sampleTree.right.right.right.value === 8;
 });

 console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


 console.log('breadth first search tests');
 testCount = [0, 0];

 assert(testCount, 'able to return values in breadth first order - ' +
   '[4, 2, 5, 1, 3, 7, 6, 8]', () => {
   let results = bfs(test);
   return results !== undefined && arraysEqual(results, [4, 2, 5, 1, 3, 7, 6, 8]);
 });

 assert(testCount, 'returns an empty array for an empty tree', () => {
   let results = bfs(deserialize([]));
   return results !== undefined && arraysEqual(results, []);
 });

 console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


 console.log('pre-order depth first search tests');
 testCount = [0, 0];

 assert(testCount, 'able to return values pre-order depth first order - ' +
   '[4, 2, 1, 3, 5, 7, 6, 8]', () => {
   let results = dfsPre(test);
   return results !== undefined && arraysEqual(results, [4, 2, 1, 3, 5, 7, 6, 8]);
 });

 assert(testCount, 'returns an empty array for an empty tree', () => {
   let results = dfsPre(deserialize([]));
   return results !== undefined && arraysEqual(results, []);
 });

 console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


 console.log('in-order depth first search tests');
 testCount = [0, 0];

 assert(testCount, 'able to return values pin-order depth first order - ' +
   '[1, 2, 3, 4, 5, 6, 7, 8]', () => {
   let results = dfsIn(test);
   return results !== undefined && arraysEqual(results, [1, 2, 3, 4, 5, 6, 7, 8]);
 });

 assert(testCount, 'returns an empty array for an empty tree', () => {
   let results = dfsIn(deserialize([]));
   return results !== undefined && arraysEqual(results, []);
 });

 console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');

 console.log('post-order depth first search tests');
 testCount = [0, 0];

 assert(testCount, 'able to return values post-order depth first order - ' +
   '[1, 3, 2, 6, 8, 7, 5, 4]', () => {
   let results = dfsPost(test);
   return results !== undefined && arraysEqual(results, [1, 3, 2, 6, 8, 7, 5, 4]);
 });

 assert(testCount, 'returns an empty array for an empty tree', () => {
   let results = dfsPost(deserialize([]));
   return results !== undefined && arraysEqual(results, []);
 });

 console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');
