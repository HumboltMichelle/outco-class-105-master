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

// Helper Data Structures and Algorithms

class _ListNode {
  public String str;
  public Integer value;
  public int[] intArray;
  public _ListNode next;

  public _ListNode(Integer value){
    this.value = value;
  }

  public _ListNode(String str){
    this.str = str;
  }

  public _ListNode(int[] intArray){
    this.intArray = intArray;
  }

  public String getStringID() {
    return this.str;
  }

  public Integer getIntegerID() {
    return this.value;
  }

  public int[] getIntArrayID() {
    return this.intArray;
  }

}

class _LinkedList {
  public int length = 0;
  public _ListNode head;
  public _ListNode tail;

  public void append(int value){
    insert(value, length);
  }

  public void append(String str){
    insert(str, length);
  }

  public void append(int[] intArray) {
    insert(intArray, length);
  }

  public void insert(int value, int index){
    if(index < 0 || index > length){
      return;
    }

    _ListNode newNode = new _ListNode(value);

    if(length == 0){
      head = newNode;
      tail = newNode;
    } else if(index == 0){
      newNode.next = head;
      head = newNode;
    } else if(index == length){
      tail.next = newNode;
      tail = newNode;
    } else {
      _ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      newNode.next = prev.next;
      prev.next = newNode;
    }
    length++;
  }

  public void insert(String str, int index){
    if(index < 0 || index > length){
      return;
    }

    _ListNode newNode = new _ListNode(str);

    if(length == 0){
      head = newNode;
      tail = newNode;
    } else if(index == 0){
      newNode.next = head;
      head = newNode;
    } else if(index == length){
      tail.next = newNode;
      tail = newNode;
    } else {
      _ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      newNode.next = prev.next;
      prev.next = newNode;
    }
    length++;
  }

  public void insert(int[] intArray, int index){
    if(index < 0 || index > length){
      return;
    }

    _ListNode newNode = new _ListNode(intArray);

    if(length == 0){
      head = newNode;
      tail = newNode;
    } else if(index == 0){
      newNode.next = head;
      head = newNode;
    } else if(index == length){
      tail.next = newNode;
      tail = newNode;
    } else {
      _ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      newNode.next = prev.next;
      prev.next = newNode;
    }
    length++;
  }

  public _ListNode delete(int index){
    if(index < 0 || index >= length){
      return null;
    }

    _ListNode result;
    if(length == 1){
      result = head;
      head = null;
      tail = null;
    } else if (index == 0){
      result = head;
      head = head.next;
    } else {
      _ListNode prev = head;
      for(int i = 0; i < index-1; i++){
        prev = prev.next;
      }
      result = prev.next;
      prev.next = prev.next.next;
      if(index == length-1){
        tail = prev;
      }
    }
    length--;
    return result;
  }

  public boolean contains(Integer value){
    _ListNode current = head;
    while(current != null){
      if(current.getIntegerID().equals(value)){
        return true;
      }
      current = current.next;
    }
    return false;
  }

  public boolean contains(String str){
    _ListNode current = head;
    while(current != null){
      if(current.getStringID().equals(str)){
        return true;
      }
      current = current.next;
    }
    return false;
  }

}

class Queue {
  public _LinkedList list = new _LinkedList();
  public Integer length = 0;

  public void enqueue(String str) {
    list.append(str);
    length += 1;
  }

  public void enqueue(Integer value) {
    list.append(value);
    length += 1;
  }

  public void enqueue(int[] intArray) {
    list.append(intArray);
    length += 1;
  }

  public String dequeueStringID() {
    if (length == 0) {
      return null;
    } else {
      this.length -= 1;
      return list.delete(0).str;
    }
  }

  public Integer dequeueIntegerID() {
    if (length == 0) {
      return null;
    } else {
      this.length -= 1;
      return list.delete(0).value;
    }
  }

  public int[] dequeueIntArrayID() {
    if (length == 0) {
      return null;
    } else {
      this.length -= 1;
      return list.delete(0).intArray;
    }
  }

  public String peekStringID() {
    return list.head.getStringID();
  }

