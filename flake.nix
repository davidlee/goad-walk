{
  description = "goad-walk: the tool set a goad kit walk runs with, as an oubliette target";

  # The capsule clones this repo, not goad's, so a walking agent sees the kit
  # and the binaries and nothing else of goad. See goad docs/slices/012.
  inputs.goad.url = "git+file:///home/david/dev/goad";

  outputs = {goad, ...}: let
    system = "x86_64-linux";
    pkgs = import goad.inputs.nixpkgs {inherit system;};
    g = goad.packages.${system};
    # Stub until slice 012 lands them in goad's flake.
    pending = name: g.${name} or null;
    goadPkgs = builtins.filter (p: p != null) [g.goad g.goad-emit (pending "goad-check") (pending "goad-kit")];
  in {
    packages.${system} = {
      default = pkgs.buildEnv {
        name = "goad-walk-tools";
        paths = goadPkgs ++ [pkgs.ruby pkgs.jq];
      };
    } // pkgs.lib.optionalAttrs (g ? goad-kit) {inherit (g) goad-kit;};
  };
}
