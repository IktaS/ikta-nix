{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
    (final: prev: {
      hyprland = inputs.hyprland.packages.${prev.stdenv.hostPlatform.system}.hyprland;
      xdg-desktop-portal-hyprland =
        inputs.hyprland.packages.${prev.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    })
  ];
}
