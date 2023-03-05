/**
 *  Target Practice - Graph Traversal
 *
 *  Instructions: Solve the following graph traversal problems.
 */


/**
 *  1. For the example graph below, what an expected output if we printed
 *     each vertex value from vertex 0 outwards using:
 *
 *     a. BREADTH FIRST traversal: [0,1,2,7,4,5,6,3]
 *     b. DEPTH FIRST traversal: [0,1,2,4,5,3,6,7]
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

 #include <vector>
 #include <algorithm> // for copy()
 #include <iostream>
 #include <queue>
 #include <unordered_set>
 #include <unordered_map>
 using namespace std;


 // DO NOT EDIT
 // Vertex class
 class Vertex {
     public:
       int id;
       vector<Vertex*> edges;

     Vertex(int id) {
         this->id = id;
     }
 };

 // DO NOT EDIT
 // generate graph from int and array of arrays
 Vertex *deserialize(int n, vector<vector<int>> edges){
     unordered_map<int, Vertex*> vertices;
     for (int i = 0; i < n; i++) {
         vertices[i] = new Vertex(i);
     }
     int v1;
     int v2;
     for (int i = 0; i < edges.size(); i++) {
         v1 = edges[i][0];
         v2 = edges[i][1];
         vertices[v1]->edges.push_back(vertices[v2]);
         vertices[v2]->edges.push_back(vertices[v1]);
     }
     return vertices[0];
 }

 /**
  *  1. Implement Breadth First Search using a queue and while loop.
  *
  *  Input: {Vertex} - the starting vertex
  *  Output: {vector} - an list of vertex ids of the path
  *
  *  HINT: Use a set or hash map to handle redundancy
  */

 vector<int> bfs(Vertex *vertex) {
     vector<int> result;
     queue<Vertex*> queue;
     unordered_set<int> visited;
     queue.push(vertex);
     visited.insert(vertex->id);

     Vertex *current;
     while (queue.size() > 0) {
         current = queue.front();
         queue.pop();
         vector<Vertex*> edges = current->edges;
         for(int i = 0; i < edges.size(); i++) {
             Vertex *neighbor = edges[i];
             if (visited.find(neighbor->id) == visited.end()) {
                 queue.push(neighbor);
                 visited.insert(neighbor->id);
             }
         }
         result.push_back(current->id);
     }
     return result;
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

  void traverse(Vertex *current, vector<int> &path, int destID,
                              vector<vector<int>> &result, unordered_set<Vertex*> visited){
      if(visited.find(current) != visited.end()) return;

      if(current->id == (destID)) {
          path.push_back(current->id);
          result.push_back(vector<int>{path});
          path.erase(path.begin() + path.size() - 1);
          return;
      }

      visited.insert(current);
      path.push_back(current->id);

      for(Vertex *edgeVertex: current->edges){
          traverse(edgeVertex, path, destID, result, visited);
      }

      path.erase(path.begin() + path.size() - 1);
      visited.erase(current);
  }

 vector<vector<int>> dfs(Vertex *src, int dest) {
     vector<int> path;
     vector<vector<int>> result;
     unordered_set<Vertex*> visited;

     traverse(src, path, dest, result, visited);

     return result;
 }




 ////////////////////////////////////////////////////////////
 ///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
 ////////////////////////////////////////////////////////////

 void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);
 void bfsTests(),dfsTests();
 bool bfsTest1(),bfsTest2(),bfsTest3(),dfsTest1(),dfsTest2(),dfsTest3(),dfsTest4();


int main() {
  bfsTests();
  dfsTests();
  return 0;
}

void bfsTests() {
  int testCount[] = {0, 0};
  cout << "Breadth First Search tests" << endl;
  runTest(bfsTest1, "able to return the elements of a graph in breadth first manner", testCount);
  runTest(bfsTest2, "should return only starting initial node if no edges exist in graph", testCount);
  runTest(bfsTest3, "should return elements of simple graph: 0 - 1 - 2 starting at 0", testCount);
  printTestsPassed(testCount);
}

void dfsTests() {
  int testCount[] = {0, 0};
  cout << "Depth First Search Tests" << endl;
  runTest(dfsTest1, "should return all valid dfs paths for connected graph with a cycle", testCount);
  runTest(dfsTest2, "should return valid dfs for connected graph with no cycle", testCount);
  runTest(dfsTest3, "should return valid dfs for unconnected graphs with a path", testCount);
  runTest(dfsTest4, "should return valid dfs for unconnected graphs with no path", testCount);
  printTestsPassed(testCount);
}


vector<Vertex*> getNeighbors(Vertex *vertex, unordered_map<int, Vertex*> visited) {
      vector<Vertex*> results;
      vector<Vertex*> edges = vertex->edges;
      Vertex *neighbor;
      for (int i = 0; i < edges.size(); i++) {
          neighbor = edges[i];
          if(visited.find(neighbor->id) == visited.end()) {
              results.push_back(neighbor);
          }
      }
      return results;
}

vector<int> getValues(vector<Vertex*> vertices) {
    vector<int> results;
    for (int i = 0; i < vertices.size(); i++) {
        results.push_back(vertices[i]->id);
    }
    return results;
}

vector<Vertex*> removeVisited(vector<Vertex*> vertices, unordered_set<Vertex*> visited) {
    vector<Vertex*> results;
    for (int i = 0; i < vertices.size(); i++) {
        Vertex *vertex = vertices[i];
        if (visited.find(vertex) == visited.end()) {
            results.push_back(vertex);
        }
    }
    return results;
}

