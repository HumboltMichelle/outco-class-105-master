
# What are your 3 strongest technical strengths you will bring to this position?

Should take one minute; minute and a half at most

##### Prompt

Say: "What are your 3 strongest technical strengths you will bring to this position?"

##### Do you hear these things?

- *Identify*: Does the interviewee discuss their competencies based on what you have asked them? Competencies include:
   - Technical Skills (libraries, languages, etc.)
   - Interpersonal Skills  


- *Prove*: Does the interviewee provide a _specific_ example (past experience or hypothetical scenario)  to showcase competencies and/or fit? Is it presented in the form of a story (punchline, beginning, middle, positive end)?


- *Close*: Does the interviewee showcase why the company should hire them and how their skills/experience/values will add value to and align with the team/company? Does the interviewee showcase what they have learned in "Prove" and how they will apply it to the new role?

# 311 - Graph is a Tree ..?

Given an undirected graph in an adjacency list format (a map of every vertex to a list of all its neighboring vertices), determine whether or not said graph is a tree.

```
Input: Undirected Graph as an Adjacency List
Output: Boolean
```

# Example

```
Input:
```
![GraphIsTree1](http://res.cloudinary.com/outco-io/image/upload/v1520910500/GraphIsTree1.png)

```
Output: True
```

```
Input:
```
![GraphIsTree2](http://res.cloudinary.com/outco-io/image/upload/c_scale,w_400/v1520910500/GraphIsTree2.png)

```
Output: False
```

# Constraints

```
Time Complexity: O(V + E)
Auxiliary Space Complexity: O(V + E)
```

The graph `Vertex` has the following properties:

`value` : an integer

`edges` : a list which contains references to other vertices in the `Graph`

You may assume the values of the vertices will all be unique.

# Solution

An undirected graph is a tree if the following two conditions are met:

* 1) There is no cycle among the vertices

* 2) All of the vertices of the graph are connected

Key Insight: If there is a cycle, a `vertex` will have `2` or more `neighbors` in the `visited` set

To detect a cycle:

* 1) Perform either DFS or BFS through the graph

* 2) For every `vertex` in the graph, count the number of neighbors present in the `visited` set

  * a) If there are `1` or fewer, continue your BFS or DFS

    * There will always be at least `1` unless you're at the start node since that represents the node you just came from

  * b) If there are `2` or more return `false`, since that means there is a cycle


* 3) If we search through the entire `Graph` and do not return `false`, then we know there is no cycle and can return `true`

To detect connectivity:

* 1) Perform either DFS or BFS through the graph starting at any vertex

* 2) Check to see whether all the vertices are reachable

* 3) If we can reach every vertex then we know the graph is connected and can return `true`, otherwise return `false`

# Resources

[Check if Graph is Tree](http://quiz.geeksforgeeks.org/check-given-graph-tree/)
