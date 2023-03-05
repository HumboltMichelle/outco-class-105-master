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


func redundantConnection(edges [][]int) []int {
  // YOUR WORK HERE
  return []int{}
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
  // YOUR WORK HERE
  return []int{}
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
  // YOUR WORK HERE
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
  // YOUR WORK HERE
  return -1
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



func longestPathI(edges [][]int) []int {
  // YOUR WORK HERE
  return []int{}
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
  // YOUR WORK HERE
  return []string{}
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


func crypticDictionary(words []string) []string {
  // YOUR WORK HERE
  return []string{}
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
