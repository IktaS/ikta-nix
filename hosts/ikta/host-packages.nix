{
  pkgs,
  pkgsUnstable,
  ...
}: {
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
    godot
    chromium
    osu-lazer
    krita
    libreoffice
    inkscape
    prismlauncher
    alsa-scarlett-gui
    esptool
    kdePackages.kdenlive
  ];
}
