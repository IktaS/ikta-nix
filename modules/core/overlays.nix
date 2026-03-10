{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
    (final: prev: {
      hyprland = inputs.hyprland.packages.${prev.system}.hyprland;
      xdg-desktop-portal-hyprland = inputs.hyprland.packages.${prev.system}.xdg-desktop-portal-hyprland;
    })
  ];
}
