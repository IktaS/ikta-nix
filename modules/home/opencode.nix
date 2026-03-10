{
  pkgs,
  pkgsUnstable,
  inputs,
  config,
  ...
}:
{

  # this allows you to access `pkgsUnstable` anywhere in your config
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
  # Install opencode for the user
  home.packages = [
    pkgsUnstable.opencode
    pkgsUnstable.opencode-desktop
  ];
}
