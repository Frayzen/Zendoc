---
title: Transport Problem
Owner: Tim Pearson
---
![[Untitled 72.png|Untitled 72.png]]
### definition
- We have to deliver at minimum cost, some units of a product from m origins to n destinations, respecting offer and demand.
- Such a problem is balanced if offer equals demand.
- It’s always possible to balance a transport problem artificially, when offer is  
    greater than demand.
### Balance the problem
![[Untitled 1 48.png|Untitled 1 48.png]]
  
  
### Greedy algo
### problem:
![[Untitled 2 35.png|Untitled 2 35.png]]
### solution:
![[Untitled 3 27.png|Untitled 3 27.png]]
1. Sort origins by decreasing offers
2. Saturate demands by increasing cost
Greedy’s cost = 34 400
- choose the max offer
- do the minimum cost

> [!important] helps to add the offers and demands to the costs table
  
## Cheapest costs not always the best
![[Untitled 4 21.png|Untitled 4 21.png]]
![[Untitled 5 15.png|Untitled 5 15.png]]
  
  
## Transport problem modelisation
  
![[Untitled 6 11.png|Untitled 6 11.png]]
  
## Heuristic (check Vogels Algo)
- we want to find the difference of taking the second best instead of the best
![[Untitled 7 9.png|Untitled 7 9.png]]
- want to optimize cost
- choose to start with the rows and cols with the highest delta
- then choose the one with the lowest cost
- that gives us F2,C1 and F3, C3
- to choose between the two, you want to send as much as you can. we take the second since we can send 22 straight up
- to summarize we choose F3.C3
![[Untitled 8 8.png|Untitled 8 8.png]]

> [!important] remember to exclude any filled rows rom next steps (where demand is satisfied)

> [!important] and also update the supply column
![[Untitled 9 6.png|Untitled 9 6.png]]
  
### Conclusion
- Empirical studies showed this heuristic is "often" optimal, or close to optimality
- we can make it even more optimal