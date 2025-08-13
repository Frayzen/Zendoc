---
title: NN Maths
Owner: Tim Pearson
---
## Softmax Derivative
$a_{2i} = \frac{e^{z_{2i}}}{\sum_{j} e^{z_{2j}}}  
\\  
\\  
\frac{\partial a_{2i}}{\partial z_{2i}} = \frac{e^{z_{2i}} \cdot \sum_{j} e^{z_{2j}} - e^{z_{2i}} \cdot e^{z_{2i}}}{\left( \sum_{j} e^{z_{2j}} \right)^2}  
\\ \\  
\frac{\partial}{\partial z_{2i}} \left( \sum_{j} e^{z_{2j}} \right) = e^{z_{2i}}  
\\ \\  
\frac{\partial a_{2i}}{\partial z_{2i}} = \frac{e^{z_{2i}} \cdot \sum_{j} e^{z_{2j}} - e^{z_{2i}} \cdot e^{z_{2i}}}{\left( \sum_{j} e^{z_{2j}} \right)^2}  
\\ \\  
\frac{\partial a_{2i}}{\partial z_{2i}} = \frac{e^{z_{2i}} \cdot \left( \sum_{j} e^{z_{2j}} - e^{z_{2i}} \right)}{\left( \sum_{j} e^{z_{2j}} \right)^2}  
\\ \\  
\frac{\partial a_{2i}}{\partial z_{2i}} = a_{2i} \cdot (1 - a_{2i})$
## Cross Entropy Loss
- we can use the soft-max derivative to find the derivative of the loss with respect to `z2`
$L = - \sum_{i} y_i \log(a_{2i}) \\ \frac{\partial L}{\partial z_{2i}} = - \frac{\partial}{\partial z_{2i}} \sum_{j} y_j \log(a_{2j}) \\ \frac{\partial L}{\partial z_{2i}} = - \sum_{j} \frac{\partial L}{\partial a_{2j}} \frac{\partial a_{2j}}{\partial z_{2i}} \\ \frac{\partial L}{\partial z_{2i}} = - \sum_{j} \left( - \frac{y_j}{a_{2j}} \right) \cdot a_{2j} (\delta_{ij} - a_{2i}) \\ \frac{\partial L}{\partial z_{2i}} = \sum_{j} \left( a_{2i} - y_i \right) a_{2i} (\delta_{ij} - a_{2i}) \\ \frac{\partial L}{\partial z_{2i}} = a_{2i} - y_i$