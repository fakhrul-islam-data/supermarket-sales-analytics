# 🛒 Supermarket Sales & Operations Analytics
### End-to-End Retail Data Analysis Case Study

---

## 📌 Executive Summary

Over the past few months, I analyzed 1,000 retail sales transactions across three store branches in BigQuery to help store managers figure out where they were losing time and money. 

The data revealed three major operational bottlenecks:
* 🛒 **Checkout Bottlenecks:** Store foot traffic hits major peaks during the evening rush at **7:00 PM** (113 transactions, $39.7k) and lunch hour at **1:00 PM** (103 transactions, $34.7k), but drops off sharply during late afternoon (**5:00 PM**, 74 transactions) and late evening (**8:00 PM**, 75 transactions).
* 💳 **Missed Loyalty Conversions:** Walk-in non-members paying with E-wallets accounted for **$58,202.15** in revenue across 184 transactions, making them the largest single customer-payment revenue segment and a massive opportunity for loyalty enrollment.
* 🏷️ **Rigid Pricing Structures:** Every single product line currently operates on a flat, static **4.76% gross profit margin**, missing out on extra margin potential from high-volume categories like Food & Beverages.

By realigning cashier shift schedules, targeting E-wallet shoppers with instant checkout loyalty signups, and implementing flexible category pricing, store management can optimize staffing and boost profitability.

---

## 📋 Project Scenario & Business Goal

When taking on this project, I stepped into the role of a junior data analyst leading a new consulting engagement for a multi-branch supermarket business. The client wanted a ground-up analysis of their sales data to address checkout delays, evaluate store profit margins, and understand how different customer groups prefer to pay.

### Key Questions Solved
1. ⏰ **Staffing:** When are stores busiest, and how should register shifts be scheduled to shorten checkout queues?
2. 💰 **Pricing Strategy:** Which product categories bring in the highest revenue, and where are margins too rigid?
3. 👥 **Customer Retention:** How do shopping habits differ between loyalty members and non-members?

---

## 📂 The Data & Verification Process

The raw dataset contains quarterly sales logs across three regional branches (Branch A, B, and C). To keep the pipeline clean and auditable, I uploaded the original data into **Google BigQuery** (`supermarket-sales-analytics.raw_supermarket_data.sales_records`).

* 📊 **Data Scope:** 1,000 individual transaction rows with 17 distinct attributes.
* 📋 **Tracked Variables:** Branch location, city, customer membership status, product lines, payment types, unit prices, quantity, total sales, taxes, cost of goods sold, and customer ratings.

Before diving into deeper analysis, I ran a series of preliminary SQL validation checks:
1. Verified row count (`COUNT(*) = 1000`) to ensure all records transferred cleanly.
2. Audited primary keys (`COUNT(DISTINCT `Invoice ID`) = 1000`) to confirm zero duplicate transactions.
3. Verified that numerical values (prices, quantities, gross margins) contained no negative anomalies.

*(For full validation code, see [`1_data_validation_audit.sql`](./1_data_validation_audit.sql).)*

---

## 📊 Core Findings & Analysis

Using SQL queries to aggregate and group transactional metrics (`2_exploratory_data_analysis.sql`), several clear operational trends emerged:

### 1. Shift Scheduling & Foot Traffic
Foot traffic fluctuates significantly throughout operating hours:
* **Peak Hours:** Traffic surges heavily at **7:00 PM / Hour 19** (113 sales, $39,699.51) and **1:00 PM / Hour 13** (103 sales, $34,723.23). Morning traffic also holds strong at **10:00 AM / Hour 10** (101 sales, $31,421.48).
* **Low-Traffic Windows:** Sales slow down noticeably at **5:00 PM / Hour 17** (74 sales, $24,445.22) and **8:00 PM / Hour 20** (75 sales, $22,969.53). These quiet periods are prime windows for register wrap-ups and stock replenishment rather than maximum checkout staffing.

### 2. High-Value Customers vs. Quick Walk-Ins
* **Credit Card Loyalty Members:** Generated the highest average spend per order at **$335.88** (172 transactions totaling $57,771.47), outspending non-members on credit cards ($309.32 avg).
* **E-Wallet Non-Members:** Generated the highest overall revenue volume of any subgroup at **$58,202.15** across 184 transactions (avg spend $316.32). Converting these regular digital shoppers into program members represents the store's single biggest retention win.

### 3. Product Margins & Pricing Inefficiencies
* **Food & Beverages:** Led total earnings across all categories with **$56,144.84** in revenue across 174 orders.
* **Fashion Accessories:** Logged the highest individual transaction volume at **178 orders**, bringing in $54,305.89.
* **Fixed Markup:** Across all six product lines (from Health & Beauty to Food & Beverages), the gross profit margin percentage sits at a rigid **4.76%**, proving that store management relies on a flat percentage markup rather than demand-based variable pricing.

---

## 🚀 Strategic Recommendations

Based on these findings, here are the top three actions recommended for store managers:

1. ⏰ **Realign Cashier Schedules:** Move register staff away from quiet periods like 5:00 PM and 8:00 PM to cover the heavy 1:00 PM lunch surge and 7:00 PM evening rush to cut down checkout queue times.
2. 📱 **Target E-Wallet Shoppers at Checkout:** Place QR code loyalty enrollment prompts directly on payment terminals. Converting even 15% of E-wallet walk-ins ($58.2k volume) into members will significantly raise customer lifetime value.
3. 🏷️ **Adopt Flexible Category Margins:** Move away from the uniform 4.76% margin model. Slightly increase margins on high-volume staples like Food & Beverages, and bundle low-cost Fashion Accessories to drive higher total basket sizes.
