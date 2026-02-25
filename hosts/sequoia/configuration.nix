{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-85e57033-8b62-439d-9d0d-10fd6e87abe1".device = "/dev/disk/by-uuid/85e57033-8b62-439d-9d0d-10fd6e87abe1";
  networking.hostName = "sequoia";

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
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

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
  gnupg.enable = true;
  nfs.enable = true;
  tailscale.enable = true;
  git.enable = true;
  albin.enable = true;

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
    git
    brightnessctl
    fastfetch
    tmux
    opencode
    vim
    kitty
    signal-desktop
    pass
    ticktick
  ];
}
