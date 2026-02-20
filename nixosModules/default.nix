{ pkgs, lib, ... }:

{
  imports = [
    # Add modules by importing them relatively ./module.nix...
    ./hyprland.nix
    ./home-manager.nix
    ./neovim.nix
  ];

  # Enable modules by default using module.enable = lib.mkDefault true;
}
