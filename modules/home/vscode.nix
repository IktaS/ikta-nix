{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          jeff-hykin.better-nix-syntax
          ms-vscode.cpptools-extension-pack
          mads-hartmann.bash-ide-vscode
          tamasfe.even-better-toml
          zainchen.json
          shd101wyy.markdown-preview-enhanced
          ziglang.vscode-zig
          ms-vscode.live-server
          golang.go
          ocamllabs.ocaml-platform
          rust-lang.rust-analyzer
        ];
      };
    };
  };
}
