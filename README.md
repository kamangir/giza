# Giza

Giza 🔻 is a set of instructions to build a Linux AI system for a team, that is,

- quick at scale for multi-person collaboration: enables groups of humans to be exponentially more efficient collectively.
- cloud-native: compute, storage, metadata, signaling, API.
- simultaneously multi-machine: user interface through the terminal, VSCode, and Jupyter Notebook + task deployment on cloud compute.
- a dev and production env: AI algo ideation, poc, productization, support, feature-add, within a modern production ci-cd environment such as github or gitlabs.
- secure.
- based on bash and python, extensible to other languages.  
- organic emergence: no assumption about the tools, minimalism, and orthogonality.

## Objective

Giza builds a language to formalize sequences of inter-related calls such as below that are relevant to a use-case.

- `$tool_name $task [--keyword value]`
- `python3 $tool_name $task [--keyword value]`

These commands generally perform AI and related operations on multiple physical and virtual Linux machines, including docker containers.

## Goals

1. To reduce the cognitive burden of the user and increase their efficiency.
1. To reduce the risk of user-induced errors.
1. To establish a document-as-you-go framework on the procedure and results, i.e. the [scripts](#scripts) and the [objects](#objects).

## Steps

1. Understand [the concepts](./chapters/concepts.md).
1. Build [the core](./chapters/core.md).
1. Develop [the first application](./chapters/applications.md).

:fire:

## `@download` and `@upload`

```bash
options=filename=<filename>,open,<...>

@download object <object-name> <options>
@download <options>
```

```bash
options=filename=<filename>,<...>

@upload object <object-name> <options>
@upload options
``` 

# Tags

An object can be tagged many times. A tag is a boolean or valued property of the object.

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

:fire:

## `@seed`

:fire:


# giza

`giza` is a mathematical model for a production environment for ai development and [reproducible](https://en.wikipedia.org/wiki/Reproducibility) experimentation through python and bash.

![image](giza.png)

[`awesome-bash-cli`](https://github.com/kamangir/awesome-bash-cli) (`abcli`) is one implementation of `giza`.