  public Integer peekIntegerID() {
    return list.head.getIntegerID();
  }

  public Integer size() {
    return this.length;
  }

}

class _Graph {
  public HashMap<String, ArrayList<Object>> storage = new HashMap<>();

  public void addVertex(String str) {
    if (!storage.containsKey(str)) {
      storage.put(str, new ArrayList<>());
    }
  }

  public void addVertex(Integer value) {
    String strKey = Integer.toString(value);
    if (!storage.containsKey(strKey)) {
      storage.put(strKey, new ArrayList<>());
    }
  }

  public void removeVertex(String str) {
    if (storage.get(str) == null) {
      return;
    }

    for (ArrayList<Object> neighbors : storage.values()) {
      neighbors.remove(str);
    }

    storage.remove(str);
  }

  public void removeVertex(Integer value) {
    String strKey = Integer.toString(value);

    if (storage.get(strKey) == null) {
      return;
    }

    for (ArrayList<Object> neighbors : storage.values()) {
      neighbors.remove(value);
    }

    storage.remove(strKey);
  }

  public void addEdge(String a, String b) {
    if (storage.get(a) == null) {
      addVertex(a);
    }
    if (storage.get(b) == null) {
      addVertex(b);
    }
    storage.get(a).add(b);
  }

  public void addEdge(Integer a, Integer b) {
    String strA = Integer.toString(a);
    String strB = Integer.toString(b);
    if (storage.get(strA) == null) {
      addVertex(a);
    }
    if (storage.get(strB) == null) {
      addVertex(b);
    }
    storage.get(strA).add(b);
  }

  public void removeEdge(String a, String b) {
    if (storage.get(a) == null) {
      return;
    }
    storage.get(a).remove(b);
  }

  public void removeEdge(Integer a, Integer b) {
    String strA = Integer.toString(a);
    if (storage.get(strA) == null) {
      return;
    }
    storage.get(strA).remove(b);
  }

  public boolean isVertex(String str) {
    return storage.get(str) != null;
  }

  public boolean isVertex(Integer value) {
    String strKey = Integer.toString(value);
    return storage.get(strKey) != null;
  }

  public ArrayList<Object> neighbors(String str) {
    if (this.isVertex(str)) {
      return storage.get(str);
    }
    return new ArrayList<>();
  }

  public ArrayList<Object> neighbors(Integer value) {
    String strKey = Integer.toString(value);
    if (this.isVertex(strKey)) {
      return storage.get(strKey);
    }
    return new ArrayList<>();
  }

  public ArrayList<String> getStringVertices() {
    return new ArrayList<>(storage.keySet());
  }

  public ArrayList<Integer> getIntegerVertices() {
    ArrayList<Integer> result = new ArrayList<>();
    for (String key : storage.keySet()) {
      Integer intKey = Integer.parseInt(key);
      result.add(intKey);
    }
    return result;
  }
}

class GenerateAdjacencyList {

  public static _Graph compute(int[][] edges) {
    _Graph graph = new _Graph();
    graph.storage.clear();
    int u, v;

    for (int[] edge : edges) {
      u = edge[0];
      v = edge[1];
      graph.addEdge(u, v);
    }

    return graph;
  }

  public static _Graph compute(String[][] edges) {
    _Graph graph = new _Graph();
    graph.storage.clear();
    String u;
    String v;

    for (String[] edge : edges) {
      u = edge[0];
      v = edge[1];
      graph.addEdge(u, v);
    }

    return graph;
  }
}

class TopologicalSort {
  private static HashSet<String> visited = new HashSet<>();
  private static ArrayList<String> result = new ArrayList<>();
  private static _Graph graph;

  public static String[] compute(_Graph inputGraph) {
    visited.clear();
    result.clear();
    graph = inputGraph;

    ArrayList<String> vertices = graph.getStringVertices();

    for (String vertex : vertices) {
      dfs(vertex);
    }

    String[] resultFormat = new String[result.size()];
    for (int i = resultFormat.length - 1; i > -1; i--) {
      resultFormat[resultFormat.length - 1 - i] = result.get(i);
    }

    return resultFormat;
  }

