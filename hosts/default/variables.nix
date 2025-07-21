{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "IktaS";
  gitEmail = "imamrafiia@gmail.com";

  # Set Displau Manager
  # `tui` for Text login
  # `sddm` for graphical GUI
  # SDDM background is set with stylixImage
  displayManager = "sddm";

  # Emable/disable bundled applications
  tmuxEnable = false;
  alacrittyEnable = false;
  weztermEnable = false;
  ghosttyEnable = false;
  vscodeEnable = true;
  helixEnable = false;

  # Hyprland Settings
  # ex: monitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: monitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  # You can configure multiple monitors. Create a new line for each one.
  monitorSettings = [
      ",preferred,auto,auto"
      "Virtual-1,1920x1080@60,auto,1"
  ];

  workspaceSettings = [
  ];

  additionalExecOnceSettings = [
  ];

  # Waybar Settings
  clock24h = true;

  # Program Options
  # Set Default Browser (google-chrome-stable for google-chrome)
  browser = "zen";

  # Available Options:
  # Kitty, ghostty, wezterm
  terminal = "kitty"; # Set Default System Terminal

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

  # Themes, waybar and animation.
  #  Only uncomment your selection
  # The others much be commented out.

  # Set Stylix Image
  # This will set your color palette
  # Default background
  # Add new images to ~/ikta-nix/wallpapers
  stylixImage = ../../wallpapers/4.jpg;

  # Set Waybar
  #  Available Options:
  # waybarChoice = ../../modules/home/waybar/waybar-curved.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  waybarChoice = ../../modules/home/waybar/waybar-ddubs-2.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-simple.nix;
  #waybarChoice = ../../modules/home/waybar/Jerry-waybar.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-nekodyke.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project very fluid)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-def.nix;
  #animChoice = ../../modules/home/hyprland/animations-end4.nix;
  #animChoice = ../../modules/home/hyprland/animations-dynamic.nix;
  #animChoice = ../../modules/home/hyprland/animations-moving.nix;
}
