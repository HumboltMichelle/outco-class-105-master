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

#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
#include <unordered_set>
#include <unordered_map>
#include <typeinfo>
using namespace std;

// Helper Data Structures and Algorithms

class ListNode {
  public:
    string str;
    int value;
    vector<int> intArray;
    ListNode *next;

    ListNode(int value) {
      this->value = value;
    }

    ListNode(string str) {
      this->str = str;
    }

    ListNode(vector<int> intArray){
      this->intArray = intArray;
    }

    string getStringID() {
      return this->str;
    }

    int getintID() {
      return this->value;
    }

    vector<int> getIntArrayID() {
      return this->intArray;
    }
};


class LinkedList {
  public:
    int length = 0;
    ListNode *head, *tail;

    void insert(ListNode *newNode, int index) {
      if(this->length == 0){
        head = newNode;
        tail = newNode;
      } else if(index == 0){
        newNode->next = head;
        head = newNode;
      } else if(index == this->length){
        tail->next = newNode;
        tail = newNode;
      } else {
        ListNode *prev = head;
        for(int i = 0; i < index-1; i++){
          prev = prev->next;
        }
        newNode->next = prev->next;
        prev->next = newNode;
      }
      this->length++;
    }

    void insert(int value, int index){
      if(index < 0 || index > this->length){
        return;
      }
      ListNode *newNode = new ListNode(value);
      this->insert(newNode, index);
    }

    void insert(string str, int index){
      if(index < 0 || index > this->length){
        return;
      }
      ListNode *newNode = new ListNode(str);
      this->insert(newNode, index);
    }

    void insert(vector<int> intArray, int index){
      if(index < 0 || index > this->length){
        return;
      }
      ListNode *newNode = new ListNode(intArray);
      this->insert(newNode, index);

    }

    void append(int value){
      insert(value, this->length);
    }

    void append(string str){
      insert(str, this->length);
    }

    void append(vector<int> intArray) {
      insert(intArray, this->length);
    }


    ListNode* delete_node(int index){
      if(index < 0 || index >= this->length){
        return NULL;
      }

      ListNode *result;
      if(this->length == 1){
        result = this->head;
        head = NULL;
        tail = NULL;
      } else if (index == 0){
        result = this->head;
        head = this->head->next;
      } else {
        ListNode *prev = head;
        for(int i = 0; i < index-1; i++){
          prev = prev->next;
        }
        result = prev->next;
        prev->next = prev->next->next;
        if(index == length-1){
          tail = prev;
        }
      }
      length--;
      return result;
    }

    bool Contains(int value){
      ListNode *current = this->head;
      while(current != NULL){
        if(current->getintID() == value){
          return true;
        }
        current = current->next;
      }
      return false;
    }

    bool Contains(string str){
      ListNode *current = this->head;
      while(current != NULL){
        if(current->getStringID() == str){
          return true;
        }
        current = current->next;
      }
      return false;
    }
};


class Queue {
  public:
    LinkedList *list = new LinkedList();
    int length = 0;

    void enqueue(string str) {
      list->append(str);
      this->length += 1;
    }

    void enqueue(int value) {
      list->append(value);
      this->length += 1;
    }

    void enqueue(vector<int> intArray) {
      list->append(intArray);
      this->length += 1;
    }

    string dequeueStringID() {
      if (this->length == 0) {
        return NULL;
      } else {
        this->length -= 1;
        return list->delete_node(0)->str;
      }
    }

    int dequeueintID() {
      if (this->length == 0) {
        //?
        return -1;
      } else {
        this->length -= 1;
        return list->delete_node(0)->value;
      }
    }

    vector<int> dequeueIntArrayID() {
      if (this->length == 0) {
        return vector<int>{};
      } else {
        this->length -= 1;
        return list->delete_node(0)->intArray;
      }
    }

    string peekStringID() {
      return list->head->getStringID();
    }

    int peekintID() {
      return list->head->getintID();
    }

    int size() {
      return this->length;
    }
};


