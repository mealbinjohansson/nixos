{ lib, config, ... }:

{
  options = {
    albin.enable = lib.mkEnableOption "Enables albin user account";
  };

  config = lib.mkIf config.albin.enable {
    users.users.albin = {
      isNormalUser = true;
      description = "Albin";
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$6$L20PMhDJQGNl1AtG$MMn5sY/QD/1ldLsJ27dImP/qbW3YpGTY2pnyec5IU.XHJtWllXz6iiW5z9I4O1znEyswEU5SqdgdH/AwZ1TtV1";
    };
  };
}
