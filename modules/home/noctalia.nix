{
  pkgs,
  config,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  noctaliaPackage = inputs.noctalia.packages.${system}.default.overrideAttrs (old: {
    nativeBuildInputs =
      (old.nativeBuildInputs or [])
      ++ [
        pkgs.clang
      ];
    env =
      (old.env or {})
      // {
        CC = "${pkgs.clang}/bin/clang";
        CXX = "${pkgs.clang}/bin/clang++";
      };
  });
in {
  imports = [inputs.noctalia.homeModules.default];

  programs.noctalia = {
    enable = true;
    package = noctaliaPackage;
    systemd.enable = false;
    validateConfig = true;
    settings = {
      shell = {
        settings_show_advanced = true;
        telemetry_enabled = false;
        polkit_agent = true;
      };
      lockscreen.enabled = true;
      bar.main = {
        position = "top";
        thickness = 34;
        radius = 12;
        margin_ends = 180;
        margin_edge = 10;
        padding = 14;
        widget_spacing = 6;
        start = ["launcher" "workspaces"];
        center = ["clock"];
        end = ["media" "tray" "notifications" "clipboard" "network" "bluetooth" "volume" "brightness" "battery" "control-center" "session"];
      };
    };
  };
}
