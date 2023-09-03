# Abstraction

`giza` is a mathematical model for building AI languages with python+bash. The objective of this model is to enable a group of humans to interact with an AI system by running [commands](../commands/README.md) on a terminal or as [scripts](../concepts/script.md). Commands consume and modify [objects](../concepts/objects.md).


Here is a script that ingests the latest images from traffic cameras in downtown Vancouver and publishes them on aws using [`vanwatch`: Vancouver-Watching 🌈](https://github.com/kamangir/Vancouver-Watching)

```bash
abcli select
# vanwatch discover vancouver
vanwatch ingest vancouver
abcli publish . random_url
```
