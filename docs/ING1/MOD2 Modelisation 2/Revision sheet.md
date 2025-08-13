---
Owner: "Florian "
---
  
# Binary methods
## Overview
- Very easy concept
- Difficult to implement in classic OO
- Very easy to implement using multi-methods (_also called generic methods_)
## Thanks to CLOS
- Some security checks added
- Validation at usage time
- Validation at implementation time
## Thanks to MOP
- Explicit concept
- Extension of the OO base system
# Aggregations
### Simple
relationship “ensemble / parts”
==eex : football team is an aggregation of football players but each one has a life outside the teamx : football team is an aggregation of football players but each one has a life outside the team==
### Composition / composite aggregation
Stringer aggregation
Parts of the ensemble don’t have a life outside the ensemble
If an ensemble is destroyed so are all its part
==ex : ensemble body, parts : arm, leg, foot… They don’t exist outside==
## Inheritance
Represent an implicit notion of inclusion → include what's above in what’s down
==ex : an employee doesn’t include a human, they are a human but also more than that (an employee)==