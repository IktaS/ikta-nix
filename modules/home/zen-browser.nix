{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser.enable = true;

  programs.zen-browser.profiles.default.extensions.packages =
    with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        yomitan
        adnauseam
      ];
}
