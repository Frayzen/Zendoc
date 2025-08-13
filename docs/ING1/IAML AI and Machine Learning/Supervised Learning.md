---
Owner: Tim Pearson
---
  
## Linear Regression
- DEF 1: find a **functional dependency** between **input** variable and output **variable**
- DEF 2: primary objective of regression analysis, or simply regression, is to study the **dependency relationships** between variables
### Objectives of LR
- as a **stylistical technique,** a fundamental aim of regression is to **synthesize** the available info
- we are looking for **parsimonious model** that can be interpreted
- **simplicity** is also an objective
### Specifying a regression model
- model can be guided by theoretical considerations such as a block on a inclined slope
- sometimes, the model is unknown. but we want to like a response variable to a predictor variable
- **example**: do countries with higher per capita incomes tend to have lower birth rates than those with lower per capita income countries
    - **response variable**: birth rate
    - **forecast** : per capita income
### Relationship schema
- A ⇒ B
- B ⇒ A
- C ⇒ A, C ⇒ B
# Estimation error analysis
- choosing a linear model would give us this as the error to estimate the water boiling temp at different air pressures
- error = (atmospheric pression) - (mx + b)
- we plot the error versus temperature: the vertical axis is on a smaller scale thus increasing resolution
# Supervised learning
- dataset → training set
- assumption
    - there exists a target function f that is unkown
        - f: obvs→label
    - a number of obvs and associated labels are avaialable
- aim
    - find h that approximates of given the training set
  
### Risk Compnents
- Residual risks: non zero in the presence of noise, the relationship between X and Y is not a deterministic function or relationship
- error of apporximation: zero only if R’ can be reached by a function of F, F contains he desired deoendency
- Estimation error: the F function that minimaized the empirical ricks is not necessarily ht eone that mimimizes the expectred risk
    - when you train you model the kind of optimation problem is not convext (not one global mimimum)
## Risk and sample size
- empirical risk and estimation error …
  
### Sensitivty and specificity (ROC curves)
- check
  
## Supervised learning data stets
- training dataset:
- validation database:
- test database
## Decision trees
- **entropy**: is the remaining cost of finding the classifications
    - for an attribute A, we divide the data according the the values of A
    - x is the set of instances whose attribute A has value v
- **for each x we can calculate the remaining cost**: entropy(x)
    - find formula
- **we want to maximize he information gain defined by :**
    - gain(S,A) = entropy(S) - s …
  
## Measuring performance
### standard measurement
- **accuracy**: proportion of the correct predictions in relation to the total number fo sampes
- **Confusing** matrix: visualization of the model performance for different classes
- **ROC curve (Receiver operation characteristic)**: evaluates the models ability to discriminate
### other important metrics
- **recall**: models ability to identify all positive samples
- **F1- score**: combined measurements of precision and recall
- **Area under the ROC curve(AUC -ROC)**: measure of overall model performance
  
## Support vector machine
- SVM for discrimination
    - margin maximization
    - kernel trick
- estimating the support of a distribution
- kernel methods and data analysis
- core definition
    - valid cores and good cores
    - kernels for different data types
    - combination of cores, hybrid cores
### basic idea
- have a bunch of points to try segment
- play with the distance function (kernel in SVN)
    
    using different kernels we can create different decision surfaces
    
## Linear discrimination and margin
- since there may be many possilities
- chose a plane that is furthest away from all points