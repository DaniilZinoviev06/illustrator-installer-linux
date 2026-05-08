#!/bin/bash

source ./scripts/general.sh
source ./scripts/ai_desktop.sh

launcherFunc() {
    show_message_info "Illustrator is starting..."
    notify-send "Illustrator is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$ILLUSTRATOR"
}

installAIFunc() {
    local ARCHIVE="https://twdl.isgood.host/shr/kgwp1zeicspu/illustrator_17.tar.xz"
    local ARCHIVE_NAME="illustrator_17.tar.xz"
    local TAR_SHA256="4716c4266a39ab894425ddd9f0fb510e9cf13474452badd6be85c5ee71e5db5f"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAR_SHA256"

    sleep 5

    cp -r "$SCRIPT_DOWNLOADS/illustrator_17" "$WINE_PREF_PATH/drive_c/Program Files"

    sleep 5

    createDesktopFunc

    sleep 5

    launcherFunc
}
