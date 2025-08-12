---
title: "Dijsktra"
---
Allow negative cost: No
Type of algorithm: One point to every others
remember: D = del_min_list

[pcc_Dijkstra.pdf](Dijsktra/pcc_Dijkstra.pdf)

# Pseudo Code

![Untitled](Dijsktra/Untitled.png)

<aside>
⚠️ The line 10 does not admit a good complexity. Instead, it is better to add only the source in the queue originally and enqueue the vertices visited (between line 16 and 17)

</aside>

 

# To remember

- del_min_list
- initialize L = [ ], dist, p
- append src to L
- while L ≠ [ ]
    - x = del_min_list
    - for x adjs
        - standard if
            - add y to L if dist[y] = inf
        - standard update
- return (p, dist)

# GitLab

![Untitled](Dijsktra/Untitled%201.png)

# ChatGPT implementation

```python
def dijkstra(graph, start):
    visited = [False] * graph.order
    distances = [sys.maxsize] * graph.order
    distances[start] = 0
    queue = []
    enqueue(start)
    while queue:
        vertex = dequeue()
        if not visited[vertex]:
            visited[vertex] = True
            for neighbor, cost in graph.adjlists[vertex].items():
                new_distance = distances[vertex] + cost
                if new_distance < distances[neighbor]:
                    distances[neighbor] = new_distance
                if not visited[neighbor]:
                    enqueue(neighbor)

    return distances
```
