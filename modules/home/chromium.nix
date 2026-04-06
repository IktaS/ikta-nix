{
  pkgs,
  inputs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    extensions = {
      enable = true;
      packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        yomitan
        adnauseam
      ];
    };
  };
}
