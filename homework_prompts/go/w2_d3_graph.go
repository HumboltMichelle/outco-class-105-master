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

package main
import (
  "fmt"
  "strconv"
  "reflect"
)



type Graph struct {
  storage map[int][]int
}

func (graph *Graph) Init() {
  // YOUR WORK HERE
}

//   Time Complexity:
//   Auxiliary Space Complexity:
func (graph *Graph) addVertex(id int) bool {
  // YOUR WORK HERE
  return true
}


func (graph *Graph) removeVertex(id int) bool {
  // YOUR WORK HERE
  return true
}


// Time Complexity:
// Auxiliary Space Complexity:
func (graph *Graph) addEdge(id1 int, id2 int) bool {
  // YOUR WORK HERE
  return true
}


// Time Complexity:
// Auxiliary Space Complexity:
func (graph *Graph) removeEdge(id1 int, id2 int) bool {
  // YOUR WORK HERE
  return true
}


//   Time Complexity:
//   Auxiliary Space Complexity:
func (graph *Graph) isVertex(id int) bool {
  // YOUR WORK HERE
  return true
}


// Time Complexity:
// Auxiliary Space Complexity:
func (graph *Graph) neighbors(id int) []int {
  // YOUR WORK HERE
  return []int{}
}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

func main() {
  graphClassTests()
  graphAddVertexMethodTests()
  graphRemoveVertexMethodTests()
  graphAddEdgeMethodTests()
  graphRemoveEdgeMethodTests()
  graphIsVertexMethodTests()
  graphNeighborsMethodTests()
}

func graphClassTests() {
  testCount := []int{0,0}
  fmt.Println("Graph Class")
  runTest(graphClassTest1, "able to create an instance", testCount)
  runTest(graphClassTest2, "has storage field", testCount)
  printTestsPassed(testCount)
}

func graphAddVertexMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph addVertex method")
  runTest(graphAddVertexMethodTest1, "is able to add a vertex", testCount)
  runTest(graphAddVertexMethodTest2, "vertices store a list or set of connections", testCount)
  runTest(graphAddVertexMethodTest3, "is able to add two vertices", testCount)
  runTest(graphAddVertexMethodTest4, "does not add in duplicate vertex", testCount)
  printTestsPassed(testCount)
}

func graphRemoveVertexMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph removeVertex method")
  runTest(graphRemoveVertexMethodTest1, "able to remove a vertex within graph", testCount)
  runTest(graphRemoveVertexMethodTest2, "does not remove vertex that does not exist", testCount)
  printTestsPassed(testCount)
}

func graphAddEdgeMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph addEdge method")
  runTest(graphAddEdgeMethodTest1, "able to create an edge between two vertices that exist", testCount)
  runTest(graphAddEdgeMethodTest2, "addVertex returns true if vertices are added", testCount)
  runTest(graphAddEdgeMethodTest3, "does not create an edge when one of the vertices does not exist", testCount)
  printTestsPassed(testCount)
}

func graphRemoveEdgeMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph removeEdge method")
  runTest(graphRemoveEdgeMethodTest1, "able to remove an edge between two vertices", testCount)
  runTest(graphRemoveEdgeMethodTest2, "returns true if able to remove an edge", testCount)
  runTest(graphRemoveEdgeMethodTest3, "does not remove edge when edge does not exist", testCount)
  runTest(graphRemoveEdgeMethodTest4, "returns false if edge does not exist", testCount)
  printTestsPassed(testCount)
}

func graphIsVertexMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph isVertex method")
  runTest(graphIsVertexMethodTest1, "returns true when a vertex exists", testCount)
  runTest(graphIsVertexMethodTest2, "returns false when a vertex does not exist", testCount)
  printTestsPassed(testCount)
}

func graphNeighborsMethodTests() {
  testCount := []int{0,0}
  fmt.Println("Graph neighbors method")
  runTest(graphNeighborsMethodTest1, "returns null if the vertex does not exist", testCount)
  runTest(graphNeighborsMethodTest2, "returns an empty array if vertex has no edges", testCount)
  runTest(graphNeighborsMethodTest3, "returns neighbors if edges exist for a vertex", testCount)
  printTestsPassed(testCount)
}




