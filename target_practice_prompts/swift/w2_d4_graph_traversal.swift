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

// DO NOT EDIT
// Vertex class
class Vertex {
  var id: Int
  var edges = [Vertex]()

  init(_ id: Int) {
    self.id = id
  }
}

// DO NOT EDIT
// generate graph from int and array of arrays
func deserialize(_ n: Int, _ edges: [[Int]]) -> Vertex {
  var vertices: [Int: Vertex] = [:]
  for i in 0..<n {
    vertices[i] = Vertex(i)
  }
  var v1: Int
  var v2: Int
  for edge in edges {
    v1 = edge[0]
    v2 = edge[1]
    vertices[v1]!.edges.append(vertices[v2]!)
    vertices[v2]!.edges.append(vertices[v1]!)
  }

  return vertices[0]!
}

// DO NOT EDIT
// sampleGraph is the vertex with id 0
let sampleGraph: Vertex = deserialize(8, [[0, 1], [1, 2], [2, 4], [3, 5], [4, 5], [1, 7], [4, 6], [4, 7], [5, 6]])

/**
 *  1. Implement Breadth First Search using a queue and while loop.
 *
 *  Input: vertex: Vertex - a starting vertex
 *  Output: [Int] - an array of vertex ids of the path
 *
 *  NOTE: You may use an array or linked list for your queue.
 *
 *  HINT: Use a set or hash table to handle redundancy
 */
func bfs(_ vertex: Vertex) -> [Int] {
  // YOUR WORK HERE
  return [-1]
}


/**
 *  2. Given a starting vertex, and an integer destination, return all valid
 *     paths for a given source and destination.
 *
 *  Input: {Vertex} - the starting vertex
 *         {Destination} - integer value of the destination vertex
 *  Output: {Array} - an array of arrays of integers
 *
 *  HINT: Use a set or hash map to handle redundancy
 *
 *  NOTE: Please be aware that this problem is a slight variation
 *    of the HackerRank challenge that was provided in class. How would you
 *    handle things differently if each path returned needed to be a list?
 */
func dfs(_ vertex: Vertex, _ destination: Int) -> [[Int]] {
  // YOUR WORK HERE
  return [[-1]]
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

func filterVisited(_ vertices: [Vertex], _ visited: [Int: Vertex]) -> [Vertex] {
  return vertices.filter { visited[$0.id] == nil }
}

func getIds(_ vertices: [Vertex]) -> [Int] {
  return vertices.map { $0.id }
}

func arraysMatching<T: Hashable>(_ arr1: [T], _ arr2: [T]) -> Bool {
  if arr1.count != arr2.count {
    return false
  }

  var cache = [T: Int]()
  for value in arr1 {
    if cache[value] == nil {
      cache[value] = 1
    }  else {
      cache[value] = cache[value]! + 1
    }
  }

  for value in arr2 {
    if cache[value] == nil || cache[value] == 0 {
      return false
    }
    cache[value] = cache[value]! - 1
  }
  return true
}

// takes in an array of path and a vertex start point and determines whether
// the bfs is valid
func validBfs(_ path: [Int], _ start: Vertex) -> Bool {
  if path[0] != start.id { return false }

  var visited = [Int: Vertex]()
  var neighbors: [Vertex]
  var ids: [Int]
  visited[start.id] = start
  var current: Vertex;
  var i = 0
  var j = 1

  while i < path.count {
    if i >= j { return false }
    current = visited[path[i]]!
    neighbors = filterVisited(current.edges, visited)
    ids = getIds(neighbors)
    if !arraysMatching(ids, j >= path.count ? [Int]() : Array(path[j..<(j + ids.count)])) { return false }
    j += ids.count
    for vertex in neighbors {
      visited[vertex.id] = vertex
    }
    i += 1
  }

  return true
}


// takes in an array of path and a vertex start point and determines whether
// the dfs is valid
/*
func validDfs(_ path: [Int], _ start: Vertex) -> Bool {
  if path[0] != start.id { return false }

  var stack: [[Vertex]] = []
  var visited = [Int: Vertex]()
  var moves: [Vertex] = [start]
  var current: Vertex?

  for id in path {
    while moves.count == 0 {
      if stack.count == 0 { return false }
      moves = filterVisited(stack.removeLast(), visited)
    }
    current = moves.first( where: { $0.id == id })
    if current == nil { return false }
    visited[current!.id] = current
    stack.append(moves)
    moves = filterVisited(current!.edges, visited)
  }
  while stack.count > 0 {
    if filterVisited(stack.removeLast(), visited).count > 0 { return false }
  }
  return true
}
*/

func validDFS(_ paths: [[Int]], _ source: Vertex, _ destID: Int) -> Bool {
  for path in paths {
    if path[0] != source.id {
      return false
    }
    if path[path.count - 1] != destID {
      return false
    }

    var current: Vertex = source
    var isValid: Bool = false

    for node in 1..<paths.count {
      let neighbors: [Vertex] = current.edges
      for neighbor in neighbors {
        if neighbor.id == path[node] {
          isValid = true
          current = neighbor
          break
        }
      }
      if !isValid {
        return false
      }
    }
  }

  if testDFS(source, Set<Int>(), destID) && paths.count == 0 {return false}

  return true
}

func testDFS(_ current: Vertex, _ visited: Set<Int>, _ destID: Int) -> Bool {
  if visited.contains(current.id) {return false}
  var visited = visited
  visited.insert(current.id)
  if current.id == destID {return true}
  let neighbors: [Vertex] = current.edges
  for neighbor in neighbors {
    if !visited.contains(neighbor.id) {
      if testDFS(neighbor, visited, destID) {return true}
    }
  }
  visited.remove(current.id)
  return false
}

let testGraph = deserialize(8, [[0, 1], [1, 2], [2, 4], [3, 5], [4, 5], [1, 7], [4, 6], [4, 7], [5, 6]])

print("Breadth First Search tests")
var testCount: [Int] = [0, 0]

assert(&testCount, "able to return the elements of a graph in breadth first manner",  {
  let results = bfs(testGraph)
  return validBfs(results, testGraph)
})

assert(&testCount, "should return only starting initial node if no edges exist in graph", {
  let graph = deserialize(8, [])
  let results = bfs(graph)
  return validBfs(results, graph)
})

assert(&testCount, "should return elements of simple graph: 0 - 1 - 2 starting at 0", {
  let graph = deserialize(3, [[0,1],[1,2]])
  let results = bfs(graph)
  return validBfs(results, graph)
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")

print("Depth First Search tests")
testCount = [0, 0]

assert(&testCount, "should return valid dfs for connected graph with a cycle",  {
  let results = dfs(testGraph, 3)
  let destination = 3
  return validDFS(results, testGraph, destination)
})

assert(&testCount, "should return valid dfs for connected graph with no cycle",  {
  let source = deserialize(6, [[0, 1], [1, 5], [1, 2], [2, 4], [4, 3]])
  let destination = 3
  let results = dfs(source, destination)
  return validDFS(results, source, destination)
})

assert(&testCount, "should return valid dfs for unconnected graphs with a path",  {
  let source = deserialize(7, [[5,1], [5,6], [1,2], [2,4], [0,3]])
  let destination = 3
  let results = dfs(source, destination)
  return validDFS(results, source, destination)
})

assert(&testCount, "should return valid dfs for unconnected graphs with no path",  {
  let source = deserialize(7, [[0,1], [1,6], [1,2], [2,4], [5,3]])
  let destination = 3
  let results = dfs(source, destination)
  return validDFS(results, source, destination)
})

print("PASSED: ", testCount[0], " / ", testCount[1], "\n\n")
