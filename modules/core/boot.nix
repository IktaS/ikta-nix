{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [
      "squashfs"
    ];
    # extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
    supportedFilesystems = ["squashfs"];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };

  # Fix: kernel 7.0.12 produces vmlinuz instead of bzImage but kernel.target still returns bzImage
  system.boot.loader.kernelFile = "vmlinuz";
}
