{profile, ...}: {
  # Services to start
  services = {
    upower.enable = true;
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    power-profiles-daemon.enable = true;
    openssh = {
      enable = true; # Enable SSH
      settings = {
        PermitRootLogin = "no"; # Prevent root from SSH login
        PasswordAuthentication = true; # Users can SSH using kb and password
        KbdInteractiveAuthentication = true;
      };
      ports = [22];
    };
    blueman.enable = true; # Bluetooth Support
    ratbagd.enable = true; # Gaming mouse configuration daemon (piper)
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;

    smartd = {
      enable =
        if profile == "vm"
        then false
        else true;
      autodetect = true;
    };
  };
}
