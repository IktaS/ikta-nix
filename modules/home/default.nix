{
  pkgs,
  config,
  inputs,
  host,
  ...
}: let
  vars = import ../../hosts/${host}/variables.nix;
  inherit
    (vars)
    alacrittyEnable
    barChoice
    ghosttyEnable
    tmuxEnable
    waybarChoice
    weztermEnable
    vscodeEnable
    helixEnable
    doomEmacsEnable
    antigravityEnable
    ;
  # Select bar module based on barChoice
  barModule =
    if barChoice == "noctalia"
    then ./noctalia.nix
    else waybarChoice;
in {
  imports =
    [
      ./amfora.nix
      ./bash.nix
      ./bashrc-personal.nix
      ./overview.nix
      ./python.nix
      ./cli/bat.nix
      ./cli/btop.nix
      ./cli/bottom.nix
      ./cli/cava.nix
      ./emoji.nix
      ./eza.nix
      ./fastfetch
      ./cli/fzf.nix
      ./cli/gh.nix
      ./cli/git.nix
      ./gtk.nix
      ./cli/htop.nix
      ./hyprland
      ./terminals/kitty.nix
      ./cli/lazygit.nix
      ./obs-studio.nix
      #./editors/nvf.nix
      ./editors/nixvim.nix
      ./editors/nano.nix
      ./rofi
      ./qt.nix
      ./scripts
      ./scripts/gemini-cli.nix
      ./stylix.nix
      ./swappy.nix
      ./swaync.nix
      ./tealdeer.nix
      ./virtmanager.nix
      barModule
      ./wlogout
      ./xdg.nix
      ./yazi
      #./zen-browser.nix
      ./zoxide.nix
      ./zsh
      ./chromium.nix
      ./opencode.nix
      ./editors/zed.nix
      ./orca-slicer.nix
      # ./rquickshare.nix # disabled: upstream Tauri version mismatch
    ]
    ++ (
      if helixEnable
      then [./editors/evil-helix.nix]
      else []
    )
    ++ (
      if vscodeEnable
      then [./editors/vscode.nix]
      else []
    )
    ++ (
      if antigravityEnable
      then [./editors/antigravity.nix]
      else []
    )
    ++ (
      if doomEmacsEnable
      then [
        ./editors/doom-emacs-install.nix
        ./editors/doom-emacs.nix
      ]
      else []
    )
    ++ (
      if weztermEnable
      then [./terminals/wezterm.nix]
      else []
    )
    ++ (
      if ghosttyEnable
      then [./terminals/ghostty.nix]
      else []
    )
    ++ (
      if tmuxEnable
      then [./terminals/tmux.nix]
      else []
    )
    ++ (
      if alacrittyEnable
      then [./terminals/alacritty.nix]
      else []
    );

  # this allows you to access `pkgsUnstable` anywhere in your config
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };
}
