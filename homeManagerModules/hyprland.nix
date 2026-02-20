{ pkgs, lib, config, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enables Hyprland via Home Manager";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.enable = true;
  };
}
