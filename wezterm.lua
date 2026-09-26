local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'flexoki-dark'

config.keys = {
  -- Pane navigation: Cmd+Arrow
  { key = 'LeftArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Down' },

  -- Vertical split (side-by-side panes): Cmd+Alt+ ('+' is Shift+'=' on US layouts,
  -- so bind both forms)
  { key = '+', mods = 'CMD|ALT|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '=', mods = 'CMD|ALT',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  -- Horizontal split (stacked panes): Cmd+Alt-
  { key = '-', mods = 'CMD|ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- Rename current tab: Cmd+R (replaces the default reload-config binding;
  -- Ctrl+Shift+R still reloads)
  {
    key = 'r',
    mods = 'CMD',
    action = act.PromptInputLine {
      description = 'Rename tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line is nil if the prompt was cancelled with Escape
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

return config
