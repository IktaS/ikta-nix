{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./zsh
    ./overview.nix
    ./python.nix
    ./cli/bat.nix
    ./cli/btop.nix
    ./cli/bottom.nix
    ./cli/cava.nix
    ./cli/fzf.nix
    ./cli/gh.nix
    ./cli/git.nix
    ./cli/htop.nix
    ./cli/lazygit.nix
    ./emoji.nix
    ./eza.nix
    ./gtk.nix
    ./hyprland
    ./terminals/kitty.nix
    ./terminals/ghostty.nix
    ./obs-studio.nix
    ./editors/nano.nix
    ./editors/zed.nix
    ./qt.nix
    ./scripts
    ./stylix.nix
    ./swappy.nix
    ./tealdeer.nix
    ./virtmanager.nix
    ./noctalia.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zen-browser.nix
    ./opencode.nix
    ./zoxide.nix
    ./rquickshare.nix
    ./orca-slicer.nix
  ];

  # this allows you to access `pkgsUnstable` anywhere in your config
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
}
