{ inputs, lib, config, ... }:

{
  options = {
    dotfiles.neovim.enable = lib.mkEnableOption "Enables neovim configuration";
  };

  config = lib.mkIf config.dotfiles.neovim.enable {
    home.file.".config/nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
  };
}
