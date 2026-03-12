{ lib, pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "breeze";
    style = {
      package = pkgs.kdePackages.qtstyleplugin-kvantum;
      name = lib.mkForce "kvantum";
    };
  };
}
