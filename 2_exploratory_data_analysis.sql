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
