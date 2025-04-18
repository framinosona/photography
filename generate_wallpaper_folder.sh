#!/bin/bash

# Set the source directory (where your gallery is)
SOURCE_DIR="./gallery"

# Set the destination directory for the flat structure
DEST_DIR="../all_photos"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy all image files and prefix with parent folder to avoid conflicts
find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
  # Get parent folder name and file name
  parent_folder=$(basename "$(dirname "$file")")
  base_name=$(basename "$file")
  
  # Build unique name and copy
  cp "$file" "$DEST_DIR/${parent_folder}_${base_name}"
done

echo "✅ All images have been copied to: $DEST_DIR"