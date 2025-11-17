#!/bin/bash

# Define the content directory
content_directory="content"

# Loop through all markdown files in the content directory
find "$content_directory" -type f -name "*.md" | while read -r file; do
    # Find and replace '#' from the tags in the frontmatter
    sed -i.bak '/^tags:/,/^[^ ]/{s/#//g}' "$file"
done

echo "Hashes in tag URLs have been successfully removed."
