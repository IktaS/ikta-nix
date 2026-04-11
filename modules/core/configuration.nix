{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add other dependencies here
    webkitgtk_4_1
    webkitgtk_6_0
    gtk3
    glib
    libsoup
    libxml2
    # If using Wayland
    libwpe
    wpebackend-fdo
  ];
}
