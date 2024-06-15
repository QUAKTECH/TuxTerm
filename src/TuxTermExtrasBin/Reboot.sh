#!/bin/bash

Reboot() {

  bar_width=20

  print_bar() {
      local progress=$1
      local num_bar=$(($progress * $bar_width / 100))
      local num_space=$(($bar_width - $num_bar))
      printf "["
      printf "%${num_bar}s" | tr ' ' '#'
      printf "%${num_space}s" | tr ' ' ' '
      printf "] %d%%" $progress
  }

  for ((i=0; i<=100; i+=5)); do
      print_bar $i
      printf "\r"
      sleep 0.1
  done
  echo
  
  while true
  do
    echo -n -e "\n$(pwd)\n"
    echo -n -e "Is BrainTerm reachable from this Directory? (y/n)\n: "
    read ReachCheck
    if [[ "$ReachCheck" == "y" ]]; then
      ./BrainTerm.sh
      break
    elif [[ "$ReachCheck" == "n" ]]; then
      exit 1
      break
    else 
      echo "Invalid Input"
    fi
  done

}