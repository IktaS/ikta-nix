{host, ...}: let
  vars = import ../../../hosts/${host}/variables.nix;
  inherit
    (vars)
    additionalExecOnceSettings
    ;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once =
      [
        "noctalia"
        "wl-paste --type text --watch cliphist store" # Saves text
        "wl-paste --type image --watch cliphist store" # Saves images
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "qs -c overview" # Start quickshell-overview daemon
      ]
      ++ additionalExecOnceSettings;
  };
}
