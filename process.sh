#!/bin/sh

# Function to process a directory recursively
process_directory() {
  local dir="docs"
  
  # Find all .md files (except index.md and README.md) in current directory
  find "$dir" -type f -name '*.md' | while read -r file; do
    # sed -i '/]]$/a\\' "$file"
    # base_name=$(basename "$file" .md)
    # dir_path=$(dirname "$file")
    
    # if [[ "$(basename "$dir_path")" == "$base_name" ]]; then
    #   file=$(echo "$file" | cut -c6-)
    #   dir_path=$(echo "$dir_path" | cut -c6-)
    #   obsidian-cli move "$file" "$dir_path/index.md"
    # fi
    echo "DONE $file"
  done
}

process_directory
echo "Done reorganizing markdown files recursively!"

