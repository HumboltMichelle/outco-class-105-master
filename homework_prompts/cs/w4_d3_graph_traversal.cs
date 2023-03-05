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

using System;
using System.Linq;
using System.Collections.Generic;


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
  *  Input: edges: [[int]]
  *  Output: [int]
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

class RedundantConnection {


  public static int[] compute(int[,] edges) {
    // YOUR WORK HERE
    return new int[0];
  }

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

class ThirdDegreeNeighbors {

  public static int[] compute(int[,] edges, int start) {
    // YOUR WORK HERE
    return new int[0];
  }
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

class DetectCycleInGraph {

  public static bool compute(int[,] edges) {
    // YOUR WORK HERE
    return false;
  }
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

class FriendCircles {

  public static int compute(int[,] matrix) {
    // YOUR WORK HERE
    return -1;
  }
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

class LongestPathI {


  public static int[] compute(int[,] edges) {
    // YOUR WORK HERE
    return new int[0];
  }
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
  *  Input: courses: [[string]]
  *  Output: [string]
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

class CourseSchedule {

  public static string[] compute(string[,] edges) {
    // YOUR WORK HERE
    return new string[0];
  }
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
  *  Input: words: [string]
  *  Output: [string]
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

class CrypticDictionary {

  public static string[] compute(string[] words) {
    // YOUR WORK HERE
    return new string[0];
  }
}



// ////////////////////////////////////////////////////////////
// ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
// ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

  public static void Main() {
    redundantConnectionTests();
    thirdDegreeNeighborsTests();
    detectCycleInGraphTests();
    friendCirclesTests();
    longestPathITests();
    courseScheduleTests();
    crypticDictionaryTests();
  }

  private static void redundantConnectionTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Redundant Connection Tests");
    runTest(redundantConnectionTest1, "should work for first example case", testCount);
    runTest(redundantConnectionTest2, "should work for second example case", testCount);
    runTest(redundantConnectionTest3, "should work for cyclic graph", testCount);
    runTest(redundantConnectionTest4, "should work for cyclic graph with branches coming off cyclical portion", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void thirdDegreeNeighborsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Third Degree Neighbors Tests");
    runTest(thirdDegreeNeighborsTest1, "should work for example case", testCount);
    runTest(thirdDegreeNeighborsTest2, "should work for graph with no third degree neighbors", testCount);
    runTest(thirdDegreeNeighborsTest3, "should work for graph with no edges", testCount);
    runTest(thirdDegreeNeighborsTest4, "should work for branching graph", testCount);
    runTest(thirdDegreeNeighborsTest5, "should work for linear graph", testCount);
    runTest(thirdDegreeNeighborsTest6, "should work for cyclic graph", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void detectCycleInGraphTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Detect Cycle In Graph Tests");
    runTest(detectCycleInGraphTest1, "should work for example case", testCount);
    runTest(detectCycleInGraphTest2, "should return false when cycle does not exist", testCount);
    runTest(detectCycleInGraphTest3, "should return false when no edges exist in graph", testCount);
    runTest(detectCycleInGraphTest4, "should return true for one large loop", testCount);
    runTest(detectCycleInGraphTest5, "should return false for single element graph", testCount);
    runTest(detectCycleInGraphTest6, "should return false for two element graph connected by edge", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void friendCirclesTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Friend Circles Tests");
    runTest(friendCirclesTest1, "should work for first example case", testCount);
    runTest(friendCirclesTest2, "should work for second example case", testCount);
    runTest(friendCirclesTest3, "should work for an empty matrix", testCount);
    runTest(friendCirclesTest4, "should work when no one is friends with anyone else", testCount);
    runTest(friendCirclesTest5, "should work when everyone is friends with everyone else", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void longestPathITests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Longest Path I Tests");
    runTest(longestPathITest1, "should work for first example case", testCount);
    runTest(longestPathITest2, "should work for second example case", testCount);
    runTest(longestPathITest3, "should work for three-element linear graph", testCount);
    runTest(longestPathITest4, "should work for graph with two equivalent paths", testCount);
    runTest(longestPathITest5, "should work for single-element graph", testCount);
    runTest(longestPathITest6, "should handle graph with multiple paths equivalent in length", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void courseScheduleTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Course Schedule Tests");
    runTest(courseScheduleTest1, "should work for first example case", testCount);
    runTest(courseScheduleTest2, "should work for second example case", testCount);
    runTest(courseScheduleTest3, "should work for courseload with small number of courses", testCount);
    runTest(courseScheduleTest4, "should work for large courseload", testCount);
    runTest(courseScheduleTest5, "should work for empty input array", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }

  private static void crypticDictionaryTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Cryptic Dictionary Tests");
    runTest(crypticDictionaryTest1, "should work for first example case", testCount);
    runTest(crypticDictionaryTest2, "should work for second example case", testCount);
    runTest(crypticDictionaryTest3, "should work for two word input case", testCount);
    runTest(crypticDictionaryTest4, "should work for words that have two characters", testCount);
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }


  private static bool redundantConnectionTest1() {
    int[] solution = RedundantConnection.compute(new int[,]{{1,2},{1,3},{2,3}});
    return solution.SequenceEqual(new int[] {2,3}) || solution.SequenceEqual(new int[] {1,3});
  }

  private static bool redundantConnectionTest2() {
    int[] solution = RedundantConnection.compute(new int[,] {{1,2},{2,3},{2,4},{4,5},{5,2}});
    return solution.SequenceEqual(new int[] {5,2});
  }

  private static bool redundantConnectionTest3() {
    int[] solution = RedundantConnection.compute(new int[,] {{1,2},{2,3},{3,1}});
    return solution.SequenceEqual(new int[] {1,2}) ||
          solution.SequenceEqual(new int[] {2,3}) ||
          solution.SequenceEqual(new int[] {3,1});
  }

  private static bool redundantConnectionTest4() {
    int[] solution = RedundantConnection.compute(new int[,] {{1,2},{2,3},{3,1},{3,6},{2,5},{1,4}});
    return solution.SequenceEqual(new int[] {1,2}) ||
          solution.SequenceEqual(new int[] {2,3}) ||
          solution.SequenceEqual(new int[] {3,1});
  }



  private static bool thirdDegreeNeighborsTest1() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,]
             {{1,2},{2,1},{1,3},{3,1},{2,4},
              {4,2},{3,4},{4,3},{4,8},{8,4},
              {4,5},{5,4},{5,6},{6,5},{5,7},
              {7,5},{6,7},{7,6},{8,7},{7,8},
              {8,9},{9,8}}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {5,8});
  }

  private static bool thirdDegreeNeighborsTest2() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,] {{1,2},{2,1},{1,3},{3,1},{2,4},{4,2},{3,4},{4,3}}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {});
  }

