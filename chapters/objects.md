# Objects

[Commands](commands.md) consume and generate objects. Objects are accessible on every machine by their `name` or a reference to them, after they are [selected](commands/select.md). Objects may be [downloaded](#download) and [uploaded](#upload) or [streamed](#list), at the same time.

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