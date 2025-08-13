---
Owner: "Florian "
---
- a path is some arcs
- a chain is some edges
closed path / chain ⇒ length = 0
path / chain vertices distincts ⇒ elementary
closed path + elementary = circuit
  
  
Tarjan is used to determine the strongly connected components of a directed graph (uses stack)
Kosaraju is used to determine the strongly connected components of a directed graph (reverses + stack)
  
a lock is either:
- an edge
a 2-conneted component is:
- a maximum block
- a biconnected graph
  
Partial graph: takes any number of **existing vertices** and some of the **existing edges**
: takes any number of **existing vertices** and any **edges (new ones potentially)**
## Sub graph
## Spanning Sub Graph
A subgraph takes any number of edges and the associated vertices but **NO MORE**.
A spanning sub graph takes any number of edges and any points from the graph (no correlation)
**EXAMPLE:**
**EXAMPLE:**
![[Untitled 7.png|Untitled 7.png]]
![[Untitled 1 2.png|Untitled 1 2.png]]
- subset of
- include all vertices
- subset of edges
- preserves connectivity