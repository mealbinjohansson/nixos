{...}: {
  imports = [
    # Add modules by importing them relatively ./module.nix...
    ./albin.nix
    ./hyprland.nix
    ./neovim.nix
    ./bash.nix
    ./rofi.nix
    ./tmux.nix
  ];

  programs.home-manager.enable = true;

  # Enable modules by default using module.enable = lib.mkDefault true;
}
