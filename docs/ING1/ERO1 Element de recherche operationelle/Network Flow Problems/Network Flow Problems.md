---
Owner: "Florian "
---
# Network & flows
A **network** is a **directed** graph, defined by its vertices and edges.
Commodity flowing on the edges of a network is called a flow. The type of commodity can be multiple.
## Flow
An analogy with water flowing through pipe can be made.
- Source node: Node generating flow, act as the origin of the flow
- Sink node: Node absorbing flow. Acts as he final destination of the flow
- Transshipment node: any other node

> [!important] We are usually working with one source and one target.
The capacity is the maximum quantity of flow allowed on the edge. If the flow is a water output, then the flow is the pipe diameter.
## Costs
There is a cost for one unit of flow crossing the edge
The total cost is the weighted sum of all flows on all edges.
![[Untitled 70.png|Untitled 70.png]]
# Shortest path
![[Untitled 1 46.png|Untitled 1 46.png]]
Finding the shortest path between nodes a and d is equivalent to outputing one unit of flow at minimum cost.
# Maximum flow
If flow represents a throughput and each of the pipe comes with a  
maximum capacity, how to maximize water output at the sink node ?
# Minimum capacity cut
A cut capacity cut is the idea of partitioning a node set in two subsets. We usually call them $[ S, \bar{S}]$

> [!important] All of the node need to be in one of the two subsets. Otherwise, it is not a valid cut.
## s-t (_or a-d_) cut
It is a special type of cut where, giving a source node s and a sink node t, the set of node is spitted such that $s \in S, t \in \bar{S}$.
The capacity of a cut can be measured by taking the set $(i,j), i \in S, j \in \bar{S}.$
Be careful with the direction i → j.

> [!important] It does not make any sens to talk about capacity in the context of a non s-t cut.
  
![[Untitled 2 33.png|Untitled 2 33.png]]
The following cut has a capacity of 8 for example.
## Flow invariance along a cut
Net value of flow along any cut is independent of the cut.
This means the flow value can be computed along any cut, by counting **positively** flows from $S$ to $\bar{S}$, and **negatively** the others.
![[Untitled 3 25.png|Untitled 3 25.png]]
The following cut has a flow of 3.
Therefore:
- Flow value in a network is less than the capacity of any cut.
- **Max-Flow Min-Cut theorem**
    
    The maximum flow in a network is equal to the minimum  
    capacity of a cut in the same network.
    
# Ford-Fulkerson Algoritm
## Overview
The Ford-Fulkerson algorithm is used to **solve the maximum flow problem** in a flow network. This algorithm helps determine the maximum possible flow from a source node to a sink node in a network with various capacities assigned to each edge.
If maximum flow of network G = (V,A) is equal to F, then the Ford-Fulkerson algorithm is of complexity O(F|A|).

> [!important] **Fun Fact:**
> 
> If capacities are not all rationals, then the algorithm may never halt or not converge to the optimal solution.
## Residual capacity
**Residual capacity of a path**: minimum residual capacity along the path.
For each edge, I create two values:
- x as the current flow
- u as the capacity

> [!important] The residual capacity is basically the minimum capacity not used across all edges of the path.
![[Untitled 4 19.png|Untitled 4 19.png]]
**Augmenting path**: path between source and sink node with a strictly positive residual capacity.
### Example
![[Untitled 5 13.png|Untitled 5 13.png]]
The residual capacity of the a-c-b-d path is
$min(4,3,2) = 2.$
Thus, the a-c-b-d path, is an **augmenting path.**
## Step by step
1. We start with a capacity-defined, zero flow graph.
2. Find an augmenting path. If none is found, the found flow is maximum.
3. Compute the residual capacity R of the path and update residual capacities of edges along the path:
    1. increment residual capacity of (j, i) edges by R units.
    2. decrement residual capacity of (i, j) edges by R units.
4. Back to step 1
### Example
![[Untitled 6 9.png|Untitled 6 9.png]]
![[Untitled 7 8.png|Untitled 7 8.png]]
![[Untitled 8 7.png|Untitled 8 7.png]]
![[Untitled 9 5.png|Untitled 9 5.png]]
![[Untitled 10 5.png|Untitled 10 5.png]]
![[Untitled 11 5.png|Untitled 11 5.png]]
![[Untitled 12 5.png|Untitled 12 5.png]]
![[Untitled 13 5.png|Untitled 13 5.png]]

> [!important] To eventually find minimum capacity cut, define S by taking all vertices reachable from source in residual network.
## Termination
- If edges capacities are all integers; the algorithm terminates
- Supposing it does not terminate. Since
    
    - The sequence is strictly increasing
    - The maximum flow value is an upper bound
    - It has integers values
    
    Therefore, the sequence is infinite, upper bounded and strictly increasing, which is absurd.
    
It is proven that the algorithm will always terminate.
## Algorithm correctness
1. Flow is maximum between source s and sink t
2. The residual network has no augmenting path
3. There exists a cut which capacity is equal to the flow.
  
- 1 ⇒ 2
    
    Since the algorithm is done.
    
- 2 ⇒ 3
    
    Consider the s – t [S,S] cut obtained by putting in S all vertices reachable from  
    s in residual network. If the residual network has no augmenting path, then all edges  
    between S and S go from S to S.  
    Then for all edges of the initial network from S to S, the flow value is equal to the edge  
    capacity, and it is zero for all edge going the other direction. This means flow value is  
    equal to the cut capacity of the cut [S,S].
    
- 3 ⇒ 1
    
    If a flow has the value of a cut capacity, it is then maximum as flows are necessarily less than the capacity of any cut
    
# Minimum cost flow