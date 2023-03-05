#
# Homework - Advanced Graph Traversals
#
# Instructions: We will be exploring further graph traversal problems in this
# homework file. You'll want to go through the corresponding learning material
# on the Data Structures and Algorithms course at
# https://outco.teachable.com/courses/438359/lectures/6721871
#
# You'll want to use the following classes in your code:
#     - Graph
#     - Stack
#     - Queue
#

# import collections
require 'set'




class Graph
  attr_accessor :storage

  def initialize
    @storage = {}
  end

  def add_vertex(id)
    return false if @storage[id]
    @storage[id] = []
    return true
  end

  def remove_vertex(id)
    return false if !@storage[id]

    @storage.each do |vertex, edges|
      edges.delete(id)
    end
    @storage.delete(id)
    return true
  end


  def add_edge(id1, id2)
    return false if !@storage[id1] || !@storage[id2]
    return false if @storage[id1].include? id2
    @storage[id1].push(id2)
    return true
  end

  def remove_edge(id1, id2)
    if @storage[id1]
      @storage[id1].delete(id2)
      return true
    end
    return false
  end

  def is_vertex(id)
    return !!@storage[id]
  end

  def neighbors(id)
    return @storage[id] || nil
  end

  def vertices()
    return self.storage.keys
  end
end


def generate_adjacency_list(edges)
  graph = Graph.new()
  edges.each { |edge|
    start = edge[0]
    destination = edge[1]
    graph.add_vertex(start)
    graph.add_vertex(destination)
    graph.add_edge(start, destination)
  }
  graph
end


def topological_sort(graph)
  visited = Set.new []
  answer = []

  dfs = lambda do |node|
    if visited.member?(node)
      return
    end
    visited.add(node)
    neighbors = graph.neighbors(node)
    neighbors.each do |neighbor|
      dfs.call(neighbor)
    end
    answer.push(node)
  end

  graph.vertices.each do |vertex|
    dfs.call(vertex)
  end
  answer.reverse
end



# Predict Order


# Practice visualizing the order of traversal for each of the following
# graphs. Write a valid ordering if
#     1) BFS
#     2) DFS (pre-order)
#     3) topological sort are performed.
# The starting vertex for BFS and DFS is vertex 0
#
#  There are no tests for this particular problem. Additionally, for some of
#  these graphs, there are multiple possible solutions
#
#
#
#  Graph A: https://res.cloudinary.com/outco/image/upload/v1519855558/graph-traversal/Paper.Graph_Traversal.10.png
#
#  1) BFS: {0,1,2,3,4,5}
#  2) DFS: {0,1,3,4,5,2}
#  3) Topological sort: {0,2,1,3,4,5}
#
#  Graph B: https://res.cloudinary.com/outco/image/upload/v1519855554/graph-traversal/Paper.Graph_Traversal.11.png
#
#  1) BFS: {0,1,2,4,3}
#  2) DFS: {0,1,3,4,2}
#  3) Topological sort: {0,2,1,3,5,4}
#
#  Graph C: https://res.cloudinary.com/outco/image/upload/v1519855557/graph-traversal/Paper.Graph_Traversal.12.png
#
#  1) BFS: {0,1,2,3,4,5,6,7}
#  2) DFS: {0,2,4,5,7,6,1,3}
#  3) Topological sort: {0,1,3,2,4,6,5,7}
#
#
#
#  Redundant Connection
#
#  Given a directed graph (list of edges), where if one of the edges is
#  removed, the graph will become a tree. Return that edge.
#
#  Parameters:
#
#  Input: edges: [[Integer]]
#  Output: [Integer]
#
#  Examples:
#
# `{{1, 2}, {1, 3}, {2, 3}} --> {2, 3}`
# `{{1, 2}, {2, 3}, {2, 4}, {4, 5}, {5, 2}} --> {5, 2}`
#
#  Note:
#  - For some inputs, there coule be multiple correct solutions
#
#  Resources:
#  - https://leetcode.com/problems/redundant-connection-ii/description/
#


