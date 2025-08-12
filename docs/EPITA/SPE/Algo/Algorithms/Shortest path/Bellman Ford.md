---
title: "Bellman Ford"
---
Allow negative cost: Yes
Type of algorithm: One point to every others
remember: ford=fast in and out and all (n)

# Principle

The Bellman Ford alorithm is based on the fact that the number of edges in the shortest path we are looking for **can not be greater than the number of verticles - 1.**

Therefore, we can implement an algorithm that sets the origin as a distance zero and is updating the distances n-1 times.

## Update the distance

In order to update the distances we just 

# To remember

- q_in, q_out, inQueue, n = G.order
- src in q_out
- while n > 0 and q_out no empty
- empty q_out then standard check, only enqueue to q_in if not already in
- swap queues and decrement n

# Gitlab

![Untitled](Bellman%20Ford/Untitled.png)

# Pseudocode

## English

### Initialization

![Untitled](Bellman%20Ford/Untitled%201.png)

### Core

![Untitled](Bellman%20Ford/Untitled%202.png)

### Negative cycle

![Untitled](Bellman%20Ford/Untitled%203.png)

## Fench

![Untitled](Bellman%20Ford/Untitled%204.png)

![image-1681377750642.jpg7201923380614892661.jpg](Bellman%20Ford/image-1681377750642.jpg7201923380614892661.jpg)

To detect negative cycle, we can apply the following loop at the end of the program

![Untitled](Bellman%20Ford/Untitled%205.png)

# 

# ChatGPT implmentation

```python
def bellman_ford(graph, start):
    distances = [sys.maxsize] * graph.order
    distances[start] = 0
    queue = Queue()
    for i in range(graph.order):
        for j in range(graph.order):
            for neighbor, cost in graph.adjlists[j].items():
                if distances[j] + cost < distances[neighbor]:
                    distances[neighbor] = distances[j] + cost
                    if not queue.is_empty():
                        queue.enqueue(neighbor)
        if not queue.is_empty():
            j = queue.dequeue()
            queue.enqueue(j)
            distances[j] = -sys.maxsize

    return distances
```
