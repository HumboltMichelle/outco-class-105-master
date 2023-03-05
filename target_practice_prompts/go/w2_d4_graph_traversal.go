/**
 *  Target Practice - Graph Traversal
 *
 *  Instructions: Solve the following graph traversal problems.
 */

package main
import (
  "fmt"
  "strconv"
)

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
type Vertex struct {
  id int
  edges []*Vertex
}

func (vertex *Vertex) Init(i int) *Vertex {
  return &Vertex{id: i, edges: []*Vertex{}}
}

// DO NOT EDIT
// generate graph from int and array of arrays
func deserialize(n int, edges [][]int) *Vertex {
   vertices := make(map[int]*Vertex)
   for i := 0; i < n; i++ {
       vertices[i] = new(Vertex).Init(i)
   }
   var v1,v2 int
   for i := 0; i < len(edges); i++ {
       v1 = edges[i][0]
       v2 = edges[i][1]
       vertices[v1].edges = append(vertices[v1].edges, vertices[v2])
       vertices[v2].edges = append(vertices[v2].edges, vertices[v1])
   }
   return vertices[0]
}


/**
 *  1. Implement Breadth First Search using a queue and while loop.
 *
 *  Input: {Vertex} - the starting vertex
 *  Output: {vector} - an list of vertex ids of the path
 *
 *  HINT: Use a set or hash map to handle redundancy
 */

func bfs(vertex *Vertex) []int {
  // YOUR WORK HERE
  return []int{}
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


func dfs(src *Vertex, dest int) [][] int {
  // YOUR WORK HERE
  return [][]int{}
}




////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  bfsTests()
  dfsTests()
}

func bfsTests() {
  testCount := []int{0,0}
  fmt.Println("Breadth First Search tests")
  runTest(bfsTest1, "able to return the elements of a graph in breadth first manner", testCount)
  runTest(bfsTest2, "should return only starting initial node if no edges exist in graph", testCount)
  runTest(bfsTest3, "should return elements of simple graph: 0 - 1 - 2 starting at 0", testCount)
  printTestsPassed(testCount)
}

func dfsTests() {
  testCount := []int{0,0}
  fmt.Println("Depth First Search Tests")
  runTest(dfsTest1, "should return all valid dfs paths for connected graph with a cycle", testCount)
  runTest(dfsTest2, "should return valid dfs for connected graph with no cycle", testCount)
  runTest(dfsTest3, "should return valid dfs for unconnected graphs with a path", testCount)
  runTest(dfsTest4, "should return valid dfs for unconnected graphs with no path", testCount)
  printTestsPassed(testCount)
}


func bfsTest1() bool {
  var test *Vertex = deserialize(8, [][]int{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}})
  var results []int = bfs(test)
  return validBfs(results, test)
}

func bfsTest2() bool {
  var test *Vertex = deserialize(8, [][]int{})
  var results []int = bfs(test)
  return validBfs(results, test)
}

func bfsTest3() bool {
  var test *Vertex = deserialize(8, [][]int{{0,1}, {1,2}})
  var results []int = bfs(test)
  return validBfs(results, test)
}


func dfsTest1() bool {
  var test *Vertex = deserialize(8, [][]int{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}})
  var destinationID int = 3
  var results [][]int = dfs(test, destinationID)

  solution := [][]int{{0, 1, 2, 4, 5, 3},
                      {0, 1, 2, 4, 6, 5, 3},
                      {0, 1, 7, 4, 5, 3},
                      {0, 1, 7, 4, 6, 5, 3}}
  return array2DEqualsUnordered(results, solution)
}

func dfsTest2() bool {
  var testGraph *Vertex = deserialize(8, [][]int{{0, 1}, {1, 5}, {1, 2}, {2, 4}, {4, 3}})
  var destinationID int = 3
  var results [][]int = dfs(testGraph, destinationID)
  return validDfs(results, testGraph, destinationID)
}

