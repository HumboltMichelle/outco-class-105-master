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

package main
import (
  "fmt"
  "strconv"
  "sort"
)

/////////////////////////////////////////////
/////////~~HELPER FUNCTIONS START~~//////////
/////////////////////////////////////////////

/*~~ADJACENCY LIST GENERATION FUNCTIONS~~*/
// Create adjacency list graph from int edges
func generateIntAdjacencyList(edges *[][]int) map[int]*[]int{
  graph := make(map[int]*[]int)
  for _,edge := range *edges {
    var u int = edge[0]
    var v int = edge[1]
    if uList, ok := graph[u]; ok {
      *uList = append(*uList, v)
    } else {
      graph[u] = &[]int{v}
    }
  }
  return graph
}

// Create adjacency list graph from str edges
func generateStrAdjacencyList(edges *[][]string) map[string]*[]string{
  graph := make(map[string]*[]string)
  for _,edge := range *edges {
    var u string = edge[0]
    var v string = edge[1]
    if uList, ok := graph[u]; ok {
      *uList = append(*uList, v)
    } else {
      graph[u] = &[]string{v}
    }
  }
  return graph
}


/*~~TOPOLOGICAL SORT FUNCTIONS~~*/
var ts_visited map[string]bool
var ts_result *[]string
var ts_graph *map[string]*[]string

func dfs_ts(current string) {
   if ts_visited[current] { return }

   ts_visited[current] = true
   if (*ts_graph)[current] != nil {
     for _,neighbor := range *(*ts_graph)[current] {
       dfs_ts(neighbor)
     }
   }
   *ts_result = append(*ts_result, current)
}

func topologicalSort(inputGraph *map[string]*[]string) []string {
   ts_visited = make(map[string]bool)
   ts_result = &[]string{}
   ts_graph = inputGraph
   for vertex := range *ts_graph {
     dfs_ts(vertex)
   }
   resultFormat := make([]string, len(*ts_result))
   for i := len(resultFormat) - 1; i >= 0; i-- {
     resultFormat[len(resultFormat) - 1 - i] = (*ts_result)[i]
   }
   return resultFormat
}
/////////////////////////////////////////////
//////////~~HELPER FUNCTIONS END~~///////////
/////////////////////////////////////////////

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
 *  1) BFS: {0,1,2,3,4,5}
 *  2) DFS: {0,1,3,4,5,2}
 *  3) Topological sort: {0,2,1,3,4,5}
 *
 *  Graph B: https://res.cloudinary.com/outco/image/upload/v1519855554/graph-traversal/Paper.Graph_Traversal.11.png
 *
 *  1) BFS: {0,1,2,4,3}
 *  2) DFS: {0,1,3,4,2}
 *  3) Topological sort: {0,2,1,3,5,4}
 *
 *  Graph C: https://res.cloudinary.com/outco/image/upload/v1519855557/graph-traversal/Paper.Graph_Traversal.12.png
 *
 *  1) BFS: {0,1,2,3,4,5,6,7}
 *  2) DFS: {0,2,4,5,7,6,1,3}
 *  3) Topological sort: {0,1,3,2,4,6,5,7}
 *
 */



 /*
  *  Redundant Connection
  *
  *  Given a directed graph (list of edges), where if one of the edges is
  *  removed, the graph will become a tree with one root.  Return that edge.
  *
  *  Parameters:
  *
  *  Input: edges: [[int]]
  *  Output: [int]
  *
  *  Examples:
  *
  * `{{1, 2}, {1, 3}, {2, 3}} --> {2, 3}`
  * `{{1, 2}, {2, 3}, {2, 4}, {4, 5}, {5, 2}} --> {5, 2}`
  *
  *  Note:
  *  - For some inputs, there could be multiple
  *    correct solutions
  *
  *  Resources:
  *  - https://leetcode.com/problems/redundant-connection-ii/description/
  *
  *
  */

// Use DSU Union+Find to find redundant connection(s)
var dsuParent []int

func find(x int) int {
  // Recurse from x to root, set root as parent of every node on the way back up call stack
  if x != dsuParent[x] {
    dsuParent[x] = find(dsuParent[x])
  }
  return dsuParent[x]
}

