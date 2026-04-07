{pkgs, ...}: let
  extDir = "$HOME/.config/adnauseam-chromium";
  chromiumBin = "${pkgs.ungoogled-chromium}/bin/chromium";

  adnauseam-script = pkgs.writeScriptBin "chromium" ''
    #!/usr/bin/env bash
    set -euo pipefail

    EXT_DIR="${extDir}"

    if [ ! -d "$EXT_DIR/adnauseam.chromium" ]; then
      echo "Installing AdNauseam..."
      TEMP_ZIP="/tmp/adnauseam.chromium.zip"
      rm -rf "$EXT_DIR"
      mkdir -p "$EXT_DIR"
      curl -L -o "$TEMP_ZIP" "https://github.com/dhowe/AdNauseam/releases/latest/download/adnauseam.chromium.zip"
      unzip -o "$TEMP_ZIP" -d "$EXT_DIR"
      rm -f "$TEMP_ZIP"
      echo "AdNauseam installed."
    fi

    exec ${chromiumBin} --disable-features=ExtensionManifestV2Unsupported --load-extension=${extDir}/adnauseam.chromium "''${@:-}"
  '';

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
in {
  home.packages = [
    install-adnauseam
  ];

  home.sessionPath = [
    "${adnauseam-script}/bin"
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "likgccmbimhjbgkjambclfkhldnlhbnn"
      "ailoabdmgclmfmhdagmlohpjlbpffblp"
      "fdcjeigdfljhiinbagbmlhekkbgcdnfc"
    ];
  };

  home.file."chromium/Default/Preferences".source = pkgs.writeTextFile {
    name = "chromium-preferences";
    text = builtins.toJSON {
      default_search_provider = {
        enabled = true;
        is_default = true;
        name = "Google";
        search_url = "https://www.google.com/search?q={searchTerms}";
        suggest_url = "https://www.google.com/complete/search?client=chrome&q={searchTerms}";
      };
      default_search_provider_data = {
        bookmark_bar_data = {};
        new_tab = {};
      };
    };
  };
}
