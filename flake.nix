{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = {
    nixpkgs,
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
    homeManagerModules.default = ./homeManagerModules;
  };
}
