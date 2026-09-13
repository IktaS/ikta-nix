{
  pkgs,
  config,
  inputs,
  host,
  ...
}: let
  # Import the host-specific variables.nix
  vars = import ../../hosts/${host}/variables.nix;
in {
  imports = [
    ./boot.nix
    ./configuration.nix
    ./flatpak.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./nfs.nix
    ./nh.nix
    ./pipewire.nix
    ./quickshell.nix
    ./packages.nix
    ./printing.nix
    # Conditionally import the display manager module
    (
      if vars.displayManager == "tui"
      then ./ly.nix
      else ./sddm.nix
    )
    ./security.nix
    ./services.nix
    ./steam.nix
    ./stylix.nix
    ./sunshine.nix
    ./syncthing.nix
    ./system.nix
    ./tailscale.nix
    ./thunar.nix
    ./user.nix
    ./virtualisation.nix
    ./vlc.nix
    ./wol.nix
    ./xserver.nix
    ./cachix.nix
    inputs.stylix.nixosModules.stylix
  ];

  # this allows you to access `pkgsUnstable` anywhere in your config
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
}
