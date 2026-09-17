# Telecom Customer Churn Analytics Dashboard 📊

Customer retention is one of the biggest challenges for telecom companies. Acquiring a new customer can cost up to 5 times more than retaining an existing one, making churn reduction a top business priority. 

This project is an end-to-end data analytics and business intelligence solution created to explore customer retention patterns, quantify lost revenue, and present actionable insights through an interactive **Power BI** dashboard.

![Dashboard Preview](dashboard_preview.png)

---

##  Key Business Insights

* **Overall Churn Rate:** **26.54%** of the customer base (1,869 out of 7,043 customers) has churned.
* **Monthly Revenue Impact:** Lost customer churn accounts for an estimated **$139,130.85** in lost monthly recurring revenue.
* **Contract Risk:** Customers on **Month-to-month contracts** show a staggering **42.71% churn rate**, compared to just **2.83%** for two-year contract holders.
* **Tenure Vulnerability:** New customers (**0–12 months tenure**) exhibit the highest churn rate (**47.44%**), indicating a need for better onboarding strategies.
* **Service & Payment Drivers:** Customers using **Fiber optic internet (41.89% churn)** and **Electronic check payment methods (45.29% churn)** show significantly higher drop-off rates than other segments.

---

## 🛠️ Tools & Tech Stack

* **Data Processing & Analysis:** Python (Pandas, Jupyter Notebook)
* **Database Management:** SQLite & SQL queries
* **Business Intelligence & Visualization:** Microsoft Power BI
* **Version Control:** Git & GitHub

---

## 📂 Project Architecture & Organization

```text
Telecom Customer Churn Analytics Dashboard/
│
├── data/
│   ├── raw/                   # Original dataset (7,043 rows x 21 columns)
│   └── processed/             # Cleaned dataset ready for DB loading & BI
│
├── database/
│   └── telecom_churn.db       # SQLite database file
│
├── notebooks/
│   ├── 01_data_exploration.ipynb   # Python EDA & data cleaning
│   └── Database/              # DB creation & SQL automation scripts
│
├── Sql/
│   └── churn_analysis.sql     # SQL queries calculating retention metrics
│
├── dashboard_preview.png      # Power BI visual preview
├── Telecom_Churn_Dashboard.pdf# Exported dashboard document
└── README.md