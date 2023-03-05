/**
 *  Homework - Graph
 *
 *  Problem: Graph
 *
 *  Prompt: Create a directed graph class using adjacency list edge
 *          representation.
 *
 *  The Graph will have the following properties:
 *
 *             storage: {HashMap} - the keys represent unique vertex ids {Integer}
 *                      and the values are Lists representing the
 *                      vertex ids of its neighors.
 *
 *  The Graph will also have the following methods:
 *
 *           addVertex: Method that accepts a vertex id {Integer} and adds the
 *                      vertex to the graph.  Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {Integer}
 *                     Output:    {bool}
 *
 *        removeVertex: Method that accepts a vertex id and removes the vertex
 *                      with the matching id. Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {Integer}
 *                     Output:    {bool}
 *
 *             addEdge: Method that accepts two vertex ids and creates a
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                      Input:    id1 {Integer}
 *                      Input:    id2 {Integer}
 *                     Output:    {bool}
 *
 *          removeEdge: Method that accepts two vertex id's and removes the
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                       Input:    id1 {Integer}
 *                       Input:    id2 {Integer}
 *                      Output:    {bool}
 *
 *           isVertex:  Method that accepts an id, and returns whether the vertex
 *                      exists in the graph.
 *
 *                       Input:    id {Integer}
 *                      Output:   {bool}
 *
 *           neighbors: Method that accepts a vertex id, and returns all of the
 *                      edges of that vertex.
 *
 *                       Input:    id {Integer}
 *                      Output:   {List<Integer>}
 *
 *
 *  Input:  {Void}
 *  Output: {Graph}
 *
 *  Notes:   The notation for Time/Auxiliary Space Complexity for graphs
 *           is slightly different since certain functions depend on
 *           either the number of vertices, edges or even both
 *
 *           O(V) = Linear w/ respect to the number of vertices
 *           O(E) = Linear w/ respect to the number of edges
 *           O(V+E) = Linear w/ respect to the number of vertices * number of edges
 */


using System;
using System.Collections.Generic;

class Graph {

  public Dictionary<int, List<int>> storage = new Dictionary<int, List<int>>();

  //   Time Complexity: O(1)
  //   Auxiliary Space Complexity: O(1)
  public bool addVertex(int id) {
    if (storage.ContainsKey(id)) {
      return false;
    }
    storage[id] = new List<int>();
    return true;
  }

  public bool removeVertex(int id) {
    if (!storage.ContainsKey(id)) {
      return false;
    }
    foreach (List<int> edges in storage.Values) {
      int index = edges.IndexOf(id);
      if (index > -1) {
        edges.Remove(index);
      }
    }
    storage.Remove(id);
    return true;
  }

  //   Time Complexity: O(E)
  //   Auxiliary Space Complexity: O(1)
  public bool addEdge(int id1, int id2) {
    if(!storage.ContainsKey(id1) || !storage.ContainsKey(id2)) {
      return false;
    }
    if(storage[id1].IndexOf(id2) >= 0) {
      return false;
    }
    storage[id1].Add(id2);
    return true;
  }

  // Time Complexity: O(1)
  // Auxiliary Space Complexity: O(1)
  public bool removeEdge(int id1, int id2) {
    if (storage.ContainsKey(id1) && storage.ContainsKey(id2)) {
      int index = storage[id1].IndexOf(id2);
      if (index >= 0) {
        storage[id1].RemoveAt(index);
        return true;
      }
    }
    return false;
  }

  //   Time Complexity: O(1)
  //   Auxiliary Space Complexity: O(1)
  public bool isVertex(int id) {
    return storage.ContainsKey(id);
  }

