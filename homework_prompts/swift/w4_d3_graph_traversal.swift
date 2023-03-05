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

// Classes that we'll use in solution:
// - Graph class - use a map for storage
//
// Functions that we'll use in solution:
// - generateAdjacencyList
// - topologicalSort


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

func redundantConnection(_ edges: [[Int]]) -> [Int] {
  // YOUR WORK HERE 
   return [0]

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

func thirdDegreeNeighbors(_ edges: [[Int]], _ start: Int) -> [Int] {
  // YOUR WORK HERE 
   return [0]
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

 func detectCycleInGraph(_ edges: [[Int]]) -> Bool {
   // YOUR WORK HERE 
    return false
 }

/*
 * Longest Path I
 * Given a DAG (directed acyclic graph), find the longest path in the graph
 *
 * Parameters:
 *
 * Input: Graph: [[Integer]] (edge list)
 * Output: Integer
 *
 * Example:
 *
 * Input: [[1, 2], [2, 3], [1, 3]]
 * Output: [1, 2, 3]
 *
 * Input: [[6, 5], [6, 4], [5, 4], [4, 3], [2, 3], [1, 2], [4, 1]]
 * Output: [6, 5, 4, 1, 2, 3]
 */

 func longestPath1(_ edges: [[Int]]) -> [Int] {
   // YOUR WORK HERE 
    return [0]
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

func friendCircles(_ matrix: [[Int]]) -> Int {
 // YOUR WORK HERE 
  return -1
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

func courseSchedule(_ arr: [[String]]) -> [String] {
   // YOUR WORK HERE 
    return [""]
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


func crypticDictionary(_ wordList: [String]) -> [String] {
  // YOUR WORK HERE 
   return [""]
}

////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func assert(_ count: inout [Int], _ name: String, _ test: () -> Bool) {
  if count.count != 2 {
    count = [0, 0]
  } else {
    count[1] = count[1] + 1
  }

  var pass: String = "false"

  if test() {
    pass = " true"
    count[0] = count[0] + 1
  }
  print(count[1], ")   ", pass, ":", name)
}

func arraysEqual(_ arr1: [Int], _ arr2: [Int]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}

func arraysEqual(_ arr1: [String], _ arr2: [String]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }
  for i in 0..<arr1.count {
    if arr1[i] != arr2[i] {
      return false
    }
  }
  return true
}

var testCount: [Int] = [0, 0]
print("Redundant Connection")

assert(&testCount, "should work for first example case",  {
  let solution = redundantConnection([[1, 2], [1, 3], [2, 3]])
  return arraysEqual(solution, [2, 3]) || arraysEqual(solution, [2, 3])
})

assert(&testCount, "should work for second example case",  {
  let solution = redundantConnection([[1, 2], [2, 3], [2, 4], [4, 5], [5, 2]])
  return arraysEqual(solution, [5, 2]);
})

assert(&testCount, "should work for cyclic graph",  {
  let solution = redundantConnection([[1, 2], [2, 3], [3, 1]])
return arraysEqual(solution, [1, 2]) || arraysEqual(solution, [2, 3]) || arraysEqual(solution, [3, 1])
})

assert(&testCount, "should work for cyclic graph with branches coming off cyclic portion",  {
  let solution = redundantConnection([[1, 2], [2, 3], [3, 1], [3, 6], [2, 5], [1, 4]])
return arraysEqual(solution, [1, 2]) || arraysEqual(solution, [2, 3]) || arraysEqual(solution, [3, 1])
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


testCount = [0, 0]
print("Third Degree Neighbors")

assert(&testCount, "should work for example case",  {
  let solution = thirdDegreeNeighbors([[1, 2], [2, 1], [1, 3], [3, 1], [2, 4], [4, 2], [3, 4], [4, 3], [4, 8], [8, 4], [4, 5], [5, 4],
  [5, 6], [6, 5], [5, 7], [7, 5], [6, 7], [7, 6], [8, 7], [7, 8], [8, 9], [9, 8]], 1)
  return arraysEqual(solution, [5, 8]) || arraysEqual(solution, [8, 5])
})

assert(&testCount, "should work for graph with no third degree neighbors",  {
  let solution = thirdDegreeNeighbors([[1, 2], [2, 1], [1, 3], [3, 1], [2, 4], [4, 2], [3, 4], [4, 3]], 1)
  return arraysEqual(solution, [])
})

assert(&testCount, "should work for branching graph",  {
  let solution = thirdDegreeNeighbors([[1,2],[2,1],[2,3],[3,2],[3,4],[4,3],[3,5],[5,3],[3,6],[6,3],[1,7],[7,1],[7,8],[8,7],[8,9],
    [9,8], [8,10],[10,8],[8,11],[11,8]], 1)
  return arraysEqual(solution, [4, 5, 6, 9, 10, 11])
})

assert(&testCount, "should work for linear graph",  {
  let solution = thirdDegreeNeighbors([[1,2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3], [4, 5], [5, 4], [5, 6], [6, 5], [6, 1], [6, 1]], 1)
  return arraysEqual(solution, [4])
})

assert(&testCount, "should work for cyclic graph",  {
  let solution = thirdDegreeNeighbors([[1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3], [4, 5], [5, 4], [5, 6], [6, 5], [6, 7], [7, 6],
  [7, 8], [8, 7], [8, 1], [1, 8]], 1)
  return arraysEqual(solution, [4, 6])
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Detect Cycle In Graphs")

assert(&testCount, "should work for example case",  {
  let solution = detectCycleInGraph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 4], [4, 3], [4, 5], [5, 4], [5, 6], [6, 5], [4, 7], [7, 4]])
  return solution == true
})

assert(&testCount, "should return false when cycle does not exist",  {
  let solution = detectCycleInGraph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 4], [4, 3], [4, 5], [5, 4], [5, 6], [6, 5], [4, 7], [7, 4]])
  return solution == true
})

assert(&testCount, "should return false when no edges exist in graph",  {
  let solution = detectCycleInGraph([])
  return solution == false
})

assert(&testCount, "should return true for one large loop",  {
  let solution = detectCycleInGraph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 5], [5, 3], [5, 6], [6, 5], [6, 4], [4, 6], [4, 2], [2, 4]])
  return solution == true
})

