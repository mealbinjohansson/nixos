{ inputs, pkgs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "Enables neovim module";
  };

  config = lib.mkIf config.neovim.enable {
    home.file.".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
      force = true;
    };
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [ telescope-fzf-native-nvim ];
      extraPackages = with pkgs; [
        gcc
        gnumake
        fzf
        ripgrep
        lua-language-server
      ];
    };
  };
}
