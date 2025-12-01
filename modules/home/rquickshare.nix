{
  config,
  pkgs,
  host,
  ...
}:
let
  rquickshareWrapped = pkgs.writeShellScriptBin "rquickshare" ''
    WEBKIT_DISABLE_COMPOSITING_MODE=1 exec ${pkgs.rquickshare}/bin/rquickshare "$@"
  '';
  inherit (import ../../hosts/${host}/variables.nix) rQuickSharePort;
in
{
  home.packages = [ rquickshareWrapped ];

  xdg.dataFile."dev.mandre.rquickshare/.settings.json".source =
    pkgs.writeText "rquickshare-settings.json"
      (
        builtins.toJSON {
          autostart = true;
          startminimized = true;
          visibility = 0;
          download_path = "${config.home.homeDirectory}/Downloads/QuickShare";
          realclose = false;

          port = rQuickSharePort;
        }
      );
}