assert(&testCount, "should return false for single element graph",  {
  let solution = detectCycleInGraph([[1, 1]])
  return solution == false
})

assert(&testCount, "should return false for two element graph connected by edge",  {
  let solution = detectCycleInGraph([[1, 2], [2, 1]])
  return solution == false
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Friend Circles")

assert(&testCount, "should work on first example case",  {
  let solution = friendCircles([[1, 1, 0], [1, 1, 0], [0, 0, 1]])
  return solution == 2
})

assert(&testCount, "should work on second example case",  {
  let solution = friendCircles([[1, 1, 0], [1, 1, 1], [0, 1, 1]])
  return solution == 1
})

assert(&testCount, "should work on empty matrix",  {
  let solution = friendCircles([])
  return solution == 0
})

assert(&testCount, "should work on one person",  {
  let solution = friendCircles([[1]])
  return solution == 1
})

assert(&testCount, "should work when no one is friends with anyone else",  {
  let solution = friendCircles([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
  return solution == 4
})

assert(&testCount, "should work when everyone is friends with everyone else",  {
  let solution = friendCircles([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]])
  return solution == 1
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Friend Circles")

assert(&testCount, "should work on first example case",  {
  let solution = friendCircles([[1, 1, 0], [1, 1, 0], [0, 0, 1]])
  return solution == 2
})

assert(&testCount, "should work on second example case",  {
  let solution = friendCircles([[1, 1, 0], [1, 1, 1], [0, 1, 1]])
  return solution == 1
})

assert(&testCount, "should work on empty matrix",  {
  let solution = friendCircles([])
  return solution == 0
})

assert(&testCount, "should work on one person",  {
  let solution = friendCircles([[1]])
  return solution == 1
})

assert(&testCount, "should work when no one is friends with anyone else",  {
  let solution = friendCircles([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
  return solution == 4
})

assert(&testCount, "should work when everyone is friends with everyone else",  {
  let solution = friendCircles([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]])
  return solution == 1
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Longest Path 1")

assert(&testCount, "should work for first example case",  {
  let solution = longestPath1([[1, 2], [2, 3], [1, 3]])
  return arraysEqual(solution, [1, 2, 3])
})

assert(&testCount, "should work for second example case",  {
  let solution = longestPath1([[6, 5], [6, 4], [5, 4], [4, 3], [2, 3], [1, 2], [4, 1]])
  return arraysEqual(solution, [6, 5, 4, 1, 2, 3])
})

assert(&testCount, "should work for three element linear graph",  {
  let solution = longestPath1([[2, 3], [3, 1]])
  return arraysEqual(solution, [2, 3, 1])
})

assert(&testCount, "should work for graph with two equivalent paths",  {
  let solution = longestPath1([[1, 2], [2, 4], [4, 6], [1, 3], [3, 5], [5, 7]])
  return arraysEqual(solution, [1, 2, 4, 6]) || arraysEqual(solution, [1, 3, 5, 7])
})

assert(&testCount, "should work for single element graph",  {
  let solution = longestPath1([[1, 1]])
  return arraysEqual(solution, [1])
})

assert(&testCount, "should handle graph with multiple paths equivalent in length",  {
  let solution = longestPath1([[1, 2], [1, 3], [1, 4], [1, 5]])
  return arraysEqual(solution, [1, 2]) || arraysEqual(solution, [1, 3]) || arraysEqual(solution, [1, 4]) || arraysEqual(solution, [1, 5])
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Course Schedule")

assert(&testCount, "should work for first example case",  {
  let solution = courseSchedule([["a", "b"], ["a", "c"], ["b", "d"], ["c", "d"]])
  return arraysEqual(solution, ["a", "b", "c", "d"]) || arraysEqual(solution, ["a", "c", "b", "d"])
})

assert(&testCount, "should work for second example case",  {
  let solution = courseSchedule([["a", "b"], ["b", "c"], ["c", "d"]])
  return arraysEqual(solution, ["a", "b", "c", "d"])
})

assert(&testCount, "should work for third example case",  {
  let solution = courseSchedule([["a", "c"], ["a", "b"]])
  return arraysEqual(solution, ["a", "c", "b"]) || arraysEqual(solution, ["a", "b", "c"])
})

assert(&testCount, "should work for fourth example case",  {
  let solution = courseSchedule([["a","b"],["a","c"],["b","d"],["d","e"],["d","c"],["c","e"],["e","f"],["f","h"],["e","h"],["e","g"],["h","g"]])
  return arraysEqual(solution, ["a", "b", "d", "c", "e", "f", "h", "g"])
})

assert(&testCount, "should work for single element graph",  {
  let solution = longestPath1([[1, 1]])
  return arraysEqual(solution, [1])
})

assert(&testCount, "should handle graph with multiple paths equivalent in length",  {
  let solution = longestPath1([[1, 2], [1, 3], [1, 4], [1, 5]])
  return arraysEqual(solution, [1, 2]) || arraysEqual(solution, [1, 3]) || arraysEqual(solution, [1, 4]) || arraysEqual(solution, [1, 5])
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

testCount = [0, 0]
print("Cryptic Dictionary")

assert(&testCount, "should work for first example case",  {
  let solution = crypticDictionary(["baa", "abcd", "abca", "cab", "cad"])
  return arraysEqual(solution, ["b", "d", "a", "c"])
})

assert(&testCount, "should work for second example case",  {
  let solution = crypticDictionary(["caa", "aaa", "aab"])
  return arraysEqual(solution, ["c", "a", "b"])
})

assert(&testCount, "should work for third example case",  {
  let solution = crypticDictionary(["bbb", "bab"])
  return arraysEqual(solution, ["b", "a"])
})

assert(&testCount, "should work for single element graph",  {
  let solution = crypticDictionary(["bm", "bn", "bo", "mo"])
  return arraysEqual(solution, ["b", "m", "n", "o"])
})


print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")


// print("Graph addVertex method")
//
//
// assert(&testCount, "is able to add a single vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   return g.storage.count == 1 && g.storage[1] != nil
// })
//
//
// assert(&testCount, "is able to add multiple vertices",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addVertex(3)
//   return g.storage.count == 3 &&
//          g.storage[1] != nil &&
//          g.storage[2] != nil &&
//          g.storage[3] != nil
// })
//
// assert(&testCount, "does not add repeat vertices",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(1)
//   return g.storage.count == 1
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]
//
//
//
//
// print("Graph addEdge method")
//
// assert(&testCount, "adds a single edge properly",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.storage.count == 2 && (g.storage[1]?.contains(2))!
// })
//
// assert(&testCount, "adds multiple edges properly",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addVertex(3)
//   let _ = g.addEdge(1, 2)
//   let _ = g.addEdge(1, 3)
//
//   return g.storage.count == 3 && (g.storage[1]?.contains(2))! && (g.storage[1]?.contains(3))!
// })
//
// assert(&testCount, "does not repeat edges",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   let _ = g.addEdge(1, 2)
//
//   return g.storage.count == 2 && (g.storage[1]?.contains(2))! && g.storage[1]?.count == 1
// })
//
// assert(&testCount, "does not add edges between 1 invalid vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 3)
//
//   return g.storage.count == 2 && g.storage[1]?.count == 0
// })
//
// assert(&testCount, "does not add edges between 2 invalid vertices",  {
//   let g = Graph()
//   return g.addEdge(1, 2) == false && g.storage.count == 0
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]
//
//
//
// print("Graph removeEdge method")
//
//
// assert(&testCount, "removes a single edge properly",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.removeEdge(1, 2) == true
// })
//
// assert(&testCount, "does not remove nonexsitent edge",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   return g.removeEdge(1, 2) == false
// })
//
// assert(&testCount, "removes multiple edges",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addVertex(3)
//   let _ = g.addEdge(1, 2)
//   let _ = g.addEdge(1, 3)
//   return g.removeEdge(1, 2) == true && g.removeEdge(1, 3) == true && g.storage[1]?.count == 0
// })
//
// assert(&testCount, "does not remove edge from 1 invalid vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.removeEdge(1, 3) == false && g.storage[1]?.count == 1
// })
//
// assert(&testCount, "does not remove edge from 2 invalid vertices",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.removeEdge(3, 4) == false && g.storage[1]?.count == 1
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]



// print("Graph removeVertex method")
//
//
// assert(&testCount, "removes single unconnected vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   return g.removeVertex(1) == true && g.storage.count == 0
// })
//
//
// assert(&testCount, "removes multiple unconnected vertices",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   return g.removeVertex(1) == true && g.removeVertex(2) == true && g.storage.count == 0
// })
//
// assert(&testCount, "removes vertex with one connection from it",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.removeVertex(1) == true && g.storage.count == 1
//   // && g.neighbors(2)!.count == 0
// })
//
// assert(&testCount, "removes vertex with one connection to it",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.removeVertex(2) == true && g.storage.count == 1
//   // && g.neighbors(1).count == 0
// })
//
//
// assert(&testCount, "removes vertex with multiple connections to it",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addVertex(3)
//   let _ = g.addVertex(4)
//   let _ = g.addEdge(2, 1)
//   let _ = g.addEdge(3, 1)
//   let _ = g.addEdge(4, 1)
//
//   return g.removeVertex(1) == true &&
//          g.storage.count == 3 &&
//          g.storage[2]?.count == 0 &&
//          g.storage[3]?.count == 0 &&
//          g.storage[4]?.count == 0
// })
//
// assert(&testCount, "does not remove nonexsitent vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   return g.removeVertex(2) == false && g.storage.count == 1
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]
//
//
//
// print("Graph isVertex method")
//
// assert(&testCount, "returns true when a vertex exists",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   return g.isVertex(1) == true
// })
//
// assert(&testCount, "returns false when a vertex doesn't exist",  {
//   let g = Graph()
// return g.isVertex(1) == false
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]
//
//
//
//
// print("Graph neighbors method")
//
// assert(&testCount, "returns empty array for unconnected vertex",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   return g.neighbors(1)?.count == 0
// })
//
// assert(&testCount, "returns nil for nonexsitent vertex",  {
//   let g = Graph()
//   return g.neighbors(1) == nil
// })
//
//
// assert(&testCount, "works for a vertex with one edge",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addEdge(1, 2)
//   return g.neighbors(1)?.count == 1 && (g.neighbors(1)?.contains(2))!
// })
//
// assert(&testCount, "works for a vertex with multiple edges",  {
//   let g = Graph()
//   let _ = g.addVertex(1)
//   let _ = g.addVertex(2)
//   let _ = g.addVertex(3)
//   let _ = g.addVertex(4)
//   let _ = g.addEdge(1, 2)
//   let _ = g.addEdge(1, 3)
//   let _ = g.addEdge(1, 4)
//   return g.neighbors(1)?.count == 3
// })
//
// print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
// testCount = [0, 0]
