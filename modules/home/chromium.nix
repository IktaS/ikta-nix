{
  pkgs,
  ...
}:
let
  extDir = "$HOME/.config/adnauseam-chromium";

  install-adnauseam = pkgs.writeScriptBin "install-adnauseam" ''
    #!/usr/bin/env bash
    set -euo pipefail

    TEMP_ZIP="/tmp/adnauseam.chromium.zip"
    EXT_DIR="${extDir}"

    if [ -d "$EXT_DIR/adnauseam.chromium" ] && [ "''${1:-}" != "--force" ]; then
      echo "AdNauseam already installed at $EXT_DIR/adnauseam.chromium"
      echo "Run with --force to reinstall"
      exit 0
    fi

    rm -rf "$EXT_DIR"
    mkdir -p "$EXT_DIR"

    echo "Downloading AdNauseam..."
    curl -L -o "$TEMP_ZIP" "https://github.com/dhowe/AdNauseam/releases/latest/download/adnauseam.chromium.zip"

    echo "Extracting to $EXT_DIR..."
    unzip -o "$TEMP_ZIP" -d "$EXT_DIR"
    rm -f "$TEMP_ZIP"

    echo ""
    echo "AdNauseam installed at: $EXT_DIR/adnauseam.chromium"
  '';

  chromium-with-adnauseam = pkgs.writeScriptBin "chromium-adnauseam" ''
    #!/usr/bin/env bash
    set -euo pipefail
    exec chromium --disable-features=ExtensionManifestV2Unsupported --load-extension=${extDir}/adnauseam.chromium "''${@:-}"
  '';
in
{
  home.packages = [
    install-adnauseam
    chromium-with-adnauseam
  ];
  programs.chromium = {
    enable = true;
    extensions = [
      "ailoabdmgclmfmhdagmlohpjlbpffblp"
      "likgccmbimhjbgkjambclfkhldnlhbnn"
    ];
  };

}
