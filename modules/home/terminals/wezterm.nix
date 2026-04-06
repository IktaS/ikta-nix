{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require("wezterm")

      local config = wezterm.config_builder()

      config.enable_wayland = false

      -- General appearance and visuals
      config.colors = {
        tab_bar = {
          background = "#00141d", -- col_gray1, your main DWM bar background

          active_tab = {
            bg_color = "#80bfff", -- col_gray2 (selected tab in bright blue)
            fg_color = "#00141d", -- contrast text on active tab
          },

          inactive_tab = {
            bg_color = "#1a1a1a", -- col_gray4 (dark background for inactive tabs)
            fg_color = "#FFFFFF", -- col_gray3 (white text on inactive tabs)
          },

          new_tab = {
            bg_color = "#1a1a1a", -- same as inactive
            fg_color = "#4fc3f7", -- col_barbie (for the "+" button)
          },
        },
      }

      config.window_background_opacity = 0.90
      config.color_scheme = "nightfox"
      config.font_size = 12
      config.font = wezterm.font("FiraCode", { weight = "Regular", italic = false })

      config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
      }

      config.use_fancy_tab_bar = true
      config.window_frame = {
        -- font = wezterm.font({ family = "FiraCode Nerd Font Mono", weight = "Regular" }),
        font = wezterm.font({ family = "JetBrainsMono Nerd Font Mono", weight = "Regular" }),
      }

      config.default_cursor_style = "BlinkingUnderline"
      config.cursor_blink_rate = 500
      config.term = "xterm-256color"
      config.max_fps = 144
      config.animation_fps = 30

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

        { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'DownArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'UpArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },

        { key = 'z', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },

        { key = '[', mods = 'ALT', action = wezterm.action.MoveTabRelative(-1) },
        { key = ']', mods = 'ALT', action = wezterm.action.MoveTabRelative(1) },

        { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.ReloadConfiguration },
      }

      return config
    '';
  };
}
