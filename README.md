# giza 🔻

TL;DR: [Understand](./chapters/concepts.md) 1️⃣ -> [Build](./chapters/core.md) 2️⃣ -> [Deploy](./chapters/plugins.md)  3️⃣

## What

`giza` is a set of instructions to build a Linux AI that is,

- quick at scale for multi-person collaboration: enables groups of humans to be exponentially more efficient collectively.
- cloud-native: compute, storage, metadata, signaling, API.
- simultaneously multi-machine: user interface through the terminal, VSCode, and Jupyter Notebook + task deployment on cloud compute + [single board computers](https://github.com/kamangir/blue-bracket) + auto-[terraform](chapters/terraform.md). 
- a dev and production env: AI algo ideation, poc, productization, support, feature-add, within a modern production ci-cd environment such as github or gitlabs.
- secure.
- based on bash and python, extensible to other languages.  
- organic emergence: no assumption about the tools, minimalist, and orthogonal.

## What

`giza` builds a language to formalize a series of sequences of interrelated calls, such as below, that are relevant to an AI use-case.

- `$tool_name $task [--keyword value] [--keyword value] [--keyword value] ...`
- `python3 $tool_name $task $arg $arg [--keyword value] [--keyword value] [--keyword value] ...`

These commands generally perform AI and related operations on multiple physical and virtual Linux machines, including docker containers.

## How

1. To reduce the cognitive burden of the user and increase their efficiency.
1. To reduce the risk of user-induced errors.
1. To establish a document-as-you-go framework on [the procedure](./chapters/script.md) and the [results](./chapters/objects.md).

## Steps

1. Understand [the concepts](./chapters/concepts.md).
1. Build [the core](./chapters/core.md).
1. Deploy [the first plugin](./chapters/plugins.md).

![image](giza.png)
