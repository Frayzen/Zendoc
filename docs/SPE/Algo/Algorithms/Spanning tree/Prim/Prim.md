---
title: Prim
Owner: "Florian "
---
# Description
![[Untitled 116.png|Untitled 116.png]]
# Pseudocode
![[Untitled 1 83.png|Untitled 1 83.png]]
  
# Example
1.
![[Untitled 2 60.png|Untitled 2 60.png]]
2.
![[Untitled 3 46.png|Untitled 3 46.png]]
⬛ = potentials
🟥 = picked
⬜ = either not seen or not considered anymore
3.
![[Untitled 4 33.png|Untitled 4 33.png]]
4.
![[Untitled 5 23.png|Untitled 5 23.png]]
  
  
  
  
  
# To remember
- initiallize heap, n = 0, parent[-1 ], insol[F ], costs[inf], graph T(undir), x = 0
- inSol[0] = T,
- while n < G.order:
    - check x adjs not in sol, and cost[adj] > G.costs(x,adj)
    - update heap, parent and costs of adj
    - check heap is empty for not connected
    - x = heap.pop(), x now in sol, T.addegde(x, p[x], costs[x]), n++
- return T
  
# ChatGPT implementation
```Python
import sys
def prim(graph, start):
    visited = set()
    mst = set()
    distances = {v: sys.maxsize for v in graph.adjlists}
    distances[start] = 0
    while len(visited) < graph.order:
        min_distance = sys.maxsize
        for v in graph.adjlists:
            if v not in visited and distances[v] < min_distance:
                min_distance = distances[v]
                min_vertex = v
        visited.add(min_vertex)
        for neighbor, cost in graph.adjlists[min_vertex].items():
            if neighbor not in visited and cost < distances[neighbor]:
                distances[neighbor] = cost
                mst.add((min_vertex, neighbor, cost))
    return mst
```