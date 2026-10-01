{
  description = "goad-walk: the tool set a goad kit walk runs with, as an oubliette target";

  # The capsule clones this repo, not goad's. See goad docs/slices/012.
  # inputs.goad.url = "git+file:///home/david/dev/goad";
  inputs.goad.url = "github:davidlee/goad";

  outputs = {goad, ...}: let
    system = "x86_64-linux";
    pkgs = import goad.inputs.nixpkgs {inherit system;};
    g = goad.packages.${system};
  in {
    packages.${system} = {
      default = pkgs.buildEnv {
        name = "goad-walk-tools";
        paths = [g.goad g.goad-emit g.goad-check g.goad-kit pkgs.ruby pkgs.jq];
      };
      inherit (g) goad-kit;
    };
  };
}
