#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

IPStatusChecker() {
  if check_root; then
    clear
    echo "========================"
    echo "TUXTERM STATUS CHECKER"
    echo "========================"
    sleep 1
    clear
    echo -n -e "[ Enter the IP you want to check ]\n: "
    read target

    while true
    do
      if ping -q -c 2 -w 1 $target > /dev/null; then
        echo "$target is up"
        break
      else 
        echo "$target is down."
      fi
    sleep 2
    done
  else 
    echo -n -e "\n${RED}[ ERROR : P(U)0002 ] : You need to be Root user to use this. (See README.md for for info on Errors.)${NC}\n"
  fi
}