'use strict'
/*
 * Homework - Advanced Graph Traversals
 *
 * Instructions: We will be exploring further graph traversal problems in this
 * homework file. You'll want to go through the corresponding learning material
 * on the Data Structures and Algorithms course at
 * https://outco.teachable.com/courses/438359/lectures/6721871
 *
 * You'll want to use the following classes in your code:
 *     - Graph
 *     - Stack
 *     - Queue
 **/

// Helper Data Structures and Algorithms

// Graph Class: Directed, Unweighted, Adacency List
class Graph {
  constructor() {
      this.storage = new Map();
  }

  addVertex(value) {
      if (this.storage.get(value) === undefined) {
          this.storage.set(value, new Set());
      }
  }

  removeVertex(value) {
    if (this.storage.get(value) === undefined) {
        return;
    }
    // remove all edge references to vertex
    for (let vertex in this.storage) {
        let neighbors = this.storage.get(vertex);
        neighbors.delete(value);
    }
    // remove vertex from storage
    this.storage.delete(value);
  }

  addEdge(a, b) {
    if (this.storage.get(a) === undefined) {
        this.addVertex(a);
    }
    if (this.storage.get(b) === undefined) {
        this.addVertex(b);
    }
    this.storage.get(a).add(b);
  }

  removeEdge(a, b) {
    if (this.storage.get(a) === undefined) {
       return;
    }
    this.storage.get(a).delete(b);
  }

  isVertex(vertex) {
      return this.storage.get(vertex) !== undefined;
  }

  neighbors(vertex) {
    if (this.storage.get(vertex) !== undefined) {
      return this.storage.get(vertex);
    }
  }

  vertices() {
    let keys = [];
    this.storage.forEach((value, key) => {
      keys.push(key);
    })
    return keys;
  }
}

// generate graph from list of edges
function generateAdjacencyList(edges) {
  let graph = new Graph();

  let u, v;
  edges.forEach(edge => {
    [u, v] = edge;
    graph.addEdge(u, v);
  });

  return graph;
}




/*
  *  Predict Order
  *
  *  Practice visualizing the order of traversal for each of the following
  *  graphs. Write a valid ordering if 1) BFS, 2) DFS (pre-order), and
  *  3) topological sort is performed. The starting vertex for BFS and DFS
  *  is vertex 0
  *
  *  There are no tests for this particular problem. Additionally, for some of
  *  these graphs, there are multiple possible solutions
  *
  *
  *
  *  Graph A: https://res.cloudinary.com/outco/image/upload/v1519855558/graph-traversal/Paper.Graph_Traversal.10.png
  *
  *  YOUR WORK HERE
  *  1) BFS:
  *  2) DFS:
  *  3) Topological sort:
  *
  *  Graph B: https://res.cloudinary.com/outco/image/upload/v1519855554/graph-traversal/Paper.Graph_Traversal.11.png
  *
  *  YOUR WORK HERE
  *  1) BFS:
  *  2) DFS:
  *  3) Topological sort:
  *
  *  Graph C: https://res.cloudinary.com/outco/image/upload/v1519855557/graph-traversal/Paper.Graph_Traversal.12.png
  *
  *  YOUR WORK HERE
  *  1) BFS:
  *  2) DFS:
  *  3) Topological sort:
  *
  */




 /*
  *  Redundant Connection
  *
  *  Given a directed graph (list of edges), where if one of the edges is
  *  removed, the graph will become a tree.  Return that edge.
  *
  *  Parameters:
  *
  *  Input: edges: [[Integer]]
  *  Output: [Integer]
  *
  *  Examples:
  *
  * `{{1, 2}, {1, 3}, {2, 3}} --> {2, 3}`
  * `{{1, 2}, {2, 3}, {2, 4}, {4, 5}, {5, 2}} --> {5, 2}`
  *
  *  Note:
  *  - For some inputs, there coule be multiple
  *    correct solutions
  *
  *  Resources:
  *  - https://leetcode.com/problems/redundant-connection-ii/description/
  *
  *
  */

function redundantConnection(edgeList) {
  // YOUR WORK HERE
  return -1;
}


/*
 *  Third Degree Neighbors
 *
 *  Given an undirected graph represented by a list of edges and a start
 *  vertex, return an array of the 3rd degree neighbors.
 *
 *  Parameters:
 *
 *  Input: edges: [[Integer]]
 *  Input: start: Integer
 *  Output: [Integer]
 *
 *  Example:
 *
 *  The following example with start vertex `1`:
 *  Input: `{{1,2},{2,1},{1,3},{3,1},{2,4},{4,2},{3,4},{4,3},
 *           {4,8},{8,4},{4,5},{5,4},{5,6},{6,5},{5,7},{7,5},
 *           {6,7},{7,6},{8,7},{7,8},{8,9},{9,8}}`
 *  Input: 1
 *  Output: `[5,8]` or `[8,5]`     (order does not matter)
 *  Picture here: https://res.cloudinary.com/outco/image/upload/v1519850256/graph-traversal/Paper.Graph_Traversal.2.png
 *
 *
 *
 */

