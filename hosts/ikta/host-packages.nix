{ pkgs, pkgsUnstable, ... }:
{
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    zoom-us
    freecad
    ardour
    bruno
    gamemode
    chromium
    osu-lazer
    krita
    libreoffice
    inkscape
    prismlauncher
    alsa-scarlett-gui
    esptool
    davinci-resolve
  ];
}
