{host, ...}: let
  inherit
    (import ../../../hosts/${host}/variables.nix)
    monitorSettings
    ;
in {
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        {
          name = "resolve-noblur";
          match.class = "^(\\bresolve\\b)$";
          match.xwayland = true;
          no_blur = true;
        }
        {
          name = "tag-file-manager";
          match.class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$";
          tag = "+file-manager";
        }
        {
          name = "tag-terminal";
          match.class = "^(org.wezfurlong.wezterm|wezterm-dropterm|Alacritty|kitty|kitty-dropterm)$";
          tag = "+terminal";
        }
        {
          name = "tag-browser-brave";
          match.class = "^(Brave-browser(-beta|-dev|-unstable)?)$";
          tag = "+browser";
        }
        {
          name = "tag-browser-firefox";
          match.class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$";
          tag = "+browser";
        }
        {
          name = "tag-browser-chrome";
          match.class = "^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$";
          tag = "+browser";
        }
        {
          name = "tag-browser-thorium";
          match.class = "^([Tt]horium-browser|[Cc]achy-browser)$";
          tag = "+browser";
        }
        {
          name = "tag-projects-codium";
          match.class = "^(codium|codium-url-handler|VSCodium)$";
          tag = "+projects";
        }
        {
          name = "tag-projects-vscode";
          match.class = "^(VSCode|code-url-handler)$";
          tag = "+projects";
        }
        {
          name = "tag-im-discord";
          match.class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$";
          tag = "+im";
        }
        {
          name = "tag-im-ferdium";
          match.class = "^([Ff]erdium)$";
          tag = "+im";
        }
        {
          name = "tag-im-whatsapp";
          match.class = "^([Ww]hatsapp-for-linux)$";
          tag = "+im";
        }
        {
          name = "tag-im-telegram";
          match.class = "^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$";
          tag = "+im";
        }
        {
          name = "tag-im-teams";
          match.class = "^(teams-for-linux)$";
          tag = "+im";
        }
        {
          name = "tag-games-gamescope";
          match.class = "^(gamescope)$";
          tag = "+games";
        }
        {
          name = "tag-games-steam";
          match.class = "^(steam_app_\\d+)$";
          tag = "+games";
        }
        {
          name = "tag-gamestore-steam";
          match.class = "^([Ss]team)$";
          tag = "+gamestore";
        }
        {
          name = "tag-gamestore-lutris";
          match.title = "^([Ll]utris)$";
          tag = "+gamestore";
        }
        {
          name = "tag-gamestore-heroic";
          match.class = "^(com.heroicgameslauncher.hgl)$";
          tag = "+gamestore";
        }
        {
          name = "tag-settings-disks";
          match.class = "^(gnome-disks|wihotspot(-gui)?)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-rofi";
          match.class = "^([Rr]ofi)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-archiver";
          match.class = "^(file-roller|org.gnome.FileRoller)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-network";
          match.class = "^(nm-applet|nm-connection-editor|blueman-manager)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-audio";
          match.class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-theming";
          match.class = "^(nwg-look|qt5ct|qt6ct|[Yy]ad)$";
          tag = "+settings";
        }
        {
          name = "tag-settings-portal";
          match.class = "(xdg-desktop-portal-gtk)";
          tag = "+settings";
        }
        {
          name = "tag-settings-blueman";
          match.class = "(.blueman-manager-wrapped)";
          tag = "+settings";
        }
        {
          name = "tag-settings-nwgdisplays";
          match.class = "(nwg-displays)";
          tag = "+settings";
        }
        {
          name = "pip-move";
          match.title = "^(Picture-in-Picture)$";
          move = "72% 7%";
        }
        {
          name = "keybinds-float";
          match.title = "^(Hyprland Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration)$";
          float = true;
        }
        {
          name = "keybinds-center";
          match.title = "^(Hyprland Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration)$";
          center = true;
        }
        {
          name = "keybinds-size";
          match.title = "^(Hyprland Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration)$";
          size = "55% 66%";
        }
        {
          name = "cheatsheets-float";
          match.title = "^(Cheatsheets Viewer)$";
          float = true;
        }
        {
          name = "cheatsheets-center";
          match.title = "^(Cheatsheets Viewer)$";
          center = true;
        }
        {
          name = "cheatsheets-size";
          match.title = "^(Cheatsheets Viewer)$";
          size = "65% 60%";
        }
        {
          name = "ferdium-center";
          match.class = "^([Ff]erdium)$";
          center = true;
        }
        {
          name = "qs-wallpapers-float";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Wallpapers)$";
          float = true;
        }
        {
          name = "qs-vidwallpapers-float";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          float = true;
        }
        {
          name = "qs-vidwallpapers-center";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          center = true;
        }
        {
          name = "qs-wlogout-float";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(qs-wlogout)$";
          float = true;
        }
        {
          name = "qs-wlogout-center";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(qs-wlogout)$";
          center = true;
        }
        {
          name = "qs-panels-float";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Panels)$";
          float = true;
        }
        {
          name = "qs-panels-center";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Panels)$";
          center = true;
        }
        {
          name = "qs-panels-noshadow";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Panels)$";
          no_shadow = true;
        }
        {
          name = "qs-panels-noblur";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Panels)$";
          no_blur = true;
        }
        {
          name = "qs-panels-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Panels)$";
          rounding = 12;
        }
        {
          name = "docs-float";
          match.title = "^(Hyprland Keybinds|Niri Keybinds|BSPWM Keybinds|i3 Keybinds|Sway Keybinds|DWM Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration|Cheatsheets Viewer|Documentation Viewer)$";
          float = true;
        }
        {
          name = "docs-center";
          match.title = "^(Hyprland Keybinds|Niri Keybinds|BSPWM Keybinds|i3 Keybinds|Sway Keybinds|DWM Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration|Cheatsheets Viewer|Documentation Viewer)$";
          center = true;
        }
        {
          name = "docs-size";
          match.title = "^(Hyprland Keybinds|Niri Keybinds|BSPWM Keybinds|i3 Keybinds|Sway Keybinds|DWM Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration|Cheatsheets Viewer|Documentation Viewer)$";
          size = "55% 66%";
        }
        {
          name = "pavucontrol-center";
          match.class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$";
          center = true;
        }
        {
          name = "thunar-dialog-center";
          match.class = "([Tt]hunar)";
          match.title = "negative:(.*[Tt]hunar.*)";
          center = true;
        }
        {
          name = "auth-center";
          match.title = "^(Authentication Required)$";
          center = true;
        }
        {
          name = "idle_inhibit-class";
          match.class = "^(.*)$";
          idle_inhibit = "fullscreen";
        }
        {
          name = "idle_inhibit-title";
          match.title = "^(.*)$";
          idle_inhibit = "fullscreen";
        }
        {
          name = "idle_inhibit-fullscreen";
          match.fullscreen = true;
          idle_inhibit = "fullscreen";
        }
        {
          name = "settings-float";
          match.tag = "settings*";
          float = true;
        }
        {
          name = "ferdium-float";
          match.class = "^([Ff]erdium)$";
          float = true;
        }
        {
          name = "pip-float";
          match.title = "^(Picture-in-Picture)$";
          float = true;
        }
        {
          name = "mpv-float";
          match.class = "^(mpv|com.github.rafostar.Clapper)$";
          float = true;
        }
        {
          name = "auth-float";
          match.title = "^(Authentication Required)$";
          float = true;
        }
        {
          name = "codium-dialog-float";
          match.class = "(codium|codium-url-handler|VSCodium)";
          match.title = "negative:(.*codium.*|.*VSCodium.*)";
          float = true;
        }
        {
          name = "heroic-dialog-float";
          match.class = "^(com.heroicgameslauncher.hgl)$";
          match.title = "negative:(Heroic Games Launcher)";
          float = true;
        }
        {
          name = "steam-dialog-float";
          match.class = "^([Ss]team)$";
          match.title = "negative:^([Ss]team)$";
          float = true;
        }
        {
          name = "thunar-dialog-float";
          match.class = "([Tt]hunar)";
          match.title = "negative:(.*[Tt]hunar.*)";
          float = true;
        }
        {
          name = "add-folder-float";
          match.initial_title = "(Add Folder to Workspace)";
          float = true;
        }
        {
          name = "open-files-float";
          match.initial_title = "(Open Files)";
          float = true;
        }
        {
          name = "wants-save-float";
          match.initial_title = "(wants to save)";
          float = true;
        }
        {
          name = "open-files-size";
          match.initial_title = "(Open Files)";
          size = "70% 60%";
        }
        {
          name = "add-folder-size";
          match.initial_title = "(Add Folder to Workspace)";
          size = "70% 60%";
        }
        {
          name = "settings-size";
          match.tag = "settings*";
          size = "70% 70%";
        }
        {
          name = "ferdium-size";
          match.class = "^([Ff]erdium)$";
          size = "60% 70%";
        }
        {
          name = "browser-opacity";
          match.tag = "browser*";
          opacity = "1.0 1.0";
        }
        {
          name = "projects-opacity";
          match.tag = "projects*";
          opacity = "0.9 0.8";
        }
        {
          name = "im-opacity";
          match.tag = "im*";
          opacity = "0.94 0.86";
        }
        {
          name = "filemanager-opacity";
          match.tag = "file-manager*";
          opacity = "0.9 0.8";
        }
        {
          name = "terminal-opacity";
          match.tag = "terminal*";
          opacity = "0.8 0.7";
        }
        {
          name = "settings-opacity";
          match.tag = "settings*";
          opacity = "0.8 0.7";
        }
        {
          name = "textedit-opacity";
          match.class = "^(gedit|org.gnome.TextEditor|mousepad)$";
          opacity = "0.8 0.7";
        }
        {
          name = "seahorse-opacity";
          match.class = "^(seahorse)$";
          opacity = "0.9 0.8";
        }
        {
          name = "pip-opacity";
          match.title = "^(Picture-in-Picture)$";
          opacity = "0.95 0.75";
        }
        {
          name = "pip-pin";
          match.title = "^(Picture-in-Picture)$";
          pin = true;
        }
        {
          name = "pip-aspect";
          match.title = "^(Picture-in-Picture)$";
          keep_aspect_ratio = true;
        }
        {
          name = "games-noblur";
          match.tag = "games*";
          no_blur = true;
        }
        {
          name = "games-fullscreen";
          match.tag = "games*";
          fullscreen = true;
        }
        {
          name = "qs-wallpapers-noborder";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Wallpapers)$";
          border_size = 0;
        }
        {
          name = "qs-wallpapers-noshadow";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Wallpapers)$";
          no_shadow = true;
        }
        {
          name = "qs-wallpapers-noblur";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Wallpapers)$";
          no_blur = true;
        }
        {
          name = "qs-wallpapers-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Wallpapers)$";
          rounding = 12;
        }
        {
          name = "qs-vidwallpapers-noborder";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          border_size = 0;
        }
        {
          name = "qs-vidwallpapers-noshadow";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          no_shadow = true;
        }
        {
          name = "qs-vidwallpapers-noblur";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          no_blur = true;
        }
        {
          name = "qs-vidwallpapers-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Video Wallpapers)$";
          rounding = 12;
        }
        {
          name = "qs-wlogout-noborder";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(qs-wlogout)$";
          border_size = 0;
        }
        {
          name = "qs-wlogout-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(qs-wlogout)$";
          rounding = 20;
        }
        {
          name = "qs-wlogout-opacity";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(qs-wlogout)$";
          opacity = "1.0 1.0";
        }
        {
          name = "qs-cheatsheets-noborder";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Cheatsheets Viewer)$";
          border_size = 0;
        }
        {
          name = "qs-cheatsheets-noshadow";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Cheatsheets Viewer)$";
          no_shadow = true;
        }
        {
          name = "qs-cheatsheets-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Cheatsheets Viewer)$";
          rounding = 12;
        }
        {
          name = "qs-docs-noborder";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Documentation Viewer)$";
          border_size = 0;
        }
        {
          name = "qs-docs-noshadow";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Documentation Viewer)$";
          no_shadow = true;
        }
        {
          name = "qs-docs-rounding";
          match.class = "^(org\\.qt-project\\.qml)$";
          match.title = "^(Documentation Viewer)$";
          rounding = 12;
        }
      ];
    };
  };
}
