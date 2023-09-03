# Objects

[Commands](commands.md) consume and modify objects.

Objects are accessible on every machine by their `name` or a reference to them after they are [selected](commands/select.md).

Objects may be [downloaded](#download) and [uploaded](#upload), fully or partially, or [streamed](#list).

Objects have [metadata](metadata.md).


## `@download`

```bash
options=filename=<filename>,open,<...>

@download object <object-name> <options>
@download <options>
```

## `@list`

:fire:

## `@upload`

```bash
options=filename=<filename>,<...>

@upload object <object-name> <options>
@upload options
``` 
