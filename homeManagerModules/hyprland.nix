{
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enables hyprland dotfiles";
  };

  config = lib.mkIf config.hyprland.enable {
    home.file.".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/hypr";
      force = true;
    };
  };
}
