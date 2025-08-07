#!/bin/bash

# Set the source directory (where your gallery is)
SOURCE_DIR="./gallery"

# Set the destination directory for the flat structure
DEST_DIR="../all_photos"

# Create the destination directory if it doesn't exist
if [ -d "$DEST_DIR" ]; then
  echo "⚠️  Destination directory already exists. Please remove it before running the script."
  exit 1
fi
# Create the destination directory
echo "📂 Creating destination directory..."
mkdir -p "$DEST_DIR"

# Create a temporary file to store hashes of copied files
HASH_FILE=$(mktemp)
trap "rm -f $HASH_FILE" EXIT

# Counters for statistics
copied_count=0
skipped_count=0

echo "🔍 Processing images and checking for duplicates..."

# Create a temporary file to store the list of files
FILES_LIST=$(mktemp)
trap "rm -f $HASH_FILE $FILES_LIST" EXIT

# Find all image files and store them in a temporary file
find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) > "$FILES_LIST"

# Process each file
while IFS= read -r file; do
  # Skip empty lines
  [ -z "$file" ] && continue

  # Calculate hash of the file
  file_hash=$(shasum -a 256 "$file" | cut -d' ' -f1)

  # Check if hash already exists
  if grep -q "^$file_hash$" "$HASH_FILE" 2>/dev/null; then
    echo "⚠️  Skipping duplicate: $file (same content as previously copied file)"
    ((skipped_count++))
  else
    # Get parent folder name and file name
    parent_folder=$(basename "$(dirname "$file")")
    base_name=$(basename "$file")

    # Build unique name and copy
    dest_file="$DEST_DIR/${parent_folder}_${base_name}"
    cp "$file" "$dest_file"

    # Store the hash
    echo "$file_hash" >> "$HASH_FILE"
    ((copied_count++))

    echo "✅ Copied: $file -> $(basename "$dest_file")"
  fi
done < "$FILES_LIST"

echo ""
echo "📊 Summary:"
echo "   • Files copied: $copied_count"
echo "   • Duplicates skipped: $skipped_count"
echo "✅ All unique images have been copied to: $DEST_DIR"
