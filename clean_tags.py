import os
import re

content_directory = 'content'

# Function to clean the tags
def clean_tags(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.readlines()

    # Modify the lines containing tags
    for i, line in enumerate(content):
        if line.startswith('tags:'):
            # Remove '#' from the tags
            content[i] = re.sub(r'#', '', line)

    # Write the cleaned content back to the file
    with open(file_path, 'w', encoding='utf-8') as file:
        file.writelines(content)

# Traverse the content directory to find markdown files
for subdir, _, files in os.walk(content_directory):
    for file in files:
        if file.endswith('.md'):
            clean_tags(os.path.join(subdir, file))

print("Hashes in tag URLs have been successfully removed.")