  private static void dfs(String current) {
    if (visited.contains(current)) {
      return;
    }

    visited.add(current);
    ArrayList<Object> neighbors = graph.neighbors(current);
    for (Object neighborObj : neighbors) {
      String neighbor = (String) neighborObj;
      dfs(neighbor);
    }
    result.add(current);
  }
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
class Combo {
   public Integer value;
   public  HashSet<Integer> seen;

   Combo(Integer val, HashSet<Integer> seenSet) {
     value = val;
     seen = seenSet;
   }
 }

class RedundantConnection {

  public static ArrayList<ArrayList<Integer>> candidates;
  public static HashMap<Integer, Integer> parent;
  public static Integer N;

  public static int[] compute(int[][] edges) {
    candidates = new ArrayList<>();
    parent = new HashMap<>();
    N = edges.length;

    for (int[] edge : edges) {
      ArrayList<Integer> edgeCopy = new ArrayList<>(Arrays.asList(edge[0], edge[1]));
      int origin = edgeCopy.get(0);
      int destination = edgeCopy.get(1);

      if (parent.containsKey(destination)) {
        candidates.add(new ArrayList<>(Arrays.asList(parent.get(destination), destination)));
        candidates.add(edgeCopy);
      } else {
        parent.put(destination, origin);
      }
    }

    int root = orbit(1).value;

    if (candidates.size() == 0) {
      HashSet<Integer> cycle = orbit(root).seen;
      int[] answer = new int[0];

      for (int[] edge : edges) {
        ArrayList<Integer> edgeCopy = new ArrayList<>(Arrays.asList(edge[0], edge[1]));
        int origin = edgeCopy.get(0);
        int destination = edgeCopy.get(1);

        if (cycle.contains(origin) && cycle.contains(destination)) {
          answer = new int[]{origin, destination};
        }
      }
      return answer;
    }

    HashMap<Integer, ArrayList<Integer>> children = new HashMap<>();

    for (Integer v : parent.keySet()) {
      if (children.get(parent.get(v)) == null) {
        children.put(parent.get(v), new ArrayList<>(Collections.singletonList(v)));
      } else {
        children.get(parent.get(v)).add(v);
      }
    }

    ArrayList<Boolean> seen = new ArrayList<>(Collections.singletonList(true));

    for (int i = 0; i < N; i++) {
      seen.add(false);
    }

    ArrayList<Integer> stack = new ArrayList<>(Collections.singletonList(root));

    while (stack.size() > 0) {
      Integer node = stack.remove(stack.size() - 1);
      if (!seen.get(node)) {
        seen.set(node, true);
        if (children.containsKey(node)) {
          ArrayList<Integer> connected = children.get(node);
          stack.addAll(connected);
        }
      }
    }


    for (boolean seenItem : seen) {
      if (!seenItem) {
        return new int[]{candidates.get(0).get(0), candidates.get(0).get(1)};
      }
    }

    return new int[]{candidates.get(1).get(0), candidates.get(1).get(1)};
  }

