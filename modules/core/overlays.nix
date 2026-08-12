{inputs, ...}: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
    (final: prev: let
      patchedHyprland = inputs.hyprland.packages.${prev.stdenv.hostPlatform.system}.hyprland.overrideAttrs (old: {
        postPatch =
          (old.postPatch or "")
          + ''
            sed -i "s/find_package(glaze 7\.\.\.<8 QUIET)/find_package(glaze QUIET)/" CMakeLists.txt
          '';
      });
    in {
      hyprland = patchedHyprland;
      xdg-desktop-portal-hyprland = inputs.hyprland.packages.${prev.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland.overrideAttrs (old: {
        buildInputs =
          [
            patchedHyprland
          ]
          ++ builtins.filter (p: (p.pname or "") != "hyprland") (old.buildInputs or []);
        postInstall = ''
          wrapProgramShell $out/bin/hyprland-share-picker \
            "''${qtWrapperArgs[@]}" \
            --prefix PATH ":" ${patchedHyprland}/bin
          wrapProgramShell $out/libexec/xdg-desktop-portal-hyprland \
            --prefix PATH ":" ${patchedHyprland}/bin
        '';
      });
    })
    (final: prev: {
      inkscape = prev.inkscape.overrideAttrs (old: {
        env =
          (old.env or {})
          // {
            NIX_CFLAGS_COMPILE = "-O2 -Wno-error=deprecated-declarations";
          };
      });
      linuxPackages_zen = prev.linuxPackages_zen.extend (self: super: {
        kernel = super.kernel.overrideAttrs (old: {
          postFixup =
            (old.postFixup or "")
            + ''
              ln -sf bzImage $out/vmlinuz
            '';
        });
      });
    })
  ];
}