def redundant_connection(edges)
  n = edges.length
  parent = Hash.new 0
  candidates = []

  for u, v in edges do
    if parent.member?(v)
      candidates.push([parent[v], v])
      candidates.push([u, v])
    else
      parent[v] = u
    end
  end

  def orbit(node, parent)
    seen = Set.new
    while parent.member?(node) == true && seen.member?(node) == false
      seen.add(node)
      node = parent[node]
    end
    return node, seen
  end

  root = orbit(1, parent)[0]
  if candidates.length == 0
    cycle = orbit(root, parent)[1]
    for u, v in edges do
      if cycle.member?(u) && cycle.member?(v)
       ans = [u, v]
       return ans
      end
    end
  end

  children = Hash.new []
  for v in parent do
    if children.member?(parent[v]) == false
      children[parent[v]] = []
    else
      children[parent[v]].push(v)
    end
  end

  seen = [true] + [false] * n
  stack = [root]
  while stack.length > 0
    node = stack.pop()
    if seen[node] == false
      seen[node] = true
      stack.push(*children[node])
    end
  end

  answer = []
  seen.each_with_index do |item, index|
    if item == true && index != 0 && candidates[index] != nil
      answer.push(candidates[index])
    end
  end
  answer[0]
end


#
# Third Degree Neighbors
#
# Given an undirected graph represented by a list of edges and a start vertex, return an array of the 3rd degree neighbors.
# Parameters:
#
# Input: edges: [[Integer]]
# Input: start: Integer
# Output: [Integer]
#
# Examples:
#
# The following example with start vertex `1`:
# input:
#              9
#            /
# 1 -- 2   8
# |    | /   \
# 3 -- 4      7
#        \  /  \
#          5 -- 6


# output: [5, 8]

def third_degree_neighbors(edges, start)
  graph = generate_adjacency_list(edges)
  queue = Queue.new
  visited = Set.new []
  result = []

  visited.add(start)
  queue.push([start, 0])

  while queue.length > 0
    current, degree = queue.pop
    if degree == 3
      result.push(current)
    end
    neighbors = graph.neighbors(current)
    for neighbor in neighbors do
      if visited.member?(neighbor) == false
        queue.push([neighbor, degree + 1])
        visited.add(neighbor)
      end
    end
  end
  result
end

# Detect Cycle in Graph (Undirected)
# Given edges that represent an undirected graph, determine if the graph has a cycle.
# A cycle has a minimum of 3 vertices.

# Parameters:
# Input: edges: [[Integer]]
# Output: Boolean

# Example:

# Input: [[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3],
#         [3, 4], [4, 3], [5, 4], [5, 6], [6, 5], [5, 7],
#         [7, 5], [6, 7], [7, 6], [8, 7], [8, 9], [9, 8]]

#                 9
#               /
#   1 - -  2   8
#   |     | /   \
#   3 - - 4      7
#          \   /  \
#            5 - - 6


# Output: True

def detect_cycle_in_graph(edges)
  graph = generate_adjacency_list(edges)
  seen = Set.new []
  queue = Queue.new

  vertices = graph.vertices
  vertices.each { |vertex|
    if (seen.member?(vertex) == false)
      seen.add(vertex)
      queue.push(vertex)
    end
  }
  while (queue.length > 0)
    current = queue.pop
    neighbors = graph.neighbors(current)
    neighbors_visited = 0
    flag = false
    neighbors.each { |neighbor|
      if seen.member?(neighbor) == false
        seen.add(neighbor)
      else
        neighbors_visited += 1
      end
      if neighbors_visited > 1
        flag = true
      end
      if flag == true
        return flag
      end
    }

  end
  return false
end

#
#  Friend Circles
#
#  A friend circle is a group of people who are direct or indirect friends.
#  Given a NxN bitset matrix, where a 1 in the i,j coordinate signifies a
#  friendship between person i and person j, determine how many circles of
#  friends there are.
#
#  Parameters:
#
#  Input: Graph: [[Integer]] (adjacency matrix)
#  Output: Integer
#
#  Example:
#
#  Input: `[[1,1,0], [1,1,0], [0,0,1]]`
#  Output: 2
#
#  Input: `[[1,1,0], [1,1,1], [0,1,1]]`
#  Output: 1
#
#  Resources:
#  - https://leetcode.com/problems/friend-circles/description/
#
#

def friend_circles(matrix)
  seen = Set.new
  circles = 0
  queue = Queue.new

  matrix.each_with_index do |item, row|
    person = row
  if seen.member?(person) == false
    queue.push(person)
    seen.add(person)
    circles += 1
  end
  while queue.length > 0
    current = queue.pop
    matrix[row].each_with_index do |connection, friend|
      if matrix[current][friend] == 1 && seen.member?(friend) == false
        seen.add(friend)
        queue.push(friend)
      end
    end
   end
  end
  return circles
end

