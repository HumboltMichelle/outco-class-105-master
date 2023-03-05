/*
 *  Homework - Graph
 *
 *  Problem: Graph
 *
 *  Prompt: Create a directed graph class using adjacency list edge
 *          representation.
 *
 *  The Graph will have the following properties:
 *
 *             storage: {Hash Table} - the keys represent unique vertex ids
 *                      and the values are arrays of Integers representing the
 *                      vertex ids of its neighors.
 *
 *  The Graph will also have the following methods:
 *
 *           addVertex: Method that accepts a vertex id {Integer} and adds the
 *                      vertex to the graph.  Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {Integer}
 *                     Output:    {Boolean}
 *
 *        removeVertex: Method that accepts a vertex id and removes the vertex
 *                      with the matching id. Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {Integer}
 *                     Output:    {Boolean}
 *
 *             addEdge: Method that accepts two vertex ids and creates a
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                      Input:    id1 {Integer}
 *                      Input:    id2 {Integer}
 *                     Output:    {Boolean}
 *
 *          removeEdge: Method that accepts two vertex id's and removes the
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                       Input:    id1 {Integer}
 *                       Input:    id2 {Integer}
 *                      Output:    {Boolean}
 *
 *           isVertex:  Method that accepts an id, and returns whether the vertex
 *                      exists in the graph.
 *
 *                       Input:    id {Integer}
 *                      Output:   {Boolean}
 *
 *           neighbors: Method that accepts a vertex id, and returns all of the
 *                      edges of that vertex.
 *
 *                       Input:    id {Integer}
 *                      Output:   {Array}
 *
 *
 *  Input:  {Undefined}
 *  Output: {Graph}
 *
 *  Notes:   The notation for Time/Auxiliary Space Complexity for graphs
 *           is slightly different since certain functions depend on
 *           either the number of vertices, edges or even both
 *
 *           O(V) = Linear w/ respect to the number of vertices
 *           O(E) = Linear w/ respect to the number of edges
 *           O(V+E) = Linear w/ respect to the number of vertices plus edges
 */

'use strict';

class Graph {
 constructor() {
  // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 addVertex(id) {
   // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 removeVertex(id) {
   // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 addEdge(id1, id2) {
   // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 removeEdge(id1, id2) {
   // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 isVertex(id) {
   // YOUR WORK HERE
 }

