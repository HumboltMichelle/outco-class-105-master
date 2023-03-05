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
 *                      and the values are Lists/Vectors representing the
 *                      vertex ids of its neighors.
 *
 *  The Graph will also have the following methods:
 *
 *           addVertex: Method that accepts a vertex id {Integer} and adds the
 *                      vertex to the graph.  Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {int}
 *                     Output:    {bool}
 *
 *        removeVertex: Method that accepts a vertex id and removes the vertex
 *                      with the matching id. Return true if success and false
 *                      if failed.
 *
 *                      Input:    id {int}
 *                     Output:    {bool}
 *
 *             addEdge: Method that accepts two vertex ids and creates a
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                      Input:    id1 {int}
 *                      Input:    id2 {int}
 *                     Output:    {bool}
 *
 *          removeEdge: Method that accepts two vertex id's and removes the
 *                      directed edge from the first vertex to the second.
 *                      Returns true if success and false if failed.
 *
 *                       Input:    id1 {int}
 *                       Input:    id2 {int}
 *                      Output:    {bool}
 *
 *           isVertex:  Method that accepts an id, and returns whether the vertex
 *                      exists in the graph.
 *
 *                       Input:    id {int}
 *                      Output:   {bool}
 *
 *           neighbors: Method that accepts a vertex id, and returns all of the
 *                      edges of that vertex.
 *
 *                       Input:    id {int}
 *                      Output:   {vector<int>}
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

#include <set>
#include <map>
#include <vector>
#include <iostream>
#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <typeinfo>
using namespace std;

class Graph {
  public:
    unordered_map<int, vector<int>> storage;

    //   Time Complexity:
    //   Auxiliary Space Complexity:
    bool addVertex(int id) {
      // YOUR WORK HERE
      return true;
    }


    bool removeVertex(int id) {
      // YOUR WORK HERE
      return true;
    }


    //   Time Complexity:
    //   Auxiliary Space Complexity:
    bool addEdge(int id1, int id2) {
      // YOUR WORK HERE
      return true;
    }


    // Time Complexity:
    // Auxiliary Space Complexity:
    bool removeEdge(int id1, int id2) {
      // YOUR WORK HERE
      return true;
    }


    //   Time Complexity:
    //   Auxiliary Space Complexity:
    bool isVertex(int id) {
      // YOUR WORK HERE
      return true;
    }


    // Time Complexity:
    // Auxiliary Space Complexity:
    vector<int> neighbors(int id) {
      // YOUR WORK HERE
      return vector<int>{};
    }

};


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void graphClassTests(),graphAddVertexMethodTests(),graphRemoveVertexMethodTests(),
    graphAddEdgeMethodTests(),graphRemoveEdgeMethodTests(),graphIsVertexMethodTests(),
    graphNeighborsMethodTests();

bool graphClassTest1(), graphClassTest2(), graphClassTest3(), graphClassTest4();
bool graphAddVertexMethodTest1(), graphAddVertexMethodTest2(), graphAddVertexMethodTest3(),
    graphAddVertexMethodTest4(), graphAddVertexMethodTest5();
bool graphRemoveVertexMethodTest1(), graphRemoveVertexMethodTest2(), graphRemoveVertexMethodTest3();
bool graphAddEdgeMethodTest1(), graphAddEdgeMethodTest2(), graphAddEdgeMethodTest3(), graphAddEdgeMethodTest4();
bool graphRemoveEdgeMethodTest1(), graphRemoveEdgeMethodTest2(), graphRemoveEdgeMethodTest3(),
    graphRemoveEdgeMethodTest4(), graphRemoveEdgeMethodTest5();
bool graphIsVertexMethodTest1(), graphIsVertexMethodTest2(), graphIsVertexMethodTest3();
bool graphNeighborsMethodTest1(), graphNeighborsMethodTest2(), graphNeighborsMethodTest3(), graphNeighborsMethodTest4();

int main() {
  graphClassTests();
  graphAddVertexMethodTests();
  graphRemoveVertexMethodTests();
  graphAddEdgeMethodTests();
  graphRemoveEdgeMethodTests();
  graphIsVertexMethodTests();
  graphNeighborsMethodTests();
  return 0;
}

void graphClassTests() {
    int testCount[] = {0, 0};
    cout << "Graph Class" << endl;
    runTest(graphClassTest1, "able to create an instance", testCount);
    runTest(graphClassTest2, "has storage field", testCount);
    runTest(graphClassTest3, "storage property initialized to a dictionary", testCount);
    runTest(graphClassTest4, "storage property initialized as empty", testCount);
    printTestsPassed(testCount);
}

void graphAddVertexMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph addVertex method" << endl;
    runTest(graphAddVertexMethodTest1, "has addVertex method", testCount);
    runTest(graphAddVertexMethodTest2, "is able to add a vertex", testCount);
    runTest(graphAddVertexMethodTest3, "vertices store a list/vector or set of connections", testCount);
    runTest(graphAddVertexMethodTest4, "is able to add two vertices", testCount);
    runTest(graphAddVertexMethodTest5, "does not add in duplicate vertex", testCount);
    printTestsPassed(testCount);
}

void graphRemoveVertexMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph removeVertex method" << endl;
    runTest(graphRemoveVertexMethodTest1, "has removeVertex method", testCount);
    runTest(graphRemoveVertexMethodTest2, "able to remove a vertex within graph", testCount);
    runTest(graphRemoveVertexMethodTest3, "does not remove vertex that does not exist", testCount);
    printTestsPassed(testCount);
}

void graphAddEdgeMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph addEdge method" << endl;
    runTest(graphAddEdgeMethodTest1, "has addEdge method", testCount);
    runTest(graphAddEdgeMethodTest2, "able to create an edge between two vertices that exist", testCount);
    runTest(graphAddEdgeMethodTest3, "addVertex returns true if vertices are added", testCount);
    runTest(graphAddEdgeMethodTest4, "does not create an edge when one of the vertices does not exist", testCount);
    printTestsPassed(testCount);
}

void graphRemoveEdgeMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph removeEdge method" << endl;
    runTest(graphRemoveEdgeMethodTest1, "has removeEdge method", testCount);
    runTest(graphRemoveEdgeMethodTest2, "able to remove an edge between two vertices", testCount);
    runTest(graphRemoveEdgeMethodTest3, "returns true if able to remove an edge", testCount);
    runTest(graphRemoveEdgeMethodTest4, "does not remove edge when edge does not exist", testCount);
    runTest(graphRemoveEdgeMethodTest5, "returns false if edge does not exist", testCount);
    printTestsPassed(testCount);
}

void graphIsVertexMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph isVertex method" << endl;
    runTest(graphIsVertexMethodTest1, "has isVertex method", testCount);
    runTest(graphIsVertexMethodTest2, "returns true when a vertex exists", testCount);
    runTest(graphIsVertexMethodTest3, "returns false when a vertex does not exist", testCount);
    printTestsPassed(testCount);
}

void graphNeighborsMethodTests() {
    int testCount[] = {0, 0};
    cout << "Graph neighbors method" << endl;
    runTest(graphNeighborsMethodTest1, "has neighbors method", testCount);
    runTest(graphNeighborsMethodTest2, "returns empty list/vector if vertex does not exist", testCount);
    runTest(graphNeighborsMethodTest3, "returns an empty array if vertex has no edges", testCount);
    runTest(graphNeighborsMethodTest4, "returns neighbors if edges exist for a vertex", testCount);
    printTestsPassed(testCount);
}


// SFINAE test
template <typename T>
class HasStorage{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::storage) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasAddVertex{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::addVertex) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRemoveVertex{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::removeVertex) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasAddEdge{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::addEdge) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasRemoveEdge{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::removeEdge) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasIsVertex{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::isVertex) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};

// SFINAE test
template <typename T>
class HasNeighbors{
private:
    typedef char YesType[1];
    typedef char NoType[2];
    template <typename C> static YesType& test( decltype(&C::neighbors) ) ;
    template <typename C> static NoType& test(...);
public:
    enum { value = sizeof(test<T>(0)) == sizeof(YesType) };
};


bool graphClassTest1() {
  Graph *graph = new Graph();
  bool typeMatched = typeid(*graph).name() == typeid(Graph).name();
  delete(graph);
  return typeMatched;
}

bool graphClassTest2() {
  return HasStorage<Graph>::value;
}

bool graphClassTest3() {
  Graph *graph = new Graph();
  bool testVal = typeid(graph->storage).name() == typeid(unordered_map<int, vector<int>>).name() ||
      typeid(graph->storage).name() == typeid(map<int, vector<int>>).name() ||
      typeid(graph->storage).name() == typeid(map<int, set<int>>).name() ||
      typeid(graph->storage).name() == typeid(map<int, unordered_set<int>>).name();
  delete(graph);
  return testVal;

}

bool graphClassTest4() {
  Graph *graph = new Graph();
  bool testVal = graph->storage.size() == 0;
  delete(graph);
  return testVal;
}


bool graphAddVertexMethodTest1() {
  return HasAddVertex<Graph>::value;
}

bool graphAddVertexMethodTest2() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool testVal = graph->storage.size() == 1;
  delete(graph);
  return testVal;
}

