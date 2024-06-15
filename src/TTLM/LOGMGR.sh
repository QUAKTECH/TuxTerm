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

    # Check if username exists in the array
    if [[ -z "${users[$username]}" ]]; then
        echo "Invalid username"
        return 1
    else
        encrypted_var="${users[$username]}"
        decrypted_var=$(decrypt_base64 "$encrypted_var")

        echo -n -e "[ Enter your PIN ]\n: "
        read -s password

        # Validate the password
        if [[ "$decrypted_var" == "$password" ]]; then
            echo -e "\nWelcome $username\n"
            return 0
        else
            echo "Invalid PIN"
            return 1
        fi
    fi
}


