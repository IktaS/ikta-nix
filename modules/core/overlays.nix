{inputs, ...}: {
  nixpkgs.overlays = [
    # Provide pkgs.google-antigravity via antigravity-nix overlay
    inputs.antigravity-nix.overlays.default
    # Provide the fenix Rust toolchain as pkgs.fenix
    inputs.fenix.overlays.default
    # Build tumbler without EPUB thumbnailer (libgepub) to avoid webkitgtk
    (_final: prev: {
      xfce =
        prev.xfce
        // {
          tumbler = prev.xfce.tumbler.overrideAttrs (old: {
            buildInputs = prev.lib.remove prev.libgepub old.buildInputs;
          });
        };
      inkscape = prev.inkscape.overrideAttrs (old: {
        env =
          (old.env or {})
          // {
            NIX_CFLAGS_COMPILE = "-O2 -Wno-error=deprecated-declarations";
          };
      });
    })
  ];
}
