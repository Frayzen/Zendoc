---
title: Tackling an OR problem
Owner: Matcha
---
## What is Operationnal research ?
**Definition :** development and the use of a wide range of problem-solving techniques and methods applied in the pursuit of improved decision-making and efficiency
A scientific approach to solve concrete problems usually complex using mathematics and algorithms
Usually Optimization problems (maximization or minimization), constrained, often combinatorial
### Examples : Traveling salesman problem (TSP)
![[Untitled 69.png|Untitled 69.png]]

**For n cities, how many possible circuits?**
$\frac{(n-1)!}{2}$ Once you chose a city you have $n-1$ cites tochose from and so on → $(n-1)!$  
You then divide by $2$ because you can go to the right or the left
  

> [!important] **Difficult even for powerful computers!**
> 
>   
> With a computer able to evaluate the cost of 1 000 000 000 000 paths per second:  
> Evaluating the cost for all paths with 15 cities takes < 1 second
> 
> - 18 cities takes ~ 3 min
> - 20 cities takes ~ 15 min
> - 22 cities takes ~ 1 year
> - 25 cities takes ~ 10 000 years
> - 30 cities takes ~1 times the age of the universe
Does $P=NP$ ?
[https://scienceetonnante.com/2020/07/17/est-ce-que-p-np/](https://scienceetonnante.com/2020/07/17/est-ce-que-p-np/)
  
# An Iterative approach
![[Untitled 1 45.png|Untitled 1 45.png]]

  
## Need expression
Specify the need.
The problem is not always well defined,and what is asked not always clear.
==**Example :**== ==How to increase travelers satisfaction while waiting for luggage?  
⇒ Make the passengers take a detour to seem like a shorter wait==
Know what we are optimizing. Is it time, distance…
![[Untitled 2 32.png|Untitled 2 32.png]]

  
## Model
A model is a representation of reality. Naturally every model is false.  
A good model is foremost a useful model: It represents well enough reality, with the right granularity
Choosing a good model depends on what you need.
![[Untitled 3 24.png|Untitled 3 24.png]]

### Model with graph theory and linear programming
We will see how to formalize and model an optimization problem with the help of graph theory and linear programming.
![[Untitled 4 18.png|Untitled 4 18.png]]

Here all the nodes have odd edges so you can’t come back
  
## Analysis and validation Tools
Performance indicators
- Is my solution high-quality?
- Are my constraints fulfilled?
- Are my computing times acceptable?
  
Scenario comparison
- If I change a parameter, how does my solution change?
- If I add/remove constraints, is my problem easier to solve?
  
Data visualization (outside of this course scope)
- Maps
- Charts  
    
![[Untitled 5 12.png|Untitled 5 12.png]]

  
# Problem examples
### Shortest path between 2 given points
The shortest paths between two given points is "easy" to solve  
(given positive distances, which is a sensible hypothesis).
On the contrary, the longest path between two points can't be solved in polynomial time.
### Military resources optimization
Take in account the resources…
A radar placed on a given sector watches up to its surrounding sectors. How many radars are needed at minimum to watch the whole territory?
### Delivery/collect tours
Optimize for temperature of the food, the multiple orders, collect garbage…
Generalized TSP
### Transport problems between providers and clients
How to minimize transportation costs, taking into account demands and production capacities ?
### COVID patient transfer
How to free hospital space at minimum cost?
### Tricount
How to balance accounts between friends, with minimum transfers?
### Electricity production planning
How to plan electricity plant production to satisfy moment to moment consumption?
### Departures/arrivals planning of trains in a station
How to assign trains to platforms? How to have a robust plan when problems come? How to maximize user comfort?
### Loading container ships plan
How to load container ships so as to minimize operating times during stops?  
How to lay out containers before loading?
### Telegraph posts positionning
How to place a minimum of telegraph posts so as to keep a minimum height between line and ground at any point?
### Network connecting a bunch of places
How to link all the houses with a minimum number of tiles?
### Terrain irrigation
How to irrigate a set of terrains, while minimizing plumbing tubes and number of pumps required?
### Open sky excavation
What geometrical profile for an open sky mine, so as to maximize excavated value?
### Underground galery design
How to design underground galeries so as to minimize the excavated dirt quantity?
### Table plan
How to plan tables, keeping in mind preferences and incompatibilities between guests?
## Timetable problems
Course to room assignement? Teachers to timeslots? Preferences? Overtime hours?
# Optimization: local or global?
The cheapest link are not always the most optimal ones.
To optimize globally, sometimes imply degrading locally a solution (refuse again seemingly interesting, but losing more somewhere else).
To optimize a system globally requires full cooperation from every actor: some need to accept net loss in their perimeter, for the whole system to behave better.
This is difficult to get agreement on and to operate when local needs are going against global needs.