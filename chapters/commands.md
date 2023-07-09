# Commands

A [giza](../README.md) command start with [`<core>`](core.md) or the name of a [plugin](plugins.md). 

`<plugin-name> help` prints help instructions for `<plugin-name>`. Many commands start with a `<task-name>`. `<plugin-name> <task-name> help` prints the list of [arguments](#arguments) for `<tool-name> <task-name>`.

## Arguments

An argument for a [command](commands.md) may be,

- A `<keyword>`.
- Reference to an [object](objects.md): `<object-name>`, `.`, `..`, `...`, `....`.
- An `options` string representation of a dictionary, such as `<keyword>=<value>,<keyword>,~<keyword>,<...>`.
- Open-ended series of arguments, such as `--<arg> <value>`, as expected by a Linux tool.
- Arguments generally have a default, or are optional.