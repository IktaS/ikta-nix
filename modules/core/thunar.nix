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
      plugins = [
        pkgs.thunar-archive-plugin
        pkgs.thunar-volman
      ];
    };
  };
  environment = {
    systemPackages = with pkgs; [
      ffmpegthumbnailer # Need For Video / Image Preview
    ];
    sessionVariables = lib.mkIf thunarEnable {
      TERMINAL = terminal;
    };
  };
}
