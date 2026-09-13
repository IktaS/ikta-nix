{
  pkgs,
  host,
  lib,
  ...
}: let
  vars = import ../../hosts/${host}/variables.nix;
in {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      # If the host defines mimeDefaultApps in hosts/${host}/variables.nix,
      # use it to set per-host default applications.
      defaultApplications = lib.mkIf (vars ? mimeDefaultApps) vars.mimeDefaultApps;
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
      configPackages = [pkgs.hyprland];
    };
  };
}
