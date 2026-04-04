{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = {
    nixpkgs,
    nixpkgs-stable,
    ...
  } @ inputs: {
    nixosConfigurations.sequoia = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        homeStateVersion = "25.11";
      };
      modules = [
        ./hosts/sequoia/configuration.nix
        ./nixosModules
        inputs.home-manager.nixosModules.home-manager
      ];
    };
    nixosConfigurations.spruce = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        homeStateVersion = "25.11";
      };
      modules = [
        ./hosts/spruce/configuration.nix
        ./nixosModules
        inputs.home-manager.nixosModules.home-manager
      ];
    };
    nixosConfigurations.oak = nixpkgs-stable.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./hosts/oak/configuration.nix
        ./nixosModules/base.nix
        ./nixosModules/albin.nix
      ];
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}
