{ pkgs, lib, ... }:

{
  imports = [
    # Add modules by importing them relatively ./module.nix...
    ./hyprland.nix
  ];

  # Enable modules by default using module.enable = lib.mkDefault true;
}
