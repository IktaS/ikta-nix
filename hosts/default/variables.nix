{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "IktaS";
  gitEmail = "imamrafiia@gmail.com";

  # Python development tools are included by default

  # Hyprland Settings
  # ex: monitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: monitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  # You can configure multiple monitors. Create a new line for each one.
  monitorSettings = "
    monitor=,preferred,auto,auto
    monitor=Virtual-1,1920x1080@60,auto,1
  ";

  additionalHyprlandConfig = "
  ";

  additionalExecOnceSettings = [
  ];

  # Waybar Settings (used when barChoice = "waybar")
  clock24h = false;

  # Program Options
  # Set Default Browser (google-chrome-stable for google-chrome)
  browser = "zen";

  # Available Options:
  # Kitty, ghostty
  terminal = "ghostty"; # Set Default System Terminal

  keyboardLayout = "us";
  keyboardVariant = "";
  consoleKeyMap = "us";

  # For hybrid support (Intel/NVIDIA Prime or AMD/NVIDIA)
  intelID = "PCI:1:0:0";
  amdgpuID = "PCI:5:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = true;

  # Enable Thunar GUI File Manager
  # Yazi is default File Manager
  thunarEnable = true;

  # Themes and animation.
  #  Only uncomment your selection
  # The others much be commented out.

  # Set Stylix Image
  # This will set your color palette
  # Default background
  # Add new images to ~/ikta-nix/wallpapers
  stylixImage = ../../wallpapers/4.jpg;

  # Set Animation style
  # Available options are:
  animChoice = ../../modules/home/hyprland/animations-def.nix;
  #animChoice = ../../modules/home/hyprland/animations-end4.nix;
  #animChoice = ../../modules/home/hyprland/animations-end4-slide.nix;
  #animChoice = ../../modules/home/hyprland/animations-end-slide.nix;
  #animChoice = ../../modules/home/hyprland/animations-dynamic.nix;
  #animChoice = ../../modules/home/hyprland/animations-moving.nix;

  # RQuickShare settings
  rQuickSharePort = 12588;

  # Set network hostId if required (needed for zfs)
  # Otherwise leave as-is
  hostId = "5ab03f50";
}
