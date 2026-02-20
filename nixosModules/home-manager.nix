{ inputs, lib, config, ... }:

{
  options = {
    home-manager.enable = lib.mkEnableOption "Enables home manager module";
    home-manager.file = lib.mkOption {
      type = lib.types.path;
      description = "Path to the home-manager configuration file";
    };
  };

  config = lib.mkIf config.home-manager.enable {
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.users."albin" = {
      imports = [
        config.home-manager.file
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
