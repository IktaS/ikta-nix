{
  pkgs,
  host,
  options,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) rQuickSharePort;
  inherit (import ../../hosts/${host}/variables.nix) hostId;
in
{
  networking = {
    hostName = "${host}";
    hostId = hostId;
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080
        rQuickSharePort # rquickshare
      ]
      ++ builtins.genList (x: 1714 + x) 51; # KDE Connect: 1714-1764
      allowedUDPPorts = [
        59010
        59011
      ]
      ++ builtins.genList (x: 1714 + x) 51; # KDE Connect: 1714-1764
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
