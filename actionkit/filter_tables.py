#!/usr/bin/env python3
"""
Filter ActionKit tables based on a custom user property.

Usage:
    python filter_tables.py <property_name> <property_value> <input_dir> <output_dir>

Example:
    python filter_tables.py chapter "East Bay" ./data ./filtered_data
"""

import argparse
import duckdb
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(
        description="Filter ActionKit tables by custom user property"
    )
    parser.add_argument("property_name", help="Custom user property name to filter on")
    parser.add_argument("property_value", help="Custom user property value to match")
    parser.add_argument("input_dir", help="Directory containing input parquet/csv files")
    parser.add_argument("output_dir", help="Directory to write filtered output files")
    args = parser.parse_args()

    input_dir = Path(args.input_dir)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    con = duckdb.connect()

    # Helper to load a table from parquet or csv
    def load_table(name):
        parquet_path = input_dir / f"{name}.parquet"
        csv_path = input_dir / f"{name}.csv"
        if parquet_path.exists():
            con.execute(f"CREATE TABLE {name} AS SELECT * FROM read_parquet('{parquet_path}')")
            return True
        elif csv_path.exists():
            con.execute(f"CREATE TABLE {name} AS SELECT * FROM read_csv_auto('{csv_path}')")
            return True
        return False

    # Helper to export a table
    def export_table(name, query=None):
        if query is None:
            query = f"SELECT * FROM {name}"
        output_path = output_dir / f"{name}.parquet"
        con.execute(f"COPY ({query}) TO '{output_path}' (FORMAT PARQUET)")
        count = con.execute(f"SELECT COUNT(*) FROM ({query})").fetchone()[0]
        print(f"  {name}: {count} rows")

    print(f"Filtering by {args.property_name} = '{args.property_value}'")
    print(f"Input: {input_dir}")
    print(f"Output: {output_dir}")
    print()

    # =========================================================================
    # STEP 1: Load core tables needed for filtering
    # =========================================================================
    print("Loading core tables...")

    required_tables = ["cln_actionkit__core_user", "cln_actionkit__core_userfield"]
    for table in required_tables:
        if not load_table(table):
            print(f"ERROR: Required table {table} not found in {input_dir}")
            return 1

    # =========================================================================
    # STEP 2: Create filtered_users table based on custom property
    # =========================================================================
    print(f"\nCreating filtered_users table...")

    con.execute(f"""
        CREATE TABLE filtered_users AS
        SELECT DISTINCT u.user_id
        FROM cln_actionkit__core_user u
        INNER JOIN cln_actionkit__core_userfield uf ON u.user_id = uf.parent_id
        WHERE uf.name = '{args.property_name}'
          AND uf.value = '{args.property_value}'
    """)

    user_count = con.execute("SELECT COUNT(*) FROM filtered_users").fetchone()[0]
    print(f"  Found {user_count} users with {args.property_name} = '{args.property_value}'")

    if user_count == 0:
        print("WARNING: No users found matching criteria. Output will be empty.")

    # =========================================================================
    # STEP 3: Export filtered tables
    # =========================================================================
    print("\nExporting filtered tables...")

    # --- Tables with direct user_id ---

    # core_user - the main users table
    export_table("cln_actionkit__core_user", """
        SELECT u.* FROM cln_actionkit__core_user u
        INNER JOIN filtered_users fu ON u.user_id = fu.user_id
    """)

    # core_userfield - custom fields (parent_id -> user_id)
    export_table("cln_actionkit__core_userfield", """
        SELECT uf.* FROM cln_actionkit__core_userfield uf
        INNER JOIN filtered_users fu ON uf.parent_id = fu.user_id
    """)

    # Tables with direct user_id column
    direct_user_tables = [
        "cln_actionkit__core_usergeofield",
        "cln_actionkit__core_bounce_soft",
        "cln_actionkit__core_click",
        "cln_actionkit__core_open",
        "cln_actionkit__core_location",
        "cln_actionkit__core_order",
        "cln_actionkit__core_orderrecurring",
        "cln_actionkit__core_phone",
        "cln_actionkit__core_subscription",
        "cln_actionkit__core_subscriptionhistory",
        "cln_actionkit__core_usermailing",
        "cln_actionkit__share_link",
    ]

    for table in direct_user_tables:
        if load_table(table):
            export_table(table, f"""
                SELECT t.* FROM {table} t
                INNER JOIN filtered_users fu ON t.user_id = fu.user_id
            """)

    # core_user_page_tags - uses user_id (no id column)
    if load_table("cln_actionkit__core_user_page_tags"):
        export_table("cln_actionkit__core_user_page_tags", """
            SELECT t.* FROM cln_actionkit__core_user_page_tags t
            INNER JOIN filtered_users fu ON t.user_id = fu.user_id
        """)

    # --- Tables linked through action ---

    # First, load and filter core_action
    if load_table("cln_actionkit__core_action"):
        # Create filtered_actions table for downstream joins
        con.execute("""
            CREATE TABLE filtered_actions AS
            SELECT a.id as action_id
            FROM cln_actionkit__core_action a
            INNER JOIN filtered_users fu ON a.user_id = fu.user_id
        """)

        export_table("cln_actionkit__core_action", """
            SELECT a.* FROM cln_actionkit__core_action a
            INNER JOIN filtered_users fu ON a.user_id = fu.user_id
        """)

        # core_actionfield - parent_id -> action_id
        if load_table("cln_actionkit__core_actionfield"):
            export_table("cln_actionkit__core_actionfield", """
                SELECT af.* FROM cln_actionkit__core_actionfield af
                INNER JOIN filtered_actions fa ON af.parent_id = fa.action_id
            """)

        # Action subtype tables (action_ptr_id -> action_id)
        action_subtypes = [
            "cln_actionkit__core_donationaction",
            "cln_actionkit__core_letteraction",
            "cln_actionkit__core_lteaction",
            "cln_actionkit__core_petitionaction",
            "cln_actionkit__core_signupaction",
            "cln_actionkit__core_surveyaction",
            "cln_actionkit__core_unsubscribeaction",
        ]

        for table in action_subtypes:
            if load_table(table):
                export_table(table, f"""
                    SELECT t.* FROM {table} t
                    INNER JOIN filtered_actions fa ON t.action_ptr_id = fa.action_id
                """)

        # Tables with action_id column
        if load_table("cln_actionkit__core_cwcdeliverylog"):
            export_table("cln_actionkit__core_cwcdeliverylog", """
                SELECT t.* FROM cln_actionkit__core_cwcdeliverylog t
                INNER JOIN filtered_actions fa ON t.action_id = fa.action_id
            """)

        if load_table("cln_actionkit__share_action"):
            export_table("cln_actionkit__share_action", """
                SELECT t.* FROM cln_actionkit__share_action t
                INNER JOIN filtered_actions fa ON t.action_id = fa.action_id
            """)

    # --- Tables linked through order ---

    if load_table("cln_actionkit__core_order"):
        # Create filtered_orders table
        con.execute("""
            CREATE TABLE filtered_orders AS
            SELECT o.id as order_id
            FROM cln_actionkit__core_order o
            INNER JOIN filtered_users fu ON o.user_id = fu.user_id
        """)

        # core_order_detail - order_id -> order
        if load_table("cln_actionkit__core_order_detail"):
            export_table("cln_actionkit__core_order_detail", """
                SELECT od.* FROM cln_actionkit__core_order_detail od
                INNER JOIN filtered_orders fo ON od.order_id = fo.order_id
            """)

        # core_transaction - order_id -> order
        if load_table("cln_actionkit__core_transaction"):
            export_table("cln_actionkit__core_transaction", """
                SELECT t.* FROM cln_actionkit__core_transaction t
                INNER JOIN filtered_orders fo ON t.order_id = fo.order_id
            """)

    print("\nDone!")
    return 0


if __name__ == "__main__":
    exit(main())
