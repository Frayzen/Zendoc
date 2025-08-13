---
title: Spanning tree
Owner: "Florian "
---
# Algorithms
(both work for negative costs and cycles but the graph must be ==connected== and ==un-directed==)
[[Kruskal]]
[[Prim]]
# Definition
## Spanning subgraph
If a subgraph _**H**_ is drawn by
- removing only a **few** (or **all**) **edges**
- but retaining **all** the _**vertices**_ (points) of a graph **G** _,_
the subgraph _**H**_ is called as a Spanning Subgraph.

> [!important] A spanning subgraph is NOT necessarily a tree, it has to be connected AND acyclic to be so.
### Example
![[Untitled 35.png|Untitled 35.png]]
## Spanning tree (ST)
A ST (Spanning Tree) is obtained, for a connected graph G, building a partial graph of G that is a tree. that is to say connected and acyclic. We can see in figure 1 a connected graph with two possible examples of spanning tree.
![[Untitled 1 19.png|Untitled 1 19.png]]
## Minimal spanning tree (MST)
The spanning tree problem consists to find a partial graph of G which is connected and whose cost is minimum. Such a graph can not have a cycle, otherwise the deletion of one of its edges would give a graph with a less cost and a best spanning tree candidate. As it is connected it is a tree and whose cost is minimum.

> [!important] A minimal spanning tree is
> 
> **not** unique
![[Untitled 2 11.png|Untitled 2 11.png]]