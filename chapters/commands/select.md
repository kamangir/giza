# `@select`

```bash
@select <object-name>
```

When an [object](../objects.md) is selected, `.` represents `<object-name>`. Similarly, `..`, `...`, and so on, as deep as needed, refer to the previously selected object and the one before that.

[commands](./commands.md) by default the objects they consume and modify to `.`, `..`, and so on. Because the commands in a [script](./scripts.md) use the same objects, selecting the objects enables their names to be omitted in a script.
