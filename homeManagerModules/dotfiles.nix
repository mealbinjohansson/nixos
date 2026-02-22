{ inputs, pkgs, lib, config, ... }:

{
  options = {
    dotfiles.neovim.enable = lib.mkEnableOption "Enables neovim configuration";
    dotfiles.hyprland.enable = lib.mkEnableOption "Enables hyprland configuration";
  };

  config = lib.mkMerge [
    (lib.mkIf config.dotfiles.neovim.enable {
      home.file.".config/nvim" = {
        source = ../dotfiles/nvim;
        recursive = true;
      };
    })
    (lib.mkIf config.dotfiles.hyprland.enable {
      nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "input-fonts"
      ];
      nixpkgs.config.input-fonts.acceptLicense = true;
      home.packages = with pkgs; [
        rofi
        input-fonts
      ];
      home.file.".config/hypr" = {
        source = ../dotfiles/hypr;
        recursive = true;
      };
      home.file.".config/rofi" = {
        source = ../dotfiles/rofi;
        recursive = true;
      };
    })
  ];
}
