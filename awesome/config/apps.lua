local apps = {
    terminal = "kitty -1", 
    launcher = "sh /home/parndt/.config/rofi/launch.sh", 
    switcher = require("widgets.alt-tab"), 
    xrandr = "lxrandr", 
    screenshot = "scrot -e 'echo $f'", 
    volume = "pavucontrol", 
    appearance = "lxappearance", 
    browser = "firefox", 
    fileexplorer = "thunar",
    musicplayer = "pragha", 
    settings = "code /home/myu/awesome/"
}

user = {
    terminal = "kitty -1",
    floating_terminal = "kitty -1" }

return apps
