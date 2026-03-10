{
  pkgs,
  pkgsUnstable,
  inputs,
  config,
  ...
}:
{
  # Install opencode for the user
  home.packages = [
    pkgsUnstable.opencode
    pkgsUnstable.opencode-desktop
  ];
}
