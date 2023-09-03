# giza 🔻

TL;DR: [Understand](./chapters/abstract.md) 1️⃣ -> [Build](./chapters/core.md) 2️⃣ -> [Deploy](./chapters/plugins.md)  3️⃣

## What is giza?

`giza` is a set of instructions to build a Linux AI that is,

- Quick at scale for multi-person collaboration: enables groups of humans to be exponentially more efficient collectively.
- Cloud-native: compute, storage, metadata, signaling, API.
- Simultaneously multi-machine: user interface through the terminal, VSCode, and Jupyter Notebook + task deployment on cloud compute + [single board computers](https://github.com/kamangir/blue-bracket) + auto-[terraform](chapters/terraform.md). 
- A dev and production env: AI algo ideation, poc, productization, support, feature-add, within a modern production ci-cd environment such as github or gitlabs.
- Secure.
- Based on bash and python, likely extensible to other languages.  
- Organic emergence: no assumption about the tools, minimalist, and orthogonal.
- Mathematics in action.
- Brown.

## What does `giza` do?

`giza` builds a language to formalize a series of sequences of interrelated calls, such as below, that are relevant to an AI use-case.

```
$tool_name $task \
  --keyword value \
  --keyword value \
  --keyword value \
  ...
```

```bash
python3 $tool_name \
  $task $arg $arg \
  --keyword value \
  --keyword value \
   --keyword value \
   ...
```

These commands generally perform AI and related operations on multiple physical and virtual Linux machines, including docker containers.

## What does `giza` achieve?

1. Reduction of the cognitive burden of the user and increase of their efficiency.
1. Reduction in the risk of user-induced errors.
1. Establishment of a document-as-you-go framework on [the procedure](./chapters/script.md) and the [results](./chapters/objects.md).
2. Magic. 🪄

## How do I use `giza`?

1. Understand [the concepts](./chapters/concepts.md).
1. Build [the core](./chapters/core.md).
1. Deploy [the first plugin](./chapters/plugins.md).

## Is there an example?

[awesome bash cli](https://github.com/kamangir/awesome-bash-cli) (`abcli`) is an example implementation of `giza`. Here is what is in `abcli`.

![image](giza.png)
