{
  description = "Development environment with libpqxx";

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
            pkgs.libpqxx   # Include the libpqxx library
            pkgs.cmake     # Common for building C++ projects
            pkgs.gcc       # C++ compiler
            pkgs.pkg-config # Utility for managing compile/link flags
          ];
          
          shellHook = ''
            echo "Development environment with libpqxx is ready!"
          '';
        };
      };
    };
}