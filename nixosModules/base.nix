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
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.input-fonts.acceptLicense = true;
  };
}
