{
  lib,
  config,
  ...
}: {
  options = {
    fish.enable = lib.mkEnableOption "Enables fish shell configuration";
  };

  config = lib.mkIf config.fish.enable {
    home.file.".config/fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/fish";
      force = true;
    };
  };
}
