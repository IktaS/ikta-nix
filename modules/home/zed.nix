{ lib,... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.zed-editor = {
    enable = true;
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
    ];
    userSettings = {
      theme = lib.mkForce {
        mode = "dark";
        dark = "One Dark";
        light = "One Light";
      };
      hour_format = "hour24";
    };
  };
}
