#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
IMAGE_NAME="team22-demo-gui:0.1.0"
CONTAINER_NAME="team22-demo-gui"

if ! docker image inspect "$IMAGE_NAME" > /dev/null 2>&1; then
    echo "Building Docker image..."
    docker build --platform linux/amd64 -t "$IMAGE_NAME" "$ROOT_DIR"
fi

docker rm -f "$CONTAINER_NAME" > /dev/null 2>&1 || true

echo "Starting Team 22 demo..."
echo "Open http://localhost:6080/vnc.html?autoconnect=true&resize=scale in your browser"

MSYS_NO_PATHCONV=1 docker run -it --rm \
    --platform linux/amd64 \
    -p 6080:6080 \
    -v "$ROOT_DIR":/workspace \
    --name "$CONTAINER_NAME" \
    "$IMAGE_NAME"
