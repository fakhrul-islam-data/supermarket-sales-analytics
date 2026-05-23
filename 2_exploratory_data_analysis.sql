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

/* STEP 1 KEY OBSERVATIONS & INSIGHTS:
1. TOP REVENUE GENERATORS: Branch C is a dominant revenue driver, capturing the highest single category 
   sales via "Food and beverages" ($23,766.85) and "Fashion accessories" ($21,560.07). 
2. REVENUE VS. MARGIN TRUTH: While total revenue varies drastically across categories, the gross profit 
   margin is perfectly flat at exactly 4.76% across every single transaction. This indicates a strict, 
   centralized corporate pricing model that does not scale based on category value or sales volume.
*/

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

/* STEP 2 KEY OBSERVATIONS & INSIGHTS:
1. MEMBERS SPEND MORE PER VISIT: The store's loyalty program successfully drives larger transaction 
   sizes. "Members" using a Credit Card generate the highest single average basket size at $335.88.
2. DISCONNECT IN WALLET USERS: There is an untapped segment of high-volume, non-member shoppers. 
   "Normal" walk-in customers heavily prefer E-wallets, driving a massive $58,202.15 in total revenue. 
   This highlights a major marketing opportunity to target E-wallet checkout stations for loyalty sign-ups.
*/
