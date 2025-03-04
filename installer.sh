#!/bin/bash

source ./scripts/check_dep.sh
source ./scripts/conf_wine.sh
source ./scripts/ai_install.sh
source ./scripts/uninstaller.sh


source ./scripts/general.sh

main() {

    while true; do

        echo -e "  _____ _      _     _    _  _____ _______ _____         _______ ____  _____"
        echo -e " |_   _| |    | |   | |  | |/ ____|__   __|  __ \     /\|__   __/ __ \|  __ \ "
        echo -e "   | | | |    | |   | |  | | (___    | |  | |__) |   /  \  | | | |  | | |__) | "
        echo -e "   | | | |    | |   | |  | |\___ \   | |  |  _  /   / /\ \ | | | |  | |  _  / "
        echo -e "  _| |_| |____| |___| |__| |____) |  | |  | | \ \  / ____ \| | | |__| | | \ \ "
        echo -e " |_____|______|______\____/|_____/   |_|  |_|  \_\/_/    \_\_|  \____/|_|  \_\ "



        echo -e "\n \e[91m!\e[0m \e[92mMake sure you have the following dependencies installed:\e[0m"
        echo -e " \e[34m-\e[0m \e[93m wine \e[0m"
        echo -e " \e[34m-\e[0m \e[93m curl \e[0m"

        echo -e "\n \e[91m!\e[0m \e[92mDo not change the location of the generated prefix\e[0m"

        echo -e "\n\e[97m-------------------------------------------------------\e[0m"

        echo -e "\n\e[34m|\e[0m \e[92m1 - Install Illustrator\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m2 - Info\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m3 - Launch Illustrator\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m4 - Configure Wine prefix\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m5 - Delete Illustrator\e[0m\n"

        read -p "Enter: " choice

        case $choice in
            1)
                ver_req

                sleep 5

                wine_setup

                sleep 5

                installAIFunc
            ;;

            2)
                while true; do
                    clear
                    echo -e "Author: "

                    echo -e "\n\e[34m|\e[0m 1 - Back\n"
                    read -p "Enter: " choice

                    case $choice in
                        1)
                            clear
                            break
                        ;;

                        *)
                            clear
                            echo -e "\n-------------------------"
                            echo "Bad enter..."
                            echo "-------------------------"
                        ;;
                    esac

                done
            ;;

            3)
                if [ -f "$ILLUSTRATOR" ]; then
                    clear
                    launcherFunc > /dev/null 2>&1
                else
                    clear
                    show_message_bad "First install Illustrator"
                fi
            ;;

            4)
                if [ -d "$WINE_PREF_PATH" ]; then
                    clear
                    WINEPREFIX="$WINE_PREF_PATH" winecfg
                else
                    clear
                    show_message_bad "First install Illustrator"
                fi
            ;;

            5)
                clear
                uninstallFunc
            ;;

            *)
                clear
                echo -e "\n-------------------------"
                echo "Bad enter..."
                echo "-------------------------"
            ;;

        esac

    done
}

main
