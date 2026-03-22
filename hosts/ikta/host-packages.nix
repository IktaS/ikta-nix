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
    ungoogled-chromium
    osu-lazer
    krita
    libreoffice
    inkscape
    prismlauncher
    alsa-scarlett-gui
    esptool
    pkgsUnstable.kicad
    davinci-resolve
  ];
}
