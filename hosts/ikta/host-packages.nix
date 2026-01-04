{ pkgs, ... }:
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
    ungoogled-chromium
    osu-lazer
    krita
    libreoffice
    inkscape
    openscad
    lunar-client
    alsa-scarlett-gui
    esptool
  ];
}
