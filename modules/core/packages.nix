{
  inputs,
  pkgs,
  host,
  ...
}: let
  vars = import ../../hosts/${host}/variables.nix;
  inherit (vars) barChoice;
  # Noctalia-specific packages
  noctaliaPkgs =
    if barChoice == "noctalia"
    then
      with pkgs; [
        matugen # color palette generator needed for noctalia-shell
        app2unit # launcher for noctalia-shell
        gpu-screen-recorder # needed for nnoctalia-shell
      ]
    else [];
in {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    firefox.enable = true;
    hyprland = {
      enable = true; # set this so desktop file is created
      withUWSM = false;
    };
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    hyprlock.enable = true;
    kdeconnect.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    segger-jlink.acceptLicense = true;
  };
  nixpkgs.config.permittedInsecurePackages = ["openssl-1.1.1w" "libsoup-2.74.3"];

  environment.systemPackages = with pkgs;
    [
      awww
      inputs.synfetch.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ noctaliaPkgs
    ++ [
      alejandra # nix formatter
      android-tools # adb and fastboot
      squashfsTools # For AppImage extraction
      dwarfs # For DWARFS-compressed AppImages
      brightnessctl # For Screen Brightness Control
      cliamp # terminal music player
      cliphist # Clipboard manager using rofi menu
      cmatrix # Matrix Movie Effect In Terminal
      cowsay # Great Fun Terminal Program
      discord # Stable client
      discord-canary # beta client
      docker-compose # Allows Controlling Docker From A Single File
      duf # Utility For Viewing Disk Usage In Terminal
      dysk # Disk space util nice formattting
      eza # Beautiful ls Replacement
      ffmpeg-full # Terminal Video / Audio Editing
      file-roller # Archive Manager
      fd # find util needed for emacs but good util regardless vs. find
      gearlever # Manage / run Appimages
      icu # dep for gearlever
      gimp-with-plugins # Great Photo Editor
      mesa-demos # needed for inxi diag util
      tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
      htop # Simple Terminal Based System Monitor
      eog # For Image Viewing
      inxi # CLI System Information Tool
      killall # For Killing All Instances Of Programs
      libnotify # For Notifications
      lm_sensors # Used For Getting Hardware Temps
      lolcat # Add Colors To Your Terminal Command Output
      lshw # Detailed Hardware Information
      lufus # Rufus clone for Linux
      mdcat # CLI markdown parser
      mpv # Incredible Video Player
      ncdu # Disk Usage Analyzer With Ncurses Interface
      nixfmt # Nix Formatter
      nwg-displays # configure monitor configs via GUI
      nwg-drawer # Application launcher for wayland
      nwg-dock-hyprland # Dock for hyprland
      nwg-menu # App menu for waybar
      onefetch # provides zsaneyos build info on current system
      pandoc # format MD to HTML for cheatsheet parser
      pavucontrol # For Editing Audio Levels & Devices
      pciutils # Collection Of Tools For Inspecting PCI Devices
      picard # For Changing Music Metadata & Getting Cover Art
      pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
      playerctl # Allows Changing Media Volume Through Scripts
      rhythmbox # audio player
      ripgrep # Improved Grep
      sqlite # needed for emaacs
      socat # Needed For Screenshots
      unrar # Tool For Handling .rar Files
      unzip # Tool For Handling .zip Files
      usbutils # Good Tools For USB Devices
      upower # noctalia shell battery
      uwsm # Universal Wayland Session Manager (optional must be enabled)
      v4l-utils # Used For Things Like OBS Virtual Camera
      wget # Tool For Fetching Files With Links
      ytmdl # Tool For Downloading Audio From YouTube
      hyprpicker # Color Picker
      lsscsi
      bluez # Bluetooth protocol stack
      bluez-tools # Bluetooth utilities
      nrfutil # Nordic CLI tools for nRF52840
      ntfs3g # ntfs driver tools things
      obsidian # notes app
      opam
      orca-slicer
      protonup-qt # Compatibility checker tool for Steam
      qbittorrent # torrent client
      qpwgraph # GUI Graph Manager for PipeWire
      pear-desktop # Youtube Music Desktop App
      # rquickshare # QuickShare client (disabled: upstream Tauri version mismatch)
      packet
      # programming shit
      python3 # Python 3 programming language
      uv # Python package manager
      bubblewrap
      bun # js shit
      dig
      erlang
      gcc
      gedit # Simple Graphical Text Editor
      (
        gleam.overrideAttrs (_: {
          doCheck = false;
        })
      )
      gnumake
      go
      vscode
      typst
      zig
      nil
      nixd
      arduino-cli
      # rust related
      (
        fenix.complete.withComponents [
          "cargo"
          "clippy"
          "rust-src"
          "rustc"
          "rustfmt"
        ]
      )
      fenix.stable.toolchain
      rust-analyzer
      libratbag
      piper
      marimo
      (
        import
        (fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/751890b33476e0a9311b3534bccb60b13286ce9d.tar.gz";
          sha256 = "1nxcni5rpbpcnddkc2wbaaf3qmqykwhcn0nry5b4hhcqqg142kpr";
        })
        {
          localSystem = {
            system = "x86_64-linux";
          };
        }
      ).mokuro
    ];
}
