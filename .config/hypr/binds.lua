---------------------
---- KEYBINDINGS ----
---------------------
local terminal    = "alacritty"
local fileManager = "nautilus"
local menu        = "rofi -show run"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal), {
  description = "Open terminal",
})
hl.bind(mainMod .. " + C", hl.dsp.window.close(), {
  description = "Close window",
})
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"), {
    description = "Exit Hyprland",
  })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager), {
  description = "Open file manager",
})
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"), {
  description = "Open Discord",
})
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("vivaldi-stable"), {
  description = "Open Vivaldi",
})
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }, {
  description = "Toggle window floating",
}))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(menu), {
  description = "Open application menu launcher",
})
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only


for i = 0, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i },
    {
      description = "Switch to workspace " .. i,
    }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i },
    {
      description = "Move window to workspace " .. i,
    }))
end

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"), {
  locked = true,
  description = "Take a screenshot of a region"
})

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprpicker -a"), {
  locked = true,
  description = "Pick a color from the screen"
})

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" },
  {
    description = "Switch to next workspace",
  }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" },
  {
    description = "Switch to previous workspace",
  }))

hl.bind(mainMod .. " + CONTROL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"), {
  description = "Lock the screen",
})

hl.bind(mainMod .. " + CONTROL + SHIFT + P", hl.dsp.exec_cmd("systemctl poweroff"), {
  description = "Power off the system",
})

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }, {
  description = "Move window with mouse",
})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }, {
  description = "Resize window with mouse",
})

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  {
    locked = true,
    repeating = true,
    description = "Increase volume"
  })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  {
    locked = true,
    repeating = true,
    description = "Decrease volume"
  })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  {
    locked = true,
    repeating = true,
    description = "Mute/unmute volume"
  })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  {
    locked = true,
    repeating = true,
    description = "Mute/unmute microphone"
  })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
  locked = true,
  repeating = true,
  description = "Increase brightness"
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
  locked = true,
  repeating = true,
  description = "Decrease brightness"
})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
  locked = true,
  description = "Next track"
})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
  description = "Play/Pause track"
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
  description = "Play/Pause track"
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
  locked = true,
  description = "Previous track"
})

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), {
  description = "Enter resize mode (use HJKL to resize, ESC to exit)",
})
hl.define_submap("resize", function()
  hl.bind("H", hl.dsp.window.resize({ x = -60, y = 0, relative = true }),
    {
      repeating = true,
      description = "Resize window left"
    })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 60, relative = true }),
    {
      repeating = true,
      description = "Resize window down"
    })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -60, relative = true }),
    {
      repeating = true,
      description = "Resize window up"
    })
  hl.bind("L", hl.dsp.window.resize({ x = 60, y = 0, relative = true }),
    {
      repeating = true,
      description = "Resize window right"
    })

  -- Use `reset` to go back to the global submap
  hl.bind("escape", hl.dsp.submap("reset"), { description = "Exit resize mode" })
end)

-- VIM KEYBINDS
local binds = { h = 'Left', j = 'Down', k = 'Up', l = 'Right' }
for key, direction in pairs(binds) do
  local directionLower = string.lower(direction)

  -- Move windows focus
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = directionLower }, {
    description = "Move focus " .. directionLower,
  }))
  -- Move window
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = directionLower }, {
    description = "Move window " .. directionLower,
  }))
  -- ALT + hjkl (vim navigation)
  hl.bind("MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "", key = direction }), {
    repeating = true,
    description = "Move cursor " .. directionLower,
  })
  -- Mover por palabras (CTRL)
  hl.bind("CTRL + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "CTRL", key = direction }),
    {
      repeating = true,
      description = "Move cursor by word " .. directionLower
    })
  -- Seleccionar texto (SHIFT)
  hl.bind("SHIFT + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "SHIFT", key = direction }),
    {
      repeating = true,
      description = "Select text " .. directionLower
    })
  -- Seleccionar por palabras (CTRL + SHIFT)
  hl.bind("CTRL + SHIFT + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = direction }),
    {
      repeating = true,
      description = "Select text by word " .. directionLower
    })
end


-- Unifico binds de nvim con vivaldi
function vivaldiBinds(keys, send_shortcut_keys, default_send_shortcut_keys, description)
  hl.bind(keys,
    hl.dsp.exec_cmd([[
    if hyprctl activewindow | grep -qi "vivaldi"; then
      hyprctl dispatch 'hl.dsp.send_shortcut(]] .. send_shortcut_keys .. [[)'
    else
      hyprctl dispatch 'hl.dsp.send_shortcut(]] .. default_send_shortcut_keys .. [[)'
    fi
  ]]), {
      description = description,
    })
end

local vivaldi_shortcuts = {
  {
    key = "ALT + comma",
    vivaldi = '{ mods = "CTRL SHIFT", key = "Tab" }',
    default = '{ mods = "ALT", key = "comma" }',
    description = "Switch to previous tab in Vivaldi"
  },
  {
    key = "ALT + period",
    vivaldi = '{ mods = "CTRL", key = "Tab" }',
    default = '{ mods = "ALT", key = "period" }',
    description = "Switch to next tab in Vivaldi"
  },
  {
    key = "ALT + c",
    vivaldi = '{ mods = "CTRL", key = "w" }',
    default = '{ mods = "ALT", key = "c" }',
    description = "Close tab in Vivaldi"
  },
  {
    key = "SHIFT + comma",
    vivaldi = '{ mods = "CTRL SHIFT", key = "Prior" }',
    default = '{ mods = "SHIFT", key = "comma" }',
    description = "Move tab right in Vivaldi"
  },
  {
    key = "SHIFT + period",
    vivaldi = '{ mods = "CTRL SHIFT", key = "Next" }',
    default = '{ mods = "SHIFT", key = "period" }',
    description = "Move tab left in Vivaldi"
  },
}
for _, b in ipairs(vivaldi_shortcuts) do
  vivaldiBinds(b.key, b.vivaldi, b.default, b.description)
end
