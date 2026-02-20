{ config, pkgs, ... }:

{
  # Home manager
  home.username = "albin";
  home.homeDirectory = "/home/albin";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  # Modules
  neovim.enable = true;
  hyprland.enable = true;
  dotfiles.neovim.enable = true;
  dotfiles.hyprland.enable = true;
}
