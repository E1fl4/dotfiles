local pywal = require("colors-hyprland")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = "1.25",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local browser     = "firefox-developer-edition"
local fileManager = "dolphin"
local menu        = "rofi -show drun"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
    hl.exec_cmd("wal -R")
    hl.exec_cmd("swaync")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd(terminal .. " zsh -i -c 'sleep 2 && wp; exec zsh'", { workspace = "10 silent" })
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 3,

        col = {
            active_border   = { colors = {pywal.color4, pywal.color5}, angle = 45 },
            inactive_border = pywal.inactive,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        dim_inactive     = true,
        dim_strength     = 0.2,
        dim_special      = 0.8,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled           = true,
            size              = 4,
            passes            = 2,
            new_optimizations = true,

            noise             = 0.0117,
            contrast          = 0.8916,
            brightness        = 0.8172,
            vibrancy          = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "no",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("Pause",              hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + Q",          hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + T",          hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + MINUS", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + B",          hl.dsp.exec_cmd(browser))
hl.bind("CTRL + ALT + B",     hl.dsp.exec_cmd(browser))
hl.bind("SUPER + C",          hl.dsp.window.close())
hl.bind("ALT + Q",            hl.dsp.window.close())
hl.bind("SUPER + M",          hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + E",          hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V",          hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R",          hl.dsp.exec_cmd(menu))
hl.bind("SUPER + SPACE",      hl.dsp.exec_cmd(menu))
hl.bind("ALT + SPACE",        hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P",          hl.dsp.window.pseudo())
hl.bind("SUPER + X",          hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind("SUPER + Z",          hl.dsp.layout("swapsplit"))      -- dwindle only

hl.bind("SUPER + left",       hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right",      hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",         hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",       hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + H",          hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L",          hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K",          hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J",          hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + 1",          hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2",          hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3",          hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4",          hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5",          hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6",          hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7",          hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8",          hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9",          hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0",          hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + SHIFT + 1",  hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2",  hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3",  hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4",  hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5",  hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6",  hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7",  hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8",  hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9",  hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0",  hl.dsp.window.move({ workspace = 10 }))

-- G1-G9
hl.bind("XF86Tools",          hl.dsp.exec_cmd("~/Scripts/close_windows.sh"))
hl.bind("XF86Launch5",        hl.dsp.exec_cmd("~/Scripts/skip_wallpaper.sh ~/Pictures/Wallpapers"))
-- hl.bind("XF86Launch6",        hl.dsp.exec_cmd("swaync-client -t -sw"))
-- hl.bind("XF86Launch7",        hl.dsp.exec_cmd("swaync-client -t -sw"))
-- hl.bind("XF86Launch8",        hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("XF86Launch9",        hl.dsp.exec_cmd("~/Scripts/terminals.sh"))
hl.bind("F19",                hl.dsp.exec_cmd("~/Scripts/terminals2.sh"))
-- no G8 :(
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("~/Scripts/terminals3.sh"))

-- hl.bind("SUPER + TAB",        function ()
--     hl.dispatch(hl.dsp.focus({ workspace = hl.get_last_workspace() }))
-- end)

hl.bind("SUPER + TAB",         hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