class Graph {
  public:
    unordered_map<string, vector<string>> storage;

    void addVertex(string str) {
      if(!this->isVertex(str)){
        storage[str] = vector<string>{};
      }
    }

    void addVertex(int value) {
      string strKey = to_string(value);
      this->addVertex(strKey);
    }

    int findIndex(vector<string> arr, string val) {
    	auto it = std::find(arr.begin(), arr.end(), val);
    	if (it != arr.end()) return distance(arr.begin(), it);
    	return -1;
    }

    void removeVertex(string str) {
      if (!this->isVertex(str)) {
        return;
      }
      vector<string> neighbors;
      int vectorInd;
      for(auto storagePair: storage){
        neighbors = storagePair.second;
        vectorInd = findIndex(neighbors, str);
        if(vectorInd >=0) neighbors.erase(neighbors.begin() + vectorInd);
      }

      storage.erase(str);
    }

    void removeVertex(int value) {
      string strKey = to_string(value);
      this->removeVertex(strKey);
    }

    void addEdge(string a, string b) {
      if (!this->isVertex(a)) {
        addVertex(a);
      }
      if (!this->isVertex(b)) {
        addVertex(b);
      }
      storage[a].push_back(b);
    }

    void addEdge(int a, int b) {
      string strA = to_string(a);
      string strB = to_string(b);
      this->addEdge(strA, strB);
    }

    void removeEdge(string a, string b) {
      if (this->isVertex(a) || this->isVertex(b)) {
        return;
      }
      int bIndex = findIndex(storage[a], b);
      storage[a].erase(storage[a].begin() + bIndex);
    }

    void removeEdge(int a, int b) {
      string strA = to_string(a);
      string strB = to_string(b);
      this->removeEdge(strA, strB);
    }

    bool isVertex(string str) {
      return storage.find(str) != storage.end();
    }

    bool isVertex(int value) {
      return storage.find(to_string(value)) != storage.end();
    }


    vector<string> neighbors(string str) {
      if (this->isVertex(str)) {
        return storage[str];
      }
      return vector<string>{};
    }

    vector<string>neighbors(int value) {
      return this->neighbors(to_string(value));
    }


    vector<string> getStringVertices() {
      vector<string> result;
      for(auto storagePair: storage) {
        result.push_back(storagePair.first);
      }
      return result;
    }

    vector<int> getintVertices() {
      vector<int> result;
      for(auto storagePair: storage) {
        int intKey = stoi(storagePair.first);
        result.push_back(intKey);
      }
      return result;
    }

};


/////////////////////////////////////////////
///~~ADJACENCY LIST GENERATION FUNCTIONS~~///
/////////////////////////////////////////////
Graph * generateAdjacencyList(vector<vector<int>> edges) {
    Graph *graph = new Graph();
    graph->storage.clear();
    int u, v;

    for (int i = 0; i < edges.size(); i++) {
      u = edges[i][0];
      v = edges[i][1];
      graph->addEdge(u, v);
    }

    return graph;
}

Graph *generateAdjacencyList(vector<vector<string>> edges) {
    Graph *graph = new Graph();
    graph->storage.clear();
    string u, v;

    for (int i = 0; i < edges.size(); i++) {
      u = edges[i][0];
      v = edges[i][1];
      graph->addEdge(u, v);
    }

    return graph;
}



/////////////////////////////////////////////
///////~~TOPOLOGICAL SORT FUNCTIONS~~////////
/////////////////////////////////////////////
unordered_set<string> ts_visited;
vector<string> ts_result;
Graph *ts_graph;

void dfs_ts(string current) {
    if(ts_visited.find(current) != ts_visited.end()) return;

    ts_visited.insert(current);
    vector<string> neighbors = ts_graph->neighbors(current);
    for(int i=0; i< neighbors.size(); i++) {
      string neighbor = neighbors[i];
      dfs_ts(neighbor);
    }
    ts_result.push_back(current);
}

