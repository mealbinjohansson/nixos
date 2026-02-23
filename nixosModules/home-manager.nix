{ inputs, lib, config, homeStateVersion, ... }:

{
  options = {
    home-manager.enable = lib.mkEnableOption "Enables home manager module";
  };

  config = lib.mkIf config.home-manager.enable {
    home-manager.useGlobalPkgs = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.users."albin" = {
      home.stateVersion = homeStateVersion;
      imports = [
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
