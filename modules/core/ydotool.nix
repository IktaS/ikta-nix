{ pkgs, ... }:
{
  systemd.services.ydotoold = {
    description = "ydotool daemon for Wayland input injection (KDE Connect remote input)";
    wantedBy = [ "multi-user.target" ];
    after = [ "graphical.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=/run/ydotoold.sock --socket-perm=0666";
      Restart = "on-failure";
      RuntimeDirectory = "ydotoold";
      RuntimeDirectoryMode = "0755";
    };
  };
}
