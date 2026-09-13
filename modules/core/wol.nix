{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) enableWoL;
  inherit (import ../../hosts/${host}/variables.nix) wolInterface;
in {
  networking.interfaces.${wolInterface}.wakeOnLan.enable = enableWoL;
}
