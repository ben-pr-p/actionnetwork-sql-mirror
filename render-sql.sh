#!/bin/bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: $0 <target_dataset_name> <filtered_network_id>"
    echo "Example: $0 filtered_data 123"
    exit 1
fi

TARGET_DATASET_NAME="$1"
FILTERED_NETWORK_ID="$2"
OUTPUT_FILE="filtered-data-${TARGET_DATASET_NAME}-${FILTERED_NETWORK_ID}.sql"

uv run --with jinja2-cli jinja2 filtered-data.sql \
    -D target_dataset_name="$TARGET_DATASET_NAME" \
    -D filtered_network_id="$FILTERED_NETWORK_ID" \
    > "$OUTPUT_FILE"

echo "Generated $OUTPUT_FILE"
