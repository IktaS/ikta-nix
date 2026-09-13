{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
      "squashfs"
      "v4l2loopback"
    ];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
    supportedFilesystems = ["squashfs"];
    kernel.sysctl = {"vm.max_map_count" = 2147483642;};
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };

  # Fix: kernel 7.0.12 produces vmlinuz instead of bzImage but kernel.target still returns bzImage
  system.boot.loader.kernelFile = "vmlinuz";
}
