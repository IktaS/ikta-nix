{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) enableSunshine;
in {
  services.sunshine = {
    enable = enableSunshine;
    autoStart = true;
    openFirewall = true;
    capSysAdmin = true;
  };
}
