{ inputs, pkgs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "Enables neovim module";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      defaultEditor = true;
    };
  };
}
