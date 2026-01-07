{
  pkgs,
  inputs,
  ...
}:
let
  # Prefer explicit package name if available; fall back to default
  opencode = inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  # Install opencode for the user
  home.packages = [ opencode ];
}
