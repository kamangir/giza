# Commands

A valid [bash command](https://www.gnu.org/software/bash/) is a `<string>` that, when entered in the bash prompt, does not produce "bash: `<command>`: command not found." A valid bash command is a string composed of entities connected with spaces and symbols.

Any valid bash command is a `giza` command. For any valid `giza` command `<command>`, `<keyword> <command>` is a valid command if `<keyword>` is a valid bash function. A `giza` implementation is built on a [core](../concepts/core.md) that can be called by its name, e.g. [`abcli`](https://github.com/kamangir/awesome-bash-cli). `giza` [plugins](../concepts/plugins.md) are also callable, e.g. [`vanwatch`](https://github.com/kamangir/Vancouver-Watching)

An argument for a [command](../commands/README.md) may be,

- A `<keyword>`.
- Reference to an [object](../concepts/objects.md): `<object-name>`, `.`, `..`, `...`, `....`.
- An [`options`](../concepts/options.md) string representation of a dictionary, such as `<keyword>=<value>,<keyword>,~<keyword>,<...>`.
- Named arguments, such as `--<arg> <value>`, as expected by a Linux tool.

Arguments generally have a default and are optional.
