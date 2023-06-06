--[[
    
Copyright (c) 2020 mut-ex <https://github.com/mut-ex>

The following code is a derivative work of the code from the awesome-wm-nice project 
(https://github.com/mut-ex/awesome-wm-nice/), which is licensed MIT. This code therefore 
is also licensed under the terms of the MIT License

]]--

local awful = require("awful")
local wibox = require("wibox")

local shapes = require("lib.shapes")

local set_left_titlebar = function(c, left_border_img, client_color)
    awful.titlebar(c, {
        position = "left",
        size = 2,
        bg = client_color,
        widget = wibox.container.background,
    }):setup{
        bgimage = left_border_img,
        widget = wibox.container.background,
    }
end

local left = function(c, args)
    -- The left side border
    local left_border_img = shapes.create_edge_left {
        client_color = args.client_color,
        height = c.screen.geometry.height,
        stroke_offset_outer = 0.5,
        stroke_width_outer = 1,
        stroke_color_outer = args.stroke_color_outer_sides,
        stroke_offset_inner = 1.5,
        stroke_width_inner = 1.5,
        inner_stroke_color = args.stroke_color_inner_sides,
    }

    set_left_titlebar(c, left_border_img, args.client_color)
end

return left
