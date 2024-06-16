#!/bin/bash

decrypt_base64() {
    local encrypted_text="$1"
    local decrypted_text=$(echo -n "$encrypted_text" | base64 --decode)
    echo "$decrypted_text"
}

LOGMGR() {
    source ./src/TTLM/.Credentials.sh

    echo -n -e "[ Enter your username ]\n: "
    read username

    if [[ -z "${users[$username]}" ]]; then
        echo "Invalid username"
        return 1
    else
        encrypted_var="${users[$username]}"
        decrypted_var=$(decrypt_base64 "$encrypted_var")

        echo -n -e "[ Enter your PIN ]\n: "
        read -s password

        if [[ "$decrypted_var" == "$password" ]]; then
            echo -e "\nWelcome $username\n"
            return 0
        else
            echo "Invalid PIN"
            return 1
        fi
    fi
}

if [[ "$1" != "login" ]]; then
    echo "Usage: $0 login"
    exit 1
fi

if [[ $? -ne 0 ]]; then
    echo "Login failed. Exiting."
    exit 1
fi
