{
  host,
  pkgs,
  lib,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) thunarEnable terminal;
in {
  programs = {
    thunar = {
      enable = thunarEnable;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
  environment = {
    systemPackages = with pkgs; [
      ffmpegthumbnailer
    ];
    sessionVariables = lib.mkIf thunarEnable {
      TERMINAL = terminal;
    };
  };
}
