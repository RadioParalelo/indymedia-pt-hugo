#!/bin/bash

# Navigate to the public directory
cd public || { echo "Public directory not found."; exit 1; }

# Loop through directories with '?' or '#' in their names
for dir in *\?* *\#*; do
    # Check if the directory exists
    if [[ -d "$dir" ]]; then
        # Replace '?' with '_' and '#' with ''
        new_dir="${dir//\?/}"    # You can change this to '_' or any other character
        new_dir="${new_dir//\#/}"

        # Rename the directory
        mv "$dir" "$new_dir"

        echo "Renamed '$dir' to '$new_dir'"
    fi
done