// function for checking if arrays contain same elements
// (do not need to be in the same order)
bool listsMatching(vector<int> &list1, vector<int> &list2) {
    if (list1.size() != list2.size()) {
        cout << "listMatching: not equal length" << endl;
        return false;
    }

    unordered_map<int, int> cache;
    for (int i = 0 ; i < list1.size() ; i++) {
        int value = list1[i];
        int count = cache.find(value) != cache.end() ? cache[value] : 0;
        cache[value] = count + 1;
    }

    for (int j = 0; j < list2.size(); j++) {
        int value = list2[j];
        if (cache.find(value) == cache.end() || cache[value] == 0) {
            return false;
        }
        cache[value]--;
    }

    return true;
}

bool validBfs(vector<int> path, Vertex *start) {
      if (path.size() == 0 && start != NULL) {
          return false;
      }
      if (path[0] != start->id) {
          return false;
      }

      Vertex *current = start;
      unordered_map<int, Vertex*> visited;
      visited[current->id] = current;
      for (int i = 0, j = 1; i < path.size() - 1; i++) {
          if (i >= j) {
              return false;
          }
          vector<Vertex*> neighbors = getNeighbors(current, visited);

          vector<int> values = getValues(neighbors);
          vector<int>::const_iterator first = path.begin() + j;
          vector<int>::const_iterator last = path.begin() + j + values.size();
          vector<int> subPath(first, last);
          if (!listsMatching(values, subPath)) {
              return false;
          }
          j += values.size();
          for(int k = 0; k < neighbors.size(); k++) {
              visited[neighbors[k]->id] = neighbors[k];
          }

          current = visited[path[i + 1]];
      }

      return true;
}

bool testDfs(Vertex *current, unordered_set<int> visited, int destID){
    if(visited.find(current->id) != visited.end()) return false;
    visited.insert(current->id);
    if(current->id == (destID)) return true;
    vector<Vertex*> neighbors = current->edges;
    for(Vertex *neighbor: neighbors){
        if(visited.find(neighbor->id) == visited.end()){
            if(testDfs(neighbor, visited, destID)) return true;
        }
    }
    visited.erase(current->id);
    return false;
}

// takes in an array of path and a vertex start point and determines whether
// the dfs is valid
bool validDfs(vector<vector<int>> paths, Vertex *source, int destID) {
    for(vector<int> path: paths){
        if(path[0] != source->id) {
            return false;
        }
        if(!(path[path.size()-1] == destID)){
            return false;
        }
        Vertex *current = source;
        bool isValid = false;
        for(int node = 1; node < path.size(); node++) {
            vector<Vertex*> neighbors = current->edges;
            for(Vertex *neighbor: neighbors){
                if(neighbor->id == (path[node])) {
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
    unordered_set<int> visited;
    if(testDfs(source, visited, destID) && paths.size()==0) return false;
    return true;
}

//Check if 2 lists contain sublists that match but are not necessarily in the same order
bool array2DEqualsUnordered(vector<vector<int>> arr1, vector<vector<int>> arr2) {
    if (arr1.size() != arr2.size()) return false;
    int count = 0;
    for(vector<int> subArr1: arr1){
        for(vector<int> subArr2: arr2){
            if(subArr1 == subArr2){
                count++;
                break;
            }
        }
    }
    return count == arr1.size();
}

bool bfsTest1() {
  Vertex *test = deserialize(8, vector<vector<int>>{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
  vector<int> results = bfs(test);
  return validBfs(results, test);
}

bool bfsTest2() {
  Vertex *test = deserialize(8, vector<vector<int>>{});
  vector<int> results = bfs(test);
  return validBfs(results, test);
}

bool bfsTest3() {
  Vertex *test = deserialize(8, vector<vector<int>>{{0,1}, {1,2}});
  vector<int> results = bfs(test);
  return validBfs(results, test);
}


bool dfsTest1() {
  Vertex *testGraph = deserialize(8, vector<vector<int>>{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
  int destinationID = 3;
  vector<vector<int>> results = dfs(testGraph, destinationID);

  vector<vector<int>> solution;
  solution.push_back(vector<int>{0, 1, 2, 4, 5, 3});
  solution.push_back(vector<int>{0, 1, 2, 4, 6, 5, 3});
  solution.push_back(vector<int>{0, 1, 7, 4, 5, 3});
  solution.push_back(vector<int>{0, 1, 7, 4, 6, 5, 3});

  return array2DEqualsUnordered(results, solution);
}

bool dfsTest2() {
  Vertex *testGraph = deserialize(6, vector<vector<int>>{{0, 1}, {1, 5}, {1, 2}, {2, 4}, {4, 3}});
  int destinationID = 3;
  vector<vector<int>> results = dfs(testGraph, destinationID);
  return validDfs(results, testGraph, destinationID);
}

bool dfsTest3() {
  Vertex *testGraph = deserialize(7, vector<vector<int>>{{5,1}, {5,6}, {1,2}, {2,4}, {0,3}});
  int destinationID = 3;
  vector<vector<int>> results = dfs(testGraph, destinationID);
  return validDfs(results, testGraph, destinationID);
}

bool dfsTest4() {
  Vertex *testGraph = deserialize(7, vector<vector<int>>{{0,1}, {1,6}, {1,2}, {2,4}, {5,3}});
  int destinationID = 3;
  vector<vector<int>> results = dfs(testGraph, destinationID);
  return validDfs(results, testGraph, destinationID);
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
