------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

local function is_hdmi_connected()
  local f = io.open("/sys/class/drm/card0-HDMI-A-1/status", "r")
  if f then
    local status = f:read("*l")
    f:close()
    return status == "connected"
  end
  return false
end

if is_hdmi_connected() then
  hl.monitor({ output = "eDP-1", disabled = true })
else
  hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1.2 })
end
