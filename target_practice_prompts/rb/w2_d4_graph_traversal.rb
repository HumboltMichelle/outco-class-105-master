#  Target Practice - Graph Traversal
#
#  Instructions: One of the most fundamental components of working with trees
#                and graphs is traversals.  We will focus primarily on this
#                piece to build your foundation of these data structures.
#
#
#
#  1. For the example graph below, what is the expected output if we printed
#     each vertex value from vertex 0 outwards using:
#
#     a. BREADTH FIRST traversal:
#     b. DEPTH FIRST traversal:
#
#     NOTE: Assume the order of edges will be in numerical order. E.g., Vertex
#           4 has edges to 4 vertices in the following order: 2, 5, 6, 7
#
#     NOTE: The traversal should take care of redundancy and not print the same
#           vertex value twice.
#
#     Example Graph:
#
#              2
#            /   \
#    0 ~~~ 1       4  ~~~ 5 ~~~ 3
#            \   /   \   /
#              7       6
#

# DO NOT EDIT
# Vertex class for a graph vertex
class Vertex
  attr_accessor :id, :edges

  def initialize(id)
    @id = id
    @edges = []
  end
end

# DO NOT EDIT
# generate graph from int and array of arrays
def deserialize(n, edges)
  vertices = {}
  while n > 0
    n -= 1
    vertices[n] = Vertex.new(n)
  end
  for edge in edges
    v1 = edge[0]
    v2 = edge[1]
    vertices[v1].edges.push(vertices[v2])
    vertices[v2].edges.push(vertices[v1])
  end

  # UNCOMMENT OUT THIS AREA IF YOU WOULD LIKE TO SEE THE GRAPH YOU'VE BUILT:
  #
  # for id, vertex in vertices
  #   puts ''
  #   puts 'ID: ' + vertex.id.to_s
  #   for edge in vertex.edges
  #     puts 'Edge ID: ' + edge.id.to_s
  #   end
  # end

  return vertices[0]
end

# sample_graph is the vertex with id 0
sample_graph = deserialize(8, [[0, 1], [1, 2], [2, 4], [3, 5], [4, 5], [1, 7], [4, 6], [4, 7], [5, 6]])



#
#  1. Implement Breadth First Search using a queue and while loop.
#
#  Input: {Vertex} - the starting vertex
#  Output: {Array} - an array of vertex ids of the path
#
#  NOTE: You may use an array or linked list for your queue.
#
#  HINT: Use a hash table to handle redundancy
#

def bfs(vertex)
  # YOUR WORK HERE
  return [[]]
end

#  2. Given a starting vertex, and an integer destination, return all valid
#     paths for a given source and destination.
#
#  Input: {Vertex} - the starting vertex
#         {Destination} - integer value of the destination vertex
#  Output: {Array} - an array of arrays of integers
#
#  HINT: Use a set or hash table to handle redundancy
#
#  NOTE: Please be aware that this problem is a slight variation
#    of the HackerRank challenge that was provided in class. How would you
#    handle things differently if each path returned needed to be a list?

def dfs(vertex, destination)
  # YOUR WORK HERE
  return [[]]
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


# code for checking if arrays contain the same elements
def arrays_matching(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  cache = {}
  for i in 0..arr1.length-1
    if cache.key?(arr1[i])
      cache[arr1[i]] += 1
    else
      cache[arr1[i]] = 1
    end
  end
  for j in 0..arr2.length - 1
    if !cache.key?(arr2[j]) || cache[arr2[j]] == 0
      return false
    end
    cache[arr2[j]] -= 1
  end
  return true
end

def get_neighbors(vertex, visited)
  edges = vertex.edges
  return edges.select do |edge| !visited.key?(edge.id)
  end
end

def get_values(vertices)
  return vertices.map { |vertex| vertex.id }
end

def remove_visited(vertices, visited)
  return vertices.select do |vertex| !visited.key?(edge)
  end
end

def valid_bfs(path, start)
  if path[0] != start.id
    return false
  end
  current = start
  visited = {}
  visited[current.id] = current
  i = 0
  j = 1
  while i < path.length
    if i >= j
      return false
    end
    neighbors = get_neighbors(current, visited)
    values = get_values(neighbors)
    if !arrays_matching(values, path[j..j+values.length-1])
      return false
    end
    j += values.length
    for vertex in neighbors
      visited[vertex.id] = vertex
    end
    if i + 1 < path.length
      current = visited[path[i + 1]]
    end
    i += 1
  end
  return true
end


# takes in an array of path and a vertex sart point and determines whether
# the dfs is valid
def valid_dfs(paths, source, destination)

  for path in paths

    if path[0] != source.id
      return false
    end

    if path[path.length - 1] != destination
      return false;
    end

    current = source
    is_valid = false

    for node in 1..path.length - 1
      neighbors = current.edges
      for neighbor in neighbors
        if neighbor.id == path[node]
          is_valid = true
          current = neighbor
          break
        end
      end
      if not is_valid
        return false
      end
    end



  end

  visited = Set.new

  test_dfs = lambda do |current|
    if visited.include?(current.id)
      return false
    end
    visited.add(current.id)
    if current.id == destination
      return true
    end
    neighbors = current.edges
    for neighbor in neighbors
      if not visited.include?(neighbor.id)
        if test_dfs.call(neighbor)
          return true
        end
      end
    end

    visited.delete(current.id)
    return false
  end

  if test_dfs.call(source) and paths == []
    return false
  end
  return true
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


@test_graph = deserialize(8, [[0, 1], [1, 2], [2, 4], [3, 5], [4, 5], [1, 7], [4, 6], [4, 7], [5, 6]])

puts 'breadth_first tests'
test_count = [0, 0]

def test()
  results = bfs(@test_graph)
  return valid_bfs(results, @test_graph)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to return the elements of a graph in breadth first manner', test)


def test()
  no_edge_graph = deserialize(8, [])
  results = bfs(no_edge_graph)
  return valid_bfs(results, no_edge_graph)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return only starting initial node if no edges exist in graph', test)

def test()
  simple_graph = deserialize(3, [[0, 1],[1, 2]])
    results = bfs(simple_graph)
    return valid_bfs(results, simple_graph)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return elements of a simple graph: 0 - 1 - 2 starting at 0', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'depth_first tests'
test_count = [0, 0]

def test()
  results = dfs(@test_graph, 3)
  destination = 3
  return valid_dfs(results, @test_graph, destination)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return valid dfs for connected graph with a cycle', test)


def test()
  source = deserialize(6, [[0, 1], [1, 5], [1, 2], [2, 4], [4, 3]])
  destination = 3
  results = dfs(source, destination)
  return valid_dfs(results, source, destination)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return valid dfs for connected graph with no cycle', test)

def test()
  source = deserialize(7, [[5,1], [5,6], [1,2], [2,4], [0,3]])
  destination = 3
  results = dfs(source, destination)
  return valid_dfs(results, source, destination)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return valid dfs for unconnected graphs with a path', test)

def test()
  source = deserialize(7, [[0,1], [1,6], [1,2], [2,4], [5,3]])
  destination = 3
  results = dfs(source, destination)
  return valid_dfs(results, source, destination)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return valid dfs for unconnected graphs with no path', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
