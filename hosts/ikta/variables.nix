{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "IktaS";
  gitEmail = "imamrafiia@gmail.com";

  # Set Display Manager
  # `tui` for Text login
  # `sddm` for graphical GUI (default)
  displayManager = "tui";

  # Enable/disable bundled applications
  tmuxEnable = false;
  alacrittyEnable = false;
  weztermEnable = true;
  ghosttyEnable = false;
  vscodeEnable = false;
  antigravityEnable = false;
  helixEnable = false;
  doomEmacsEnable = false;
  pythonEnable = false;

  # Hyprland Settings
  # You can configure multiple monitors.
  # Inside the quotes, create a new line for each monitor.
  extraMonitorSettings = "
    monitor=DP-2,1920x1080@143.98,0x180,1.0
    monitor=HDMI-A-1,1920x1080@74.97,1920x0,1.0,transform,3
    monitor=Virtual-1,1920x1080@60,auto,1

    workspace=1,monitor:DP-2,default:true
    workspace=3,monitor:DP-2,default:true
    workspace=2,monitor:HDMI-A-1,default:true
  ";

  # Extra commands run once at Hyprland startup
  additionalExecOnceSettings = [
    "[workspace 1 silent] qpwgraph"
    "[workspace 2 silent] chromium"
  ];

  # Bar/Shell Settings
  # Choose between noctalia or waybar
  barChoice = "noctalia";

  # Waybar Settings (used when barChoice = "waybar")
  waybarChoice = ../../modules/home/waybar/waybar-curved.nix;
  clock24h = true;

  # Program Options
  # Set Default Browser
  browser = "chromium";

  # Available Options:
  # Kitty, ghostty, wezterm, alacritty
  # Note: kitty, wezterm, alacritty have to be enabled above
  terminal = "wezterm"; # Set Default System Terminal

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

  # Set Stylix Image
  # This will set your color palette
  # Add new images to ~/ikta-nix/wallpapers
  stylixImage = ../../wallpapers/FetUEveUoAA9qnk.jpg;

  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-def.nix;

  # RQuickShare settings
  rQuickSharePort = 12588;

  # Set network hostId if required (needed for zfs)
  # Otherwise leave as-is
  hostId = "5ab03f50";

  # Wake on LAN
  enableWoL = true;
  wolInterface = "enp9s0"; # Ethernet interface

  # Tailscale VPN mesh
  enableTailscale = true;

  # Sunshine game streaming server
  enableSunshine = true;
}
