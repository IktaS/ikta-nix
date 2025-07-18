{host, pkgs, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) consoleKeyMap;
in {
  nix = {
    settings = {
      download-buffer-size = 250000000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ 
        # fcitx5-mozc
        fcitx5-mozc-ut
        fcitx5-gtk
    ];
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  environment.variables = {
    IKTANIX_VERSION = "2.3";
    IKTANIX = "true";
  };
  console.keyMap = "${consoleKeyMap}";
  system.stateVersion = "23.11"; # Do not change!
}
