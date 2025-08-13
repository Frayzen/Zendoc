---
title: Ex 1
Owner: Tim Pearson
---
---
## **Q1. Create the following vector in R and store it in an object called x:**
x <- c(1, 2, 3, 4, 5)
## **Q2. Display the mode of x, then its length:**
mode_x <- mode(x)  
length_x <- length(x)
## **Q3. Extract the first element, then the last one:**
first_element <- x[1]  
last_element <- x[length(x)]
## **Q4. Extract the first three elements and store them in a vector named a:**
a <- x[1:3]
## **Q5. Extract elements in positions 1, 3, and 5; store them in a vector named b:**
b <- x[c(1, 3, 5)]
## **Q6. Add 10 to the vector x, then multiply the result by 2:**
result <- (x + 10) * 2
## **Q7. Perform the addition of a and b, comment on the result; The elements of a and b are added one by one:**
addition_ab <- a + b
## **Q8. Perform the following addition: x + a, comment on the result, then look at the result of a + x:**
result_xa <- x + a  
result_ax <- a + x
## **Q9. Multiply the vector by the scalar c, which will be set to 2:**
c <- 2  
result_mult <- x * c
## **Q10. Perform the multiplication of a and b, comment on the result:**
multiplication_ab <- a * b
## **Q11. Perform the following multiplication: x * a, comment on the result:**
result_xa_mult <- x * a
## **Q12. Retrieve the positions of the multiples of 2 and store them in a vector named ind, then keep only the multiples of 2 from x in a vector named mult_2:**
ind <- which(x %% 2 == 0)  
mult_2 <- x[ind]
## **Q13. Display the elements of x that are multiples of 3 and multiples of 2:**
mult_2_and_3 <- x[x %% 3 == 0 & x %% 2 == 0]
## **Q14. Display the elements of x that are multiples of 3 or multiples of 2:**
mult_2_or_3 <- x[x %% 3 == 0 | x %% 2 == 0]
## **Q15. Calculate the sum of the elements of x:**
sum_x <- sum(x)
## **Q16. Replace the first element of x with a 4:**
x[1] <- 4
## **Q17. Replace the first element of x with the value NA, then calculate the sum of the elements of x:**
x[1] <- NA  
sum_x_with_na <- sum(x, na.rm = TRUE)
## **Q18. List the objects in memory in the R session:**
objects_in_memory <- ls()
## **Q19. Delete the vector x:**
rm(x)
## **Q20. Delete all objects from the session:**
rm(list = ls())