 // Time Complexity:
 // Auxiliary Space Complexity:
 neighbors(id) {
   // YOUR WORK HERE
 }
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


console.log('Graph Class');
let testCount = [0, 0];

assert(testCount, 'able to create an instance', () => {
 let graph = new Graph();
 return typeof graph === 'object';
});

assert(testCount, 'has storage property', () => {
 let graph = new Graph();
 return graph.hasOwnProperty('storage');
});

assert(testCount, 'storage property initialized to an empty hash table', () => {
 let graph = new Graph();
 return typeof graph.storage === 'object' && Object.keys(graph.storage).length === 0;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph addVertex method');
testCount = [0, 0];

assert(testCount, 'has addVertex method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.addVertex) === '[object Function]';
});

assert(testCount, 'is able to add a vertex', () => {
  let graph = new Graph();
  graph.addVertex(5);
  return graph.storage !== undefined &&
    Object.keys(graph.storage).length === 1 && graph.storage[5];
});

assert(testCount, 'vertices store an array of connections', () => {
 let graph = new Graph();
 graph.addVertex(5);
 return graph.storage !== undefined && Array.isArray(graph.storage[5]);
});

assert(testCount, 'is able to add two vertices', () => {
 let graph = new Graph();
 graph.addVertex(5);
 graph.addVertex(10);
 return graph.storage !== undefined && Object.keys(graph.storage).length === 2 && graph.storage[5] && graph.storage[10];
});

assert(testCount, 'does not add in duplicate vertex', () => {
 let graph = new Graph();
 graph.addVertex(5);
 graph.addVertex(5);
 return graph.storage !== undefined && Object.keys(graph.storage).length === 1;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph removeVertex method');
testCount = [0, 0];

assert(testCount, 'has removeVertex method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.removeVertex) === '[object Function]';
});

assert(testCount, 'able to remove a vertex within graph', () => {
  let graph = new Graph();
  graph.addVertex(5);
  let result = graph.removeVertex(5);
  return graph.storage !== undefined &&
    Object.keys(graph.storage).length === 0 && result;
});

assert(testCount, 'does not remove vertex that does not exist', () => {
  let graph = new Graph();
  graph.addVertex(5);
  let result = graph.removeVertex(10);
  return graph.storage !== undefined &&
    Object.keys(graph.storage).length === 1 && !result;
});

assert(testCount, 'removes a vertex while safely removing edges connected to node', () => {
  let graph = new Graph();
  graph.addVertex(5);
  graph.addVertex(10);
  graph.addVertex(15);
  graph.addEdge(5, 10);
  graph.addEdge(5, 15);
  graph.addEdge(10, 5);
  graph.addEdge(15, 10);
  let result = graph.removeVertex(5);
  return graph.storage !== undefined &&
    Object.keys(graph.storage).length === 2 &&
    graph.storage[10].length === 0 &&
    graph.storage[15].length === 1 &&
    result;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph addEdge method');
testCount = [0, 0];

assert(testCount, 'has addEdge method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.addEdge) === '[object Function]';
});

assert(testCount, 'able to create an edge between two vertices that exist', () => {
  let graph = new Graph();
  graph.addVertex(5);
  graph.addVertex(10);
  let result = graph.addEdge(5, 10);
  return graph.storage !== undefined &&
    graph.storage[5] !== undefined &&
    graph.storage[5].length === 1 && graph.storage[10].length === 0 && result;
});

assert(testCount, 'does not create an edge when one of the vertices does not exist', () => {
 let graph = new Graph();
 graph.addVertex(5);
 let result = graph.addEdge(5, 10); //should be false
 return graph.storage !== undefined &&
   graph.storage[5] !== undefined &&
   graph.storage[5].length === 0 && graph.storage[10] === undefined && !result;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph removeEdge method');
testCount = [0, 0];

assert(testCount, 'has removeEdge method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.removeEdge) === '[object Function]';
});

assert(testCount, 'able to remove an edge between two vertices', () => {
 let graph = new Graph();
 graph.addVertex(5);
 graph.addVertex(10);
 graph.addEdge(5, 10);
 let result = graph.removeEdge(5, 10);
 return graph.storage !== undefined &&
   graph.storage[5] !== undefined &&
   graph.storage[5].length === 0 && graph.storage[10].length === 0 && result;
});

assert(testCount, 'does not remove edge when edge does not exist', () => {
  let graph = new Graph();
  graph.addVertex(5);
  graph.addVertex(10);
  graph.addEdge(5, 10);
  let result = graph.removeEdge(6, 10);
  return graph.storage !== undefined &&
    graph.storage[5] !== undefined &&
    graph.storage[5].length === 1 && graph.storage[6] === undefined && !result;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph isVertex method');
testCount = [0, 0];

assert(testCount, 'has isVertex method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.isVertex) === '[object Function]';
});

assert(testCount, 'returns true when a vertex exists', () => {
 let graph = new Graph();
 graph.addVertex(5);
 return graph.isVertex(5) === true;
});

assert(testCount, 'returns false when a vertex does not exist', () => {
 let graph = new Graph();
 return graph.isVertex(5) === false;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


console.log('Graph neighbors method');
testCount = [0, 0];

assert(testCount, 'has neighbors method', () => {
 let graph = new Graph();
 return Object.prototype.toString.apply(graph.neighbors) === '[object Function]';
});

assert(testCount, 'returns null if the vertex does not exist', () => {
 let graph = new Graph();
 return graph.neighbors(5) === null;
});

assert(testCount, 'returns an empty array if vertex has no edges', () => {
  let graph = new Graph();
  graph.addVertex(5);
  return graph.neighbors(5) !== undefined &&
    graph.neighbors(5).length === 0;
});

assert(testCount, 'returns neighbors if edges exist for a vertex', () => {
  let graph = new Graph();
  graph.addVertex(5);
  graph.addVertex(10);
  graph.addVertex(15);
  graph.addVertex(20);
  graph.addEdge(5, 10);
  graph.addEdge(5, 15);
  graph.addEdge(5, 20);
  let result = graph.neighbors(5);
  return result !== undefined &&
    result.length === 3 && arraysMatching(result, [10,15,20]);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');
