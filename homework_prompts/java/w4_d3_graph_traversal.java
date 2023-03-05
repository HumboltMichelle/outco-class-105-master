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

import java.util.*;


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

class RedundantConnection {


  public static int[] compute(int[][] edges) {
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

class ThirdDegreeNeighbors {

  public static int[] compute(int[][] edges, Integer start) {
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

class DetectCycleInGraph {

  public static boolean compute(int[][] edges) {
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

class FriendCircles {

  public static Integer compute(int[][] matrix) {
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
  *  Input: Graph: [[Integer]] (edge list)
  *  Output: Integer
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


  public static int[] compute(int[][] edges) {
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

class CourseSchedule {

  public static String[] compute(String[][] edges) {
    // YOUR WORK HERE
    return new String[0];
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

class CrypticDictionary {

  public static String[] compute(String[] words) {
    // YOUR WORK HERE
    return new String[0];
  }
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class GraphProblemsTests {
  // an interface to perform tests
  public interface Test {
    boolean execute();
  }

  public static void main(String[] args) {

    int[] testCount = {0, 0};
    System.out.println("Redundant Connection Tests");

    // tests are in the form as shown
    assertTest(testCount, "should work for first example case", () -> {
      int[] solution = RedundantConnection.compute(new int[][] {{1,2},{1,3},{2,3}});
      return arraysEqual(solution, new int[] {2,3}) ||
      arraysEqual(solution, new int[] {1,3});
    });

    assertTest(testCount, "should work for second example case", () -> {
      int[] solution = RedundantConnection.compute(new int[][] {{1,2},{2,3},{2,4},{4,5},{5,2}});
      return arraysEqual(solution, new int[] {5,2});
    });

    assertTest(testCount, "should work for cyclic graph", () -> {
      int[] solution = RedundantConnection.compute(new int[][] {{1,2},{2,3},{3,1}});
      return arraysEqual(solution, new int[] {1,2}) ||
      arraysEqual(solution, new int[] {2,3}) ||
      arraysEqual(solution, new int[] {3,1});
    });

    assertTest(testCount, "should work for cyclic graph with branches coming off cyclical portion", () -> {
      int[] solution = RedundantConnection.compute(new int[][] {{1,2},{2,3},{3,1},{3,6},{2,5},{1,4}});
      return arraysEqual(solution, new int[] {1,2}) ||
      arraysEqual(solution, new int[] {2,3}) ||
      arraysEqual(solution, new int[] {3,1});
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Third Degree Neighbors Test");

    assertTest(testCount, "should work for example case", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {{1,2},{2,1},{1,3},{3,1},{2,4},
                                                {4,2},{3,4},{4,3},{4,8},{8,4},
                                                {4,5},{5,4},{5,6},{6,5},{5,7},
                                                {7,5},{6,7},{7,6},{8,7},{7,8},
                                                {8,9},{9,8}}, 1);
      return arraysMatching(solution, new int[] {5,8});
    });

    assertTest(testCount, "should work for graph with no third degree neighbors", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {{1,2},{2,1},{1,3},{3,1},{2,4},{4,2},{3,4},{4,3}}, 1);
      return arraysMatching(solution, new int[] {});
    });

    assertTest(testCount, "should work for graph with no edges", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {}, 1);
      return arraysMatching(solution, new int[] {});
    });

    assertTest(testCount, "should work for branching graph", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {{1,2},{2,1},{2,3},{3,2},{3,4},
                                                {4,3},{3,5},{5,3},{3,6},{6,3},
                                                {1,7},{7,1},{7,8},{8,7},{8,9},
                                                {9,8},{8,10},{10,8},{8,11},{11,8}}, 1);
      return arraysMatching(solution, new int[] {4,5,6,9,10,11});
    });

    assertTest(testCount, "should work for linear graph", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {{1,2},{2,1},{2,3},{3,2},{3,4},
                                                {4,3},{4,5},{5,4},{5,6},{6,5},
                                                {6,1},{1,6}}, 1);
      return arraysMatching(solution, new int[] {4});
    });

    assertTest(testCount, "should work for cyclic graph", () -> {
      int[] solution = ThirdDegreeNeighbors.compute(new int[][] {{1,2},{2,1},{2,3},{3,2},{3,4},
                                                {4,3},{4,5},{5,4},{5,6},{6,5},
                                                {6,7},{7,6},{7,8},{8,7},{8,1},
                                                {1,8}}, 1);
      return arraysMatching(solution, new int[] {4,6});
    });




    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");

    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Detect Cycle In Graph Tests");

    assertTest(testCount, "should work for example case", () ->
            DetectCycleInGraph.compute(new int[][] {{1,2},{2,1},{2,3},{3,2},{3,1},{1,3},
                                                 {3,4},{4,3},{5,4},{4,5},{5,6},{6,5},
                                                 {4,7},{7,4}}));

    assertTest(testCount, "should return false when cycle does not exist", () ->
            !DetectCycleInGraph.compute(new int[][] {{1,2},{2,1},{1,3},{3,1},{3,4},{4,3},
                                                 {4,5},{5,4},{5,6},{6,5},{4,7},{7,4}}));

    assertTest(testCount, "should return false when no edges exist in graph", () ->
            !DetectCycleInGraph.compute(new int[][] {}));

    assertTest(testCount, "should return true for one large loop", () ->
            DetectCycleInGraph.compute(new int[][] {{1,2},{2,1},{1,3},{3,1},{3,5},{5,3},
                                                 {5,6},{6,5},{6,4},{4,6},{4,2},{2,4}}));

    assertTest(testCount, "should return false for single element graph", () ->
            !DetectCycleInGraph.compute(new int[][] {{1,1}}));

    assertTest(testCount, "should return false for two element graph connected by edge", () ->
            !DetectCycleInGraph.compute(new int[][] {{1,2},{2,1}}));

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Friend Circles");

    assertTest(testCount, "should work for first example case", () ->
            FriendCircles.compute(new int[][] {{1,1,0}, {1,1,0}, {0,0,1}}) == 2);

    assertTest(testCount, "should work for second example case", () ->
            FriendCircles.compute(new int[][] {{1,1,0}, {1,1,1}, {0,1,1}}) == 1);

    assertTest(testCount, "should work for an empty matrix", () ->
            FriendCircles.compute(new int[][] {}) == 0);

    assertTest(testCount, "should work when no one is friends with anyone else", () ->
            FriendCircles.compute(new int[][] {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}}) == 4);

    assertTest(testCount, "should work when everyone is friends with everyone else", () ->
            FriendCircles.compute(new int[][] {{1,1,1,1},{1,1,1,1},{1,1,1,1},{1,1,1,1}}) == 1);

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");



    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Longest Path I");

    assertTest(testCount, "should work for first example case", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{1,2},{2,3},{1,3}});
      return arraysEqual(solution, new int[] {1,2,3});
    });

    assertTest(testCount, "should work for second example case", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}});
      return arraysEqual(solution, new int[] {6,5,4,1,2,3});
    });

    assertTest(testCount, "should work for three-element linear graph", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{2,3},{3,1}});
      return arraysEqual(solution, new int[] {2,3,1});
    });

    assertTest(testCount, "should work for graph with two equivalent paths", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{1,2},{2,4},{4,6},{1,3},{3,5},{5,7}});
      return arraysEqual(solution, new int[] {1,2,4,6}) ||
             arraysEqual(solution, new int[] {1,3,5,7});
    });

    assertTest(testCount, "should work for single-element graph", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{1,1}});
      return arraysEqual(solution, new int[] {1});
    });

    assertTest(testCount, "should handle graph with multiple paths equivalent in length", () -> {
      int[] solution = LongestPathI.compute(new int[][] {{1,2},{1,3},{1,4},{1,5}});
      return arraysEqual(solution, new int[] {1,2}) ||
      arraysEqual(solution, new int[] {1,3}) ||
      arraysEqual(solution, new int[] {1,4}) ||
      arraysEqual(solution, new int[] {1,5});
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");





    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Course Schedule");

    assertTest(testCount, "should work for first example case", () -> {
      String[] solution = CourseSchedule.compute(new String[][] {{"a","b"},{"a","c"},{"b","d"},{"c","d"}});
      return stringArraysEqual(solution, new String[] {"a","b","c","d"}) ||
             stringArraysEqual(solution, new String[] {"a","c","b","d"});
    });

    assertTest(testCount, "should work for second example case", () -> {
      String[] solution = CourseSchedule.compute(new String[][] {{"a","b"},{"b","c"},{"c","d"}});
      return stringArraysEqual(solution, new String[] {"a","b","c","d"});
    });

    assertTest(testCount, "should work for courseload with small number of courses", () -> {
      String[] solution = CourseSchedule.compute(new String[][] {{"a","c"},{"a","b"}});
      return stringArraysEqual(solution, new String[] {"a","c","b"}) ||
             stringArraysEqual(solution, new String[] {"a","b","c"});
    });

    assertTest(testCount, "should work for large courseload", () -> {
      String[] solution = CourseSchedule.compute(new String[][] {{"a","b"},{"a","c"},{"b","d"},{"d","e"},
                                                     {"d","c"},{"c","e"},{"e","f"},{"f","h"},
                                                     {"e","h"},{"e","g"},{"h","g"}});
      return stringArraysEqual(solution, new String[] {"a","b","d","c","e","f","h","g"});
    });

    assertTest(testCount, "should work for empty input array", () -> {
      String[] solution = CourseSchedule.compute(new String[][] {});
      return stringArraysEqual(solution, new String[] {});
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


    // instantiate the testing of each module by resetting count and printing title of module
    testCount[0] = 0;
    testCount[1] = 0;
    System.out.println("Cryptic Dictionary");

    assertTest(testCount, "should work for first example case", () -> {
      String[] solution = CrypticDictionary.compute(new String[] {"baa","abcd","abca","cab","cad"});
      return stringArraysEqual(solution, new String[] {"b","d","a","c"});
    });

    assertTest(testCount, "should work for second example case", () -> {
      String[] solution = CrypticDictionary.compute(new String[] {"caa","aaa","aab"});
      return stringArraysEqual(solution, new String[] {"c","a","b"});
    });

    assertTest(testCount, "should work for two word input case", () -> {
      String[] solution = CrypticDictionary.compute(new String[] {"bbb","bab"});
      return stringArraysEqual(solution, new String[] {"b","a"});
    });

    assertTest(testCount, "should work for words that have two characters", () -> {
      String[] solution = CrypticDictionary.compute(new String[] {"bm","bn","bo","mo"});
      return stringArraysEqual(solution, new String[] {"b","m","n","o"});
    });

    // print the result of tests passed for a module
    System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


  }


  // function for checking if arrays contain same elements
  // (do not need to be in the same order)
  private static boolean arraysMatching(int[] arr1, int[] arr2) {
    if (arr1.length != arr2.length) {
      return false;
    } else {
      Arrays.sort(arr1);
      Arrays.sort(arr2);

      for (int i = 0 ; i < arr1.length ; i++) {
        if (arr1[i] != arr2[i]) {
          return false;
        }
      }

      return true;
    }
  }


  // function for checking if arrays are equal
  private static boolean arraysEqual(int[] arr1, int[] arr2) {
    if (arr1.length != arr2.length) {
      return false;
    }

    for (int i = 0 ; i < arr1.length ; i++) {
      if (arr1[i] != arr2[i]) {
        return false;
      }
    }

    return true;
  }


  // function for checking if arrays are equal
  private static boolean stringArraysEqual(String[] arr1, String[] arr2) {
    if (arr1.length != arr2.length) {
      return false;
    }

    for (int i = 0 ; i < arr1.length ; i++) {
      if (!arr1[i].equals(arr2[i])) {
        return false;
      }
    }

    return true;
  }


  // do not edit below, this is to wrap the test and check for exceptions
  private static void assertTest(int[] count, String name, Test test) {
    String pass = "false";
    count[1]++;

    try {
      if (test.execute()) {
        pass = " true";
        count[0]++;
      }
    } catch(Exception ignored) {}
    String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
    System.out.println(result);
  }
}
