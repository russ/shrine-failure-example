# Minimal example of getting ana error

```
❯ crystal example.cr
Showing last frame. Use --error-trace for full trace.

In lib/shrine/src/shrine.cr:141:30

 141 | {% for plugin in @type.constant(:PLUGINS) %}
                              ^-------
Error: `for` expression must be an array, hash, tuple, named tuple or a range literal, not NilLiteral:

nil
```