vector<string> topologicalSort(Graph *inputGraph) {
    ts_visited.clear();
    ts_result.clear();
    ts_graph = inputGraph;

    vector<string> vertices = ts_graph->getStringVertices();

    for (int i = 0; i < vertices.size(); i++) {
      dfs_ts(vertices[i]);
    }

    vector<string> resultFormat(ts_result.size());
    for (int i = resultFormat.size() - 1; i > -1; i--) {
      resultFormat[resultFormat.size() - 1 - i] = ts_result[i];
    }
    return resultFormat;
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
  *  Input: edges: [[int]]
  *  Output: [int]
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
  public:
    int value;
    unordered_set<int> seen;

    Combo(int val, unordered_set<int> seenSet) {
      this->value = val;
      this->seen = seenSet;
    }
};

vector<vector<int>> candidates;
unordered_map<int, int> parent;
int N;

Combo *orbit(int node) {
  unordered_set<int> seen;

  while (parent.find(node) != parent.end()
      && seen.find(node) == seen.end()) {
    seen.insert(node);
    node = parent[node];
  }

  return new Combo(node, seen);
}


vector<int> redundantConnection(vector<vector<int>> edges) {
    candidates.clear();
    parent.clear();
    N = edges.size();

    for (int i = 0; i < edges.size(); i++) {
      vector<int> edge{edges[i][0], edges[i][1]};
      int origin = edge[0];
      int destination = edge[1];

      if (parent.find(destination) != parent.end()) {
        candidates.push_back(vector<int>{parent[destination], destination});
        candidates.push_back(edge);
      } else {
        parent[destination] = origin;
      }
    }

    Combo *orbOne,*orbRoot;
    orbOne = orbit(1);
    int root = orbOne->value;

    if (candidates.size() == 0) {
      orbRoot = orbit(root);
      unordered_set<int> cycle = orbRoot->seen;
      vector<int> answer;

      for (int i = 0; i < edges.size(); i++) {
        vector<int> edge{edges[i][0], edges[i][1]};
        int origin = edge[0];
        int destination = edge[1];

        if (cycle.find(origin) != cycle.end()
          && cycle.find(destination)  != cycle.end()) {
          answer = vector<int>{origin, destination};
        }
      }
      delete(orbRoot);
      return answer;
    }

    unordered_map<int, vector<int>> children;

    for(auto parentPair: parent) {
      int v = parentPair.first;
      int child = parent[v];
      if (children.find(child) == children.end()) {
        children[child] = vector<int>{v};
      } else {
        children[child].push_back(v);
      }
    }

    vector<bool> seen{true};

    for (int i = 0; i < N; i++) {
      seen.push_back(false);
    }

    vector<int> stack{root};

    while (stack.size() > 0) {
      int node = stack[stack.size() - 1];
      stack.erase(stack.begin() + stack.size() - 1);
      if (!seen[(int) node]) {
        seen[(int) node] = true;
        if (children.find(node) != children.end()) {
          vector<int> connected = children[node];
          for (int i = 0; i < connected.size(); i++) {
            stack.push_back(connected[i]);
          }
        }
      }
    }


    for (int i = 0; i < seen.size(); i++) {
      if (!seen[i]) {
        return vector<int>{candidates[0][0], candidates[0][1]};
      }
    }

    delete(orbOne);
    return vector<int>{candidates[1][0], candidates[1][1]};
}


