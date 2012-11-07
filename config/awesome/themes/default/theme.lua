---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#222222"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#cccccc"
theme.fg_urgent     = "#ff0000"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
--
home = os.getenv("HOME")
theme.theme_dir = awful.util.getdir("config") .. "/themes/default"
theme.icons_dir = theme.theme_dir .. "/icons"

-- Display the taglist squares
theme.taglist_squares_sel   =   theme.icons_dir .. "/taglist.square_sel.png"
theme.taglist_squares_unsel =   theme.icons_dir .. "/taglist.square_unsel.png"
theme.tasklist_floating_icon =  theme.icons_dir .. "/tasklist.floating.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.icons_dir .. "/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"


-- You can use your own command to set your wallpaper
wallpaper = home .. "/.wallpapers"
theme.wallpaper_cmd = { "awsetbg -R " .. wallpaper  }

-- You can use your own layout icons like this:
theme.layout_tile =         theme.icons_dir .. "/layout.tile.png"
theme.layout_tilebottom =   theme.icons_dir .. "/layout.tilebottom.png"
theme.layout_max =          theme.icons_dir .. "/layout.max.png"
theme.layout_fullscreen =   theme.icons_dir .. "/layout.fullscreen.png"

theme.awesome_icon = theme.icons_dir .. "/awesome-icon.png"

return theme
