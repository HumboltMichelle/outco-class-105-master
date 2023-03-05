/**
 *  Target Practice - Graph Traversal
 *
 *  Instructions: Solve the following graph traversal problems.
 */


/**
 *  1. For the example graph below, what an expected output if we printed
 *     each vertex value from vertex 0 outwards using:
 *
 *     a. BREADTH FIRST traversal:
 *     b. DEPTH FIRST traversal:
 *
 *     NOTE: The traversal should take care of redundancy and not print the same
 *           vertex value twice.
 *
 *     Example Graph:
 *
 *              2
 *            /   \
 *    0 ~~~ 1       4  ~~~ 5 ~~~ 3
 *            \   /   \   /
 *              7       6
 */

using System;
using System.Linq;
using System.Collections.Generic;

// DO NOT EDIT
// Vertex class
class Vertex {
    public int id;
    public List<Vertex> edges;

    public Vertex(int id) {
        this.id = id;
        this.edges = new List<Vertex>();
    }
}

class Problems {

    // DO NOT EDIT
    // generate graph from int and array of arrays
    public static Vertex deserialize(int n, int[,] edges){
        Dictionary<int, Vertex> vertices = new Dictionary<int, Vertex>();
        for (int i = 0; i < n; i++) {
            vertices[i] = new Vertex(i);
        }
        int v1;
        int v2;
        for (int i = 0; i < edges.GetLength(0); i++) {
            v1 = edges[i,0];
            v2 = edges[i,1];
            vertices[v1].edges.Add(vertices[v2]);
            vertices[v2].edges.Add(vertices[v1]);
        }
        return vertices[0];
    }

    /**
     *  1. Implement Breadth First Search using a queue and while loop.
     *
     *  Input: {Vertex} - the starting vertex
     *  Output: {List} - an list of vertex ids of the path
     *
     *  HINT: Use a set or hash map to handle redundancy
     */

    public static List<int> bfs(Vertex vertex) {
     // YOUR WORK HERE
     return new List<int>();
    }

    /**
     *  2. Given a starting vertex, and an integer destination, return all valid
     *     paths for a given source and destination.
     *
     *  Input: {Vertex} - the starting vertex
     *         {Destination} - integer value of the destination vertex
     *  Output: {List} - a list of lists of vertex ids (integers) for different paths
     *
     *  HINT: Use a set or hash map to handle redundancy
     *
     *  NOTE: Please be aware that this problem is a slight variation
     *    of the HackerRank challenge that was provided in class. How would you
     *    handle things differently if each path returned needed to be a list?
     */

    public static List<List<int>> dfs(Vertex src, int dest) {
    // YOUR WORK HERE
    return new List<List<int>>();
    }



}

 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

// use the Test class to run the test cases
class Test{



  public static void Main() {
    bfsTests();
    dfsTests();
	}

