{ config, pkgs, ... }:

{
  # Home manager
  home.username = "albin";
  home.homeDirectory = "/home/albin";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  programs.bash.enable = true;

  # Modules
  neovim.enable = true;
  dotfiles.neovim.enable = true;
  dotfiles.hyprland.enable = true;
}
