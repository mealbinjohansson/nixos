{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "spruce"; # Define your hostname # NOTE: Added

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account
  users.users.albin = {
    isNormalUser = true;
    description = "Albin Johansson";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages

  environment.systemPackages = with pkgs; [];

  system.stateVersion = "25.11";

  ################
  # My additions #
  ################

  # NixOS modules
  base.enable = true;
  home-manager.enable = true;
  hyprland.enable = true;
  nfs.enable = true;
  tailscale.enable = true;
  gnupg.enable = true;

  # Home manager modules
  home-manager.users."albin" = {
    albin.enable = true;
    neovim.enable = true;
    hyprland.enable = true;
    rofi.enable = true;
    bash.enable = true;
  };

  # Packages
  programs.firefox.enable = true;
  users.users.albin.packages = with pkgs; [
    fastfetch
    git
    tmux
    opencode
    vim
    kitty
    pass
    signal-desktop
    ticktick
  ];

  # Graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