function thirdDegreeNeighbors(edgeList, start) {
  // YOUR WORK HERE
  return -1;
}



/*
 *  Detect Cycle in Graph (Undirected)
 *
 *  Given edges that represent an undirected graph, determine if the graph
 *  has a cycle. A cycle has a minimum of 3 vertices.
 *
 *  Parameters:
 *
 *  Input: edges: [[Integer]]
 *  Output: Boolean
 *
 *  Example:
 *
 *  Input: `{{1,2},{2,1},{2,3},{3,2},{3,1},{1,3},
 *           {3,4},{4,3},{5,4},{4,5},{5,6},{6,5},
 *           {4,7},{7,4}}`
 *  Output: True
 *
 *  Resources:
 *  - https://www.geeksforgeeks.org/detect-cycle-undirected-graph/
 *
 */

function detectCycleInGraph(edgeList) {
  // YOUR WORK HERE
  return false;
}


/*
  *  Friend Circles
  *
  *  A friend circle is a group of people who are direct or indirect friends.
  *  Given a NxN bitset matrix, where a 1 in the i,j coordinate signifies a
  *  friendship between person i and person j, determine how many circles of
  *  friends there are.
  *
  *  Parameters:
  *
  *  Input: Graph: [[Integer]] (adjacency matrix)
  *  Output: Integer
  *
  *  Example:
  *
  *  Input: `{{1,1,0}, {1,1,0}, {0,0,1}}`
  *  Output: 2
  *
  *  Input: `{{1,1,0}, {1,1,1}, {0,1,1}}`
  *  Output: 1
  *
  *  Resources:
  *  - https://leetcode.com/problems/friend-circles/description/
  *
  */


function friendCircles(matrix) {
  // YOUR WORK HERE
  return -1;
}



/*
 *  Longest Path I
 *
 *  Given a DAG (directed acyclic graph), find the longest path in the graph.
 *
 *  Parameters:
 *
 *  Input: Graph: [[Integer]] (edge list)
 *  Output: Integer
 *
 *  Example:
 *
 *  Input: {{1,2},{2,3},{1,3}}
 *  Output: 3 --> {1,2,3}
 *
 *  Input: {{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}}
 *  Output: 6 --> {6,5,4,1,2,3}
 *
 *  Resources:
 *  - https://www.geeksforgeeks.org/find-longest-path-directed-acyclic-graph/
 *
 */

function longestPath(graph) {
  // YOUR WORK HERE
  return -1;
}


/*
 *  Course Schedule
 *
 *  A collection of courses at a University has prerequisite courses that must
 *  be taken first.  Given an array of course pairs [A, B] where A is the
 *  prerequisite of B, determine a valid sequence of courses a student can
 *  take to complete all the courses.
 *
 *  Parameters:
 *
 *  Input: courses: [[String]]
 *  Output: [String]
 *
 *  Example:
 *
 *  Input: {{"a","b"},{"a","c"},{"b","d"},{"c","d"}}
 *  Output: {"a","b","c","d"} or {"a","c","b","d"}
 *
 *  Input: {{"a","b"},{"b","c"},{"c","d"}}
 *  Output: {"a","b","c","d"}
 *
 *
 *
 */


function courseSchedule(courseList) {
  // YOUR WORK HERE
  return [];
}



 /*
  *  Cryptic Dictionary
  *
  *  An array of strings in lexicographical (alphabetical) order has been put
  *  through a [simple substitution cypher](https://en.wikipedia.org/wiki/Substitution_cipher)
  *  where each letter is now substituted for another letter. Determine a valid
  *  ordering of characters in the cypher.
  *
  *  Parameters:
  *
  *  Input: words: [String]
  *  Output: [String]
  *
  *  Example:
  *
  *  Input: {"baa", "abcd", "abca", "cab", "cad"}
  *  Output: {"b", "d", "a", "c"}
  *
  *  Input: {"caa", "aaa", "aab"}
  *  Output: {"c", "a", "b"}
  *
  *  Source: https://www.geeksforgeeks.org/given-sorted-dictionary-find-precedence-characters/
  */


