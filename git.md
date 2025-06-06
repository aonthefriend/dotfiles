# ───────────── Hyprland Configuration ─────────────

# ▶ Monitor Setup
monitor=,preferred,auto,1

# ▶ Input Devices
input {
  kb_layout=br
  follow_mouse=1
  touchpad {
    natural_scroll=yes
  }
}

# ▶ General Appearance
general {
  gaps_in=5
  gaps_out=10
  border_size=2
  col.active_border=0xff000000
  col.inactive_border=0xff111111
}

# ▶ Decoration
decoration {
  rounding = 10
  blur {
    enabled = true
    ignore_opacity = true
    size = 3
    passes = 1
  }
}

# ▶ Animations
animations {
  enabled = yes
  bezier = overshot,0.13,0.99,0.29,1.1
  animation = windows,1,7,overshot
  animation = windowsOut,1,7,overshot,slide
  animation = border,1,10,default
  animation = fade,1,10,default
  animation = workspaces,1,6,overshot
}

# ▶ Dwindle Layout
dwindle {
  pseudotile = yes
  preserve_split = yes
}

# ▶ Gestures
gestures {
  workspace_swipe = yes
}

# ▶ Keybindings
$mod = SUPER

bind = $mod, RETURN, exec, kitty
bind = $mod, Q, killactive
bind = $mod, M, exit
bind = $mod, E, exec, thunar
bind = $mod, V, togglefloating
bind = $mod, D, exec, wofi --show drun
bind = $mod, P, pseudo
bind = $mod, J, togglesplit
bind = $mod, F, fullscreen
bind = $mod SHIFT, S, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/screenshot-$(date +'%Y%m%d-%H%M%S').png

# ▶ Workspace Bindings
bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod SHIFT, 1, movetoworkspace, 1
bind = $mod SHIFT, 2, movetoworkspace, 2
bind = $mod SHIFT, 3, movetoworkspace, 3
bind = $mod SHIFT, 4, movetoworkspace, 4
bind = $mod SHIFT, 5, movetoworkspace, 5

# ▶ Mouse Bindings
bindm = $mod, mouse:272, movewindow
bindm = $mod, mouse:273, resizewindow

# ▶ Window Rules
windowrulev2 = float, class:^(pavucontrol)$
windowrulev2 = float, class:^(nm-connection-editor)$

# ▶ Environment Variables
environment = XCURSOR_SIZE,24

# ▶ Exec on Startup
exec-once = hyprctl setcursor Bibata-Modern-Ice 24

# ▶ Autostart Waybar
exec-once = waybar

# ▶ Autostart Hyprpaper
exec-once = hyprpaper

# ▶ Misc
misc {
  disable_hyprland_logo = true
  disable_splash_rendering = true
}

# ----------------------------------------------------

# Kitty basic configuration

# ▶ Fonte
font_family      FiraCode Nerd Font
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        10.5
adjust_line_height 0
adjust_column_width 0

# ▶ Cores de fundo e texto
foreground             #c0caf5
background             #000000
selection_foreground   #000000
selection_background   #c0caf5

# ▶ Cursor
cursor                 #f38ba8
cursor_shape           block

# ▶ Transparência (usado com compositors como picom ou blur no Hyprland)
background_opacity     0.75
# Para blur no Hyprland, adicione no hyprland.conf:
#   blur { enabled = true }

# ▶ Padding interno
padding_width          8

# ▶ Rolagem
scrollback_lines       10000
enable_scroll_bar      no
wheel_scroll_multiplier 5.0
touch_scroll_multiplier 3.0

# ▶ Títulos e bordas
hide_window_decorations yes
window_border_width    0
active_border_color    #000000
inactive_border_color  #000000
bell_border_color      #000000
focus_follows_mouse    no

# ▶ Atalhos (exemplo: copiar e colar)
map ctrl+c copy_to_clipboard
map ctrl+v paste_from_clipboard

# ▶ Outras opções úteis
tab_bar_edge           top
tab_bar_style          powerline
tab_powerline_style    angled
allow_hyperlinks       yes
enable_audio_bell      no
visual_bell            no
open_url_with          default

# ▶ Regras de janela específicas
windowrulev2 center, class:^(kitty)$
