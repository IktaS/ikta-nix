{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.zed-editor = {
    enable = true;
    extensions = [
        "nix"
        "toml"
        "markdown-oxide"
        "zig"
        "ocaml"
        "dockerfile"
        "sql"
        "log"
        "csv"
        "rainbow-csv"
        "make"
    ];
  };
}
