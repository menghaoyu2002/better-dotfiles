--
--
-- ▄▄▄       █     █░▓█████   ██████  ▒█████   ███▄ ▄███▓▓█████
-- ▒████▄    ▓█░ █ ░█░▓█   ▀ ▒██    ▒ ▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀
-- ▒██  ▀█▄  ▒█░ █ ░█ ▒███   ░ ▓██▄   ▒██░  ██▒▓██    ▓██░▒███
-- ░██▄▄▄▄██ ░█░ █ ░█ ▒▓█  ▄   ▒   ██▒▒██   ██░▒██    ▒██ ▒▓█  ▄
--  ▓█   ▓██▒░░██▒██▓ ░▒████▒▒██████▒▒░ ████▓▒░▒██▒   ░██▒░▒████▒
--  ▒▒   ▓▒█░░ ▓░▒ ▒  ░░ ▒░ ░▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░
--   ▒   ▒▒ ░  ▒ ░ ░   ░ ░  ░░ ░▒  ░ ░  ░ ▒ ▒░ ░  ░      ░ ░ ░  ░
--   ░   ▒     ░   ░     ░   ░  ░  ░  ░ ░ ░ ▒  ░      ░      ░
--       ░  ░    ░       ░  ░      ░      ░ ░         ░      ░  ░
--
--

local awful = require("awful")
local beautiful = require("beautiful")

require("config.errorhandling")

beautiful.init(awful.util.getdir("config") .. "theme.lua")

-- window decorations (titlebars)
require("decorations")

-- init configs
require("config.wallpaper")
require("config.layout")
require("config.rules")
require("config.tags")
require("config.keys")

-- init daemons
require("evil")
--
-- init widgets
require("widgets.topbar")
require("widgets.popup")
require("widgets.notifications")

require("awful.autofocus")


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    c:struts({
      top    = beautiful.bar_height + beautiful.useless_gap,
      left   = beautiful.useless_gap,
      right  = beautiful.useless_gap,
      bottom = beautiful.useless_gap
    })

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then

        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
   end
end)


-- autorun programs
awful.spawn.with_shell("~/.config/awesome/config/autorun.sh")
