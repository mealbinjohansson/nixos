{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "github:mealbinjohansson/dotfiles";
      flake = false;
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.sequoia = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/sequoia/configuration.nix
        ./nixosModules
        inputs.home-manager.nixosModules.home-manager
      ];
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}

