{ pkgs }:
pkgs.writeShellScriptBin "screenshootin" ''
  hyprshot -m region -- swappy -f -
''
