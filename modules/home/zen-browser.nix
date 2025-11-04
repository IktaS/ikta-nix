{inputs, pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
        ExtensionSettings = {
          "wappalyzer@crunchlabz.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4482384/wappalyzer-6.10.82.xpi";
            installation_mode = "force_installed";
          };
          "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4156831/github_file_icons-1.5.1.xpi";
            installation_mode = "force_installed";
          };
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4531307/ublock_origin-1.65.0.xpi";
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
