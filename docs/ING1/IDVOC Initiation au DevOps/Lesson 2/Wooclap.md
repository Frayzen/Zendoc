---
Owner: Tim Pearson
---
## Where should the configuratino be?
- application version and config most likely connected
- put it in git
## Valid?
```YAML
"toto: toto": "toto" # true
["toto", 1, True] # true (json syntax)
[key]: "value" \#false (cannot assign key of type list)
master:
	- key: value2 # true {'master': ['key' : 'value']} (mapping)
	
key: [{['value']}] \#flase array(mapping(list)), no mapping value
\#which are numbers
key1: 2.0 \#true
key2: 2,0 \#false
key3: 2 #
key4: "2" \#false
key5: 2.0e+1 \#true
\#which are bool
key1: false
key2: true
key3: no
key4: FaLsE \#nope
key6: False \#yes
key7: FALSE \#yes
key5: off \#true
```