# goad-walk

The environment for a goad kit walk: an oubliette target whose tool set is
goad's exported binaries, the kit, `ruby` and `jq` — and nothing else of goad.
A capsule clones this repo, so the agent never sees goad's source.

`goad-check` and `goad-kit` join the tool set once goad's slice 012 exports
them; until then the flake builds without them.
