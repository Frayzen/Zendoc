---
title: "Network Flow Problems"
---
Last edited time: June 4, 2024 5:28 PM

# Network & flows

A **network** is a **directed** graph, defined by its vertices and edges.

Commodity flowing on the edges of a network is called a flow. The type of commodity can be multiple.

## Flow

An analogy with water flowing through pipe can be made.

- Source node: Node generating flow, act as the origin of the flow
- Sink node: Node absorbing flow. Acts as he final destination of the flow
- Transshipment node: any other node

<aside>
🧠 We are usually working with one source and one target.

</aside>

The capacity is the maximum quantity of flow allowed on the edge. If the flow is a water output, then the flow is the pipe diameter.

## Costs

There is a  cost for one unit of flow crossing the edge

The total cost is the weighted sum of all flows on all edges.

![Untitled](Network%20Flow%20Problems/Untitled.png)

# Shortest path

![Untitled](Network%20Flow%20Problems/Untitled%201.png)

Finding the shortest path between nodes a and d is equivalent to outputing one unit of flow at minimum cost.

# Maximum flow

If flow represents a throughput and each of the pipe comes with a
maximum capacity, how to maximize water output at the sink node ?

# Minimum capacity cut

A cut capacity cut is the idea of partitioning a node set in two subsets. We usually call them $[ S, \bar{S}]$

<aside>
⚠️ All of the node need to be in one of the two subsets. Otherwise, it is not a valid cut.

</aside>

## s-t (*or a-d*) cut

It is a special type of cut where, giving a source node s and a sink node t, the set of node is spitted such that $s \in S, t \in \bar{S}$.

The capacity of a cut can be measured by taking the set $(i,j), i \in S, j \in \bar{S}.$

Be careful with the direction i → j.

<aside>
⚠️ It does not make any sens to talk about capacity in the context of a non s-t cut.

</aside>

![Untitled](Network%20Flow%20Problems/Untitled%202.png)

The following cut has a capacity of 8 for example.

## Flow invariance along a cut

Net value of flow along any cut is independent of the cut.

This means the flow value can be computed along any cut, by counting **positively** flows from $S$ to $\bar{S}$, and **negatively** the others.

![Untitled](Network%20Flow%20Problems/Untitled%203.png)

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

<aside>
💡 **Fun Fact:** If capacities are not all rationals, then the algorithm may never halt or not converge to the optimal solution.

</aside>

## Residual capacity

**Residual capacity of a path**: minimum residual capacity along the path.

For each edge, I create two values:

- x as the current flow
- u as the capacity

<aside>
🧠 The residual capacity is basically the minimum capacity not used across all edges of the path.

</aside>

![Untitled](Network%20Flow%20Problems/Untitled%204.png)

**Augmenting path**: path between source and sink node with a strictly positive residual capacity.

### Example

![Untitled](Network%20Flow%20Problems/Untitled%205.png)

The residual capacity of the a-c-b-d path is

$$
min(4,3,2) = 2.
$$

Thus, the a-c-b-d path, is an **augmenting path.**

## Step by step

1. We start with a capacity-defined, zero flow graph.
2. Find an augmenting path. If none is found, the found flow is maximum.
3. Compute the residual capacity R of the path and update residual capacities of edges along the path:
    1. increment residual capacity of (j, i) edges by R units.
    2. decrement residual capacity of (i, j) edges by R units.
4. Back to step 1

### Example

![Untitled](Network%20Flow%20Problems/Untitled%206.png)

![Untitled](Network%20Flow%20Problems/Untitled%207.png)

![Untitled](Network%20Flow%20Problems/Untitled%208.png)

![Untitled](Network%20Flow%20Problems/Untitled%209.png)

![Untitled](Network%20Flow%20Problems/Untitled%2010.png)

![Untitled](Network%20Flow%20Problems/Untitled%2011.png)

![Untitled](Network%20Flow%20Problems/Untitled%2012.png)

![Untitled](Network%20Flow%20Problems/Untitled%2013.png)

<aside>
🧠 To eventually find minimum capacity cut, define S by taking all vertices reachable from source in residual network.

</aside>

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
