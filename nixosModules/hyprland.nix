{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enables hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
    programs.hyprlock.enable = true;
    users.users.albin.packages = with pkgs; [swww];
  };
}
