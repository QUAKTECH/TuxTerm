#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

# Function to encrypt using Base64
encrypt_base64() {
    local plain_text="$1"
    local encrypted_text=$(echo -n "$plain_text" | base64)
    echo "$encrypted_text"
}

# Function to decrypt using Base64
decrypt_base64() {
    local encrypted_text="$1"
    local decrypted_text=$(echo -n "$encrypted_text" | base64 --decode)
    echo "$decrypted_text"
}

Add-User() {
    if check_root; then
        echo -n -e "[ Enter new user username ]\n: "
        read newusername
        echo -n -e "[ Enter new user PIN/Password ]\n: "
        read -s newpassword  
        echo
    
        # Encrypt the new password
        encrypted_var=$(encrypt_base64 "$newpassword")
    
        # Include source ./idk.sh if needed for decryption (not clear from the provided context)
        # source ./idk.sh "$encrypted_var"
    
        newuser="\t[$newusername]=\"$encrypted_var\""
    
        # Update Credentials.sh with the new user and encrypted password
        if sed -i $'/^)/i\\\n'"$newuser" src/TTLM/.Credentials.sh; then
            echo "User $newusername added to Credentials.sh"
        else
            echo -n -e "\n${RED}[ ERROR : S(U*S)0001 ] : Failed to add user $newusername to Credentials.sh (See README.md for for info on Errors.)${NC}\n"
        fi
    else 
        echo -n -e "\n${RED}[ ERROR : P(U)0002 ] : You need to be Root user to use this. (See README.md for for info on Errors.)${NC}\n"
    fi
}   