func dfsTest3() bool {
  var testGraph *Vertex = deserialize(7, [][]int{{5,1}, {5,6}, {1,2}, {2,4}, {0,3}})
  var destinationID int = 3
  var results [][]int = dfs(testGraph, destinationID)
  return validDfs(results, testGraph, destinationID)
}

func dfsTest4() bool {
  var testGraph *Vertex = deserialize(7, [][]int{{0,1}, {1,6}, {1,2}, {2,4}, {5,3}})
  var destinationID int = 3
  var results [][]int = dfs(testGraph, destinationID)
  return validDfs(results, testGraph, destinationID)
}


/*** Utility Functions ***/
func copySlice(slice []int) []int{
  res := make([]int, len(slice))
  for i,val := range slice {
      res[i] = val
  }
  return res
}

func equalIntArr(list1 []int, list2 []int) bool {
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

//Check if 2 lists contain sublists that match but are not necessarily in the same order
func array2DEqualsUnordered(arr1 [][]int, arr2 [][]int) bool {
  if len(arr1) != len(arr2) { return false }
  count := 0
  for _,subArr1 := range arr1 {
    for _,subArr2 := range arr2 {
      if equalIntArr(subArr1, subArr2) {
        count++
        break
      }
    }
  }
  return count == len(arr1)
}

func getNeighbors(vertex *Vertex, visited map[int]*Vertex) []*Vertex {
      results := []*Vertex{}
      for _,neighbor := range vertex.edges {
        if visited[neighbor.id] == nil {
          results = append(results, neighbor)
        }
      }
      return results
}

func getValues(vertices []*Vertex) []int {
    results := []int{}
    for _,vertex := range vertices {
        results = append(results, vertex.id)
    }
    return results
}

// function for checking if arrays contain same elements
// (do not need to be in the same order)
func listsMatching(list1 []int, list2 []int) bool {
    if len(list1) != len(list2) {
        fmt.Println("listMatching: not equal length")
        return false
    }
    cache := make(map[int]int)
    for _,value := range list1 {
        cache[value] = cache[value] + 1;
    }
    for _,value := range list2 {
        if cache[value] == 0 {
          return false
        }
        cache[value]--
    }
    return true
}


func validBfs(path []int, start *Vertex) bool {
      if len(path) == 0 && start != nil { return false }
      if path[0] != start.id { return false }

      var current *Vertex = start
      visited := make(map[int]*Vertex)
      visited[current.id] = current
      j := 1
      for i := 0; i < len(path) - 1; i++ {
          if i >= j {
            return false
          }
          var neighbors []*Vertex = getNeighbors(current, visited)
          var neighborIds []int = getValues(neighbors)
          var subPath []int = path[j:(j+len(neighborIds))]
          if !listsMatching(neighborIds, subPath) {
              return false
          }
          j += len(neighborIds)
          for k := 0; k < len(neighbors); k++ {
              visited[neighbors[k].id] = neighbors[k]
          }
          current = visited[path[i + 1]]
      }
      return true
}

func testDfs(current *Vertex, visited map[int]bool, destID int) bool {
    if visited[current.id] { return false }
    visited[current.id] = true
    if current.id == destID { return true }
    for _,neighbor := range current.edges {
        if !visited[neighbor.id] {
          if testDfs(neighbor, visited, destID) { return true }
        }
    }
    delete(visited, current.id)
    return false
}

// takes in an array of path and a vertex start point and determines whether
// the dfs is valid
func validDfs(paths [][]int, source *Vertex, destID int) bool {
    for _,path := range paths {
        if path[0] != source.id || path[len(path)-1] != destID{
            return false
        }
        var current *Vertex = source
        isValid := false
        for node := 1; node < len(path); node++ {
            for _,neighbor := range current.edges {
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

    /* sometimes you hit here if the input is an empty array */
    /* check that there is a valid path through doing dfs */
    visited := make(map[int]bool)
    return !(len(paths) == 0 && testDfs(source, visited, destID))
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
