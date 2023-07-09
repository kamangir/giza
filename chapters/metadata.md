# metadata

[Objects](objects.md) can be [tagged](#tags). Objects can have [relations](#relations) to other objects. 


## Tags

An object can have many tags. A tag is a boolean or valued property of the object.

```bash
@tags get <object-name> <keyword>
@tags get <object-name>

@tags search <keyword=value,~that,this>

@tags set <object-name> <keyword=value,~that,this>
```

# Relations

Two object can be related in many ways.

```bash
@relations get <object-name-1> <object-name-2> <relation>
@relations get <object-name-1> <relation>
@relations get <object-name-1>

@relations search <relation>

@relations set <object-name-1> <object-name-2> <relation>
```