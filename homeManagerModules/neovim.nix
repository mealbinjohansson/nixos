{ inputs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "Enables neovim configuration";
  };

  config = lib.mkIf config.neovim.enable {
    home.file.".config/nvim" = {
      source = "${inputs.dotfiles}/nvim";
      recursive = true;
    };
  };
}
