{ lib, config, pkgs, ... }:

{
  options = {
    rofi.enable = lib.mkEnableOption "Enables rofi dotfiles";
  };

  config = lib.mkIf config.rofi.enable {
    home.packages = with pkgs; [
      rofi
      input-fonts
    ];
    home.file.".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/rofi";
      force = true;
    };
  };
}
