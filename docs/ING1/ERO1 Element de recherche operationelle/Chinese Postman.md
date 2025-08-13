---
Owner: Tim Pearson
---
  
## Algorithm
1. **Check for Eulerian Circuit**:
    - If all vertices have an even degree, the graph has an Eulerian circuit, and that circuit is the solution to the problem.
2. **Identify Odd Degree Vertices**:
    - If the graph does not have all vertices with even degrees, identify all vertices with an odd degree. The number of such vertices will always be even.
3. **Pair Up Odd Degree Vertices**:
    - Pair the odd degree vertices such that the sum of the distances (or weights) between them is minimized.
    - Algo: perfect matching algorithm on the odd degree vertices.
4. **Add Shortest Paths to Make Degrees Even**:
    - For each pair of odd degree vertices, add the shortest path between them to the graph. This makes all degrees even, transforming the graph into one that has an Eulerian circuit.
5. **Find Eulerian Circuit**:
    - Find an Eulerian circuit in the modified graph.
    - Algo: Fleury’s, Hierholzer’s, from graph ex
6. **Convert to Original Graph**:
    - Convert the Eulerian circuit of the modified graph back to the original graph by replacing the added paths with the actual paths between the paired vertices.