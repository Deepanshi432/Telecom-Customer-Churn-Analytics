import pandas as pd

# File paths
input_file = "data/raw/telco_customer_churn.csv"
output_file = "data/processed/telco_customer_churn_clean.csv"

# Load raw data
df = pd.read_csv(input_file)

print("Original shape:", df.shape)

# Clean column names
df.columns = df.columns.str.strip()

# Convert TotalCharges to numeric
# Blank/invalid values become NaN
df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)

# Customers with tenure = 0 have no accumulated charges
df["TotalCharges"] = df["TotalCharges"].fillna(0)

# Remove duplicate records
df = df.drop_duplicates()

# Save cleaned dataset
df.to_csv(output_file, index=False)

print("Cleaned shape:", df.shape)
print("Remaining missing values:", df.isnull().sum().sum())
print("Cleaned dataset saved to:", output_file)