# goad-walk

The environment for a goad kit walk: an oubliette target whose tool set is
`goad`, `goad-emit`, `goad-check`, the kit (`goad-kit`, also exported on its
own), `ruby` and `jq`.

goad is pinned from GitHub (`github:davidlee/goad`), not from a path on one
host, so that consumers of this flake off that host can evaluate it.
`flake.lock` fixes the goad revision a walk sees.
