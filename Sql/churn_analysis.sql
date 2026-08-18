-- ============================================================
-- TELECOM CUSTOMER CHURN ANALYSIS
-- Day 3 - SQL Business Analysis
-- ============================================================


-- ============================================================
-- 1. TOTAL CUSTOMERS
-- ============================================================

SELECT
    COUNT(*) AS total_customers
FROM customers;


-- ============================================================
-- 2. TOTAL CHURNED CUSTOMERS
-- ============================================================

SELECT
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes';


-- ============================================================
-- 3. OVERALL CHURN RATE
-- ============================================================

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers;


-- ============================================================
-- 4. CHURN DISTRIBUTION
-- ============================================================

SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM customers),
        2
    ) AS percentage
FROM customers
GROUP BY Churn;


-- ============================================================
-- 5. CHURN BY CONTRACT TYPE
-- ============================================================

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;


-- ============================================================
-- 6. CHURN BY INTERNET SERVICE
-- ============================================================

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY InternetService
ORDER BY churn_rate DESC;


-- ============================================================
-- 7. CHURN BY PAYMENT METHOD
-- ============================================================

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- ============================================================
-- 8. CHURN BY SENIOR CITIZEN STATUS
-- ============================================================

SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;


-- ============================================================
-- 9. CHURN BY TENURE GROUP
-- ============================================================

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customers

GROUP BY tenure_group

ORDER BY churn_rate DESC;


-- ============================================================
-- 10. CHURN BY MONTHLY CHARGES
-- ============================================================

SELECT
    CASE
        WHEN MonthlyCharges < 40 THEN 'Low (<40)'
        WHEN MonthlyCharges < 70 THEN 'Medium (40-69)'
        ELSE 'High (70+)'
    END AS charge_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customers

GROUP BY charge_group

ORDER BY churn_rate DESC;


-- ============================================================
-- 11. CHURN BY TECH SUPPORT
-- ============================================================

SELECT
    TechSupport,
    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customers

GROUP BY TechSupport

ORDER BY churn_rate DESC;


-- ============================================================
-- 12. CHURN BY ONLINE SECURITY
-- ============================================================

SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customers

GROUP BY OnlineSecurity

ORDER BY churn_rate DESC;


-- ============================================================
-- 13. AVERAGE MONTHLY CHARGES: CHURNED VS RETAINED
-- ============================================================

SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customers
GROUP BY Churn;


-- ============================================================
-- 14. AVERAGE TENURE: CHURNED VS RETAINED
-- ============================================================

SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(tenure), 2) AS average_tenure_months
FROM customers
GROUP BY Churn;


-- ============================================================
-- 15. HIGH-RISK CUSTOMER SEGMENTS
-- ============================================================

SELECT
    Contract,
    InternetService,
    PaymentMethod,

    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM customers

GROUP BY
    Contract,
    InternetService,
    PaymentMethod

HAVING COUNT(*) >= 50

ORDER BY churn_rate DESC
LIMIT 10;