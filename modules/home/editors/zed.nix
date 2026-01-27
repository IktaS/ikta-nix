{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extensions = [
      "nix"
      "toml"
      "zig"
      "ocaml"
      "dockerfile"
      "sql"
      "log"
      "csv"
      "rainbow-csv"
      "make"
      "gleam"
      "opencode"
    ];
    userSettings = {
      font_family = "Fira Code Symbol";
      theme = lib.mkForce {
        mode = "dark";
        dark = "One Dark";
        light = "One Light";
      };
      hour_format = "hour24";
      terminal = {
        font_family = "Fira Code Symbol";
      };
    };
  };
}
