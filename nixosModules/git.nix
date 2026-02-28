{
  lib,
  config,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "Enables git configuration";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      config = {
        user.name = "Albin Johansson";
        user.email = "me@albinjohansson.com";
        init.defaultBranch = "main";
      };
    };
  };
}
