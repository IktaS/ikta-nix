{inputs, pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
        ExtensionSettings = {
        "adnauseam@rednoise.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4613584/adnauseam-3.26.2.xpi";
            installation_mode = "force_installed";
          };
          "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4510271/yomitan-25.6.3.0.xpi";
            installation_mode = "force_installed";
          };
          "moz-addon-prod@7tv.app" = {
            install_url = "https://extension.7tv.gg/v3.0.9/ext.xpi";
            installation_mode = "force_installed";
          };
      };
    };
  };
}
