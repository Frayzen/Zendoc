---
title: Floyd
Allow circuit: true
Allow negative cost: true
Type of algorithm: Every points to every points
remember: floyd is a cunt
---
# Principle

> [!important] The floyd algo is similar to
> 
> [[Warshall]] one
# Pseudo code
![[Untitled 179.png|Untitled 179.png]]
## Example of applications
### Quick example
![[Untitled 1 122.png|Untitled 1 122.png]]
![[Untitled 2 87.png|Untitled 2 87.png]]
### Example of initial matrice
![[Untitled 3 63.png|Untitled 3 63.png]]
![[Untitled 4 44.png|Untitled 4 44.png]]
### Final matrice
![[Untitled 5 31.png|Untitled 5 31.png]]
  
# Gitlab
![[Untitled 6 21.png|Untitled 6 21.png]]
# ChatGPT implementation
```Python
def floyd(graph):
    # initialize the distance matrix with infinity for all pairs
    dist = [infinity*graph.order for i in range(graph.order)]
    # initialize the diagonal with 0
    for i in range(graph.order):
        dist[i][i] = 0
    # fill the distance matrix with the edge costs
    for i in range(graph.order):
        for j in graph.adjlists[i]:
            dist[i][j] = graph.costs[(i, j)]
    # compute the shortest paths between all pairs of vertices
    for k in range(graph.order):
        for i in range(graph.order):
            for j in range(graph.order):
                if dist[i][k] + dist[k][j] < dist[i][j]:
                    dist[i][j] = dist[i][k] + dist[k][j]
    return dist
```