# Longest Path I
# Given a DAG (directed acyclic graph), find the longest path in the graph

# Parameters:

# Input: Graph: [[Integer]] (edge list)
# Output: Integer

# Example:

# Input: [[1, 2], [2, 3], [1, 3]]
# Output: [1, 2, 3]

# Input: [[6, 5], [6, 4], [5, 4], [4, 3], [2, 3], [1, 2], [4, 1]]
# Output: [6, 5, 4, 1, 2, 3]


def longest_path_1(edges)
  graph = generate_adjacency_list(edges)
  visited = Set.new []
  result = []

  dfs = lambda do |current, path|
    if visited.member? (current)
      return
    end
    if path.length > result.length
      result = path.clone
    end
    visited.add(current)
    neighbors = graph.neighbors(current)
    neighbors.each { |neighbor|
      path.push(neighbor)
      dfs.call(neighbor, path)
      path.pop
    }
    visited.delete(current)
  end

  vertices = graph.vertices
  for vertex in vertices do
    dfs.call(vertex, [vertex])
  end
  result
end


#
#  Course Schedule
#
#  A collection of courses at a university has prerequisite courses that must
#  be taken first.  Given an array of course pairs [A, B] where A is the
#  prerequisite of B, determine a valid sequence of courses a student can
#  take to complete all the courses.
#
#  Parameters:
#
#  Input: courses: [[String]]
#  Output: [String]
#
#  Example:
#
#  Input: [["a","b"],["a","c"],["b","d"],["c","d"]]
#  Output: ["a","b","c","d"] or ["a","c","b","d"]
#
#  Input: [["a","b"],["b","c"],["c","d"]]
#  Output: ["a","b","c","d"]
#


def course_schedule(course_list)
  course_list = generate_adjacency_list(course_list)
  return topological_sort(course_list)
end


#
#  Cryptic Dictionary
#
#  An array of strings in lexicographical (alphabetical) order has been put
#  through a [simple substitution cypher](https://en.wikipedia.org/wiki/Substitution_cipher)
#  where each letter is now substituted for another letter. Determine a valid
#  ordering of characters in the cypher.
#
#  Parameters:
#
#  Input: words: [String]
#  Output: [String]
#
#  Example:
#
#  Input: ["baa", "abcd", "abca", "cab", "cad"]
#  Output: ["b", "d", "a", "c"]
#
#  Input: ["caa", "aaa", "aab"]
#  Output: ["c", "a", "b"]
#
#

def cryptic_dictionary(words)
  def first_letter_difference(word1, word2)
    if word1 == nil || word2 == nil
      return
    end
    if word1.length < word2.length
      min_word = word1
    else
      min_word = word2
    end
    min_word.each_char.with_index do |char, index|
      if word1[index] != word2[index]
        return [word1[index], word2[index]]
      end
    end
  end
  edges = []
  words.each_with_index do |item, index|
    word = words[index]
    next_word = words[index + 1]
    if first_letter_difference(word, next_word) != nil
      edges.push(first_letter_difference(word, next_word))
    end
  end
  graph = generate_adjacency_list(edges)
  return topological_sort(graph)
end



############################################################
###############  DO NOT TOUCH TEST BELOW!!!  ###############
############################################################

# custom expect function to handle tests
# List count : keeps track out how many tests pass and how many total
#   in the form of a two item array i.e., [0, 0]
# String name : describes the test
# Function test : performs a set of operations and returns a boolean
#   indicating if test passed
def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  err_msg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    err_msg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if err_msg != nil
    puts'       ' + err_msg + '\n'
  end
end

