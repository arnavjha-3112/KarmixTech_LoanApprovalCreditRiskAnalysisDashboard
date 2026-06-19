-- =========================
-- KPI METRICS
-- =========================

-- Overall Approval Rate
SELECT
COUNT(*) AS total_applications,
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END) AS approved_loans,
SUM(CASE WHEN loan_status='Rejected' THEN 1 ELSE 0 END) AS rejected_loans,
ROUND(
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END)*100/COUNT(*),2
) AS approval_rate
FROM loans;

-- Approval Rate by CIBIL Category
SELECT
cibil_category,
COUNT(*) AS applications,
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END) AS approved,
ROUND(
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END)*100/COUNT(*),2
) AS approval_rate
FROM loans
GROUP BY cibil_category
ORDER BY approval_rate DESC;

-- Risk Category Performance
SELECT
risk_category,
COUNT(*) AS applications,
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END) AS approved,
ROUND(
SUM(CASE WHEN loan_status='Approved' THEN 1 ELSE 0 END)*100/COUNT(*),2
) AS approval_rate
FROM loans
GROUP BY risk_category;

-- Average Income by Loan Status
SELECT
loan_status,
ROUND(AVG(income_annum),0) AS avg_income
FROM loans
GROUP BY loan_status;

-- Average Loan Amount by Loan Status
SELECT
loan_status,
ROUND(AVG(loan_amount),0) AS avg_loan_amount
FROM loans
GROUP BY loan_status;

-- Average CIBIL Score by Loan Status
SELECT
loan_status,
ROUND(AVG(cibil_score),0) AS avg_cibil_score
FROM loans
GROUP BY loan_status;

-- Loan Size Analysis
SELECT
loan_size,
COUNT(*) AS applications,
ROUND(AVG(loan_amount),0) AS avg_loan_amount
FROM loans
GROUP BY loan_size;

-- Top Financial Segment
SELECT
cibil_category,
risk_category,
COUNT(*) AS customers
FROM loans
GROUP BY cibil_category,risk_category
ORDER BY customers DESC;
