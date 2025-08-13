---
title: Warshall
Owner: "Florian "
---
# Usage
The Warshall algorithm is used to compute the transitive closure of a directed graph. It determines whether there is a path between each pair of vertices in the graph, even if there is no direct edge between them.
## Transitive closure
In graph theory, transitive closure is a fundamental concept that refers to the set of all vertices that are reachable from a given vertex in a directed graph. In other words, if vertex A can be reached from vertex B via a path of directed edges, and vertex B can be reached from vertex C, then the transitive closure of vertex C includes vertex A.
For example, consider the following directed graph:
```Plain
cssCopy code
A -> B
B -> C
C -> D
```
The transitive closure of vertex A is `**{B, C, D}**`, because there is a path from A to B, B to C, and C to D. Similarly, the transitive closure of vertex B is `**{C, D}**`, and the transitive closure of vertex C is `**{D}**`.
# Pseudocode
![[Untitled 34.png|Untitled 34.png]]
# ChatGPT implementation
```Python
from queue import Queue
def warshall_algorithm(graph):
    n = graph.order
    closure = [[0] * n for _ in range(n)]
    # Create initial closure
    for i in range(n):
        for j in range(n):
            if i == j:
                closure[i][j] = 1
            elif j in graph.adjlists[i]:
                closure[i][j] = 1
    # Use Warshall's algorithm to compute transitive closure
    for k in range(n):
        for i in range(n):
            for j in range(n):
                closure[i][j] = closure[i][j] or (closure[i][k] and closure[k][j])
    return closure
```
## To get a list of CCs:
![[Untitled 1 18.png|Untitled 1 18.png]]