function crypticDictionary(wordList) {
  // YOUR WORK HERE
  return [];
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////


let testCount = [0, 0];
console.log('Redundant Connection Tests');

assert(testCount, 'should work when one node has two parents, but there is no cycle', function(){
  let result = redundantConnection([[1, 2], [1, 3], [2, 3]]);
  return arraysEqual(result, [2, 3]) || arraysEqual(result, [1, 3]);
});

assert(testCount, 'should work when there is a cyle, but no node has two parents', function(){
  let result = redundantConnection([[1,2],[2,3],[3,1]]);
  return arraysEqual(result, [1, 2]) || (result, [2, 3]) || arraysEqual(result, [1, 3]);
});

assert(testCount, 'should work when one node has two parents, and there is a cycle', function(){
  let result = redundantConnection([[1, 2], [2, 3], [2, 4], [4, 5], [5, 2]]);
  return arraysEqual(result, [5, 2]);
});

assert(testCount, 'should work there is a cycle, and other nodes not in the cycle', function(){
  let result = redundantConnection([[1,2],[2,3],[3,1],[3,6],[2,5],[1,4]]);
  return arraysEqual(result, [1, 2]) || (result, [2, 3]) || arraysEqual(result, [1, 3]);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');




testCount = [0, 0];
console.log('Third Degree Neighbors Tests');

assert(testCount, 'should work on a linear example input', function(){
  let result = thirdDegreeNeighbors([[1,2],[2,1],[1,3],[3,1],[2,4],[4,2],[3,4],[4,3],
           [4,8],[8,4],[4,5],[5,4],[5,6],[6,5],[5,7],[7,5],
           [6,7],[7,6],[8,7],[7,8],[8,9],[9,8]], 1);
  return arraysMatching(result, [5, 8]);
});

assert(testCount, 'should work on a graph with one vertex', function(){
  let result = thirdDegreeNeighbors([[1, 1]], 1);
  return arraysMatching(result, []);
});

assert(testCount, 'should work with multiple third degree neighbors', function(){
  let result = thirdDegreeNeighbors([[1,2],[2,1],[2,3],[3,2],[3,4],[4,3],[3,5],[5,3],
           [3,6],[6,3],[1,7],[7,1],[7,8],[8,7],[8,9],[9,8],
           [8,10],[10,8],[8,11],[11,8]], 1);
  return arraysMatching(result, [4, 5, 6, 9, 10, 11]);
});

assert(testCount, 'should work on a small cycle', function(){
  let result = thirdDegreeNeighbors([[1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3],
          [4, 5], [5, 4], [5, 6], [6, 5], [6, 1], [1, 6]], 1);
  return arraysMatching(result, [4]);
});

assert(testCount, 'should work on a large cycle', function(){
  let result = thirdDegreeNeighbors([[1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3], [4, 5], [5, 4],
          [5, 6], [6, 5], [6, 7], [7, 6], [7, 8], [8, 7], [8, 1], [1, 8]], 1);
  return arraysMatching(result, [4, 6]);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');


testCount = [0, 0];
console.log('Detect Cycle Tests');

assert(testCount, 'should work on first example input', function(){
  let result = detectCycleInGraph([[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3]]);
  return result === true;
});

assert(testCount, 'should work on second example input', function(){
  let result = detectCycleInGraph([[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3],[3, 4], [4, 3], [5, 4], [4, 5], [5, 6], [6, 5],[4, 7], [7, 4]]);
  return result === true;
});

assert(testCount, 'should work on third example input', function(){
  let result = detectCycleInGraph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 4], [4, 3],
           [4, 5], [5, 4], [5, 6], [6, 5], [4, 7], [7, 4]]);
  return result === false;
});

assert(testCount, 'should work on empty input', function(){
  let result = detectCycleInGraph([]);
  return result === false;
});

assert(testCount, 'should work on fourth example input', function(){
  let result = detectCycleInGraph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 5], [5, 3],
          [5, 6], [6, 5], [6, 4], [4, 6], [4, 2], [2, 4]]);
  return result === true;
});

assert(testCount, 'should work on a single vertex', function(){
  let result = detectCycleInGraph([[1, 1]]);
  return result === false;
});

