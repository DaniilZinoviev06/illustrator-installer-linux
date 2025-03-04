#!/bin/bash

source ./scripts/general.sh

wine_setup() {
    show_message_info "Сreate files and directories"

    show_message_info "Сreate Wine prefix in \e[93m$WINE_PREF_PATH\e[0m \e[94mDo not change the location of the generated prefix\e[0m"

    mkdir -p "$WINE_PREF_PATH"

    touch "$WINE_PREF_PATH/winetricks_install.log"

    show_message_info "Select \e[93m'Windows 7'\e[0m in the window that appears"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" winecfg
    if [ $? -eq 0 ]; then
        show_message_ok "Winecfg completed successfully"
    else
        show_message_bad "Winecfg failed"
    fi

    sleep 5
}
