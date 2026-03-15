{
  pkgs,
  inputs,
  lib,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  noctaliaPkg = inputs.noctalia.packages.${system}.default;
  configDir = "${noctaliaPkg}/share/noctalia-shell";

  # Default Noctalia settings with clipboard history enabled
  defaultSettings = {
    appLauncher = {
      enableClipboardHistory = true;
    };
  };
in {
  # Install the Noctalia package
  home.packages = [
    noctaliaPkg
    pkgs.quickshell # Ensure quickshell is available for the service
  ];

  # Seed the configuration
  home.activation.seedNoctaliaShellCode = lib.hm.dag.entryAfter ["writeBoundary"] ''
    set -eu
    DEST="$HOME/.config/quickshell/noctalia-shell"
    SRC="${configDir}"

    if [ ! -d "$DEST" ]; then
      $DRY_RUN_CMD mkdir -p "$HOME/.config/quickshell"
      $DRY_RUN_CMD cp -R "$SRC" "$DEST"
      $DRY_RUN_CMD chmod -R u+rwX "$DEST"
    fi

    # Create noctalia config directory and settings file with clipboard enabled
    NOCTALIA_CONFIG_DIR="$HOME/.config/noctalia"
    SETTINGS_FILE="$NOCTALIA_CONFIG_DIR/settings.json"

    $DRY_RUN_CMD mkdir -p "$NOCTALIA_CONFIG_DIR"

    # Create settings.json with clipboard history enabled if it doesn't exist
    if [ ! -f "$SETTINGS_FILE" ]; then
      $DRY_RUN_CMD echo '${builtins.toJSON defaultSettings}' > "$SETTINGS_FILE"
    fi
  '';
}
