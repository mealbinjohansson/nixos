{ pkgs, lib, ... }:

{
  imports = [
    # Add modules by importing them relatively ./module.nix...
    ./albin.nix
    ./dotfiles.nix
    ./neovim.nix
  ];

  # Enable modules by default using module.enable = lib.mkDefault true;
}
