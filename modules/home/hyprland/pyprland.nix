{
  pkgs,
  host,
  ...
}: let
  vars = import ../../../hosts/${host}/variables.nix;
  terminal = vars.terminal;
  droptermClass = "${terminal}-dropterm";
in {
  home.packages = with pkgs; [pyprland];

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
    ]

    [scratchpads.term]
    animation = "fromTop"
    command = "${terminal} --class ${droptermClass}"
    class = "${droptermClass}"
    size = "70% 70%"
    max_size = "1920px 100%"
    position = "150px 150px"
  '';
}
