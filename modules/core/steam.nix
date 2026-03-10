{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      extest.enable = true;
      package = pkgs.steam.override {
        extraEnv = {
          MANGOHUD = "1";
          MANGOHUD_CONFIG = "read_cfg,no_display";
          GAMEMODERUN = "1";
          AMD_VULKAN_ICD = "RADV";
          VKD3D_CONFIG = "dxr,dxr11";
          PROTON_ADD_CONFIG = "fsr4rdna3";
          PROTON_LOCAL_SHADER_CACHE = "1";
          MESA_SHARDER_CACHE_MAX_SIZE = "16G";
          WINE_VK_VULKAN_ONLY = "1";
          MESA_GLSL_CACHE_MAX_SIZE = "16G";
          WIDEDLLOVEERRIDES = "diinput8,dxgi,dsound=n,b";
        };
      };
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };
}