func graphClassTest1() bool {
  graph := Graph{}
	return reflect.TypeOf(graph) == reflect.TypeOf(Graph{})
}

func graphClassTest2() bool {
  graph := Graph{}
  return reflectStructField(graph, "storage")
}


func graphAddVertexMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  return len(graph.storage) == 1
}

func graphAddVertexMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
	return typeofobject(graph.storage[5]) == "[]int"
}

func graphAddVertexMethodTest3() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  return len(graph.storage) == 2 &&
    typeofobject(graph.storage[10]) == "[]int"
}

func graphAddVertexMethodTest4() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(5)
  return len(graph.storage) == 1 && len(graph.storage[5]) == 0
}



func graphRemoveVertexMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.removeVertex(5)
  return len(graph.storage) == 0 && !mapContainsKey(graph.storage, 5)
}

func graphRemoveVertexMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.removeVertex(10)
  return len(graph.storage) == 1 && mapContainsKey(graph.storage, 5)
}



func graphAddEdgeMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addEdge(5, 10)
  return len(graph.storage[5]) == 1 && len(graph.storage[10]) == 0
}

func graphAddEdgeMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  return graph.addEdge(5, 10) == true
}

func graphAddEdgeMethodTest3() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  var result bool = graph.addEdge(5, 10)
  return len(graph.storage[5]) == 0 && result == false
}


func graphRemoveEdgeMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addEdge(5, 10)
  graph.removeEdge(5, 10)
  return len(graph.storage[5]) == 0 && len(graph.storage) == 2
}

func graphRemoveEdgeMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addEdge(5, 10)
  return graph.removeEdge(5, 10) == true
}

func graphRemoveEdgeMethodTest3() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addEdge(5, 10)
  graph.removeEdge(6, 10)
  return mapContainsKey(graph.storage, 5) && len(graph.storage[5]) == 1
}

func graphRemoveEdgeMethodTest4() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addEdge(5, 10)
  return graph.removeEdge(6, 10) == false
}



func graphIsVertexMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.isVertex(5)
  return graph.isVertex(5) == true
}

func graphIsVertexMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  return graph.isVertex(10) == false
}



func graphNeighborsMethodTest1() bool {
  graph := Graph{}
  graph.Init()
  return graph.neighbors(5) == nil
}

func graphNeighborsMethodTest2() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  return len(graph.neighbors(5)) == 0
}

func graphNeighborsMethodTest3() bool {
  graph := Graph{}
  graph.Init()
  graph.addVertex(5)
  graph.addVertex(10)
  graph.addVertex(15)
  graph.addVertex(20)
  graph.addEdge(5, 10)
  graph.addEdge(5, 15)
  graph.addEdge(5, 20)
  return len(graph.neighbors(5)) == 3
}





/*** Utility Functions ***/
// Reflect if an interface is either a struct or a pointer to a struct
// and has the defined member field, if error is nil, the given
// FieldName exists and is accessible with reflect.
// Source: https://mrwaggel.be/post/golang-reflect-if-initialized-struct-has-member-method-or-fields/
func reflectStructField(heap interface{}, fieldName string) bool {
  valueIface := reflect.ValueOf(heap)

  // Check if the passed interface is a pointer
  if valueIface.Type().Kind() != reflect.Ptr {
  	// Create a new type of Iface's Type, so we have a pointer to work with
  	valueIface = reflect.New(reflect.TypeOf(heap))
  }

  // 'dereference' with Elem() and get the field by name
  field := valueIface.Elem().FieldByName(fieldName)
  return field.IsValid()
}

func typeofobject(x interface{}) string {
  return fmt.Sprintf("%T", x)
}


func findIndex(slice []int, val int) int {
  for i,item := range slice {
    if item == val {
      return i
    }
  }
  return -1
}

func removeIndex(slice []int, ind int) []int {
  if ind == 0 {
    slice = slice[1:]
  } else {
    slice = append(slice[:ind], slice[ind+1:]...)
  }
  return slice
}

func mapContainsKey(hashmap map[int][]int, key int) bool {
  val, containsKey := hashmap[key]
  _ = val
  return containsKey
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
