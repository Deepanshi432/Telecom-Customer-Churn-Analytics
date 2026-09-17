import sqlite3

# Create/connect to the SQLite database
connection = sqlite3.connect("database/telecom_churn.db")

print("SQLite database created successfully!")
7`

connection.close()