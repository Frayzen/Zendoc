---
title: "Spanning tree"
---
Last edited time: May 7, 2023 1:23 PM

# Algorithms

(both work for negative costs and cycles but the graph must be connected and un-directed)

[**Kruskal**](Spanning%20tree/Kruskal.md)

[Prim](Spanning%20tree/Prim.md)

# Definition

## Spanning subgraph

If a subgraph ***H*** is drawn by

- removing only a **few** (or **all**) **edges**
- but retaining **all** the ***vertices*** (points) of a graph **G** *,*

the subgraph ***H*** is called as a Spanning Subgraph.

<aside>
💡 A spanning subgraph is NOT necessarily a tree, it has to be connected AND acyclic to be so.

</aside>

### Example

![Untitled](Spanning%20tree/Untitled.png)

## Spanning tree (ST)

A ST (Spanning Tree) is obtained, for a connected graph G, building a partial graph of G that is a tree. that is to say connected and acyclic. We can see in figure 1 a connected graph with two possible examples of spanning tree.

> 
> 

![Untitled](Spanning%20tree/Untitled%201.png)

## Minimal spanning tree (MST)

The spanning tree problem consists to find a partial graph of G which is connected and whose cost is minimum. Such a graph can not have a cycle, otherwise the deletion of one of its edges would give a graph with a less cost and a best spanning tree candidate. As it is connected it is a tree and whose cost is minimum.

<aside>
💡 A minimal spanning tree is **not** unique

</aside>

![Untitled](Spanning%20tree/Untitled%202.png)
