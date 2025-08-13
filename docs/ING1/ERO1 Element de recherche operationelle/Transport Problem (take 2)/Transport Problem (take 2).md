---
title: Transport Problem (take 2)
Owner: Matcha
---
# What is it ?
The transport problem involves delivering a product from multiple origins to multiple destinations at minimum cost while respecting supply and demand constraints.
- **Balanced Problem**: The problem is balanced if the total supply equals the total demand. If not, it can be artificially balanced by adding a dummy destination or source with zero transportation cost.
### Example
- Production: 900, 900
- Demand: 400, 500, 600
- A dummy client can be added to balance the unbalanced supply and demand, e.g., demand = 300 for the fake client with cost = 0
![[Untitled 71.png|Untitled 71.png]]

![[Untitled 1 47.png|Untitled 1 47.png]]

## Greedy Algorithm
A greedy algorithm for the transport problem attempts to minimize the transportation cost by making locally optimal choices at each step. This involves selecting the most cost-effective allocation of units from origins to destinations until all demands are met.
**Steps:**
1. **Sort Origins by Decreasing Supply:**
    - Rank the origins (sources) based on their available supply, from highest to lowest.
2. **Saturate Demands by Increasing Cost:**
    - For each origin, allocate as many units as possible to the destination with the lowest transportation cost until either the supply is exhausted or the demand is met.
### Example
![[Untitled 2 34.png|Untitled 2 34.png]]

![[Untitled 3 26.png|Untitled 3 26.png]]

  
![[Untitled 4 20.png|Untitled 4 20.png]]

![[Untitled 5 14.png|Untitled 5 14.png]]

  
### Cheapest link are not necessarily the best
![[Untitled 6 10.png|Untitled 6 10.png]]

  
# Modelisation of the Transport problem
## **1. Network Representation:**
- **Nodes:** Represent the origins (suppliers) and destinations (consumers).
- **Edges:** Represent the routes between origins and destinations, each with a specific capacity (supply/demand) and unit cost.
### **Objective:**
- Find the maximum flow from origins to destinations at the minimum cost.
- Ensure the sum of supplies equals the sum of demands (balanced problem).
### **Constraints:**
- Capacity constraints on each edge.
- Flow conservation at each node (except sources and sinks).
  
## **2. Transport Table Representation:**
- **Table Format:** Rows represent origins, columns represent destinations.
- **Cells:** Each cell $x_{ij}$ represents the quantity transported from origin $i$ to destination $j$.
- **Unit Costs:** The cost of transporting one unit from $i$ to $j$.
### **Objective:**
- Minimize the total transportation cost.
- Ensure the sum of supplies equals the sum of demands (balanced).
### **Constraints:**
1. For each destination j, the sum of products received equals its demand:
    
    $⁍$
    
2. For each origin i, the sum of products sent equals its supply:
    
    $\sum_{j}x_{ij}=offer_{i}\ \forall i$
    
3. Non-negativity: $x_{ij}\ge0\ \ \forall j$
### **Total Cost:**
- The total transportation cost to minimize:
$Total\ cost= \sum_i\sum_{j}c{ij}x_{ij}$
## **Equivalence of Network and Table Models:**
- **Network Model:** Focuses on the flow of products through a network graph.
- **Table Model:** Utilizes a matrix-like representation to manage allocations and costs.
Both models aim to achieve the same objective:
- Distribute supplies to meet demands at minimal cost.
- Ensure the flow conservation and capacity constraints are respected.
  
# A heuristic
## Vogel's Approximation Method (VAM)
### **Description:**
- Vogel's Approximation Method, also known as the penalty method, is a more refined heuristic that often provides better results than the greedy approach.
### **Steps:**
1. **Calculate Penalties:**
    - For each row and column, calculate the penalty as the difference between the two smallest costs.
2. **Select the Highest Penalty:**
    - Identify the row or column with the highest penalty. This indicates the potential cost increase if the minimal cost is not chosen.
3. **Allocate Based on Minimum Cost:**
    - Within the selected row/column, allocate as much as possible to the cell with the minimum cost.
4. **Repeat:**
    - Adjust the supply and demand, remove satisfied rows/columns, and repeat the process until all demands are satisfied.
## Comparison of Greedy and Vogel's Methods
### **Greedy Algorithm:**
- Simple and fast.
- May not yield the optimal solution.
- Prioritizes immediate minimal cost.
### **Vogel's Approximation Method:**
- More sophisticated and often closer to optimal.
- Considers future cost implications via penalties.
- Empirically shown to perform well in many cases.
Both methods serve as useful heuristics for quickly finding good solutions to the transport problem, with VAM generally providing better results.
  
# Towards optimality
## Dual Variables
### **Definition:**
- Dual variables represent the potential cost savings (or additional costs) associated with increasing supply or demand by one unit at each origin or destination.
### **Impact on Cost:**
- The dual variable associated with an origin node indicates the change in total cost if the supply is increased by one unit.
- The dual variable associated with a destination node indicates the change in total cost if the demand is increased by one unit.
## Marginal Costs
### **Definition:**
- The marginal cost of an arc (link between an origin and a destination) represents the cost impact of increasing the flow along that arc by one unit.
### **Calculation:**
- The marginal cost is the cost of transporting one unit along the arc minus the dual variables of the origin and destination.
- For an active arc (one currently being used in the solution), the marginal cost is zero.
- For inactive arcs, the marginal cost needs to be computed.
## Algorithm for Optimality
### **Step-by-Step Process:**
1. **Evaluate Marginal Costs of Inactive Links:**
    - Compute the marginal costs for all arcs not currently used in the solution.
2. **Check for Improvement:**
    - If all marginal costs are positive, the current solution is optimal.
    - If there are negative marginal costs, it indicates potential for cost reduction.
3. **Select the Link with the Smallest Marginal Cost:**
    - Choose the inactive arc with the smallest (most negative) marginal cost.
4. **Allocate Units to the Chosen Link:**
    - Determine the maximum number of units that can be assigned to the chosen link without violating supply and demand constraints.
    - Adjust the flow to balance supply and demand along the associated cycle.
5. **Repeat:**
    - Recompute marginal costs and repeat the process until no further cost reduction is possible.
## Towards Optimality: The Algorithm in Detail
### **Algorithm Steps:**
1. Evaluate Marginal Costs of Inactive Links.
2. If all marginal costs are $≥ 0$, the solution is optimal. Else, choose the link with the smallest marginal cost.
3. Compute the maximum number of units for the chosen link and balance supply and demand along the cycle. Go back to step $1$.
### Details
1. **Evaluate Marginal Costs:**
    - Use dual variables to compute the marginal costs for all inactive arcs.
    - Marginal cost $MC_{ij} = c_{ij} - u_i - v_j$, where $c_{ij}$ is the cost, and $u_i$, $v_j$ are the dual variables for origin $i$ and destination $j$, respectively.
2. **Check Optimality:**
    - If all $MC_{ij} \geq 0$, the solution is optimal.
    - If any $MC_{ij} < 0$, there is potential for improvement.
3. **Select the Best Link:**
    - Choose the inactive link with the most negative marginal cost.
4. **Update the Transport Table:**
    - Find the maximum flow that can be added to the selected link.
    - Adjust the flow in the cycle to maintain feasibility.
    - Update the transport table and recompute the total cost.