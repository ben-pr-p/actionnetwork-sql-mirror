#!/bin/bash
#
# Render ActionKit filtered SQL views
#
# Usage:
#   ./filter_by_property.sh <property_name> <property_value> <target_dataset_name>
#
# Example:
#   ./filter_by_property.sh chapter "East Bay" my_project.filtered_actionkit
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# -lt 3 ]; then
    echo "Usage: $0 <property_name> <property_value> <target_dataset_name>"
    echo ""
    echo "Example:"
    echo "  $0 chapter \"East Bay\" my_project.filtered_actionkit"
    exit 1
fi

python3 "$SCRIPT_DIR/filter_tables.py" "$@"
