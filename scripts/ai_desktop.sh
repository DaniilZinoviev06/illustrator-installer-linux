#!/bin/bash

source ./scripts/general.sh

INFO="[Desktop Entry]
Version=1.0
Type=Application
Name=Illustrator CC 17
StartupNotify=true
Comment=Advanced image editing application
Exec=env WINEPREFIX=\"$WINE_PREF_PATH\" wine \"$ILLUSTRATOR\"
Icon=$HOME/.local/share/icons/icon_ai.png
StartupWMClass=.exe
"

# StartupWMClass: i spotted this from Gictorbit. Thanks to him for this

createDesktopFunc() {
    if [ ! -f "$ICON" ]; then
        show_message_bad "\e[93micon_ai.png\e[0m not found..."
    else
        cp "$ICON" "$HOME/.local/share/icons/"
    fi

    echo "$INFO" > "$DESKTOP_FILE"

    show_message_info "Desktop file created in \e[93m${HOME}/.local/share/applications/\e[0m..."
}


