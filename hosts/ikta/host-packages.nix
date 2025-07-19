{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    zoom-us
    kicad
    freecad-wayland
  ];
}
