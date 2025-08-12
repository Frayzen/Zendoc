---
title: "Transport Problem"
---
Last edited time: June 9, 2024 7:19 PM

![Untitled](Transport%20Problem/Untitled.png)

### definition

- We have to deliver at minimum cost, some units of a product from m origins to n destinations, respecting offer and demand.
- Such a problem is balanced if offer equals demand.
- It’s always possible to balance a transport problem artificially, when offer is
greater than demand.

### Balance the problem

![Untitled](Transport%20Problem/Untitled%201.png)

### Greedy algo

### problem:

![Untitled](Transport%20Problem/Untitled%202.png)

### solution:

![Untitled](Transport%20Problem/Untitled%203.png)

1. Sort origins by decreasing offers
2. Saturate demands by increasing cost

Greedy’s cost = 34 400

- choose the max offer
- do the minimum cost
- 

<aside>
💡 helps to add the offers and demands to the costs table

</aside>

## Cheapest costs not always the best

![Untitled](Transport%20Problem/Untitled%204.png)

![Untitled](Transport%20Problem/Untitled%205.png)

## Transport problem modelisation

![Untitled](Transport%20Problem/Untitled%206.png)

## Heuristic (check Vogels Algo)

- we want to find the difference of taking the second best instead of the best

![Untitled](Transport%20Problem/Untitled%207.png)

- want to optimize cost
- choose to start with the rows and cols with the highest delta
- then choose the one with the lowest cost
- that gives us F2,C1 and F3, C3
- to choose between the two, you want to send as much as you can. we take the second since we can send 22 straight up
- to summarize we choose F3.C3

![Untitled](Transport%20Problem/Untitled%208.png)

<aside>
💡 remember to exclude any filled rows rom next steps (where demand is satisfied)

</aside>

<aside>
💡 and also update the supply column

</aside>

![Untitled](Transport%20Problem/Untitled%209.png)

### Conclusion

- Empirical studies showed this heuristic is "often" optimal, or close to optimality
- we can make it even more optimal
