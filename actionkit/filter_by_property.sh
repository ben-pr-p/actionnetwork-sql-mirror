#!/bin/bash
#
# Filter ActionKit tables by a custom user property
#
# Usage:
#   ./filter_by_property.sh <property_name> <property_value> <input_dir> <output_dir>
#
# Example:
#   ./filter_by_property.sh chapter "East Bay" ./data ./filtered_data
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# -lt 4 ]; then
    echo "Usage: $0 <property_name> <property_value> <input_dir> <output_dir>"
    echo ""
    echo "Example:"
    echo "  $0 chapter \"East Bay\" ./data ./filtered_data"
    exit 1
fi

PROPERTY_NAME="$1"
PROPERTY_VALUE="$2"
INPUT_DIR="$3"
OUTPUT_DIR="$4"

echo "=== ActionKit Table Filter ==="
echo "Property: $PROPERTY_NAME = '$PROPERTY_VALUE'"
echo "Input:    $INPUT_DIR"
echo "Output:   $OUTPUT_DIR"
echo ""

python3 "$SCRIPT_DIR/filter_tables.py" "$PROPERTY_NAME" "$PROPERTY_VALUE" "$INPUT_DIR" "$OUTPUT_DIR"
