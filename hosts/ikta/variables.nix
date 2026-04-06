{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "IktaS";
  gitEmail = "imamrafiia@gmail.com";

  # Hyprland Settings
  # ex: monitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: monitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  # You can configure multiple monitors. Create a new line for each one.
  monitorSettings = "
    monitor=DP-2,1920x1080@143.98,0x180,1.0
    monitor=HDMI-A-1,1920x1080@74.97,1920x0,1.0,transform,3
    monitor=Virtual-1,1920x1080@60,auto,1
  ";

  additionalHyprlandConfig = "
    workspace=1,monitor:DP-2,default:true
    workspace=3,monitor:DP-2,default:true
    workspace=2,monitor:HDMI-A-1,default:true
  ";

  additionalExecOnceSettings = [
    "[workspace 1 silent] qpwgraph"
    "[workspace 2 silent] chromium"
  ];

  # Waybar Settings
  clock24h = true;

  # Program Options
  # Set Default Browser (google-chrome-stable for google-chrome)
  browser = "chromium";

  # Available Options:
  # kitty, wezterm
  terminal = "wezterm"; # Set Default System Terminal

  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
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
  stylixImage = ../../wallpapers/FetUEveUoAA9qnk.jpg;

  # Set Animation style
  # Available options are:
  animChoice = ../../modules/home/hyprland/animations-def.nix;
  #animChoice = ../../modules/home/hyprland/animations-end4.nix;
  #animChoice = ../../modules/home/hyprland/animations-dynamic.nix;
  #animChoice = ../../modules/home/hyprland/animations-moving.nix;

  # RQuickShare settings
  rQuickSharePort = 12588;

  # Set network hostId if required (needed for zfs)
  # Otherwise leave as-is
  hostId = "5ab03f50";
}
