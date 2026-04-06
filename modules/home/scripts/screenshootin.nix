{pkgs}:
pkgs.writeShellScriptBin "screenshootin" ''
  grim -g "$(slurp -d)" - | swappy -f -
''
