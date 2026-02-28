{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    tmux.enable = lib.mkEnableOption "Enables tmux dotfiles";
  };

  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [tmux];
    home.file.".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/tmux";
      force = true;
    };
  };
}
