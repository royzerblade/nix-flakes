{
  description = "Dev Env for local hosted postgreSQL";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      devShells.x86_64-linux = {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.postgreSQL
            pkgs.nodejs_23
          ];
          
          shellHook = ''
            echo "Environment Ready"
          '';
        };
      };
    };
}