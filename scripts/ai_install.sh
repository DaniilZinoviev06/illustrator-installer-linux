#!/bin/bash

source ./scripts/general.sh
source ./scripts/ai_desktop.sh

launcherFunc() {
    show_message_info "Illustrator is starting..."
    notify-send "Illustrator is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$ILLUSTRATOR"
}

installAIFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/illustrator_17.tar.xz"
    local ARCHIVE_NAME="illustrator_17.tar.xz"
    local TAR_SHA256="587406c49478f87f60ede4492d8cd6a5a9a1714d75e995932db6d685eec62b3a"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAR_SHA256"

    sleep 5

    cp -r "$SCRIPT_DOWNLOADS/illustrator_17" "$WINE_PREF_PATH/drive_c/Program Files"

    sleep 5

    createDesktopFunc

    sleep 5

    launcherFunc
}
