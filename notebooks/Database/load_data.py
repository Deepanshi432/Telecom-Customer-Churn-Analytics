import sqlite3
import pandas as pd

# File paths
csv_file = "data/processed/telco_customer_churn_clean.csv"
database_file = "database/telecom_churn.db"

# Load cleaned dataset
df = pd.read_csv(csv_file)

print("Dataset loaded successfully!")
print("Rows:", len(df))
print("Columns:", len(df.columns))

# Connect to SQLite database
connection = sqlite3.connect(database_file)

# Load data into SQLite
df.to_sql(
    "customers",
    connection,
    if_exists="replace",
    index=False
)

print("Data successfully loaded into 'customers' table!")

# Verify row count
cursor = connection.cursor()
cursor.execute("SELECT COUNT(*) FROM customers")
count = cursor.fetchone()[0]

print("Rows in database:", count)

connection.close()

print("Database connection closed.")