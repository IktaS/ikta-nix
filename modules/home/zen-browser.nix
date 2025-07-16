{inputs, pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.zen-browser.homeModules.twilight-official
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
            };
    };
  };
}
