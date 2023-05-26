#!/bin/bash

# Get the search keyword from the user
keyword="$1"

# Get the current directory path
currentDir=$(pwd)

# Create an empty array to store all the files in the current directory
files=()

# Create an empty array to store all the directories in the current directory
directories=()

# Create an empty associative array to store the count of occurrences for each file
declare -A occurrences

# Loop through all the files and directories in the current directory
for item in "$currentDir"/*; do
  if [[ -f "$item" ]]; then
    # If the item is a file, add it to the files array
    files+=("$item")
  elif [[ -d "$item" ]]; then
    # If the item is a directory, add it to the directories array
    directories+=("$item")
  fi
done

# Recursive function to get all the files in a directory and its subdirectories
function getFiles() {
  for item in "$1"/*; do
    if [[ -f "$item" ]]; then
      # If the item is a file, add it to the files array
      files+=("$item")
    elif [[ -d "$item" ]]; then
      # If the item is a directory, add it to the directories array
      directories+=("$item")
      # Recursively get all the files in the subdirectory
      getFiles "$item"
    fi
  done
}

# Loop through all the directories in the directories array
for directory in "${directories[@]}"; do
  # Get all the files in each directory and its subdirectories
  getFiles "$directory"
done

# Loop through all the files and check if the search keyword is present in the file
for file in "${files[@]}"; do
  count=$(grep -oi "$keyword" "$file" | wc -l)
  if [[ $count -gt 0 ]]; then
    # If the search keyword is present, store the count of occurrences for that file in the associative array
    occurrences["$file"]=$count
  fi
done

# Output the results in columns with the count, filename, and directory
printf "%-6s %-30s %s\n" "Count" "Filename" "Directory"
printf "%-6s %-30s %s\n" "-----" "--------" "---------"
if [[ ${#occurrences[@]} -eq 0 ]]; then
  printf "No files found containing the search keyword.\n"
else
  for file in "${!occurrences[@]}"; do
    printf "%-6s %-30s %s\n" "${occurrences["$file"]}" "$(basename "$file")" "$(dirname "$file")"
  done
fi
