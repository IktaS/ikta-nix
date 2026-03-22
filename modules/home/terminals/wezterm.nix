{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.keys = {
        { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
        { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },

        { key = '+', mods = 'CTRL|SHIFT', action = wezterm.action.IncreaseFontSize },
        { key = '-', mods = 'CTRL|SHIFT', action = wezterm.action.DecreaseFontSize },
        { key = '0', mods = 'CTRL|SHIFT', action = wezterm.action.ResetFontSize },

        { key = 'n', mods = 'ALT', action = wezterm.action.SpawnWindow },

        { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = false } },

        { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
        { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
        { key = 'Tab', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },
        { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = false } },

        { key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
        { key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
        { key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
        { key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3) },
        { key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4) },
        { key = '6', mods = 'ALT', action = wezterm.action.ActivateTab(5) },
        { key = '7', mods = 'ALT', action = wezterm.action.ActivateTab(6) },
        { key = '8', mods = 'ALT', action = wezterm.action.ActivateTab(7) },
        { key = '9', mods = 'ALT', action = wezterm.action.ActivateTab(8) },

        { key = '\\', mods = 'ALT|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '-', mods = 'ALT|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

        { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },

        { key = 'ArrowLeft', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'ArrowDown', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'ArrowUp', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'ArrowRight', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },

        { key = 'z', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },

        { key = '[', mods = 'ALT', action = wezterm.action.MoveTabRelative(-1) },
        { key = ']', mods = 'ALT', action = wezterm.action.MoveTabRelative(1) },

        { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.ReloadConfiguration },
      }

      return config
    '';
  };
}
