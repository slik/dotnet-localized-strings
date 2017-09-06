# Update Bundled NGettext

This framework makes use of the [NGettext](https://github.com/neris/NGettext) library
which is embedded into this package with altered namespaces to avoid naming conflicts in
projects that already make use of NGettext.

The included makefile has a special target to clone the latest version of NGettext and
perform the required transformations.

```bash
make update-bundled-ngettext
```
