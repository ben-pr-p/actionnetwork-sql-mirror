#!/bin/bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: $0 <target_dataset_name> <filtered_root_group_id>"
    echo "Example: $0 filtered_data 123"
    exit 1
fi

TARGET_DATASET_NAME="$1"
FILTERED_ROOT_GROUP_ID="$2"
OUTPUT_FILE="filtered-data-${TARGET_DATASET_NAME}-${FILTERED_ROOT_GROUP_ID}.sql"

uv run --with jinja2-cli jinja2 filtered-data.sql \
    -D target_dataset_name="$TARGET_DATASET_NAME" \
    -D filtered_root_group_id="$FILTERED_ROOT_GROUP_ID" \
    > "$OUTPUT_FILE"

echo "Generated $OUTPUT_FILE"
