/*
 *  Target Practice - Graph Traversal
 *
 *  Instructions: Solve the following graph traversal problems.
 */


/*
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


import java.util.*;


// DO NOT EDIT
// Vertex class
class Vertex {
    public Integer id;
    public List<Vertex> edges;

    public Vertex(Integer id) {
        this.id = id;
        this.edges = new ArrayList<>();
    }
}

class GraphProblems {

    // DO NOT EDIT
    // generate graph from int and array of arrays
    public static Vertex deserialize(int n, int[][] edges){
        Map<Integer, Vertex> vertices = new HashMap<>();
        for (Integer i = 0; i < n; i++) {
            vertices.put(i, new Vertex(i));
        }
        int v1;
        int v2;
        for (int[] edge : edges) {
            v1 = edge[0];
            v2 = edge[1];
            vertices.get(v1).edges.add(vertices.get(v2));
            vertices.get(v2).edges.add(vertices.get(v1));
        }
        return vertices.get(0);
    }

    /**
     *  1. Implement Breadth First Search using a queue and while loop.
     *
     *  Input: {Vertex} - the starting vertex
     *  Output: {List} - an list of vertex ids of the path
     *
     *  HINT: Use a set or hash map to handle redundancy
     */

    public static List<Integer> bfs(Vertex vertex) {
     // YOUR WORK HERE
     return new ArrayList<Integer>();
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

    public static List<ArrayList<Integer>> dfs(Vertex src, Integer dest) {
    // YOUR WORK HERE
    return new ArrayList<ArrayList<Integer>>();
    }



}


////////////////////////////////////////////////////////////
///////////////  DO NOT TOUCH TEST BELOW!!!  ///////////////
////////////////////////////////////////////////////////////

// use the Main class to run the test cases
class GraphTests {
    public interface Test {
        boolean execute();
    }

