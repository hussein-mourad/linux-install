#!/usr/bin/env bash

set -e
set -o pipefail


# Some useful commands to figure out what to tweak:
# https://askubuntu.com/questions/971067/how-can-i-script-the-settings-made-by-gnome-tweak-tool#971577
# * watch dconf changes being made:
#   'dconf watch /'
# * List gsettings keys:
#   'gsettings list-keys org.gnome....'

# https://stackoverflow.com/questions/41156442/glib-gio-message-using-the-memory-gsettings-backend-happened-in-ubuntu-16-10
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# Gnome Terminal themes
# Avaialable at: http://mayccoll.github.io/Gogh/ (https://github.com/Mayccoll/Gogh)
# After installing or creating the desired terminal themes;
# 1. Retrieve the ID: `dconf dump /org/gnome/terminal/legacy/profiles:/ | awk '/\[:/||/visible-name=/'`
# 2. Set which one to use for Dark and Light mode.
TERMINAL_LIGHT=cbe9eff5-e0d6-4d58-9a68-655f22f54fa6 # Light theme
TERMINAL_DARK=6178d070-33a6-4d4d-beef-25713333e9b8 # Dark theme

# GTK3 Themes
# MacOS 11: https://www.pling.com/p/1220826
# MacOS Sierra: https://www.pling.com/p/1013714
# MacOS Mojave: https://www.pling.com/p/1275087
# MacOS WhiteSur: https://github.com/vinceliuice/WhiteSur-gtk-theme
# For a complete article on the topic: https://itsfoss.com/make-ubuntu-look-like-macos/
# NOTE: Themes should be installed first. i.e.: Copied to ~/.themes
GTK_LIGHT='WhiteSur-light-solid'   # Or  'macOS11-GTK'
GTK_DARK='WhiteSur-dark-solid'     # Or 'Mojave-dark'

# Similar to the above but for the Gnome Shell (i.e.: top desktop bar, ...)
SHELL_LIGHT='WhiteSur-light-solid'
SHELL_DARK='WhiteSur-dark-solid'

say() {
 echo "$@" | sed \
         -e "s/\(\(@\(red\|green\|yellow\|blue\|magenta\|cyan\|white\|reset\|b\|u\)\)\+\)[[]\{2\}\(.*\)[]]\{2\}/\1\4@reset/g" \
         -e "s/@red/$(tput setaf 1)/g" \
         -e "s/@green/$(tput setaf 2)/g" \
         -e "s/@yellow/$(tput setaf 3)/g" \
         -e "s/@blue/$(tput setaf 4)/g" \
         -e "s/@magenta/$(tput setaf 5)/g" \
         -e "s/@cyan/$(tput setaf 6)/g" \
         -e "s/@white/$(tput setaf 7)/g" \
         -e "s/@reset/$(tput sgr0)/g" \
         -e "s/@b/$(tput bold)/g" \
         -e "s/@u/$(tput sgr 0 1)/g"
}

# =============================================
# ================ Gnome Shell ================
set-shell-theme() {
    theme=$1
    say @blue[["Setting SHELL theme to: @b$theme"]]
    # gsettings doesn't have a scheme for this, so we use dconf directly
    dconf write /org/gnome/shell/extensions/user-theme/name "'$theme'"
}

get-shell-theme() {
    echo $(gsettings get org.gnome.shell.extensions.user-theme name)
}

# =============================================
# ================ GTK Theme ==================

set-gtk-theme() {
    theme=$1
    say @blue[["Setting GTK theme to: @b $theme"]]
    gsettings set org.gnome.desktop.interface gtk-theme $theme
}

get-gtk-theme() {
    echo $(gsettings get org.gnome.desktop.interface gtk-theme)
}

# =============================================
# ================ Terminal ===================
set-terminal-profile() {
    theme=$1
    say @blue[["Setting TERMINAL theme to: @b$theme"]]
    gsettings set org.gnome.Terminal.ProfilesList default $theme
}

get-terminal-profile() {
    # dconf dump /org/gnome/terminal/legacy/profiles:/ | awk '/\[:/||/visible-name=/'
    echo $(gsettings get org.gnome.Terminal.ProfilesList default)
}

set-light() {
    set-gtk-theme $GTK_LIGHT
    set-shell-theme $SHELL_LIGHT
    set-terminal-profile $TERMINAL_LIGHT
}

set-dark() {
    set-gtk-theme $GTK_DARK
    set-shell-theme $SHELL_DARK
    set-terminal-profile $TERMINAL_DARK
}

toggle-theme() {
    current_gtk_theme=$(get-gtk-theme)
    say @blue[["Current theme: @b@magenta $current_gtk_theme" ]]

    if [ $current_gtk_theme == "'$GTK_LIGHT'" ];
    then
        say @blue[["Switching to DARK mode:"]]
        set-dark
    else
        say @blue[["Switching to LIGHT mode:"]]
        set-light
    fi
}

# Toggle between Light & Dark
toggle-theme


