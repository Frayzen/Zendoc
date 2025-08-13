---
Owner: Tim Pearson
---
## YAML
![[Untitled 109.png|Untitled 109.png]]
## Usage
- the usage of **key: &value** is called an anchor. It le’s allow the mapping under the value to be referenced value later on.
- the usage of **key: *common** is called a reference. It let’s one to reference an anchor. Some values can be _added_ or _override_.
- all the keys show different ways to handle whitespaces and new lines
- the chevron has eaten the whitespaces
- [https://yaml-multiline.info/](https://yaml-multiline.info/)
  
## YAML Tools
- yq is a useful tool to parse yaml in bash (similar to jq)
- yamllint detects linting errors, inconsistencies and warn you  
    about possible misuage

> [!important] key: v’alue is valid
## YAML Pitfalls
- JSON being valid YAML syntax
    - need to escape {
- Strings can be unquotted
    - be careful with numbers
- The Norway problem
    - Case insensitive booleans in [Yes, True, On, Y]
- Indentation
- Mixup of “complex” types (mapping of lists of mappings,  
    …)
## YAML bool
```YAML
key1: False
key2: off
key3: no
\#all are false according to python yaml parser
key4: fr
\#no is false but it is also the country code for Norway
```
  
[https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html)
[[Wooclap]]
[[Docker]]