func redundantConnection(edges [][]int) []int {
  var n int = len(edges)

  // Find the node with 2 parents if it exists; store associated edges in A & B
  var A []int
  var B []int
  var parent []int = make([]int, n+1)

  for _, edge := range edges {

    if parent[edge[1]] != 0 {
      // Two possibilities A & B
      //  A = edge already found for node in graph
      A = []int{parent[edge[1]],edge[1]}
      //  B = current edge being observed
      B = edge
      break
    }
    // Map parent of edge in graph
    parent[edge[1]] = edge[0]
  }

  // Use the disjoint union set data structure w/ union+find to identify edge to delete
  dsuParent = make([]int, n+1)
  for i := 0; i <= n; i++ { dsuParent[i] = i}

  for _, edge := range edges {
      var a int = edge[0]
      var b int = edge[1]
      // We will skip adding the last redundant edge to the DSU
      //  if B is not part of a cycle, DSU may detect a cycle with A and may return it
      //  else if B IS part of a cycle, DSU will not detect a cycle, and we will return B later
      if areEqual(edge, B) {
        continue
      }

      var pa int = find(a)
      var pb int = find(b)

      if pa == pb {  // Cycle found with edges considered
        //If no node with two parents, the whole graph is a cycle, so return any node
        if len(A) == 0 && len(B) == 0 {
          return edge
        }
        // else A from earlier must be a part of the cycle, so we return it
        return A
      } else {
        // Union: set parent of representative parent of b to representative parent of a
        dsuParent[pb] = pa
      }
  }
  //No cycle found in DSU, return B
  return B

}


/*
 *  Third Degree Neighbors
 *
 *  Given an undirected graph represented by a list of edges and a start
 *  vertex, return an array of the 3rd degree neighbors.
 *
 *  Parameters:
 *
 *  Input: edges: [[int]]
 *  Input: start: int
 *  Output: [int]
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



func thirdDegreeNeighbors(edges [][]int, start int) []int {
  graph := generateIntAdjacencyList(&edges)
  // Create a queue perform a BFS, counting levels along the way
  queue := []int{}
  seenSet := make(map[int]bool)
  if graph[start] != nil {
    queue = append(queue, start)
    seenSet[start] = true
  }
  var curr int

  var level int = 0
  var count int = 1
  level3s := []int{}
  for len(queue) > 0 {
    // Grab count nodes in from last level processed
    localCount := count
    // Reset count var for processing next level
    count = 0
    // Process children of all elements in a level
    for localCount > 0 {
      curr, queue = queue[0], queue[1:len(queue)]
      // If at level 3, append all nodes in level to result array
      if level == 3 {
        level3s = append(level3s, curr)
      }
      localCount--
      for _,elem := range *graph[curr] {
        if seenSet[elem] == false {
          queue = append(queue, elem)
          seenSet[elem] = true
          count++
        }
      }
    }
    level++
  }
  return level3s

}


/*
 *  Detect Cycle in Graph (Undirected)
 *
 *  Given edges that represent an undirected graph, determine if the graph
 *  has a cycle. A cycle has a minimum of 3 vertices.
 *
 *  Parameters:
 *
 *  Input: edges: [[int]]
 *  Output: bool
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



func detectCycleInGraph(edges [][]int) bool {
  graph := generateIntAdjacencyList(&edges)
  queue := []int{}
  seen := make(map[int]bool)
  var current int

  for vertex := range graph {
    if !seen[vertex] {
      seen[vertex] = true
      queue = append(queue,vertex)
    }

    for len(queue) > 0 {
      current, queue = queue[0], queue[1:len(queue)]
      neighborsVisited := 0
      for _,neighbor := range *graph[current] {
        if !seen[neighbor] {
          queue = append(queue,neighbor)
          seen[neighbor] = true
        } else {
          neighborsVisited++
        }

        if neighborsVisited > 1 {
          return true
        }

      }
    }
  }
  return false
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
 *  Input: Graph: [[int]] (adjacency matrix)
 *  Output: int
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

func friendCircles(matrix [][]int) int {
  seen := make(map[int]bool)
  var circles int = 0
  queue := []int{}
  var current int

  for personInd := range matrix {
    if !seen[personInd] {
      queue = append(queue, personInd)
      seen[personInd] = true
      circles ++
    }

    for len(queue) > 0 {
      current, queue = queue[0], queue[1:len(queue)]
      for friendInd,friendVal := range matrix[current] {
        if friendVal == 1 && !seen[friendInd] {
          queue = append(queue, friendInd)
          seen[friendInd] = true
        }
      }
    }
  }
  return circles;
}


/*
 *  Longest Path I
 *
 *  Given a DAG (directed acyclic graph), find the longest path in the graph.
 *
 *  Parameters:
 *
 *  Input: Graph: [[int]] (edge list)
 *  Output: int
 *
 *  Example:
 *
 *  Input: {{1,2},{2,3},{1,3}}
 *  Output: {1,2,3}
 *
 *  Input: {{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}}
 *  Output: {6,5,4,1,2,3}
 *
 *  Resources:
 *  - https://www.geeksforgeeks.org/find-longest-path-directed-acyclic-graph/
 *
 */


