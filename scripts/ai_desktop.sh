#!/bin/bash

source ./scripts/general.sh

INFO="[Desktop Entry]
Version=1.0
Type=Application
Name=Illustrator CC 17
StartupNotify=true
Comment=Vector graphics editor
Exec=env WINEPREFIX=\"$WINE_PREF_PATH\" wine \"$ILLUSTRATOR\"
Icon=$HOME/.local/share/icons/icon_ai.png
StartupWMClass=illustrator.exe
"

createDesktopFunc() {
    if [ ! -f "$ICON" ]; then
        show_message_bad "\e[93micon_ai.png\e[0m not found..."
    else
        mkdir -p "$HOME/.local/share/icons/"
        cp "$ICON" "$HOME/.local/share/icons/"
    fi

    echo "$INFO" > "$DESKTOP_FILE"

    show_message_info "Desktop file created in \e[93m${HOME}/.local/share/applications/\e[0m..."
}


