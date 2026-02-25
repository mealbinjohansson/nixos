{ pkgs, lib, ... }:

{
  imports = [
    # Add modules by importing them relatively ./module.nix...
    ./base.nix
    ./hyprland.nix
    ./home-manager.nix
    ./gnupg.nix
    ./nfs.nix
    ./tailscale.nix
    ./git.nix
  ];
   
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable modules by default using module.enable = lib.mkDefault true;
}
