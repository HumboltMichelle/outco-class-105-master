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

class Graph {
  var storage: [Int: [Int]] = [:]

  // Time Complexity:
  // Auxiliary Space Complexity:
  func addVertex(_ id: Int) -> Bool {
  // YOUR WORK HERE
  return false
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func addEdge(_ id1: Int,_ id2: Int) -> Bool {
  // YOUR WORK HERE
  return false
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func removeEdge(_ id1: Int, _ id2: Int) -> Bool {
  // YOUR WORK HERE
  return false
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func removeVertex(_ id: Int) -> Bool {
    // YOUR WORK HERE
    return false
  }

  // Time Complexity:
  // Auxiliary Space Complexity:
  func isVertex(_ id: Int) -> Bool {
  //YOUR WORK HERE
  return false
}

  // Time Complexity:
  // Auxiliary Space Complexity:
  func neighbors(_ id: Int) -> [Int]? {
  //YOUR WORK HERE
  return nil
  }
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

var testCount: [Int] = [0, 0]

print("Graph Class")

assert(&testCount, "has storage property",  {
  let g = Graph()
  return g.storage.count == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]


print("Graph addVertex method")


assert(&testCount, "is able to add a single vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  return g.storage.count == 1 && g.storage[1] != nil
})


assert(&testCount, "is able to add multiple vertices",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addVertex(3)
  return g.storage.count == 3 &&
         g.storage[1] != nil &&
         g.storage[2] != nil &&
         g.storage[3] != nil
})

assert(&testCount, "does not add repeat vertices",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(1)
  return g.storage.count == 1
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]




print("Graph addEdge method")

assert(&testCount, "adds a single edge properly",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.storage.count == 2 && (g.storage[1]?.contains(2))!
})

assert(&testCount, "adds multiple edges properly",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addVertex(3)
  let _ = g.addEdge(1, 2)
  let _ = g.addEdge(1, 3)

  return g.storage.count == 3 && (g.storage[1]?.contains(2))! && (g.storage[1]?.contains(3))!
})

assert(&testCount, "does not repeat edges",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  let _ = g.addEdge(1, 2)

  return g.storage.count == 2 && (g.storage[1]?.contains(2))! && g.storage[1]?.count == 1
})

assert(&testCount, "does not add edges between 1 invalid vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 3)

  return g.storage.count == 2 && g.storage[1]?.count == 0
})

assert(&testCount, "does not add edges between 2 invalid vertices",  {
  let g = Graph()
  return g.addEdge(1, 2) == false && g.storage.count == 0
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]



print("Graph removeEdge method")


assert(&testCount, "removes a single edge properly",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.removeEdge(1, 2) == true
})

assert(&testCount, "does not remove nonexsitent edge",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  return g.removeEdge(1, 2) == false
})

assert(&testCount, "removes multiple edges",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addVertex(3)
  let _ = g.addEdge(1, 2)
  let _ = g.addEdge(1, 3)
  return g.removeEdge(1, 2) == true && g.removeEdge(1, 3) == true && g.storage[1]?.count == 0
})

assert(&testCount, "does not remove edge from 1 invalid vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.removeEdge(1, 3) == false && g.storage[1]?.count == 1
})

assert(&testCount, "does not remove edge from 2 invalid vertices",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.removeEdge(3, 4) == false && g.storage[1]?.count == 1
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]



print("Graph removeVertex method")


assert(&testCount, "removes single unconnected vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  return g.removeVertex(1) == true && g.storage.count == 0
})


assert(&testCount, "removes multiple unconnected vertices",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  return g.removeVertex(1) == true && g.removeVertex(2) == true && g.storage.count == 0
})

assert(&testCount, "removes vertex with one connection from it",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.removeVertex(1) == true && g.storage.count == 1
  // && g.neighbors(2)!.count == 0
})

assert(&testCount, "removes vertex with one connection to it",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.removeVertex(2) == true && g.storage.count == 1
  // && g.neighbors(1).count == 0
})


assert(&testCount, "removes vertex with multiple connections to it",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addVertex(3)
  let _ = g.addVertex(4)
  let _ = g.addEdge(2, 1)
  let _ = g.addEdge(3, 1)
  let _ = g.addEdge(4, 1)

  return g.removeVertex(1) == true &&
         g.storage.count == 3 &&
         g.storage[2]?.count == 0 &&
         g.storage[3]?.count == 0 &&
         g.storage[4]?.count == 0
})

assert(&testCount, "does not remove nonexsitent vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  return g.removeVertex(2) == false && g.storage.count == 1
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]



print("Graph isVertex method")

assert(&testCount, "returns true when a vertex exists",  {
  let g = Graph()
  let _ = g.addVertex(1)
  return g.isVertex(1) == true
})

assert(&testCount, "returns false when a vertex doesn't exist",  {
  let g = Graph()
return g.isVertex(1) == false
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]




print("Graph neighbors method")

assert(&testCount, "returns empty array for unconnected vertex",  {
  let g = Graph()
  let _ = g.addVertex(1)
  return g.neighbors(1)?.count == 0
})

assert(&testCount, "returns nil for nonexsitent vertex",  {
  let g = Graph()
  return g.neighbors(1) == nil
})


assert(&testCount, "works for a vertex with one edge",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addEdge(1, 2)
  return g.neighbors(1)?.count == 1 && (g.neighbors(1)?.contains(2))!
})

assert(&testCount, "works for a vertex with multiple edges",  {
  let g = Graph()
  let _ = g.addVertex(1)
  let _ = g.addVertex(2)
  let _ = g.addVertex(3)
  let _ = g.addVertex(4)
  let _ = g.addEdge(1, 2)
  let _ = g.addEdge(1, 3)
  let _ = g.addEdge(1, 4)
  return g.neighbors(1)?.count == 3
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
testCount = [0, 0]
