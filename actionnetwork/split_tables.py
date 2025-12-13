#!/usr/bin/env python3
"""Split an-all-columns.csv into per-table CSV files in an-tables directory."""

import duckdb
from pathlib import Path

# Setup paths
base_dir = Path(__file__).parent
input_file = base_dir / "an-all-columns.csv"
output_dir = base_dir / "an-tables"
output_dir.mkdir(exist_ok=True)

# Connect to DuckDB and read the CSV
con = duckdb.connect()
con.execute(f"CREATE TABLE columns AS SELECT * FROM read_csv_auto('{input_file}')")

# Get all unique table names
tables = con.execute("SELECT DISTINCT table_name FROM columns ORDER BY table_name").fetchall()

print(f"Found {len(tables)} tables")

# Export each table's columns to a separate CSV
for (table_name,) in tables:
    output_file = output_dir / f"{table_name}.csv"
    con.execute(f"""
        COPY (
            SELECT column_name, data_type, is_nullable, ordinal_position
            FROM columns
            WHERE table_name = '{table_name}'
            ORDER BY ordinal_position
        ) TO '{output_file}' (HEADER, DELIMITER ',')
    """)
    print(f"  Created {output_file.name}")

print(f"\nDone! Files written to {output_dir}")
