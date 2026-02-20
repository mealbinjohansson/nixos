{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "git+https://github.com/mealbinjohansson/dotfiles.git";
      flake = false;
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, dotfiles, ... }: {
    nixosConfigurations.sequoia = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/sequoia/configuration.nix
	./nixosModules
	home-manager.nixosModules.home-manager
      ];
    };
    homeManagerModules.default = ./homeManagerModules;
  };
}

