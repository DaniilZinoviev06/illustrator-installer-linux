#!/bin/bash

source ./scripts/general.sh
source ./scripts/ai_desktop.sh

launcherFunc() {
    show_message_info "Illustrator is starting..."
    notify-send "Illustrator is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$ILLUSTRATOR"
}

installAIFunc() {
    local ARCHIVE=""
    local ARCHIVE_NAME=""
    local TAR_SHA256=""

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAR_SHA256"

    sleep 5

    createDesktopFunc

    sleep 5

    launcherFunc
}
