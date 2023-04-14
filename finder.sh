#!/bin/bash

# Function to search for a file by name
search_by_name() {
  echo "Enter the file name:"
  read file_name

  case $1 in
    1) starting_directory="$HOME" ;;
    2) echo "Enter the directory path:"; read starting_directory ;;
    *) starting_directory="/" ;;
  esac

  find "$starting_directory" -iname "$file_name" 2>/dev/null
}

# Function to search for text inside files
search_inside_files() {
  echo "Enter the text you want to search for:"
  read search_text

  case $1 in
    1) starting_directory="$HOME" ;;
    2) echo "Enter the directory path:"; read starting_directory ;;
    *) starting_directory="/" ;;
  esac

  grep -r -i --exclude-dir={.git,.svn} --files-with-matches "$search_text" "$starting_directory" 2>/dev/null
}

while true; do
  echo "Choose an option:"
  echo "1. Search by file name in the home directory"
  echo "2. Search by file name in a specific directory"
  echo "3. Search by file name in the entire filesystem"
  echo "4. Search for text inside files in the home directory"
  echo "5. Search for text inside files in a specific directory"
  echo "6. Search for text inside files in the entire filesystem"
  echo "0. Exit"

  read -r option

  case $option in
    1|2|3) search_by_name $option ;;
    4|5|6) search_inside_files $((option - 3)) ;;
    0) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option, please try again" ;;
  esac
done
