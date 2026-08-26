---------------------
---- KEYBINDINGS ----
---------------------
local terminal    = "alacritty"
local fileManager = "nautilus"
local menu        = "rofi -show run"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("vivaldi-stable"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 0, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Screenshot region
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"), { locked = true })

-- Color picker
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprpicker -a"), { locked = true })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- # Lock
hl.bind(mainMod .. " + CONTROL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- # Power off
hl.bind(mainMod .. " + CONTROL + SHIFT + P", hl.dsp.exec_cmd("systemctl poweroff"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- # Resize with VIM KEYBINDS
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
  -- Set repeating binds for resizing the active window.
  hl.bind("H", hl.dsp.window.resize({ x = -60, y = 0, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = 60, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -60, relative = true }), { repeating = true })
  hl.bind("L", hl.dsp.window.resize({ x = 60, y = 0, relative = true }), { repeating = true })

  -- Use `reset` to go back to the global submap
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- VIM KEYBINDS
local binds = { h = 'Left', j = 'Down', k = 'Up', l = 'Right' }
for key, direction in pairs(binds) do
  local directionLower = string.lower(direction)

  -- Move windows focus
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = directionLower }))
  -- Move window
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = directionLower }))
  -- ALT + hjkl (vim navigation)
  hl.bind("MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "", key = direction }), { repeating = true })
  -- Mover por palabras (CTRL)
  hl.bind("CTRL + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "CTRL", key = direction }), { repeating = true })
  -- Seleccionar texto (SHIFT)
  hl.bind("SHIFT + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "SHIFT", key = direction }), { repeating = true })
  -- Seleccionar por palabras (CTRL + SHIFT)
  hl.bind("CTRL + SHIFT + MOD5 + " .. key, hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = direction }),
    { repeating = true })
end
