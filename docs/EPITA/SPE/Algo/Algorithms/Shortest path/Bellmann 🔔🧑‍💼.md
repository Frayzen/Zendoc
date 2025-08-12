---
title: "Bellmann 🔔🧑‍💼"
---
Allow negative cost: Yes
Type of algorithm: One point to every others
remember: bell = tophat

# Main principle

The Bellman algorithm is used to find the shortest path between a source vertex and all other vertices in a weighted graph, where the weight of an edge represents the cost or distance between two vertices. The algorithm starts by assigning a distance of infinity to all vertices except the source vertex, which is assigned a distance of 0. It then relaxes all edges repeatedly, reducing the distance to the destination vertex until no more improvements can be made.

# To remember

- topological order with stack
- pop order before while and at the end of while

# Gitlab

![Untitled](Bellmann%20%F0%9F%94%94%F0%9F%A7%91%E2%80%8D%F0%9F%92%BC/Untitled.png)

# Pseudocode

Create stack of suffix order

Parent Vector

Distance vector (infinity originally)

Distance src= 0

While stack not empty

Set dist adjacents