assert(testCount, 'should work on two vertices', function(){
  let result = detectCycleInGraph([[1, 2], [2, 1]]);
  return result === false;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');



testCount = [0, 0];
console.log('Friend Circles Tests');


assert(testCount, 'should work on first example case', function(){
  let result = friendCircles([[1, 1, 0], [1, 1, 0], [0, 0, 1]]);
  return result === 2;
});

assert(testCount, 'should work on second example case', function(){
  let result = friendCircles([[1, 1, 0], [1, 1, 1], [0, 1, 1]]);
  return result === 1;
});

assert(testCount, 'should work on empty matrix', function(){
  let result = friendCircles([]);
  return result === 0;
});

assert(testCount, 'should work on a single person', function(){
  let result = friendCircles([[1]]);
  return result === 1;
});

assert(testCount, 'should work when no one is friends with anyone else', function(){
  let result = friendCircles([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]] );
  return result === 4;
});

assert(testCount, 'should work when everyone is friends with everyone else', function(){
  let result = friendCircles([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]);
  return result === 1;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');



testCount = [0, 0];
console.log('Longest Path Tests');


assert(testCount, 'should work for first example case', function(){
  let graph = generateAdjacencyList([[1,2],[2,3],[1,3]]);
  return longestPath(graph) == 3;
});

assert(testCount, 'should work for second example case', function(){
  let graph = generateAdjacencyList([[6,5],[6,4],[5,4],[4,3],[2,3],[1,2],[4,1]]);
  return longestPath(graph) == 6;
});

assert(testCount, 'should work for three-element linear graph', function(){
  let graph = generateAdjacencyList([[2,3],[3,1]]);
  return longestPath(graph) == 3;
});

assert(testCount, 'should work for graph with two equivalent paths', function(){
  let graph = generateAdjacencyList([[1,2],[2,4],[4,6],[1,3],[3,5],[5,7]]);
  return longestPath(graph) == 4;
});

assert(testCount, 'should work for single-element graph', function(){
  let graph = generateAdjacencyList([[1,1]]);
  return longestPath(graph) == 1;
});

assert(testCount, 'should handle graph with multiple paths equivalent in length', function(){
  let graph = generateAdjacencyList([[1,2],[1,3],[1,4],[1,5]]);
  return longestPath(graph) == 2;
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');




testCount = [0, 0];
console.log('Course Schedule Tests');

assert(testCount, 'should work on first example', function(){
  let result = courseSchedule([['a','b'],['a','c'],['b','d'],['c','d']]);
  return arraysEqual(result, ['a', 'b', 'c', 'd']) || arraysEqual(result, ['a', 'c', 'b', 'd']);
});

assert(testCount, 'should work on second example', function(){
  let result = courseSchedule([['a','b'],['b','c'],['c','d']]);
  return arraysEqual(result, ['a','b','c','d']);
});

assert(testCount, 'should work on third example', function(){
  let result = courseSchedule([['a','c'],['a','b']]);
  return arraysEqual(result, ['a', 'b', 'c']) || arraysEqual(result, ['a', 'c', 'b']);
});

assert(testCount, 'should work on fourth example', function(){
  let result = courseSchedule([["a","b"],["a","c"],["b","d"],["d","e"],
          ["d","c"],["c","e"],["e","f"],["f","h"],
          ["e","h"],["e","g"],["h","g"]]);
  return arraysEqual(result, ["a","b","d","c","e","f","h","g"]);
});

assert(testCount, 'should work on empty input', function(){
  let result = courseSchedule([]);
  return arraysEqual(result, []);
});

console.log('PASSED: ' + testCount[0] + ' / ' + testCount[1], '\n\n');



testCount = [0, 0];
console.log('Cryptic Dictionary Tests');

assert(testCount, 'should work on first example', function(){
  let result = crypticDictionary(['baa', 'abcd', 'abca', 'cab', 'cad']);
  return arraysEqual(result, ['b', 'd', 'a', 'c']);
});

assert(testCount, 'should work on second example', function(){
  let result = crypticDictionary(['caa', 'aaa', 'aab']);
  return arraysEqual(result, ['c', 'a', 'b']);
});

assert(testCount, 'should work on third example', function(){
  let result = crypticDictionary(['bbb', 'bab']);
  return arraysEqual(result, ['b', 'a']);
});

assert(testCount, 'should work on fourth example', function(){
  let result = crypticDictionary(['bm','bn','bo','mo']);
  return arraysEqual(result, ['b','m','n','o']);
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
  for(var i = arr1.length; i--;) {
    if(arr1[i] !== arr2[i])
      return false;
  }
  return true;
}

// custom assert function to handle tests
// Array count : keeps track out how many tests pass and how many total
//   in the form of a two item array i.e., [0, 0]
// String name : describes the test
// Function test : performs a set of operations and returns a boolean
//   indicating if test passed
function assert(count, name, test){
  if(!count || !Array.isArray(count) || count.length !== 2) {
    count = [0, '*'];
  } else {
    count[1]++;
  }

  var pass = 'false';
  var errMsg = null;
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
