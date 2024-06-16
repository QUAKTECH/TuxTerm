#!/bin/bash
# Authors of TuxTerm: Aeternusdio.
# The MIT License (MIT)
#
# Copyright (c) 2024 Apache Software Production. (ASP)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# TUXTERM IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
declare -A Versions=(
    [tuxterm]="Version 0.3.0"
    [asp-licence]="Version 2.0.0"
)

# Sources
source ./src/TTLM/LOGMGR.sh
source ./src/Scripts/IPCheck.sh
source ./src/TTLM/.Credentials.sh
source ./src/TuxTermExtrasBin/Add-User.sh
source ./src/Commands.sh
source ./src/TuxTermExtrasBin/Reboot.sh

LOGMGR
if [[ $? -ne 0 ]]; then
    echo "Login failed. Exiting."
    exit 1
fi

currentuser="$username"

check_root() {
    if [ "$currentuser" != "dude1" ]; then
        return 1
    else
        return 0
    fi
}

clear
sleep 1
echo "============="
echo "TUXTERM V1.8"
echo "============="
sleep 0.5
clear

while true
do
    echo -n -e "> "
    read -r Command Argument

    case "$Command" in
        add-user|user-add)
            Add-User
            ;;
        ip-check)
            IPStatusChecker
            ;;
        whoami)
            echo "$WHOAMI"
            ;;
        whereami)
            echo "$WHEREAMI"
            ;;
        date)
            echo "$DATETIME"
            ;;
        tuxterm|asp-licence)
            if [[ "$Argument" == "--version" ]]; then
                echo "${Versions[$Command]}"
            else
                echo "Invalid argument. Use --version to get the version."
            fi
            ;;
        ?)
            echo "help"
            ;;
        reboot)
            Reboot
            ;;
        *)
            echo "Invalid Command"
            ;;
    esac
done