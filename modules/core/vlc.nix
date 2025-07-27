{ config, pkgs, ... }:
let
    libbluray = pkgs.libbluray.override {
      withAACS = true;
      withBDplus = true;
    };
    myVlc = pkgs.vlc.override { inherit libbluray; }; # renamed this to avoid potential shadowing by `with pkgs;` 
in {
  # ... other stuff
  environment.systemPackages = [ myVlc ];
}