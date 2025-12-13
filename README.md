# SQL Mirrors

Utilities for creating filtered datasets from TMC's cleaned Action Network and ActionKit tables.

## ActionKit

```bash
# Split schema CSV into per-table files
cd actionkit && python split_tables.py

# Generate filtered SQL views by custom user property
./filter_by_property.sh <property_name> <property_value> <target_dataset> > output.sql
./filter_by_property.sh chapter "East Bay" proj.ak_filtered > output.sql
```

## Action Network

```bash
# Split schema CSV into per-table files
cd actionnetwork && python split_tables.py
```