    public static void main(String[] args) {

        int[] testCount = {0, 0};
        System.out.println("Breadth First Search tests");

        assertTest(testCount, "able to return the elements of a graph in breadth first manner", () -> {
            try {
                Vertex test = GraphProblems.deserialize(8, new int[][]{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
                List<Integer> results = GraphProblems.bfs(test);
                return validBfs(results, test);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        });

        assertTest(testCount, "should return only starting initial node if no edges exist in graph", () -> {
            try {
                Vertex test = GraphProblems.deserialize(8, new int[][]{});
                List<Integer> results = GraphProblems.bfs(test);
                return validBfs(results, test);
            } catch (Exception e) {
                return false;
            }
        });

        assertTest(testCount, "should return elements of simple graph: 0 - 1 - 2 starting at 0", () -> {
            try {
                Vertex test = GraphProblems.deserialize(3, new int[][]{{0,1}, {1,2}});
                List<Integer> results = GraphProblems.bfs(test);
                return validBfs(results, test);
            } catch (Exception e) {
                return false;
            }
        });

        System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");


        testCount[0] = 0;
        testCount[1] = 0;
        System.out.println("Depth First Search Tests");

        assertTest(testCount, "should return all valid dfs paths for connected graph with a cycle", () -> {
            try {
                Vertex testGraph = GraphProblems.deserialize(8, new int[][]{{0, 1}, {1, 2}, {2, 4}, {3, 5}, {4, 5}, {1, 7}, {4, 6}, {4, 7}, {5, 6}});
                Integer destinationID = 3;
                List<ArrayList<Integer>> results = GraphProblems.dfs(testGraph, destinationID);

                List<ArrayList<Integer>> solution = new ArrayList<>();
                solution.add(new ArrayList<>(Arrays.asList(0, 1, 2, 4, 5, 3)));
                solution.add(new ArrayList<>(Arrays.asList(0, 1, 2, 4, 6, 5, 3)));
                solution.add(new ArrayList<>(Arrays.asList(0, 1, 7, 4, 5, 3)));
                solution.add(new ArrayList<>(Arrays.asList(0, 1, 7, 4, 6, 5, 3)));

                return array2DEqualsUnordered(results, solution);
            } catch (Exception e) {
                return false;
            }
        });

        assertTest(testCount, "should return valid dfs for connected graph with no cycle", () -> {
            try {
                Vertex testGraph = GraphProblems.deserialize(6, new int[][]{{0, 1}, {1, 5}, {1, 2}, {2, 4}, {4, 3}});
                Integer destinationID = 3;
                List<ArrayList<Integer>> results = GraphProblems.dfs(testGraph, destinationID);
                return validDfs(results, testGraph, destinationID);
            } catch (Exception e) {
                return false;
            }
        });

        assertTest(testCount, "should return valid dfs for unconnected graphs with a path", () -> {
            try {
                Vertex testGraph = GraphProblems.deserialize(7, new int[][]{{5,1}, {5,6}, {1,2}, {2,4}, {0,3}});
                Integer destinationID = 3;
                List<ArrayList<Integer>> results = GraphProblems.dfs(testGraph, destinationID);
                return validDfs(results, testGraph, destinationID);
            } catch (Exception e) {
                return false;
            }
        });

        assertTest(testCount, "should return valid dfs for unconnected graphs with no path", () -> {
            try {
                Vertex testGraph = GraphProblems.deserialize(7, new int[][]{{0,1}, {1,6}, {1,2}, {2,4}, {5,3}});
                Integer destinationID = 3;
                List<ArrayList<Integer>> results = GraphProblems.dfs(testGraph, destinationID);
                return validDfs(results, testGraph, destinationID);
            } catch (Exception e) {
                return false;
            }
        });

        System.out.println("PASSED: " + testCount[0] + " / " + testCount[1] + "\n\n");
    }

    private static List<Vertex> getNeighbors(Vertex vertex, Map<Integer, Vertex> visited) {
        List<Vertex> results = new ArrayList<>();
        List<Vertex> edges = vertex.edges;
        for (Vertex neighbor : edges) {
            if (!visited.containsKey(neighbor.id)) {
                results.add(neighbor);
            }
        }
        return results;
    }

    private static List<Integer> getValues(List<Vertex> vertices) {
        List<Integer> results = new ArrayList<>();
        for (Vertex vertex : vertices) {
            results.add(vertex.id);
        }
        return results;
    }

    // function for checking if arrays contain same elements
    // (do not need to be in the same order)
    private static boolean listsMatching(List<Integer> list1, List<Integer> list2) {
        if (list1.size() != list2.size()) {
            System.out.println("listMatching: not equal length");
            return false;
        }

        Map<Integer, Integer> cache = new HashMap<>();
        for (int value : list1) {
            int count = cache.getOrDefault(value, 0);
            cache.put(value, count + 1);
        }

        for (int value : list2) {
            if (!cache.containsKey(value) || cache.get(value) == 0) {
                return false;
            }
            int count = cache.get(value);
            cache.put(value, count - 1);
        }

        return true;
    }

    // takes in an array of path and a vertex start point and determines whether
    // the bfs is valid
    private static boolean validBfs(List<Integer> path, Vertex start) {
        if (path.size() == 0 && start != null) {
            return false;
        }
        if (!path.get(0).equals(start.id)) {
            return false;
        }

        Vertex current = start;
        Map<Integer, Vertex> visited = new HashMap<>();
        visited.put(current.id, current);
        for (int i = 0, j = 1; i < path.size() - 1; i++) {
            if (i >= j) {
                return false;
            }
            List<Vertex> neighbors = getNeighbors(current, visited);

            List<Integer> values = getValues(neighbors);
            List<Integer> subPath = path.subList(j, j + values.size());
            if (!listsMatching(values, subPath)) {
                return false;
            }
            j += values.size();
            for (Vertex neighbor : neighbors) {
                visited.put(neighbor.id, neighbor);
            }

            current = visited.get(path.get(i + 1));
        }

        return true;
    }

    // takes in an array of path and a vertex start point and determines whether
    // the dfs is valid
    private static boolean validDfs(List<ArrayList<Integer>> paths, Vertex source, Integer destID) {
        for(ArrayList<Integer> path: paths){
            if(!path.get(0).equals(source.id)) {
                return false;
            }
            if(!path.get(path.size()-1).equals(destID)){
                return false;
            }
            Vertex current = source;
            boolean isValid = false;
            for(int node = 1; node < path.size(); node++) {
                List<Vertex> neighbors = current.edges;
                for(Vertex neighbor: neighbors){
                    if(neighbor.id.equals(path.get(node))) {
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
        return !testDfs(source, new HashSet<>(), destID) || paths.size() != 0;
    }

    private static boolean testDfs(Vertex current, HashSet<Integer> visited, Integer destID){
        if(visited.contains(current.id)) return false;
        visited.add(current.id);
        if(current.id.equals(destID)) return true;
        List<Vertex> neighbors = current.edges;
        for(Vertex neighbor: neighbors){
            if(!visited.contains(neighbor.id)){
                if(testDfs(neighbor, visited, destID)) return true;
            }
        }
        visited.remove(current.id);
        return false;
    }

    //Check if 2 lists contain sublists that match but are not necessarily in the same order
    private static boolean array2DEqualsUnordered(List<ArrayList<Integer>> arr1, List<ArrayList<Integer>> arr2) {
        if (arr1 == null) return (arr2 == null);
        if (arr2 == null) return false;
        if (arr1.size() != arr2.size()) return false;
        int count = 0;
        for(ArrayList<Integer> subArr1: arr1){
            for(ArrayList<Integer> subArr2: arr2){
                if(subArr1.equals(subArr2)){
                    count++;
                    break;
                }
            }
        }
        return count == arr1.size();
    }


    private static void assertTest(int[] count, String name, Test test) {
        String pass = "false";
        count[1]++;

        try {
            if (test.execute()) {
                pass = " true";
                count[0]++;
            }
        } catch(Exception ignored) {}
        String result = "  " + (count[1] + ")   ").substring(0, 5) + pass + " : " + name;
        System.out.println(result);
    }

}
