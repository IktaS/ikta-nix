{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [
      "v4l2loopback"
      "squashfs"
    ];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
    supportedFilesystems = ["squashfs"];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };
}
