#!/bin/bash

# Define the content directory
content_directory="content"

# Loop through all markdown files specifically in the news folder
find "$content_directory/news" -type f -name "*.md" | while read -r file; do
    # Use sed to find "url = "?p=<number>" and replace it with "url = "/<number>"
    sed -i.bak 's|url = "?p=$[0-9]*$"|url = "/'"'"'&'"'"'/|' "$file"
done

echo "URLs in $content_directory/news have been successfully updated."