  private static bool thirdDegreeNeighborsTest3() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,] {}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {});
  }

  private static bool thirdDegreeNeighborsTest4() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,]
           {{1,2},{2,1},{2,3},{3,2},{3,4},
            {4,3},{3,5},{5,3},{3,6},{6,3},
            {1,7},{7,1},{7,8},{8,7},{8,9},
            {9,8},{8,10},{10,8},{8,11},{11,8}}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {4,5,6,9,10,11});
  }

  private static bool thirdDegreeNeighborsTest5() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,]
           {{1,2},{2,1},{2,3},{3,2},{3,4},
            {4,3},{4,5},{5,4},{5,6},{6,5},
            {6,1},{1,6}}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {4});
  }

  private static bool thirdDegreeNeighborsTest6() {
    int[] solution = ThirdDegreeNeighbors.compute(new int[,]
           {{1,2},{2,1},{2,3},{3,2},{3,4},
            {4,3},{4,5},{5,4},{5,6},{6,5},
            {6,7},{7,6},{7,8},{8,7},{8,1},
            {1,8}}, 1);
    return new HashSet<int>(solution).SetEquals(new int[] {4,6});
  }


  private static bool detectCycleInGraphTest1() {
    return DetectCycleInGraph.compute(new int[,]
           {{1,2},{2,1},{2,3},{3,2},{3,1},{1,3},
            {3,4},{4,3},{5,4},{4,5},{5,6},{6,5},
            {4,7},{7,4}});
  }

  private static bool detectCycleInGraphTest2() {
    return !DetectCycleInGraph.compute(new int[,]
           {{1,2},{2,1},{1,3},{3,1},{3,4},{4,3},
            {4,5},{5,4},{5,6},{6,5},{4,7},{7,4}});
  }

  private static bool detectCycleInGraphTest3() {
    return !DetectCycleInGraph.compute(new int[,] {});
  }

  private static bool detectCycleInGraphTest4() {
    return DetectCycleInGraph.compute(new int[,]
           {{1,2},{2,1},{1,3},{3,1},{3,5},{5,3},
            {5,6},{6,5},{6,4},{4,6},{4,2},{2,4}});
  }

  private static bool detectCycleInGraphTest5() {
    return !DetectCycleInGraph.compute(new int[,] {{1,1}});
  }

  private static bool detectCycleInGraphTest6() {
    return !DetectCycleInGraph.compute(new int[,] {{1,2},{2,1}});
  }



  private static bool friendCirclesTest1() {
    return FriendCircles.compute(new int[,] {{1,1,0}, {1,1,0}, {0,0,1}}) == 2;
  }

  private static bool friendCirclesTest2() {
    return FriendCircles.compute(new int[,] {}) == 0;
  }

  private static bool friendCirclesTest3() {
    return FriendCircles.compute(new int[,] {{1,1,0}, {1,1,1}, {0,1,1}}) == 1;
  }

  private static bool friendCirclesTest4() {
    return FriendCircles.compute(new int[,] {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}}) == 4;
  }

  private static bool friendCirclesTest5() {
    return FriendCircles.compute(new int[,] {{1,1,1,1},{1,1,1,1},{1,1,1,1},{1,1,1,1}}) == 1;
  }



  private static bool longestPathITest1() {
    int[] solution = LongestPathI.compute(new int[,] {{1,2},{2,3},{1,3}});
    return solution.SequenceEqual(new int[] {1,2,3});
  }

  private static bool longestPathITest2() {
    int[] solution = LongestPathI.compute(new int[,] {{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}});
    return solution.SequenceEqual(new int[] {6,5,4,1,2,3});
  }

  private static bool longestPathITest3() {
    int[] solution = LongestPathI.compute(new int[,] {{2,3},{3,1}});
    return solution.SequenceEqual(new int[] {2,3,1});
  }

  private static bool longestPathITest4() {
    int[] solution = LongestPathI.compute(new int[,] {{1,2},{2,4},{4,6},{1,3},{3,5},{5,7}});
    return solution.SequenceEqual(new int[] {1,2,4,6}) ||
          solution.SequenceEqual(new int[] {1,3,5,7});
  }

  private static bool longestPathITest5() {
    int[] solution = LongestPathI.compute(new int[,] {{1,1}});
    return solution.SequenceEqual(new int[] {1});
  }

  private static bool longestPathITest6() {
    int[] solution = LongestPathI.compute(new int[,] {{1,2},{1,3},{1,4},{1,5}});
    return solution.SequenceEqual(new int[] {1,2}) ||
          solution.SequenceEqual(new int[] {1,3}) ||
          solution.SequenceEqual(new int[] {1,4}) ||
          solution.SequenceEqual(new int[] {1,5});
  }



  private static bool courseScheduleTest1() {
    string[] solution = CourseSchedule.compute(new string[,] {{"a","b"},{"a","c"},{"b","d"},{"c","d"}});
    return solution.SequenceEqual(new string[] {"a","b","c","d"}) ||
          solution.SequenceEqual(new string[] {"a","c","b","d"});
  }

  private static bool courseScheduleTest2() {
    string[] solution = CourseSchedule.compute(new string[,] {{"a","b"},{"b","c"},{"c","d"}});
    return solution.SequenceEqual(new string[] {"a","b","c","d"});
  }

  private static bool courseScheduleTest3() {
    string[] solution = CourseSchedule.compute(new string[,] {{"a","c"},{"a","b"}});
    return solution.SequenceEqual(new string[] {"a","c","b"}) ||
          solution.SequenceEqual(new string[] {"a","b","c"});
  }

  private static bool courseScheduleTest4() {
    string[] solution = CourseSchedule.compute(new string[,]
              {{"a","b"},{"a","c"},{"b","d"},{"d","e"},
              {"d","c"},{"c","e"},{"e","f"},{"f","h"},
              {"e","h"},{"e","g"},{"h","g"}});
    return solution.SequenceEqual(new string[] {"a","b","d","c","e","f","h","g"});
  }

  private static bool courseScheduleTest5() {
    string[] solution = CourseSchedule.compute(new string[,]{});
    return solution.SequenceEqual(new string[] {});
  }


  private static bool crypticDictionaryTest1() {
    string[] solution = CrypticDictionary.compute(new string[]{"baa","abcd","abca","cab","cad"});
    return solution.SequenceEqual(new string[] {"b","d","a","c"});
  }

  private static bool crypticDictionaryTest2() {
    string[] solution = CrypticDictionary.compute(new string[]{"caa","aaa","aab"});
    return solution.SequenceEqual(new string[] {"c","a","b"});
  }

  private static bool crypticDictionaryTest3() {
    string[] solution = CrypticDictionary.compute(new string[]{"bbb","bab"});
    return solution.SequenceEqual(new string[] {"b","a"});
  }

  private static bool crypticDictionaryTest4() {
    string[] solution = CrypticDictionary.compute(new string[]{"bm","bn","bo","mo"});
    return solution.SequenceEqual(new string[] {"b","m","n","o"});
  }

  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a boolean
  //   indicating if test passed
  // string name : describes the test
  // int[] testCount : keeps track out how many tests pass and how many total
  //   in the form of a two item array i.e., [0, 0]
  private static void runTest(Func<bool> test, string testName, int[] testCount){
      testCount[1]++;
      bool testPassed = false;
      // Attempt to run test and suppress exceptions on failure
      try {
          testPassed = test();
          if(testPassed) testCount[0]++;
      } catch (Exception e) {Console.WriteLine(e);}
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
}
