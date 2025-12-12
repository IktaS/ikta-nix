{
  pkgs,
  ...
}:
let
  orcaWrapped = pkgs.writeShellScriptBin "orca-slicer" ''
    export LC_ALL=C
    export MESA_LOADER_DRIVER_OVERRIDE=zink
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
    export __GLX_VENDOR_LIBRARY_NAME=mesa
    export __EGL_VENDOR_LIBRARY_FILENAMES=${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json
    export GALLIUM_DRIVER=zink
    exec ${pkgs.orca-slicer}/bin/orca-slicer "$@"
  '';
in
{
  home.packages = [ orcaWrapped ];
}