# code for checking if lists are equal
def arrays_equal(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  for i in 0..arr1.length-1
    if arr1[i] != arr2[i]
      return false
    end
  end
  return true
end

# code for capturing print output
#
# directions: capture_print function returns a list of all elements that were
#             printed using print with the function that it is given. Note that
#             the function given to capture_print must be fed using lambda.
#             Example cis provided below

# code for capturing puts output
require 'stringio'
require 'ostruct'

class Capture

  def self.capture &block

    # redirect output to StringIO objects
    stdout = StringIO.new
    $stdout = stdout

    result = block.call

    # restore normal output
    $stdout = STDOUT

    OpenStruct.new result: result, stdout: stdout.string
  end
end


# code for checking if lists are equal
def arrays_equal(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  for i in 0..arr1.length-1
    if arr1[i] != arr2[i]
      return false
    end
  end
  return true
end


puts "\n"
p ("Redundant Connection Tests")
test_count = [0, 0]

def test
  example = redundant_connection([[1, 2], [1, 3], [2, 3]])
  return example != nil && example == [2, 3] || example == [1, 3]
end

expect(test_count, "should work when one node has two parents, but there is no cycle", test)

def test
  example = redundant_connection([[1, 2], [2, 3], [2, 4], [4, 5], [5, 2]])
  return example != nil && example == [5, 2]
end

expect(test_count, "should work when one node has two parents, and there is a cycle", test)

def test
  example = redundant_connection([[1,2],[2,3],[3,1]])
  return example != nil && example == [1, 2] || example == [2, 3] || example == [3, 1]
end

expect(test_count, "should work when there is a cycle, but no node has two parents", test)

def test
  example = redundant_connection([[1,2],[2,3],[3,1],[3,6],[2,5],[1,4]])
  return example != nil && example == [1, 2] || example == [2, 3] || example == [3, 1]
end

expect(test_count, "should work when there is a cycle, and other nodes not in the cycle", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


p ("Third Degree Neighbors")
test_count = [0, 0]

def test
  edges = [[1,2],[2,1],[1,3],[3,1],[2,4],[4,2],[3,4],[4,3],[4,8],[8,4],[4,5],[5,4],[5,6],[6,5],[5,7],[7,5],[6,7],[7,6],[8,7],[7,8],[8,9],[9,8]]
  example = third_degree_neighbors(edges, 1)
  return example != nil && example == [5, 8] || example == [8, 5]
end

expect(test_count, "should work for example case", test)

def test
  edges = [[1,1]]
  example = third_degree_neighbors(edges, 1)
  return example != nil && example == []
end

expect(test_count, "should work on a graph with one vertex", test)

def test
  edges = [[1,2],[2,1],[2,3],[3,2],[3,4],[4,3],[3,5],[5,3],[3,6],[6,3],[1,7],[7,1],[7,8],[8,7],[8,9],[9,8],
           [8,10],[10,8],[8,11],[11,8]]
  example = third_degree_neighbors(edges, 1)
  return example != nil && example == [4,5,6,9,10,11]
end

expect(test_count, "should work with multiple third degree neighbors", test)

def test
  edges = [[1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3],[4, 5], [5, 4], [5, 6], [6, 5], [6, 1], [1, 6]]
  example = third_degree_neighbors(edges, 1)
  return example != nil && example == [4]
end

expect(test_count, "should work on a small cycle", test)

def test
  edges = [[1, 2], [2, 1], [2, 3], [3, 2], [3, 4], [4, 3], [4, 5], [5, 4], [5, 6], [6, 5], [6, 7], [7, 6], [7, 8], [8, 7], [8, 1], [1, 8]]
  example = third_degree_neighbors(edges, 1)
  return example != nil && example == [4, 6]
end

expect(test_count, "should work on a large cycle", test)


puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

p ("Detect Cycle Tests")
test_count = [0, 0]

def test
  example = detect_cycle_in_graph([[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3]])
  return example == true
end

expect(test_count, "should work on first example input", test)

def test
  example = detect_cycle_in_graph([[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3],[3, 4], [4, 3],
                                   [5, 4], [4, 5], [5, 6], [6, 5],[4, 7], [7, 4]])
  return example == true
end

expect(test_count, "should work on second example input", test)

def test
  example = detect_cycle_in_graph([[1, 2], [2, 1], [2, 3], [3, 2], [3, 1], [1, 3],[3, 4], [4, 3],
                                   [5, 4], [4, 5], [5, 6], [6, 5],[4, 7], [7, 4]])
  return example == true
end

expect(test_count, "should work on third example input", test)

def test
  example = detect_cycle_in_graph([])
  return example == false
end

expect(test_count, "should work on empty input", test)

def test
  example = detect_cycle_in_graph([[1, 2], [2, 1], [1, 3], [3, 1], [3, 5], [5, 3],
                                   [5, 6], [6, 5], [6, 4], [4, 6], [4, 2], [2, 4]])
  return example == true
end

expect(test_count, "should work on fifth example input", test)

def test
  example = detect_cycle_in_graph([[1, 1]])
  return example == false
end

expect(test_count, "should work on a single vertex", test)

def test
  example = detect_cycle_in_graph([[1, 2], [2, 1]])
  return example == false
end

expect(test_count, "should work on two vertices", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


p ("Friend Circles")
test_count = [0, 0]

def test
  matrix = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
  example = friend_circles(matrix)
  return example != nil && example == 2
end

expect(test_count, "should work on first example case", test)

def test
  matrix = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]
  example = friend_circles(matrix)
  return example != nil && example == 1
end

expect(test_count, "should work on second example case", test)

def test
  matrix = []
  example = friend_circles(matrix)
  return example != nil && example == 0
end

expect(test_count, "should work on empty matrix", test)

def test
  matrix = [[1]]
  example = friend_circles(matrix)
  return example != nil && example == 1
end

expect(test_count, "should work on a single person", test)

def test
  matrix = [[1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]]
  example = friend_circles(matrix)
  return example != nil && example == 4
end

expect(test_count, "should work when no one is friends with anyone else", test)

def test
  matrix = [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]
  example = friend_circles(matrix)
  return example != nil && example == 1
end

expect(test_count, "should work when everyone is friends with everyone else", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

p ("Longest Path 1")
test_count = [0, 0]

def test
  example = longest_path_1([[1, 2], [2, 3], [1, 3]])
  return example == [1, 2, 3]
end

expect(test_count, "should work for first example case", test)

def test
  example = longest_path_1([[6, 5], [6, 4], [5, 4], [4, 3], [2, 3], [1, 2], [4, 1]])
  return example == [6, 5, 4, 1, 2, 3]
end

expect(test_count, "should work for second example case", test)

def test
  example = longest_path_1([[2, 3], [3, 1]])
  return example == [2, 3, 1]
end

expect(test_count, "should work for three element linear graph", test)

def test
  example = longest_path_1([[1, 2], [2, 4], [4, 6], [1, 3], [3, 5], [5, 7]])
  return example == [1, 2, 4, 6] || example == [1, 3, 5, 7]
end

expect(test_count, "should work for graph with two equivalent paths", test)

def test
  example = longest_path_1([[1, 1]])
  return example == [1]
end

expect(test_count, "should work for single element graph", test)

def test
  example = longest_path_1([[1, 2], [1, 3], [1, 4], [1, 5]])
  return example == [1, 2] || example == [1, 3] || example == [1, 4] || example == [1, 5]
end

expect(test_count, "should handle graph with multiple paths equivalent in length", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

p ("Course Schedule")
test_count = [0, 0]

def test
  course_list = [['a', 'b'], ['a', 'c'], ['b', 'd'], ['c', 'd']]
  example = course_schedule(course_list)
  return example != nil && example == ['a', 'b', 'c', 'd'] || example == ['a', 'c', 'b', 'd']
end

expect(test_count, "should work on first example case", test)

def test
  course_list = [['a', 'b'], ['b', 'c'], ['c', 'd']]
  example = course_schedule(course_list)
  return example != nil && example == ['a', 'b', 'c', 'd']
end

expect(test_count, "should work on case with multiple possible orderings", test)


def test
  course_list = [['a', 'c'], ['a', 'b']]
  example = course_schedule(course_list)
  return example != nil && example == ['a', 'c', 'b'] || example == ['a', 'b', 'c']
end

expect(test_count, "should work on case with three courses", test)

def test
  course_list = [["a","b"],["a","c"],["b","d"],["d","e"],["d","c"],["c","e"],["e","f"],["f","h"],["e","h"],["e","g"],["h","g"]]
  example = course_schedule(course_list)
  return example != nil && example == ['a', 'b', 'd', 'c', 'e', 'f', 'h', 'g']
end

expect(test_count, "should work on example case where this one possible ordering", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

p ("Cryptic Dictionary")
test_count = [0, 0]

def test
  sorted_words = ['baa', 'abcd', 'abca', 'cab', 'cad']
  example = cryptic_dictionary(sorted_words)
  return example != nil && example == ["b", "d", "a", "c"]
end

expect(test_count, "should work on first example case", test)


def test
  sorted_words = ["caa", "aaa", "aab"]
  example = cryptic_dictionary(sorted_words)
  return example != nil && example == ["c", "a", "b"]
end

expect(test_count, "should work on example case with three unique characters", test)

def test
  sorted_words = ['bbb', 'bab']
  example = cryptic_dictionary(sorted_words)
  return example != nil && example == ["b", "a"]
end

expect(test_count, "should work on example case with two unique characters", test)

def test
  sorted_words = ['bm','bn','bo','mo']
  example = cryptic_dictionary(sorted_words)
  return example != nil && example == ['b','m','n','o']
end

expect(test_count, "should work on example case with four unique characters", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
