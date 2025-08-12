---
title: "Training"
---
Last edited time: April 16, 2023 9:15 PM

## Spanning subtree

[https://www.cim.mcgill.ca/~langer/251/E8-MST.pdf](https://www.cim.mcgill.ca/~langer/251/E8-MST.pdf)

### Ex 1

There are 5 cities. The cost of building a road directly between i and j is the entry ai,j in the matrix below. An indefinite entry indicates that the road cannot be built. Determine the least cost of making all the cities reachable from each other.

<aside>
💡 Use the [Kruskal’s Algorithm](Spanning%20tree/Kruskal.md) way

</aside>

![](https://complex-systems-ai.com/wp-content/uploads/2020/11/Image5.png)

- Answer
    
    We order the edges according to the weights: 12, 23, 13, 45, 25, 15, 24, 35, 14 (raw-column).
    
    Kruskal’s Algorithm accepts edges 12, 23, then rejects 13, then accepts 45, 25, and then it stops.
    
    Thus, the least cost to build the road network is 3 + 3 + 7 + 8 = 21.
    

# Algorithm specifications

- [Dijsktra](Shortest%20path/Dijsktra.md) algorithm is similar to [Warshall](Warshall.md) algorithm ?
- Answer
    
    No, it is [Floyd](Shortest%20path/Floyd.md) algo
    

- Does [Dijsktra](Shortest%20path/Dijsktra.md) algorithm accept circuit ?
- Answer
    
    Yes, see [Shortest path](Shortest%20path.md)
    

- Does [Dijsktra](Shortest%20path/Dijsktra.md) algorithm accept circuit ?
- Answer
    
    Yes, see [Shortest path](Shortest%20path.md)
    

- Does [Floyd](Shortest%20path/Floyd.md) algorithm accept any cost ?
- Answer
    
    Yes, see [Shortest path](Shortest%20path.md)
    

- Does [Bellman](Shortest%20path/Bellmann%20%F0%9F%94%94%F0%9F%A7%91%E2%80%8D%F0%9F%92%BC.md) algorithm accept any cost ?
- Answer
    
    Yes, see [Shortest path](Shortest%20path.md)
    

- Does [Bellman](Shortest%20path/Bellmann%20%F0%9F%94%94%F0%9F%A7%91%E2%80%8D%F0%9F%92%BC.md) algorithm accept circuits ?
- Answer
    
    No, see [Shortest path](Shortest%20path.md)
