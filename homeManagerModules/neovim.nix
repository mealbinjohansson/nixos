{ inputs, pkgs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "Enables neovim module";
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      fzf
      lua-language-server
      ripgrep
      vtsls
      roslyn-ls
    ];
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
      ];
    };
  };
}
