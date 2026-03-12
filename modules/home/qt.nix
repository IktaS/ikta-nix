{ lib, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "adwaita";
    style.name = lib.mkForce "adwaita-dark";
  };
}
