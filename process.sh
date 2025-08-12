#!/bin/sh

rm -rf docs
cp -r ../backup/docs .


# Function to process a directory recursively
process_directory() {
  local dir="$1"
  
  # Find all .md files (except index.md and README.md) in current directory
  find "$dir" -maxdepth 1 -type f -name '*.md' ! -name 'index.md' ! -name 'README.md' | while read -r file; do
    # Get filename without path and extension (e.g., "XXX" from "docs/YYY/XXX.md")
    base_name=$(basename "$file" .md)
    dir_path=$(dirname "$file")
    
    # Skip if this is already in its own directory (avoid docs/XXX/XXX.md -> docs/XXX/XXX/index.md)
    if [[ "$(basename "$dir_path")" == "$base_name" ]]; then
      continue
    fi
    
    # Create target directory
    target_dir="$dir_path/$base_name"
    mkdir -p "$target_dir"
    
    # Move the file
    mv "$file" "$target_dir/index.md"
    echo "Moved $file to $target_dir/index.md"
  done
  
  # Recurse into subdirectories
  find "$dir" -mindepth 1 -type d | while read -r subdir; do
    process_directory "$subdir"
  done
}

# Start processing from docs/
process_directory "docs"

echo "Done reorganizing markdown files recursively!"