  public static Combo orbit(Integer node) {
    HashSet<Integer> seen = new HashSet<>();

    while (parent.containsKey(node) && !seen.contains(node)) {
      seen.add(node);
      node = parent.get(node);
    }

    return new Combo(node, seen);
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
    _Graph graph = GenerateAdjacencyList.compute(edges);
    ArrayList<Integer> result = new ArrayList<>();
    Queue queue = new Queue();
    HashSet<Integer> seen = new HashSet<>();

    seen.add(start);
    queue.enqueue(new int[]{start, 0});

    while (queue.size() > 0) {
      int[] current = queue.dequeueIntArrayID();
      int val = current[0];
      int distance = current[1];
      if (distance == 3) {
        result.add(val);
      }

      ArrayList<Object> neighbors = graph.neighbors(val);
      Integer neighbor;
      for (Object neighborObj : neighbors) {
        neighbor = (Integer) neighborObj;
        if (!seen.contains(neighbor)) {
          seen.add(neighbor);
          queue.enqueue(new int[]{neighbor, distance + 1});
        }
      }
    }

    int[] resultFormat = new int[result.size()];
    for (int i = 0; i < resultFormat.length; i++) {
      resultFormat[i] = result.get(i);
    }

    return resultFormat;
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
    _Graph graph = GenerateAdjacencyList.compute(edges);
    HashSet<Integer> seen = new HashSet<>();
    Queue queue = new Queue();

    ArrayList<Integer> vertices = graph.getIntegerVertices();

    for (Integer vertex : vertices) {
      if (!seen.contains(vertex)) {
        seen.add(vertex);
        queue.enqueue(vertex);
      }
      while (queue.size() > 0) {
        Integer current = queue.dequeueIntegerID();
        ArrayList<Object> neighbors = graph.neighbors(current);
        int neighborsVisited = 0;
        boolean flag = false;

        for (Object neighborObj : neighbors) {
          Integer neighbor = (Integer) neighborObj;
          if (!seen.contains(neighbor)) {
            seen.add(neighbor);
            queue.enqueue(neighbor);
          } else {
            neighborsVisited += 1;
          }
          if (neighborsVisited > 1) {
            flag = true;
          }
        }
        if (flag) {
          return true;
        }
      }
    }
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
    HashSet<Integer> seen = new HashSet<>();
    int circles = 0;
    Queue queue = new Queue();

    for (int person = 0; person < matrix.length; person++) {
      if (!seen.contains(person)) {
        queue.enqueue(person);
        seen.add(person);
        circles += 1;
      }

      while (queue.size() > 0) {
        Integer current = queue.dequeueIntegerID();
        for (int friend = 0; friend < matrix[current].length; friend++) {
          if (matrix[current][friend] == 1 && !seen.contains(friend)) {
            seen.add(friend);
            queue.enqueue(friend);
          }
        }
      }
    }
    return circles;
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

  private static ArrayList<Integer> result = new ArrayList<>();
  private static HashSet<Integer> visited = new HashSet<>();
  private static _Graph graph = new _Graph();

  public static int[] compute(int[][] edges) {
    graph = GenerateAdjacencyList.compute(edges);
    result.clear();
    visited.clear();

    ArrayList<Integer> vertices = graph.getIntegerVertices();
    for (Integer vertex : vertices) {
      dfs(vertex, new ArrayList<>(Collections.singletonList(vertex)));
    }


    int[] resultFormat = new int[result.size()];
    for (int i = 0; i < resultFormat.length; i++) {
      resultFormat[i] = result.get(i);
    }

    return resultFormat;
  }

  private static void dfs(Integer current, ArrayList<Integer> path) {
    if (visited.contains(current)) {
      return;
    }

    if (path.size() > result.size()) {
      result = new ArrayList<>(path);
    }
    visited.add(current);

    ArrayList<Object> neighbors = graph.neighbors(current);
    for (Object neighborObj : neighbors) {
      Integer neighbor = (Integer) neighborObj;
      path.add(neighbor);
      dfs(neighbor, path);
      path.remove(path.size() - 1);
    }

    visited.remove(current);
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
    _Graph graph = GenerateAdjacencyList.compute(edges);
    return TopologicalSort.compute(graph);
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
    ArrayList<String[]> edges = new ArrayList<>();
    for (int i = 0; i < words.length - 1; i++) {
      String word = words[i];
      String nextWord = words[i + 1];
      edges.add(firstLetterDifference(word, nextWord));
    }

    String[][] edgesFormat = new String[edges.size()][];
    for (int i = 0; i < edgesFormat.length; i++) {
      edgesFormat[i] = edges.get(i);
    }

    _Graph graph = GenerateAdjacencyList.compute(edgesFormat);
    return TopologicalSort.compute(graph);
  }

  private static String[] firstLetterDifference(String word1, String word2) {
    for (int letter = 0; letter < Math.min(word1.length(), word2.length()); letter++) {
      if (word1.charAt(letter) != word2.charAt(letter)) {
        return new String[] {Character.toString(word1.charAt(letter)), Character.toString(word2.charAt(letter))};
      }
    }

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
