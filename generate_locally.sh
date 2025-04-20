#!/bin/bash

set -e

# Define paths
CONFIG_FILE="config.json"
OUTPUT_DIR="build_output"

echo "📸 Building Thumbsup Gallery Locally"

# Pull Docker image if missing
if ! docker image inspect thumbsupgallery/thumbsup > /dev/null 2>&1; then
  echo "🛠 Pulling Thumbsup Docker image..."
  docker pull thumbsupgallery/thumbsup
fi

# Run Thumbsup with Docker
docker run --rm \
  -v "$(pwd):/work" \
  thumbsupgallery/thumbsup \
  /bin/sh -c "cd /work && thumbsup --config $CONFIG_FILE"

echo "✅ Gallery generated in: $OUTPUT_DIR"