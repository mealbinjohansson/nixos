{ pkgs, lib, config, ... }:

{
  options = {
    gnupg.enable = lib.mkEnableOption "Enables gnupg configuration";
  };

  config = lib.mkIf config.gnupg.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
