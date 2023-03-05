#  Homework - Graph
#
#  Problem: Graph
#
#  Prompt: Create a directed graph class using adjacency list edge
#          representation.
#
#            storage: {Hash Table} - the keys represent unique vertex ids and
#                     the values are arrays of Integers representing the vertex
#                     ids of its neighors.
#
#  The Graph will also have the following methods:
#
#           add_vertex: Method that accepts a vertex id {Integer} and adds the
#                      vertex to the graph.  Return true if success and false
#                      if failed.
#
#                      Input:    id {Integer}
#                     Output:    {Boolean}
#
#        remove_vertex: Method that accepts a vertex id and removes the vertex
#                      with the matching id. Return true if success and false
#                      if failed.
#
#                      Input:    id {Integer}
#                     Output:    {Boolean}
#
#             add_edge: Method that accepts two vertex ids and creates a
#                      directed edge from the first vertex to the second.
#                      Returns true if success and false if failed.
#
#                      Input:    id1 {Integer}
#                      Input:    id2 {Integer}
#                     Output:    {Boolean}
#
#          remove_Edge: Method that accepts two vertex id's and removes the
#                      directed edge from the first vertex to the second.
#                      Returns true if success and false if failed.
#
#                      Input:    id1 {Integer}
#                      Input:    id2 {Integer}
#                     Output:    {Boolean}
#
#           is_vertex:  Method that accepts an id, and returns whether the vertex
#                      exists in the graph.
#
#                      Input:    id {Integer}
#                      Output:   {Boolean}
#
#           neighbors: Method that accepts a vertex id, and returns all of the
#                      edges of that vertex.
#
#                      Input:    id {Integer}
#                      Output:   {Boolean}
#
#  Input:  {Nil}
#  Output: {Graph}
#
#  Notes:  The notation for Time/Auxiliary Space Complexity for graphs is
#          slightly different since certain functions depend on either the
#          either the number of vertices, edges, or both
#
#          O(V) = Linear w/ respect to the number of vertices
#          O(E) = Linear w/ respect to the number of all edges
#          O(V+E) = Linear w/ respect to the number of vertices plus edges
#


class Graph

  # Time Complexity:
  # Auxiliary Space Complexity:
  def add_vertex(id)
    # YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def remove_vertex(id)
    # YOUR WORK HERE
  end


  # Time Complexity:
  # Auxiliary Space Complexity:
  def add_edge(id1, id2)
    # YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def remove_edge(id1, id2)
    # YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def is_vertex(id)
    # YOUR WORK HERE
  end

  # Time Complexity:
  # Auxiliary Space Complexity:
  def neighbors(id)
    # YOUR WORK HERE
  end
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
  errMsg = nil
  begin
    if test()
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    errMsg = err.message
  end

  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if errMsg != nil
    puts'       ' + errMsg + '\n'
  end
end


# code for checking if arrays contain the same elements
# (do not need to be in the same order)
def arrays_matching(arr1, arr2)
  if arr1.length != arr2.length
    return false
  else
    lib = {}
    for i in 0..arr1.length-1
      lib[arr1[i]] = true
    end
    for j in 0..arr2.length-1
      if lib[arr2[j]] == nil
        return false
      end
    end
    return true
  end
end


puts 'Graph Class'
test_count = [0, 0]

def test()
  work = Graph.new()
  return work.is_a?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an instance', test)

def test()
  work = Graph.new()
  work.instance_variable_defined?(:@storage)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has storage property', test)

def test()
  work = Graph.new()
  return work.respond_to?(:storage) && work.storage.kind_of?(Object)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'storage property initialized to an empty object', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Graph add_vertex method'
test_count = [0, 0]

def test()
  work = Graph.new()
  work.respond_to?(:add_vertex)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has add_vertex method', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  return work.respond_to?(:storage) && work.storage.length == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to add a vertex', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  return work.respond_to?(:storage) && work.storage[5].kind_of?(Array)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'verticees store an array of connections', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  return work.respond_to?(:storage) && work.storage.length == 2 && work.storage[5] && work.storage[10]
rescue StandardError => err
  puts err.message
end
expect(test_count, 'is able to add two vertices', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(5)
  return work.respond_to?(:storage) && work.storage.length == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not add in duplicate vertex', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Graph add_edge method'
test_count = [0, 0]

def test()
  work = Graph.new()
  work.respond_to?(:add_edge)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has add_edge method', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  result = work.add_edge(5, 10)
  return work.respond_to?(:storage) && work.storage[5].length == 1 && work.storage[10].length == 0 && result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to create an edge between two vertices that exist', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  result = work.add_edge(5, 10)
  return work.respond_to?(:storage) && work.storage[5].length == 0 && !work.storage[10] && !result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not create an edge when one of the vertices does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Graph remove_edge method'
test_count = [0, 0]

def test()
  work = Graph.new()
  work.respond_to?(:remove_edge)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove_edge method', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  work.add_edge(5, 10)
  result = work.remove_edge(5, 10)
  return work.respond_to?(:storage) && work.storage[5].length == 0 && work.storage[10].length == 0 && result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove an edge between two vertices', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  work.add_edge(5, 10)
  result = work.remove_edge(6, 10)
  return work.respond_to?(:storage) && work.storage[5].length == 1 && !work.storage[6] && !result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove edge when edge does not exist', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Graph remove_vertex method'
test_count = [0, 0]

def test()
  work = Graph.new()
  work.respond_to?(:remove_vertex)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has remove_vertex method', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  result = work.remove_vertex(5)
  return work.respond_to?(:storage) && work.storage.length == 0 && result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to remove a vertex within graph', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  result = work.remove_vertex(10)
  return work.respond_to?(:storage) && work.storage.length == 1 && !result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'does not remove vertex that does not exist', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  work.add_vertex(15)
  work.add_edge(5, 10)
  work.add_edge(5, 15)
  work.add_edge(10, 5)
  work.add_edge(15, 10)
  result = work.remove_vertex(5)
  return work.respond_to?(:storage) && work.storage.length == 2 && work.storage[10].length == 0 && work.storage[15].length == 1 && result
rescue StandardError => err
  puts err.message
end
expect(test_count, 'removes a vertex while safely removing edges connected to node', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"


puts 'Graph neighbors method'
test_count = [0, 0]

def test()
  work = Graph.new()
  work.respond_to?(:neighbors)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'has neighbors method', test)

def test()
  work = Graph.new()
  return work.neighbors(5) == nil
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns nil when a vertex doesn\'t exist', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  return work.neighbors(5) != nil && work.neighbors(5).length == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns an empty array if vertex has no edges', test)

def test()
  work = Graph.new()
  work.add_vertex(5)
  work.add_vertex(10)
  work.add_vertex(15)
  work.add_vertex(20)
  work.add_edge(5, 10)
  work.add_edge(5, 15)
  work.add_edge(5, 20)
  result = work.neighbors(5)
  return result != nil && result.length == 3 && arrays_matching(result, [10,15,20])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'returns neighbors if edges exist for a vertex', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
