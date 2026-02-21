{ inputs, lib, config, ... }:

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
      home.file.".config/hypr" = {
        source = ../dotfiles/hypr;
        recursive = true;
      };
    })
  ];
}
