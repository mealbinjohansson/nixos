{
  lib,
  config,
  ...
}: {
  options = {
    base.enable = lib.mkEnableOption "Enables base system defaults";
  };

  config = lib.mkIf config.base.enable {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.input-fonts.acceptLicense = true;

    boot.loader.systemd-boot.configurationLimit = 10;
  };
}
