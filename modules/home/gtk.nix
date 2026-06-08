{
  pkgs,
  lib,
  ...
}: {
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4 = {
      theme = lib.mkForce null;
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}
