{ pkgs, lib, config, ... }:

{
  options = {
    bash.enable = lib.mkEnableOption "Enables neovim module";
  };

  config = lib.mkIf config.bash.enable {
    programs.bash.enable = true;
  };
}
