{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    zoom-us
    code-cursor
    freecad
    ardour
    bruno
    gamemode
    ungoogled-chromium
    osu-lazer
    krita
    libreoffice
  ];
}
