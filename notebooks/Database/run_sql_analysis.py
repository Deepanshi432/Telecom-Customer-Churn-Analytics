import sqlite3

DATABASE = "database/telecom_churn.db"
SQL_FILE = "Sql/churn_analysis.sql"

# Connect to database
connection = sqlite3.connect(DATABASE)

# Read SQL file
with open(SQL_FILE, "r", encoding="utf-8") as file:
    sql_script = file.read()

# Split the script into individual queries
queries = [
    query.strip()
    for query in sql_script.split(";")
    if query.strip()
]

print("=" * 70)
print("TELECOM CUSTOMER CHURN - SQL ANALYSIS RESULTS")
print("=" * 70)

for i, query in enumerate(queries, start=1):

    # Skip comments-only sections
    if not any(
        line.strip() and not line.strip().startswith("--")
        for line in query.splitlines()
    ):
        continue

    # Remove SQL comments
    clean_query = "\n".join(
        line
        for line in query.splitlines()
        if not line.strip().startswith("--")
    ).strip()

    try:
        cursor = connection.execute(clean_query)
        results = cursor.fetchall()

        print(f"\n{'-' * 70}")
        print(f"QUERY {i}")
        print(f"{'-' * 70}")

        if cursor.description:
            columns = [column[0] for column in cursor.description]
            print(" | ".join(columns))
            print("-" * 70)

            for row in results:
                print(" | ".join(str(value) for value in row))

    except sqlite3.Error as error:
        print(f"\nERROR in Query {i}: {error}")

connection.close()

print(f"\n{'=' * 70}")
print("SQL ANALYSIS COMPLETED")
print("=" * 70)