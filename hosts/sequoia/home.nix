{ config, pkgs, ... }:

{
  home.username = "albin";
  home.homeDirectory = "/home/albin";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
