{ profile, ... }:
{
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "256/48000";
            pulse.default.req = "256/48000";
            pulse.max.req = "256/48000";
            pulse.min.quantum = "256/48000";
            pulse.max.quantum = "256/48000";
          };
        }
      ];
    };
    extraConfig.pipewire = {
      "92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 256;
        };
      };
    };
    extraConfig.pipewire."91-null-sinks" = {
      "context.objects" = [
        {
          # A default dummy driver. This handles nodes marked with the "node.always-driver"
          # properyty when no other driver is currently active. JACK clients need this.
          factory = "spa-node-factory";
          args = {
            "factory.name" = "support.node.driver";
            "node.name" = "Dummy-Driver";
            "priority.driver" = 8000;
          };
        }
        {
          factory = "adapter";
          args = {
            "factory.name" = "support.null-audio-sink";
            "node.name" = "Microphone-Proxy";
            "node.description" = "Microphone";
            "media.class" = "Audio/Source/Virtual";
            "audio.position" = "FL,FR";
          };
        }
        {
          factory = "adapter";
          args = {
            "factory.name" = "support.null-audio-sink";
            "node.name" = "Main-Output-Proxy";
            "node.description" = "Main Output";
            "media.class" = "Audio/Sink";
            "audio.position" = "FL,FR";
          };
        }
      ];
    };

  };
}
