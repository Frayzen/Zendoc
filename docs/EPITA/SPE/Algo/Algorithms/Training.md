---
title: Training
Owner: "Florian "
---
  
## Spanning subtree
[https://www.cim.mcgill.ca/~langer/251/E8-MST.pdf](https://www.cim.mcgill.ca/~langer/251/E8-MST.pdf)
### Ex 1
There are 5 cities. The cost of building a road directly between i and j is the entry ai,j in the matrix below. An indefinite entry indicates that the road cannot be built. Determine the least cost of making all the cities reachable from each other.

> [!important] Use the
> 
> [[Kruskal]] way
[![](https://complex-systems-ai.com/wp-content/uploads/2020/11/Image5.png)](https://complex-systems-ai.com/wp-content/uploads/2020/11/Image5.png)
- Answer
    
    We order the edges according to the weights: 12, 23, 13, 45, 25, 15, 24, 35, 14 (raw-column).
    
    Kruskal’s Algorithm accepts edges 12, 23, then rejects 13, then accepts 45, 25, and then it stops.
    
    Thus, the least cost to build the road network is 3 + 3 + 7 + 8 = 21.
    
      
    
  
  
# Algorithm specifications
  
- [[Dijsktra]] algorithm is similar to [[Warshall]] algorithm ?
- Answer
    
    No, it is [[Floyd]] algo
    
      
    
  
- Does [[Dijsktra]] algorithm accept circuit ?
- Answer
    
    Yes, see [[EPITA/SPE/Algo/Algorithms/Shortest path/Shortest path]]

    
  
- Does [[Dijsktra]] algorithm accept circuit ?
- Answer
    
    Yes, see [[EPITA/SPE/Algo/Algorithms/Shortest path/Shortest path]]

    
      
    
  
- Does [[Floyd]] algorithm accept any cost ?
- Answer
    
    Yes, see [[EPITA/SPE/Algo/Algorithms/Shortest path/Shortest path]]

    
  
- Does [[Bellmann 🔔🧑‍💼]] algorithm accept any cost ?
- Answer
    
    Yes, see [[EPITA/SPE/Algo/Algorithms/Shortest path/Shortest path]]

    
      
    
  
- Does [[Bellmann 🔔🧑‍💼]] algorithm accept circuits ?
- Answer
    
    No, see [[EPITA/SPE/Algo/Algorithms/Shortest path/Shortest path]]

