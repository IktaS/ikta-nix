{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add other dependencies here
    webkitgtk_4_1
    webkitgtk_6_0
    gtk3
    glib
    libsoup_2_4
    libsoup_3
    libxml2
    # If using Wayland
    libwpe
    libwpe-fdo
  ];
}