var lpi_graph map[int]*[]int
var lpi_result *[]int
var lpi_visited map[int]bool

func dfs_lpi(current int, path *[]int) {
  if lpi_visited[current] { return }
  *path = append(*path, current)
  lpi_visited[current] = true
  if len(*path) > len(*lpi_result) {
    lpi_result = copyPointerSlice(path)
  }

  if lpi_graph[current] != nil {
    for _,neighbor := range *lpi_graph[current] {
      dfs_lpi(neighbor, path);
    }
  }

  *path = (*path)[:len(*path)-1]
  delete(lpi_visited, current)
}

func longestPathI(edges [][]int) []int {
  lpi_graph = generateIntAdjacencyList(&edges)
  lpi_result = &[]int{}
  lpi_visited = make(map[int]bool)

  for vertex := range lpi_graph {
    dfs_lpi(vertex, &[]int{})
  }

  return *lpi_result
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
 */




func courseSchedule(edges [][]string) []string{
  graph := generateStrAdjacencyList(&edges)
  result := topologicalSort(&graph)
  return result
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

func firstLetterDifference(word1 string, word2 string) []string {
  var minWordLen int = len(word2)
  if len(word1) < len(word2) { minWordLen = len(word1) }
  for letter := 0; letter < minWordLen; letter++ {
    if word1[letter] != word2[letter] {
      return []string{string(word1[letter]), string(word2[letter])}
    }
  }
  return []string{}
}

func crypticDictionary(words []string) []string {
  edges := [][]string{}
  var word string
  var nextWord string
  for i := 0; i < len(words) - 1; i++ {
    word = words[i]
    nextWord = words[i + 1]
    edges = append(edges, firstLetterDifference(word, nextWord))
  }

  graph := generateStrAdjacencyList(&edges)
  return topologicalSort(&graph)
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  redundantConnectionTests()
  thirdDegreeNeighborsTests()
  detectCycleInGraphTests()
  friendCirclesTests()
  longestPathITests()
  courseScheduleTests()
  crypticDictionaryTests()
}

func redundantConnectionTests() {
  testCount := []int{0,0}
  fmt.Println("Redundant Connection Tests")
  runTest(redundantConnectionTest1, "should work for first example case", testCount)
  runTest(redundantConnectionTest2, "should work for second example case", testCount)
  runTest(redundantConnectionTest3, "should work for cyclic graph", testCount)
  runTest(redundantConnectionTest4, "should work for cyclic graph with branches coming off cyclical portion", testCount)
  printTestsPassed(testCount)
}

func thirdDegreeNeighborsTests() {
  testCount := []int{0,0}
  fmt.Println("Third Degree Neighbors Tests")
  runTest(thirdDegreeNeighborsTest1, "should work for example case", testCount)
  runTest(thirdDegreeNeighborsTest2, "should work for graph with no third degree neighbors", testCount)
  runTest(thirdDegreeNeighborsTest3, "should work for graph with no edges", testCount)
  runTest(thirdDegreeNeighborsTest4, "should work for branching graph", testCount)
  runTest(thirdDegreeNeighborsTest5, "should work for linear graph", testCount)
  runTest(thirdDegreeNeighborsTest6, "should work for cyclic graph", testCount)
  printTestsPassed(testCount)
}

func detectCycleInGraphTests() {
  testCount := []int{0,0}
  fmt.Println("Detect Cycle In Graph Tests")
  runTest(detectCycleInGraphTest1, "should work for example case", testCount)
  runTest(detectCycleInGraphTest2, "should return false when cycle does not exist", testCount)
  runTest(detectCycleInGraphTest3, "should return false when no edges exist in graph", testCount)
  runTest(detectCycleInGraphTest4, "should return true for one large loop", testCount)
  runTest(detectCycleInGraphTest5, "should return false for single element graph", testCount)
  runTest(detectCycleInGraphTest6, "should return false for two element graph connected by edge", testCount)
  printTestsPassed(testCount)
}

func friendCirclesTests() {
  testCount := []int{0,0}
  fmt.Println("Friend Circles Tests")
  runTest(friendCirclesTest1, "should work for first example case", testCount)
  runTest(friendCirclesTest2, "should work for second example case", testCount)
  runTest(friendCirclesTest3, "should work for an empty matrix", testCount)
  runTest(friendCirclesTest4, "should work when no one is friends with anyone else", testCount)
  runTest(friendCirclesTest5, "should work when everyone is friends with everyone else", testCount)
  printTestsPassed(testCount)
}

func longestPathITests() {
  testCount := []int{0,0}
  fmt.Println("Longest Path I Tests")
  runTest(longestPathITest1, "should work for first example case", testCount)
  runTest(longestPathITest2, "should work for second example case", testCount)
  runTest(longestPathITest3, "should work for three-element linear graph", testCount)
  runTest(longestPathITest4, "should work for graph with two equivalent paths", testCount)
  runTest(longestPathITest5, "should work for single-element graph", testCount)
  runTest(longestPathITest6, "should handle graph with multiple paths equivalent in length", testCount)
  printTestsPassed(testCount)
}

func courseScheduleTests() {
  testCount := []int{0,0}
  fmt.Println("Course Schedule Tests")
  runTest(courseScheduleTest1, "should work for first example case", testCount)
  runTest(courseScheduleTest2, "should work for second example case", testCount)
  runTest(courseScheduleTest3, "should work for courseload with small number of courses", testCount)
  runTest(courseScheduleTest4, "should work for large courseload", testCount)
  runTest(courseScheduleTest5, "should work for empty input array", testCount)
  printTestsPassed(testCount)
}

func crypticDictionaryTests() {
  testCount := []int{0,0}
  fmt.Println("Cryptic Dictionary Tests")
  runTest(crypticDictionaryTest1, "should work for first example case", testCount)
  runTest(crypticDictionaryTest2, "should work for second example case", testCount)
  runTest(crypticDictionaryTest3, "should work for two word input case", testCount)
  runTest(crypticDictionaryTest4, "should work for words that have two characters", testCount)
  printTestsPassed(testCount)
}


func redundantConnectionTest1() bool {
  solution := redundantConnection([][]int{{1,2},{1,3},{2,3}})
  return areEqual(solution, []int{2,3}) || areEqual(solution, []int{1,3})
}

func redundantConnectionTest2() bool {
  solution := redundantConnection([][]int{{1,2},{4,5},{2,3},{2,4},{5,2}})
  return areEqual(solution, []int{5,2})
}

func redundantConnectionTest3() bool {
  solution := redundantConnection([][]int{{1,2},{2,3},{3,1}})
  return areEqual(solution, []int{1,2}) || areEqual(solution, []int{2,3}) ||
    areEqual(solution, []int{3,1})
}

func redundantConnectionTest4() bool {
  solution := redundantConnection([][]int{{1,2},{2,3},{3,1},{3,6},{2,5},{1,4}})
  return areEqual(solution, []int{1,2}) || areEqual(solution, []int{2,3}) ||
    areEqual(solution, []int{3,1})
}




func thirdDegreeNeighborsTest1() bool {
  solution := thirdDegreeNeighbors([][]int{{1,2},{2,1},{1,3},{3,1},{2,4},
            {4,2},{3,4},{4,3},{4,8},{8,4},
            {4,5},{5,4},{5,6},{6,5},{5,7},
            {7,5},{6,7},{7,6},{8,7},{7,8},
            {8,9},{9,8}}, 1)
  sort.Ints(solution)
  return areEqual(solution, []int{5,8})
}


func thirdDegreeNeighborsTest2() bool {
  solution := thirdDegreeNeighbors([][]int{{1,2},{2,1},{1,3},{3,1},{2,4},{4,2},{3,4},{4,3}}, 1)
  return areEqual(solution, []int{})
}

func thirdDegreeNeighborsTest3() bool {
  solution := thirdDegreeNeighbors([][]int{}, 1)
  return areEqual(solution, []int{})
}

func thirdDegreeNeighborsTest4() bool {
  solution := thirdDegreeNeighbors([][]int{{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{3,5},{5,3},{3,6},{6,3},
          {1,7},{7,1},{7,8},{8,7},{8,9},
          {9,8},{8,10},{10,8},{8,11},{11,8}}, 1)
  sort.Ints(solution)
  return areEqual(solution, []int{4,5,6,9,10,11})
}

func thirdDegreeNeighborsTest5() bool {
  solution := thirdDegreeNeighbors([][]int{{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{4,5},{5,4},{5,6},{6,5},
          {6,1},{1,6}}, 1)
  return areEqual(solution,[]int{4})
}

func thirdDegreeNeighborsTest6() bool {
  solution := thirdDegreeNeighbors([][]int{{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{4,5},{5,4},{5,6},{6,5},
          {6,7},{7,6},{7,8},{8,7},{8,1},
          {1,8}}, 1)
  sort.Ints(solution)
  return areEqual(solution,[]int{4,6})
}



func detectCycleInGraphTest1() bool {
  return detectCycleInGraph([][]int{{1,2},{2,1},{2,3},{3,2},{3,1},{1,3},
          {3,4},{4,3},{5,4},{4,5},{5,6},{6,5},{4,7},{7,4}})
}

func detectCycleInGraphTest2() bool {
  return !detectCycleInGraph([][]int{{1,2},{2,1},{1,3},{3,1},{3,4},{4,3},
          {4,5},{5,4},{5,6},{6,5},{4,7},{7,4}})
}

func detectCycleInGraphTest3() bool {
  return !detectCycleInGraph([][]int{})
}

func detectCycleInGraphTest4() bool {
  return detectCycleInGraph([][]int{{1,2},{2,1},{1,3},{3,1},{3,5},{5,3},
          {5,6},{6,5},{6,4},{4,6},{4,2},{2,4}})
}

func detectCycleInGraphTest5() bool {
  return !detectCycleInGraph([][]int{{1,1}})
}

func detectCycleInGraphTest6() bool {
  return !detectCycleInGraph([][]int{{1,2},{2,1}})
}



func friendCirclesTest1() bool {
  return friendCircles([][]int{{1,1,0}, {1,1,0}, {0,0,1}}) == 2
}

func friendCirclesTest2() bool {
  return friendCircles([][]int{}) == 0
}

func friendCirclesTest3() bool {
  return friendCircles([][]int{{1,1,0}, {1,1,1}, {0,1,1}}) == 1
}

func friendCirclesTest4() bool {
  return friendCircles([][]int{{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}}) == 4
}

func friendCirclesTest5() bool {
  return friendCircles([][]int{{1,1,1,1},{1,1,1,1},{1,1,1,1},{1,1,1,1}}) == 1
}



func longestPathITest1() bool {
  solution := longestPathI([][]int{{1,2},{2,3},{1,3}})
  return areEqual(solution,[]int{1,2,3})
}

func longestPathITest2() bool {
  solution := longestPathI([][]int{{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}})
  return areEqual(solution,[]int{6,5,4,1,2,3})
}

func longestPathITest3() bool {
  solution := longestPathI([][]int{{2,3},{3,1}})
  return areEqual(solution,[]int{2,3,1})
}

func longestPathITest4() bool {
  solution := longestPathI([][]int{{1,2},{2,4},{4,6},{1,3},{3,5},{5,7}})
  return areEqual(solution,[]int{1,2,4,6}) ||
        areEqual(solution,[]int{1,3,5,7})
}

func longestPathITest5() bool {
  solution := longestPathI([][]int{{1,1}})
  return areEqual(solution,[]int{1})
}

func longestPathITest6() bool {
  solution := longestPathI([][]int{{1,2},{1,3},{1,4},{1,5}})
  return areEqual(solution,[]int{1,2}) ||
        areEqual(solution,[]int{1,3}) ||
        areEqual(solution,[]int{1,4}) ||
        areEqual(solution,[]int{1,5})
}



func courseScheduleTest1() bool {
  solution := courseSchedule([][]string{{"a","b"},{"a","c"},{"b","d"},{"c","d"}})
  return areEqualStrList(solution, []string{"a","b","c","d"}) ||
        areEqualStrList(solution, []string{"a","c","b","d"})
}

func courseScheduleTest2() bool {
  solution := courseSchedule([][]string{{"a","b"},{"b","c"},{"c","d"}})
  return areEqualStrList(solution, []string{"a","b","c","d"})
}

func courseScheduleTest3() bool {
  solution := courseSchedule([][]string{{"a","c"},{"a","b"}})
  return areEqualStrList(solution, []string{"a","c","b"}) ||
        areEqualStrList(solution, []string{"a","b","c"})
}

func courseScheduleTest4() bool {
  solution := courseSchedule([][]string{{"a","b"},{"a","c"},{"b","d"},{"d","e"},
            {"d","c"},{"c","e"},{"e","f"},{"f","h"},
            {"e","h"},{"e","g"},{"h","g"}})
  return areEqualStrList(solution, []string{"a","b","d","c","e","f","h","g"})
}

func courseScheduleTest5() bool {
  solution := courseSchedule([][]string{})
  return areEqualStrList(solution, []string{})
}



func crypticDictionaryTest1() bool {
  solution := crypticDictionary([]string{"baa","abcd","abca","cab","cad"})
  return areEqualStrList(solution, []string{"b","d","a","c"})
}

func crypticDictionaryTest2() bool {
  solution := crypticDictionary([]string{"caa","aaa","aab"})
  return areEqualStrList(solution, []string{"c","a","b"})
}

func crypticDictionaryTest3() bool {
  solution := crypticDictionary([]string{"bbb","bab"})
  return areEqualStrList(solution, []string{"b","a"})
}

func crypticDictionaryTest4() bool {
  solution := crypticDictionary([]string{"bm","bn","bo","mo"})
  return areEqualStrList(solution, []string{"b","m","n","o"})
}



/****** Utility Functions ******/
func copyPointerSlice(ptrSlice *[]int) *[]int{
  res := make([]int, len(*ptrSlice))
  for i,val := range *ptrSlice {
      res[i] = val
  }
  return &res
}

func areEqual(list1 []int, list2 []int) bool {
  if(len(list1) != len(list2)) {
    return false
  }
  for i := 0; i < len(list1) ; i++ {
    if(list1[i] != list2[i]) {
      return false
    }
  }
  return true
}

func areEqualStrList(list1 []string, list2 []string) bool {
  if(len(list1) != len(list2)) {
    return false
  }
  for i := 0; i < len(list1) ; i++ {
    if(list1[i] != list2[i]) {
      return false
    }
  }
  return true
}


func runTest(test func() bool, testName string, testCount []int) {
  testCount[1]++
  var testPassed bool = test()
  if(testPassed) {testCount[0]++}
  var result string = "  " + (strconv.Itoa(testCount[1]) + ")  ") + strconv.FormatBool(testPassed) + " : " + testName
  fmt.Println(result)
}

func printTestsPassed(testCount []int) {
  fmt.Println("PASSED: " + strconv.Itoa(testCount[0]) + " / " + strconv.Itoa(testCount[1]) + "\n\n")
}
