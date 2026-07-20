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

-- STAGE 2: EXPLORATORY DATA ANALYSIS
-- STEP 3: Product Line Revenue & Profitability Performance
-- Objective: Identify top-earning categories, volume drivers, and customer satisfaction scores
SELECT 
  `Product line`,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Total`), 2) AS total_revenue,
  ROUND(SUM(`gross income`), 2) AS total_gross_profit,
  ROUND(AVG(`Rating`), 1) AS average_customer_rating
FROM 
  `supermarket-sales-analytics.raw_supermarket_data.sales_records`
GROUP BY 
  `Product line`
ORDER BY 
  total_revenue DESC;

/* STEP 3 KEY OBSERVATIONS & INSIGHTS:
1. MAXIMIZING REVENUE IN FOOD & BEVERAGES: Food and beverages is the store's primary revenue driver, 
   generating the highest total sales ($56,144.84) and gross profit ($2,673.56) across all categories.
2. VOLUME VS. VALUE DISCONNECT: Fashion accessories represents the highest customer transaction volume 
   (178 purchases), yet ranks 4th in total revenue. This indicates a high volume of small-ticket item sales.
3. UNDERPERFORMING CATEGORY: Health and beauty sits at the bottom of supermarket performance, trailing 
   the leading category by nearly $7,000 in revenue, representing a key focus area for inventory optimization.
*/

-- STAGE 2: EXPLORATORY DATA ANALYSIS
-- STEP 4: Hourly Checkout Traffic & Sales Patterns
-- Objective: Analyze peak shopping hours to optimize store staffing and understand revenue spikes
SELECT 
  EXTRACT(HOUR FROM PARSE_TIME('%H:%M', `Time`)) AS checkout_hour,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Total`), 2) AS hourly_revenue
FROM 
  `supermarket-sales-analytics.raw_supermarket_data.sales_records`
GROUP BY 
  checkout_hour
ORDER BY 
  checkout_hour ASC;

/* STEP 4 KEY OBSERVATIONS & INSIGHTS:
1. EVENING & MIDDAY PEAKS: Hour 19 (7:00 PM) is the supermarket's absolute peak (113 sales, $39,699.51), closely followed by the Hour 13 (1:00 PM) lunch rush (103 sales, $34,723.23).
2. STRONG MID-MORNING HOUR: A secondary traffic spike occurs early at Hour 10 (10:00 AM), bringing in 101 transactions.
3. LOW-TRAFFIC WINDOWS: Foot traffic drops significantly during late afternoon (Hour 17 / 5:00 PM) and late evening (Hour 20 / 8:00 PM), dipping down into the 70s (74-75 transactions).
*/
