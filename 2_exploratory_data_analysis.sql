-- STAGE 2: EXPLORATORY DATA ANALYSIS
-- STEP 1: Revenue & Profit Performance Baseline by Branch and Product Line
SELECT 
  `Branch`,
  `Product line`,
  ROUND(SUM(`Total`), 2) AS total_revenue,
  ROUND(SUM(`gross income`), 2) AS total_gross_profit,
  ROUND((SUM(`gross income`) / SUM(`Total`)) * 100, 2) AS gross_profit_margin_pct
FROM 
  `supermarket-sales-analytics.raw_supermarket_data.sales_records`
GROUP BY 
  `Branch`, 
  `Product line`
ORDER BY 
  total_revenue DESC;

-- STAGE 2: EXPLORATORY DATA ANALYSIS
-- STEP 2: Customer Behaviour & Payment Preference Analytics
SELECT 
  `Customer type`,
  `Payment`,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Total`), 2) AS total_revenue,
  ROUND(AVG(`Total`), 2) AS average_transaction_value
FROM 
  `supermarket-sales-analytics.raw_supermarket_data.sales_records`
GROUP BY 
  `Customer type`, 
  `Payment`
ORDER BY 
  `Customer type`, 
  total_revenue DESC;
