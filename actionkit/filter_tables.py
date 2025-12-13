#!/usr/bin/env python3
"""
Render ActionKit filtered SQL views from template.

Usage:
    python filter_tables.py <property_name> <property_value> <target_dataset_name>

Example:
    python filter_tables.py chapter "East Bay" my_project.filtered_actionkit
"""

import argparse
import re
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(
        description="Render ActionKit filtered SQL views from template"
    )
    parser.add_argument("property_name", help="Custom user property name to filter on")
    parser.add_argument("property_value", help="Custom user property value to match")
    parser.add_argument("target_dataset_name", help="Target dataset name for views")
    args = parser.parse_args()

    template_path = Path(__file__).parent / "filtered-data.sql"
    template = template_path.read_text()

    # Simple Jinja-style replacement
    output = template.replace("{{ property_name }}", args.property_name)
    output = output.replace("{{ property_value }}", args.property_value)
    output = output.replace("{{ target_dataset_name }}", args.target_dataset_name)

    print(output)


if __name__ == "__main__":
    main()
