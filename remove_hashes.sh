#!/bin/bash

# Define the content directory
content_directory="content"

# Loop through all markdown files
find "$content_directory" -type f -name "*.md" | while read -r file; do
    # Use sed to remove '#' from the frontmatter
    sed -i.bak 's|url = ".*#|url = "|g' "$file"
done

echo "Hashes in URLs have been successfully removed."
