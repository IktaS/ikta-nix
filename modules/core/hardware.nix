{ pkgs, ... }:
{
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
    logitech.wireless.enable = false;
    logitech.wireless.enableGraphical = false;
    graphics.enable = true;
    enableRedistributableFirmware = true;
    keyboard.qmk.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          KernelExperimental = true;
          ControllerMode = "le"; # Force LE mode only (QMK BLE is LE)
          Privacy = "off"; # Disable LE privacy completely for QMK
          LEAutoSecurity = "true";
          FastConnectable = "true"; # Faster connection for QMK advertising windows
          JustWorksRepairing = "always"; # Allow re-pairing without authentication
          # Disable classic Bluetooth since QMK uses LE only
          ClassicBondedOnly = "false";
          # Increase timeout for QMK's short advertising window
          TemporaryTimeout = "60";
          # nRF52840 specific: longer discovery timeouts for power-efficient advertising
          DiscoverableTimeout = "0"; # No timeout
          PairableTimeout = "0"; # No timeout
        };
        Scan = {
          # nRF52840 uses power-efficient advertising - need longer scan windows
          Interval = "160"; # 100ms scan interval
          Window = "160"; # 100ms scan window (100% duty cycle during scan)
        };
        Policy = {
          AutoEnable = "true";
        };
        LE = {
          # Connection parameters for better QMK/nRF52840 compatibility
          MinConnectionInterval = "6";
          MaxConnectionInterval = "12";
          ConnectionLatency = "0";
          LinkSupervisionTimeout = "3200";
        };
        GATT = {
          # Enable GATT cache for better nRF52840 device handling
          Cache = "always";
        };
        AdvMon = {
          # Better advertising monitoring for power-efficient devices like nRF52840
          RSSILowThreshold = "-90";
          RSSIHighThreshold = "-60";
        };
      };
    };
  };
  local.hardware-clock.enable = false;
}