  // Time Complexity: O(1)
  // Auxiliary Space Complexity: O(E)
  public List<int> neighbors(int id) {
    return storage.ContainsKey(id) ? new List<int>(storage[id]) : null;
  }

}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{

    public static void Main() {
        graphClassTests();
        graphAddVertexMethodTests();
        graphRemoveVertexMethodTests();
        graphAddEdgeMethodTests();
        graphRemoveEdgeMethodTests();
        graphIsVertexMethodTests();
        graphNeighborsMethodTests();
    }

    private static void graphClassTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph Class");
        runTest(graphClassTest1, "able to create an instance", testCount);
        runTest(graphClassTest2, "has storage field", testCount);
        runTest(graphClassTest3, "storage property initialized to a dictionary", testCount);
        runTest(graphClassTest4, "storage property initialized as empty", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphAddVertexMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph addVertex method");
        runTest(graphAddVertexMethodTest1, "has addVertex method", testCount);
        runTest(graphAddVertexMethodTest2, "is able to add a vertex", testCount);
        runTest(graphAddVertexMethodTest3, "vertices store a list or set of connections", testCount);
        runTest(graphAddVertexMethodTest4, "is able to add two vertices", testCount);
        runTest(graphAddVertexMethodTest5, "does not add in duplicate vertex", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphRemoveVertexMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph removeVertex method");
        runTest(graphRemoveVertexMethodTest1, "has removeVertex method", testCount);
        runTest(graphRemoveVertexMethodTest2, "able to remove a vertex within graph", testCount);
        runTest(graphRemoveVertexMethodTest3, "does not remove vertex that does not exist", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphAddEdgeMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph addEdge method");
        runTest(graphAddEdgeMethodTest1, "has addEdge method", testCount);
        runTest(graphAddEdgeMethodTest2, "able to create an edge between two vertices that exist", testCount);
        runTest(graphAddEdgeMethodTest3, "addVertex returns true if vertices are added", testCount);
        runTest(graphAddEdgeMethodTest4, "does not create an edge when one of the vertices does not exist", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphRemoveEdgeMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph removeEdge method");
        runTest(graphRemoveEdgeMethodTest1, "has removeEdge method", testCount);
        runTest(graphRemoveEdgeMethodTest2, "able to remove an edge between two vertices", testCount);
        runTest(graphRemoveEdgeMethodTest3, "returns true if able to remove an edge", testCount);
        runTest(graphRemoveEdgeMethodTest4, "does not remove edge when edge does not exist", testCount);
        runTest(graphRemoveEdgeMethodTest5, "returns false if edge does not exist", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphIsVertexMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph isVertex method");
        runTest(graphIsVertexMethodTest1, "has isVertex method", testCount);
        runTest(graphIsVertexMethodTest2, "returns true when a vertex exists", testCount);
        runTest(graphIsVertexMethodTest3, "returns false when a vertex does not exist", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static void graphNeighborsMethodTests() {
        int[] testCount = {0, 0};
        Console.WriteLine("Graph neighbors method");
        runTest(graphNeighborsMethodTest1, "has neighbors method", testCount);
        runTest(graphNeighborsMethodTest2, "returns null if the vertex does not exist", testCount);
        runTest(graphNeighborsMethodTest3, "returns an empty array if vertex has no edges", testCount);
        runTest(graphNeighborsMethodTest4, "returns neighbors if edges exist for a vertex", testCount);
        Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }


   private static bool graphClassTest1() {
       Graph graph = new Graph();
       return graph.GetType() == typeof(Graph);
   }

   private static bool graphClassTest2() {
       return new Graph().GetType().GetField("storage") != null;
   }

   private static bool graphClassTest3() {
       Graph graph = new Graph();
       Type dictType = graph.storage.GetType();
       bool isDict = dictType.IsGenericType;
       isDict = isDict && (dictType.GetGenericTypeDefinition() == typeof(Dictionary<,>) ||
                dictType.GetGenericTypeDefinition() == typeof(IDictionary<,>));
       return isDict;

   }

   private static bool graphClassTest4() {
       Graph graph = new Graph();
       return graph.storage.Count == 0;
   }


   private static bool graphAddVertexMethodTest1() {
       return new Graph().GetType().GetMethod("addVertex") != null;
   }

   private static bool graphAddVertexMethodTest2() {
       Graph graph = new Graph();
       graph.addVertex(5);
       return graph.storage.Count == 1;
   }

   private static bool graphAddVertexMethodTest3() {
       Graph graph = new Graph();
       graph.addVertex(5);
       return graph.storage[5].GetType() == typeof(List<int>) ||
            graph.storage[5].GetType() == typeof(IList<int>);
   }

   private static bool graphAddVertexMethodTest4() {
       Graph graph = new Graph();
       graph.addVertex(5);
       graph.addVertex(10);
       return graph.storage.Count == 2 && (
           graph.storage[10].GetType() == typeof(List<int>) ||
           graph.storage[10].GetType() == typeof(IList<int>)
       );
   }

   private static bool graphAddVertexMethodTest5() {
       Graph graph = new Graph();
       graph.addVertex(5);
       graph.addVertex(5);
       return graph.storage.Count == 1 && graph.storage[5].Count == 0;
   }



    private static bool graphRemoveVertexMethodTest1() {
        return new Graph().GetType().GetMethod("removeVertex") != null;
    }

    private static bool graphRemoveVertexMethodTest2() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.removeVertex(5);
        return graph.storage.Count == 0 && !graph.storage.ContainsKey(5);
    }

    private static bool graphRemoveVertexMethodTest3() {
        Graph graph = new Graph();
        graph.addVertex(5);
        bool result = graph.removeVertex(10);
        return graph.storage.Count == 1 && graph.storage.ContainsKey(5);
    }



    private static bool graphAddEdgeMethodTest1() {
        return new Graph().GetType().GetMethod("addEdge") != null;
    }

    private static bool graphAddEdgeMethodTest2() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addEdge(5, 10);
        return graph.storage[5].Count == 1 &&
                graph.storage[10].Count == 0;
    }

    private static bool graphAddEdgeMethodTest3() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        return graph.addEdge(5, 10) == true;
    }

    private static bool graphAddEdgeMethodTest4() {
        Graph graph = new Graph();
        graph.addVertex(5);
        bool result = graph.addEdge(5, 10);
        return graph.storage[5].Count == 0 && result == false;
    }


    private static bool graphRemoveEdgeMethodTest1() {
        return new Graph().GetType().GetMethod("removeEdge") != null;
    }

    private static bool graphRemoveEdgeMethodTest2() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addEdge(5, 10);
        graph.removeEdge(5, 10);
        return graph.storage[5].Count == 0 && graph.storage.Count == 2;
    }

    private static bool graphRemoveEdgeMethodTest3() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addEdge(5, 10);
        return graph.removeEdge(5, 10) == true;
    }

    private static bool graphRemoveEdgeMethodTest4() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addEdge(5, 10);
        graph.removeEdge(6, 10);
        return graph.storage.ContainsKey(5) && graph.storage[5].Count == 1;
    }

    private static bool graphRemoveEdgeMethodTest5() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addEdge(5, 10);
        return graph.removeEdge(6, 10) == false;
    }


    private static bool graphIsVertexMethodTest1() {
        return new Graph().GetType().GetMethod("isVertex") != null;
    }

    private static bool graphIsVertexMethodTest2() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.isVertex(5);
        return graph.isVertex(5) == true;
    }

    private static bool graphIsVertexMethodTest3() {
        Graph graph = new Graph();
        graph.addVertex(5);
        return graph.isVertex(10) == false;
    }


    private static bool graphNeighborsMethodTest1() {
        return new Graph().GetType().GetMethod("neighbors") != null;
    }

    private static bool graphNeighborsMethodTest2() {
        Graph graph = new Graph();
        return graph.neighbors(5) == null;
    }

    private static bool graphNeighborsMethodTest3() {
        Graph graph = new Graph();
        graph.addVertex(5);
        return graph.neighbors(5).Count == 0;
    }

    private static bool graphNeighborsMethodTest4() {
        Graph graph = new Graph();
        graph.addVertex(5);
        graph.addVertex(10);
        graph.addVertex(15);
        graph.addVertex(20);
        graph.addEdge(5, 10);
        graph.addEdge(5, 15);
        graph.addEdge(5, 20);
        return graph.neighbors(5).Count == 3;
    }



    private static void runTest(Func<bool> test, string testName, int[] testCount){
        testCount[1]++;
        bool testPassed = false;
        // Attempt to run test and suppress exceptions on failure
        try {
            testPassed = test();
            if(testPassed) testCount[0]++;
        } catch {}
        string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
        Console.WriteLine(result);
    }
}