/*
 *  Third Degree Neighbors
 *
 *  Given an undirected graph represented by a list of edges and a start
 *  vertex, return an array of the 3rd degree neighbors.
 *
 *  Parameters:
 *
 *  Input: edges: [[int]]
 *  Input: start: int
 *  Output: [int]
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

vector<int> thirdDegreeNeighbors(vector<vector<int>> edges, int start) {
  Graph *graph = generateAdjacencyList(edges);
  vector<int> result;
  Queue *queue = new Queue();
  unordered_set<int> seen;

  seen.insert(start);
  queue->enqueue(vector<int>{start, 0});

  while (queue->size() > 0) {
   vector<int> current = queue->dequeueIntArrayID();
   int val = current[0];
   int distance = current[1];
   if (distance == 3) {
     result.push_back(val);
   }

   vector<string> neighbors = graph->neighbors(val);

   for (int i = 0; i < neighbors.size(); i++) {
     int neighbor = stoi(neighbors[i]);
     if (seen.find(neighbor) == seen.end()) {
       seen.insert(neighbor);
       queue->enqueue(vector<int>{neighbor, distance + 1});
     }
   }
  }

  vector<int> resultFormat(result.size());
  for (int i = 0; i < resultFormat.size(); i++) {
   resultFormat[i] = result[i];
  }

  delete(graph);
  delete(queue);
  return resultFormat;
}


/*
 *  Detect Cycle in Graph (Undirected)
 *
 *  Given edges that represent an undirected graph, determine if the graph
 *  has a cycle. A cycle has a minimum of 3 vertices.
 *
 *  Parameters:
 *
 *  Input: edges: [[int]]
 *  Output: bool
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

bool detectCycleInGraph(vector<vector<int>> edges) {
  Graph *graph = generateAdjacencyList(edges);
  unordered_set<int> seen;
  Queue *queue = new Queue();

  vector<int> vertices = graph->getintVertices();

  for (int i = 0; i < vertices.size(); i++) {
   int vertex = vertices[i];
   if (seen.find(vertex) == seen.end()) {
     seen.insert(vertex);
     queue->enqueue(vertex);
   }
   while (queue->size() > 0) {
     int current = queue->dequeueintID();
     vector<string> neighbors = graph->neighbors(current);
     int neighborsVisited = 0;
     bool flag = false;

     for (int j = 0; j < neighbors.size(); j++) {
       int neighbor = stoi(neighbors[j]);
       if (seen.find(neighbor) == seen.end()) {
         seen.insert(neighbor);
         queue->enqueue(neighbor);
       } else {
         neighborsVisited += 1;
       }
       if (neighborsVisited > 1) {
         flag = true;
       }
     }
     if (flag) {
       delete(graph);
       delete(queue);
       return flag;
     }
   }
  }
  delete(graph);
  delete(queue);
  return false;
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
 *  Input: Graph: [[int]] (adjacency matrix)
 *  Output: int
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


int friendCircles(vector<vector<int>> matrix) {
  unordered_set<int> seen;
  int circles = 0;
  Queue *queue = new Queue();

  for (int row = 0; row < matrix.size(); row++) {
   int person = row;

   if (seen.find(person) == seen.end()) {
     queue->enqueue(person);
     seen.insert(person);
     circles += 1;
   }

   while (queue->size() > 0) {
     int current = queue->dequeueintID();
     for (int friendVal = 0; friendVal < matrix[current].size(); friendVal++) {
       if (matrix[current][friendVal] == 1 &&
         seen.find(friendVal) == seen.end()) {
         seen.insert(friendVal);
         queue->enqueue(friendVal);
       }
     }
   }
  }
  delete(queue);
  return circles;
}


/*
 *  Longest Path I
 *
 *  Given a DAG (directed acyclic graph), find the longest path in the graph.
 *
 *  Parameters:
 *
 *  Input: Graph: [[int]] (edge list)
 *  Output: int
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


vector<int> lpi_result;
unordered_set<int> lpi_visited;
Graph *lpi_graph = new Graph();

void dfs_lpi(int current, vector<int> path) {
   if (lpi_visited.find(current) != lpi_visited.end()) {
     return;
   }

   if (path.size() > lpi_result.size()) {
     lpi_result = vector<int>(path);
   }
   lpi_visited.insert(current);

   vector<string> neighbors = lpi_graph->neighbors(current);
   for (int i = 0; i < neighbors.size(); i++) {
     int neighbor = stoi(neighbors[i]);
     path.push_back(neighbor);
     dfs_lpi(neighbor, path);
     path.erase(path.begin() + path.size() - 1);
   }

   lpi_visited.erase(current);
}

vector<int> longestPathI(vector<vector<int>> edges) {
   lpi_graph = generateAdjacencyList(edges);
   lpi_result.clear();
   lpi_visited.clear();

   vector<int> vertices = lpi_graph->getintVertices();
   for (int i = 0; i < vertices.size(); i++) {
     dfs_lpi(vertices[i], vector<int>{vertices[i]});
   }


   vector<int> resultFormat(lpi_result.size());
   for (int i = 0; i < resultFormat.size(); i++) {
     resultFormat[i] = lpi_result[i];
   }
   delete(lpi_graph);
   return resultFormat;
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

vector<string> courseSchedule(vector<vector<string>> edges) {
  Graph *graph = generateAdjacencyList(edges);
  vector<string> result = topologicalSort(graph);
  delete(graph);
  return result;
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

 vector<string> firstLetterDifference(string word1, string word2) {
   for (int letter = 0; letter < min(word1.length(), word2.length()); letter++) {
     if (word1[letter] != word2[letter]) {
       return vector<string>{string(1,word1[letter]), string(1,word2[letter])};
     }
   }
   return vector<string>{};
 }

vector<string> crypticDictionary(vector<string> words) {
    vector<vector<string>> edges;
    for (int i = 0; i < words.size() - 1; i++) {
      string word = words[i];
      string nextWord = words[i + 1];
      edges.push_back(firstLetterDifference(word, nextWord));
    }

    vector<vector<string>> edgesFormat(edges.size(), vector<string>{});
    for (int i = 0; i < edgesFormat.size(); i++) {
      edgesFormat[i] = edges[i];
    }

    Graph *graph = generateAdjacencyList(edgesFormat);
    vector<string> result = topologicalSort(graph);
    delete(graph);
    return result;
}



////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

void runTest (bool test(), string testName, int testCount[]),  printTestsPassed(int testCount[]);

void redundantConnectionTests(),thirdDegreeNeighborsTests(),detectCycleInGraphTests(),
    friendCirclesTests(),longestPathITests(),courseScheduleTests(),crypticDictionaryTests();

bool redundantConnectionTest1(),redundantConnectionTest2(),redundantConnectionTest3(),redundantConnectionTest4();
bool thirdDegreeNeighborsTest1(),thirdDegreeNeighborsTest2(),thirdDegreeNeighborsTest3(),
    thirdDegreeNeighborsTest4(),thirdDegreeNeighborsTest5(),thirdDegreeNeighborsTest6();
bool detectCycleInGraphTest1(),detectCycleInGraphTest2(),detectCycleInGraphTest3(),
    detectCycleInGraphTest4(),detectCycleInGraphTest5(),detectCycleInGraphTest6();
bool friendCirclesTest1(),friendCirclesTest2(),friendCirclesTest3(),
    friendCirclesTest4(),friendCirclesTest5();
bool longestPathITest1(),longestPathITest2(),longestPathITest3(),
    longestPathITest4(),longestPathITest5(),longestPathITest6();
bool courseScheduleTest1(),courseScheduleTest2(),courseScheduleTest3(),courseScheduleTest4(),courseScheduleTest5();
bool crypticDictionaryTest1(),crypticDictionaryTest2(),crypticDictionaryTest3(),crypticDictionaryTest4();


int main() {
  redundantConnectionTests();
  thirdDegreeNeighborsTests();
  detectCycleInGraphTests();
  friendCirclesTests();
  longestPathITests();
  courseScheduleTests();
  crypticDictionaryTests();
  return 0;
}

void redundantConnectionTests() {
  int testCount[] = {0, 0};
  cout << "Redundant Connection Tests" << endl;
  runTest(redundantConnectionTest1, "should work for first example case", testCount);
  runTest(redundantConnectionTest2, "should work for second example case", testCount);
  runTest(redundantConnectionTest3, "should work for cyclic graph", testCount);
  runTest(redundantConnectionTest4, "should work for cyclic graph with branches coming off cyclical portion", testCount);
  printTestsPassed(testCount);
}

void thirdDegreeNeighborsTests() {
  int testCount[] = {0, 0};
  cout << "Third Degree Neighbors Tests" << endl;
  runTest(thirdDegreeNeighborsTest1, "should work for example case", testCount);
  runTest(thirdDegreeNeighborsTest2, "should work for graph with no third degree neighbors", testCount);
  runTest(thirdDegreeNeighborsTest3, "should work for graph with no edges", testCount);
  runTest(thirdDegreeNeighborsTest4, "should work for branching graph", testCount);
  runTest(thirdDegreeNeighborsTest5, "should work for linear graph", testCount);
  runTest(thirdDegreeNeighborsTest6, "should work for cyclic graph", testCount);
  printTestsPassed(testCount);
}

void detectCycleInGraphTests() {
  int testCount[] = {0, 0};
  cout << "Detect Cycle In Graph Tests" << endl;
  runTest(detectCycleInGraphTest1, "should work for example case", testCount);
  runTest(detectCycleInGraphTest2, "should return false when cycle does not exist", testCount);
  runTest(detectCycleInGraphTest3, "should return false when no edges exist in graph", testCount);
  runTest(detectCycleInGraphTest4, "should return true for one large loop", testCount);
  runTest(detectCycleInGraphTest5, "should return false for single element graph", testCount);
  runTest(detectCycleInGraphTest6, "should return false for two element graph connected by edge", testCount);
  printTestsPassed(testCount);
}

void friendCirclesTests() {
  int testCount[] = {0, 0};
  cout << "Friend Circles Tests" << endl;
  runTest(friendCirclesTest1, "should work for first example case", testCount);
  runTest(friendCirclesTest2, "should work for second example case", testCount);
  runTest(friendCirclesTest3, "should work for an empty matrix", testCount);
  runTest(friendCirclesTest4, "should work when no one is friends with anyone else", testCount);
  runTest(friendCirclesTest5, "should work when everyone is friends with everyone else", testCount);
  printTestsPassed(testCount);
}

void longestPathITests() {
  int testCount[] = {0, 0};
  cout << "Longest Path I Tests" << endl;
  runTest(longestPathITest1, "should work for first example case", testCount);
  runTest(longestPathITest2, "should work for second example case", testCount);
  runTest(longestPathITest3, "should work for three-element linear graph", testCount);
  runTest(longestPathITest4, "should work for graph with two equivalent paths", testCount);
  runTest(longestPathITest5, "should work for single-element graph", testCount);
  runTest(longestPathITest6, "should handle graph with multiple paths equivalent in length", testCount);
  printTestsPassed(testCount);
}

void courseScheduleTests() {
  int testCount[] = {0, 0};
  cout << "Course Schedule Tests" << endl;
  runTest(courseScheduleTest1, "should work for first example case", testCount);
  runTest(courseScheduleTest2, "should work for second example case", testCount);
  runTest(courseScheduleTest3, "should work for courseload with small number of courses", testCount);
  runTest(courseScheduleTest4, "should work for large courseload", testCount);
  runTest(courseScheduleTest5, "should work for empty input array", testCount);
  printTestsPassed(testCount);
}

void crypticDictionaryTests() {
  int testCount[] = {0, 0};
  cout << "Cryptic Dictionary Tests" << endl;
  runTest(crypticDictionaryTest1, "should work for first example case", testCount);
  runTest(crypticDictionaryTest2, "should work for second example case", testCount);
  runTest(crypticDictionaryTest3, "should work for two word input case", testCount);
  runTest(crypticDictionaryTest4, "should work for words that have two characters", testCount);
  printTestsPassed(testCount);
}


bool redundantConnectionTest1() {
  vector<int> solution = redundantConnection(vector<vector<int>>{{1,2},{1,3},{2,3}});
  return solution == (vector<int>{2,3}) || solution == (vector<int>{1,3});
}

bool redundantConnectionTest2() {
  vector<int> solution = redundantConnection(vector<vector<int>>{{1,2},{2,3},{2,4},{4,5},{5,2}});
  return solution == (vector<int>{5,2});
}

bool redundantConnectionTest3() {
  vector<int> solution = redundantConnection(vector<vector<int>>{{1,2},{2,3},{3,1}});
  return solution == (vector<int>{1,2}) ||
        solution == (vector<int>{2,3}) ||
        solution == (vector<int>{3,1});
}

bool redundantConnectionTest4() {
  vector<int> solution = redundantConnection(vector<vector<int>>{{1,2},{2,3},{3,1},{3,6},{2,5},{1,4}});
  return solution == (vector<int>{1,2}) ||
        solution == (vector<int>{2,3}) ||
        solution == (vector<int>{3,1});
}



bool thirdDegreeNeighborsTest1() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>
           {{1,2},{2,1},{1,3},{3,1},{2,4},
            {4,2},{3,4},{4,3},{4,8},{8,4},
            {4,5},{5,4},{5,6},{6,5},{5,7},
            {7,5},{6,7},{7,6},{8,7},{7,8},
            {8,9},{9,8}}, 1);
  sort(solution.begin(), solution.end());
  return solution == vector<int>{5,8};
}

bool thirdDegreeNeighborsTest2() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>{{1,2},{2,1},{1,3},{3,1},{2,4},{4,2},{3,4},{4,3}}, 1);
  return solution == vector<int>{};
}

bool thirdDegreeNeighborsTest3() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>{}, 1);
  return solution == vector<int>{};
}

bool thirdDegreeNeighborsTest4() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>
         {{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{3,5},{5,3},{3,6},{6,3},
          {1,7},{7,1},{7,8},{8,7},{8,9},
          {9,8},{8,10},{10,8},{8,11},{11,8}}, 1);
  sort(solution.begin(), solution.end());
  return solution == vector<int>{4,5,6,9,10,11};
}

bool thirdDegreeNeighborsTest5() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>
         {{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{4,5},{5,4},{5,6},{6,5},
          {6,1},{1,6}}, 1);
  return solution == vector<int>{4};
}

bool thirdDegreeNeighborsTest6() {
  vector<int> solution = thirdDegreeNeighbors(vector<vector<int>>
         {{1,2},{2,1},{2,3},{3,2},{3,4},
          {4,3},{4,5},{5,4},{5,6},{6,5},
          {6,7},{7,6},{7,8},{8,7},{8,1},
          {1,8}}, 1);
  sort(solution.begin(), solution.end());
  return solution == vector<int>{4,6};
}


bool detectCycleInGraphTest1() {
  return detectCycleInGraph(vector<vector<int>>
         {{1,2},{2,1},{2,3},{3,2},{3,1},{1,3},
          {3,4},{4,3},{5,4},{4,5},{5,6},{6,5},
          {4,7},{7,4}});
}

bool detectCycleInGraphTest2() {
  return !detectCycleInGraph(vector<vector<int>>
         {{1,2},{2,1},{1,3},{3,1},{3,4},{4,3},
          {4,5},{5,4},{5,6},{6,5},{4,7},{7,4}});
}

bool detectCycleInGraphTest3() {
  return !detectCycleInGraph(vector<vector<int>>{});
}

bool detectCycleInGraphTest4() {
  return detectCycleInGraph(vector<vector<int>>
         {{1,2},{2,1},{1,3},{3,1},{3,5},{5,3},
          {5,6},{6,5},{6,4},{4,6},{4,2},{2,4}});
}

bool detectCycleInGraphTest5() {
  return !detectCycleInGraph(vector<vector<int>>{{1,1}});
}

bool detectCycleInGraphTest6() {
  return !detectCycleInGraph(vector<vector<int>>{{1,2},{2,1}});
}



bool friendCirclesTest1() {
  return friendCircles(vector<vector<int>>{{1,1,0}, {1,1,0}, {0,0,1}}) == 2;
}

bool friendCirclesTest2() {
  return friendCircles(vector<vector<int>>{}) == 0;
}

bool friendCirclesTest3() {
  return friendCircles(vector<vector<int>>{{1,1,0}, {1,1,1}, {0,1,1}}) == 1;
}

bool friendCirclesTest4() {
  return friendCircles(vector<vector<int>>{{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}}) == 4;
}

bool friendCirclesTest5() {
  return friendCircles(vector<vector<int>>{{1,1,1,1},{1,1,1,1},{1,1,1,1},{1,1,1,1}}) == 1;
}



bool longestPathITest1() {
  vector<int> solution = longestPathI(vector<vector<int>>{{1,2},{2,3},{1,3}});
  return solution == (vector<int>{1,2,3});
}

bool longestPathITest2() {
  vector<int> solution = longestPathI(vector<vector<int>>{{6,5},{6,4},{5,4},{4,3},{2,3},{1,2},{4,1}});
  return solution == (vector<int>{6,5,4,1,2,3});
}

bool longestPathITest3() {
  vector<int> solution = longestPathI(vector<vector<int>>{{2,3},{3,1}});
  return solution == (vector<int>{2,3,1});
}

bool longestPathITest4() {
  vector<int> solution = longestPathI(vector<vector<int>>{{1,2},{2,4},{4,6},{1,3},{3,5},{5,7}});
  return solution == (vector<int>{1,2,4,6}) ||
        solution == (vector<int>{1,3,5,7});
}

bool longestPathITest5() {
  vector<int> solution = longestPathI(vector<vector<int>>{{1,1}});
  return solution == (vector<int>{1});
}

bool longestPathITest6() {
  vector<int> solution = longestPathI(vector<vector<int>>{{1,2},{1,3},{1,4},{1,5}});
  return solution == (vector<int>{1,2}) ||
        solution == (vector<int>{1,3}) ||
        solution == (vector<int>{1,4}) ||
        solution == (vector<int>{1,5});
}



bool courseScheduleTest1() {
  vector<string> solution = courseSchedule(vector<vector<string>>{{"a","b"},{"a","c"},{"b","d"},{"c","d"}});
  return solution == (vector<string>{"a","b","c","d"}) ||
        solution == (vector<string>{"a","c","b","d"});
}

bool courseScheduleTest2() {
  vector<string> solution = courseSchedule(vector<vector<string>>{{"a","b"},{"b","c"},{"c","d"}});
  return solution == (vector<string>{"a","b","c","d"});
}

bool courseScheduleTest3() {
  vector<string> solution = courseSchedule(vector<vector<string>>{{"a","c"},{"a","b"}});
  return solution == (vector<string>{"a","c","b"}) ||
        solution == (vector<string>{"a","b","c"});
}

bool courseScheduleTest4() {
  vector<string> solution = courseSchedule(vector<vector<string>>
            {{"a","b"},{"a","c"},{"b","d"},{"d","e"},
            {"d","c"},{"c","e"},{"e","f"},{"f","h"},
            {"e","h"},{"e","g"},{"h","g"}});
  return solution == (vector<string>{"a","b","d","c","e","f","h","g"});
}

bool courseScheduleTest5() {

  vector<string> solution = courseSchedule(vector<vector<string>>{});
  return solution == (vector<string>{});
}


bool crypticDictionaryTest1() {
  vector<string> solution = crypticDictionary(vector<string>{"baa","abcd","abca","cab","cad"});
  return solution == (vector<string>{"b","d","a","c"});
}

bool crypticDictionaryTest2() {
  vector<string> solution = crypticDictionary(vector<string>{"caa","aaa","aab"});
  return solution == (vector<string>{"c","a","b"});
}

bool crypticDictionaryTest3() {
  vector<string> solution = crypticDictionary(vector<string>{"bbb","bab"});
  return solution == (vector<string>{"b","a"});
}

bool crypticDictionaryTest4() {
  vector<string> solution = crypticDictionary(vector<string>{"bm","bn","bo","mo"});
  return solution == (vector<string>{"b","m","n","o"});
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
