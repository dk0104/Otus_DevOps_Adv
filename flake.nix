{
  description = "Nix devshells!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # NEW
    nodejs_16_nixpkgs.url = "github:nixos/nixpkgs/a71323f68d4377d12c04a5410e214495ec598d4c";
  };

  outputs = {
    nixpkgs,
    nodejs_16_nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    # NEW
    nodejs_16 = (import nodejs_16_nixpkgs {inherit system;}).nodejs_16;
    # ...
  in {
    devShells.${system} = {
      # ...
      default = pkgs.mkShell {
        packages = [
          pkgs.valkey
          # NEW: replaced node 22 and pnpm with node 16
          nodejs_16
          pkgs.fish
        ];
        # ...
      };
    };
  };
}
