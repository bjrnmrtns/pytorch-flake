{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.jupyter
          pkgs.python3
          pkgs.python3Packages.pytorch
          pkgs.python3Packages.python-lsp-server
          pkgs.python3Packages.matplotlib
          pkgs.python3Packages.notebook
          pkgs.python3Packages.ipython
        ];
      };
    });
}