  private static void bfsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Breadth First Search tests");
    runTest(bfsTest1, "able to return the elements of a graph in breadth first manner", testCount);
    runTest(bfsTest2, "should return only starting initial node if no edges exist in graph", testCount);
    runTest(bfsTest3, "should return elements of simple graph: 0 - 1 - 2 starting at 0", testCount);
    printTestsPassed(testCount);
  }

  private static void dfsTests() {
    int[] testCount = {0, 0};
    Console.WriteLine("Depth First Search Tests");
    runTest(dfsTest1, "should return all valid dfs paths for connected graph with a cycle", testCount);
    runTest(dfsTest2, "should return valid dfs for connected graph with no cycle", testCount);
    runTest(dfsTest3, "should return valid dfs for unconnected graphs with a path", testCount);
    runTest(dfsTest4, "should return valid dfs for unconnected graphs with no path", testCount);
    printTestsPassed(testCount);
  }

  private static List<Vertex> getNeighbors(Vertex vertex, Dictionary<int, Vertex> visited) {
        List<Vertex> results = new List<Vertex>();
        List<Vertex> edges = vertex.edges;
        Vertex neighbor;
        for (int i = 0; i < edges.Count; i++) {
            neighbor = edges[i];
            if(!visited.ContainsKey(neighbor.id)) {
                results.Add(neighbor);
            }
        }
        return results;
    }

    private static List<int> getValues(List<Vertex> vertices) {
        List<int> results = new List<int>();
        for (int i = 0; i < vertices.Count; i++) {
            results.Add(vertices[i].id);
        }
        return results;
    }

    private static List<Vertex> removeVisited(List<Vertex> vertices, HashSet<Vertex> visited) {
        List<Vertex> results = new List<Vertex>();
        for (int i = 0; i < vertices.Count; i++) {
            Vertex vertex = vertices[i];
            if (!visited.Contains(vertex)) {
                results.Add(vertex);
            }
        }
        return results;
    }

    // function for checking if arrays contain same elements
    // (do not need to be in the same order)
    private static bool listsMatching(List<int> list1, List<int> list2) {
        if (list1.Count != list2.Count) {
            Console.WriteLine("listMatching: not equal length");
            return false;
        }

        Dictionary<int, int> cache = new Dictionary<int, int>();
        for (int i = 0 ; i < list1.Count ; i++) {
            int value = list1[i];
            int count = cache.ContainsKey(value) ? cache[value] : 0;
            cache[value] = count + 1;
        }

        for (int j = 0; j < list2.Count; j++) {
            int value = list2[j];
            if (!cache.ContainsKey(value) || cache[value] == 0) {
                return false;
            }
            cache[value]--;
        }

        return true;
    }

  private static bool validBfs(List<int> path, Vertex start) {
        if (path.Count == 0 && start != null) {
            return false;
        }
        if (path[0] != start.id) {
            return false;
        }

        Vertex current = start;
        Dictionary<int, Vertex> visited = new Dictionary<int, Vertex>();
        visited[current.id] = current;
        for (int i = 0, j = 1; i < path.Count - 1; i++) {
            if (i >= j) {
                return false;
            }
            List<Vertex> neighbors = getNeighbors(current, visited);

            List<int> values = getValues(neighbors);
            List<int> subPath = path.GetRange(j, values.Count);
            if (!listsMatching(values, subPath)) {
                return false;
            }
            j += values.Count;
            for(int k = 0; k < neighbors.Count; k++) {
                visited[neighbors[k].id] = neighbors[k];
            }

            current = visited[path[i + 1]];
        }

        return true;
    }

    private static bool testDfs(Vertex current, HashSet<int> visited, int destID){
        if(visited.Contains(current.id)) return false;
        visited.Add(current.id);
        if(current.id.Equals(destID)) return true;
        List<Vertex> neighbors = current.edges;
        foreach(Vertex neighbor in neighbors){
            if(!visited.Contains(neighbor.id)){
                if(testDfs(neighbor, visited, destID)) return true;
            }
        }
        visited.Remove(current.id);
        return false;
    }

    // takes in an array of path and a vertex start point and determines whether
    // the dfs is valid
    private static bool validDfs(List<List<int>> paths, Vertex source, int destID) {
        foreach(List<int> path in paths){
            if(path[0] != source.id) {
                return false;
            }
            if(!path[path.Count-1].Equals(destID)){
                return false;
            }
            Vertex current = source;
            bool isValid = false;
            for(int node = 1; node < path.Count; node++) {
                List<Vertex> neighbors = current.edges;
                foreach(Vertex neighbor in neighbors){
                    if(neighbor.id.Equals(path[node])) {
                        isValid = true;
                        current = neighbor;
                        break;
                    }
                }
                if(!isValid){
                    return false;
                }
            }
        }

        /* sometimes you hit here if the input is an empty array */
        /* check that there is a valid path through doing dfs */
        if(testDfs(source, new HashSet<int>(), destID) && paths.Count==0) return false;
        return true;
    }

    //Check if 2 lists contain sublists that match but are not necessarily in the same order
    private static bool array2DEqualsUnordered(List<List<int>> arr1, List<List<int>> arr2) {
        if (arr1 == null) return (arr2 == null);
        if (arr2 == null) return false;
        if (arr1.Count != arr2.Count) return false;
        int count = 0;
        foreach(List<int> subArr1 in arr1){
            foreach(List<int> subArr2 in arr2){
                if(subArr1.SequenceEqual(subArr2)){
                    count++;
                    break;
                }
            }
        }
        return count == arr1.Count;
    }


  private static bool bfsTest1() {
    Vertex test = Problems.deserialize(8, new int[,]{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
    List<int> results = Problems.bfs(test);
    return validBfs(results, test);
  }

  private static bool bfsTest2() {
    Vertex test = Problems.deserialize(8, new int[,]{});
    List<int> results = Problems.bfs(test);
    return validBfs(results, test);
  }

  private static bool bfsTest3() {
    Vertex test = Problems.deserialize(8, new int[,]{{0,1}, {1,2}});
    List<int> results = Problems.bfs(test);
    return validBfs(results, test);
  }



  private static bool dfsTest1() {
    Vertex testGraph = Problems.deserialize(8, new int[,]{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
    int destinationID = 3;
    List<List<int>> results = Problems.dfs(testGraph, destinationID);

    List<List<int>> solution = new List<List<int>>();
    solution.Add(new List<int>{0, 1, 2, 4, 5, 3});
    solution.Add(new List<int>{0, 1, 2, 4, 6, 5, 3});
    solution.Add(new List<int>{0, 1, 7, 4, 5, 3});
    solution.Add(new List<int>{0, 1, 7, 4, 6, 5, 3});

    return array2DEqualsUnordered(results, solution);
  }

  private static bool dfsTest2() {
    Vertex testGraph = Problems.deserialize(6, new int[,]{{0, 1}, {1, 5}, {1, 2}, {2, 4}, {4, 3}});
    int destinationID = 3;
    List<List<int>> results = Problems.dfs(testGraph, destinationID);
    return validDfs(results, testGraph, destinationID);
  }

  private static bool dfsTest3() {
    Vertex testGraph = Problems.deserialize(7, new int[,]{{5,1}, {5,6}, {1,2}, {2,4}, {0,3}});
    int destinationID = 3;
    List<List<int>> results = Problems.dfs(testGraph, destinationID);
    return validDfs(results, testGraph, destinationID);
  }

  private static bool dfsTest4() {
    Vertex testGraph = Problems.deserialize(7, new int[,]{{0,1}, {1,6}, {1,2}, {2,4}, {5,3}});
    int destinationID = 3;
    List<List<int>> results = Problems.dfs(testGraph, destinationID);
    return validDfs(results, testGraph, destinationID);
  }


  // DO NOT TOUCH FUNCTIONS BELOW

  // Custom runTest function to handle tests
  // Function<bool> test : performs a set of operations and returns a bool
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
      } catch (Exception e) {
        Console.WriteLine(e);
      }
      string result = "  " + (testCount[1] + ")   ") + testPassed + " : " + testName;
      Console.WriteLine(result);
  }
  // this is to print the number of test cases passed for a test suite function
  private static void printTestsPassed(int[] testCount) {
    Console.WriteLine("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
  }
}
