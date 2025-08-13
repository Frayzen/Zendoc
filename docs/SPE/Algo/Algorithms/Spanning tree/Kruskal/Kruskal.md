---
Owner: "Florian "
---
The purpose of Kruskal's algorithm is to find a minimum spanning tree in a connected, weighted graph. A minimum spanning tree is a tree that spans all the vertices in the graph, using the minimum possible total edge weight. Kruskal's algorithm works by starting with a forest of single-vertex trees and repeatedly adding the minimum-weight edge that connects two trees in the forest, until all the vertices are in a single tree. The algorithm maintains a set of disjoint sets of vertices, and uses a priority queue to extract the minimum-weight edges. Kruskal's algorithm has a time complexity of O(E log E), where E is the number of edges in the graph, making it an efficient way to find a minimum spanning tree in large graphs.
# Pseudocode
![[Untitled 117.png|Untitled 117.png]]
## Example
![[Untitled 1 84.png|Untitled 1 84.png]]
![[Untitled 2 61.png|Untitled 2 61.png]]
  
# To remember
- initialize basic heap and push all nodes,
- initialize graph T, n = 0, parent[ ]
- while n < G,order -1 and heap not empty
    - x→y = heap pop
    - if union x, y:
        - add x→y to T
        - n ++
- if n > G.order -1 ⇒ not connected
- return T
# Chat GPT implementation
```Python
def kruskal(graph):
    """
    Kruskal's algorithm to find minimum spanning tree (MST) of a graph.
    Args:
        graph (Graph): The graph for which to find the MST.
    Returns:
        Graph: The MST of the input graph.
    """
    # sort edges by weight
    edges = []
    for src in range(graph.order):
        for dst in graph.adjlists[src]:
            if src <= dst: # prevent considering each edge twice
                weight = graph.costs[(src, dst)] if graph.costs else 1
                edges.append((weight, src, dst))
    edges.sort()
    # create a forest of trees, with one tree per vertex
    trees = []
    for vertex in range(graph.order):
        t = Graph(1)
        t.addvertex()
        trees.append(t)
    # iterate over the sorted edges, adding each one that doesn't create a cycle
    MST = Graph(graph.order)
    for weight, src, dst in edges:
        tree1 = find_tree_containing_vertex(trees, src)
        tree2 = find_tree_containing_vertex(trees, dst)
        if tree1 != tree2:
            MST.addedge(src, dst, weight)
            trees.remove(tree2)
            tree1.addvertex(t=tree2)
    return MST

def find_tree_containing_vertex(trees, vertex):
    """
    Find the tree in a forest that contains a given vertex.
    Args:
        trees (list of Graphs): The forest of trees to search.
        vertex (int): The vertex to search for.
    Returns:
        Graph: The tree containing the vertex.
    """
    for t in trees:
        if vertex in t.adjlists:
            return t
    return None
```
a star algo
a star algo
a star algo
a star algo
a star algo
a star algo
a star algo