bool graphAddVertexMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool testVal = typeid(graph->storage[5]).name() == typeid(vector<int>).name() ||
      typeid(graph->storage[5]).name() == typeid(unordered_set<int>).name() ||
      typeid(graph->storage[5]).name() == typeid(set<int>).name();
  delete(graph);
  return testVal;
}

bool graphAddVertexMethodTest4() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  bool testVal = graph->storage.size() == 2 && (
     typeid(graph->storage[10]).name() == typeid(vector<int>).name() ||
     typeid(graph->storage[10]).name() == typeid(unordered_set<int>).name() ||
     typeid(graph->storage[10]).name() == typeid(set<int>).name());
  delete(graph);
  return testVal;
}

bool graphAddVertexMethodTest5() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(5);
  bool testVal = graph->storage.size() == 1 && graph->storage[5].size() == 0;
  delete(graph);
  return testVal;
}



bool graphRemoveVertexMethodTest1() {
    return HasRemoveVertex<Graph>::value;
}

bool graphRemoveVertexMethodTest2() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->removeVertex(5);
  bool testVal = graph->storage.size() == 0 && graph->storage.find(5) == graph->storage.end();
  delete(graph);
  return testVal;
}

bool graphRemoveVertexMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->removeVertex(10);
  bool testVal = graph->storage.size() == 1 && graph->storage.find(5) != graph->storage.end();
  delete(graph);
  return testVal;
}



bool graphAddEdgeMethodTest1() {
    return HasAddEdge<Graph>::value;
}

bool graphAddEdgeMethodTest2() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addEdge(5, 10);
  bool testVal = graph->storage[5].size() == 1 && graph->storage[10].size() == 0;
  delete(graph);
  return testVal;
}

bool graphAddEdgeMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  bool testVal = graph->addEdge(5, 10);
  delete(graph);
  return testVal;
}

bool graphAddEdgeMethodTest4() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool result = graph->addEdge(5, 10);
  bool testVal = graph->storage[5].size() == 0 && result == false;
  delete(graph);
  return testVal;
}


bool graphRemoveEdgeMethodTest1() {
    return HasRemoveEdge<Graph>::value;
}

bool graphRemoveEdgeMethodTest2() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addEdge(5, 10);
  graph->removeEdge(5, 10);
  bool testVal = graph->storage[5].size() == 0 && graph->storage.size() == 2;
  delete(graph);
  return testVal;
}

bool graphRemoveEdgeMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addEdge(5, 10);
  bool testVal = graph->removeEdge(5, 10);
  delete(graph);
  return testVal;
}

bool graphRemoveEdgeMethodTest4() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addEdge(5, 10);
  graph->removeEdge(6, 10);
  bool testVal = graph->storage.find(5) != graph->storage.end() && graph->storage[5].size() == 1;
  delete(graph);
  return testVal;
}

bool graphRemoveEdgeMethodTest5() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addEdge(5, 10);
  bool testVal = graph->removeEdge(6, 10) == false;
  delete(graph);
  return testVal;
}


bool graphIsVertexMethodTest1() {
  return HasIsVertex<Graph>::value;
}

bool graphIsVertexMethodTest2() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool testVal = graph->isVertex(5);
  delete(graph);
  return testVal;
}

bool graphIsVertexMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool testVal = !graph->isVertex(10);
  delete(graph);
  return testVal;
}


bool graphNeighborsMethodTest1() {
  return HasNeighbors<Graph>::value;
}

bool graphNeighborsMethodTest2() {
  Graph *graph = new Graph();
  bool testVal = graph->neighbors(5) == vector<int>{};
  delete(graph);
  return testVal;
}

bool graphNeighborsMethodTest3() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  bool testVal = graph->neighbors(5).size() == 0;
  delete(graph);
  return testVal;
}

bool graphNeighborsMethodTest4() {
  Graph *graph = new Graph();
  graph->addVertex(5);
  graph->addVertex(10);
  graph->addVertex(15);
  graph->addVertex(20);
  graph->addEdge(5, 10);
  graph->addEdge(5, 15);
  graph->addEdge(5, 20);
  bool testVal = graph->neighbors(5).size() == 3;
  delete(graph);
  return testVal;
}


// this is to wrap the test and check for exceptions
void runTest (bool test(), string testName, int testCount[]){
  testCount[1]++;
  bool testPassed = test();
  if(testPassed) testCount[0]++;
  string result = "  " + (to_string(testCount[1]) + ")   ") + (testPassed ? "true" : "false") + " : " + testName;
  cout << result << endl;
}

// this is to print the number of test cases passed for a test suite function
void printTestsPassed(int testCount[]) {
  cout << "PASSED: " + to_string(testCount[0]) + " / " + to_string(testCount[1]) + "\n\n" <<endl;
}
