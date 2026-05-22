-- STEP 1: Total Row Count Check
SELECT COUNT(*) AS total_rows 
FROM `supermarket-sales-analytics.raw_supermarket_data.sales_records`;

-- STEP 2: Duplicate Check (Uniqueness)
SELECT COUNT(DISTINCT `Invoice ID`) AS unique_invoice_count 
FROM `supermarket-sales-analytics.raw_supermarket_data.sales_records`;

-- STEP 3: Completeness Check (Count Missing/Null Values)
SELECT 
  COUNTIF(`Invoice ID` IS NULL) AS missing_invoices,
  COUNTIF(`Branch` IS NULL) AS missing_branches,
  COUNTIF(`Product line` IS NULL) AS missing_products,
  COUNTIF(`Total` IS NULL) AS missing_totals
FROM `supermarket-sales-analytics.raw_supermarket_data.sales_records`;

-- STEP 4: Numeric Data Range Audit (Accuracy Check)
SELECT 
  MIN(`Unit price`) AS min_unit_price, MAX(`Unit price`) AS max_unit_price,
  MIN(`Quantity`) AS min_quantity, MAX(`Quantity`) AS max_quantity,
  MIN(`Total`) AS min_total, MAX(`Total`) AS max_total
FROM `supermarket-sales-analytics.raw_supermarket_data.sales_records`;

-- STEP 5: Categorical Consistency Check
SELECT 
  COUNT(DISTINCT `Branch`) AS unique_branches,
  COUNT(DISTINCT `Customer type`) AS unique_customer_types,
  COUNT(DISTINCT `Payment`) AS unique_payment_methods
FROM `supermarket-sales-analytics.raw_supermarket_data.sales_records`;

  -- STEP 6: Date and Time Sanity Check (Chronological Validity)
SELECT 
  MIN(`Date`) AS project_start_date, 
  MAX(`Date`) AS project_end_date,
  MIN(`Time`) AS earliest_transaction_time, 
  MAX(`Time`) AS latest_transaction_time
FROM
  `supermarket-sales-analytics.raw_supermarket_data.sales_records`;
