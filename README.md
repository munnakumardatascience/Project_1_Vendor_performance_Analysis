# Vendor Performance Analytics Project

## 📌 Problem Statement
A retail company wants to evaluate vendor performance using transactional data (sales, purchases, invoices, and inventory).  
The goal is to identify top vendors, detect low-performing ones, analyze lead times, and measure profitability — enabling better vendor negotiations and supply chain optimization.

---

## 📂 Project Structure
- **deployment.sql** → SQL script that:
  - Cleans raw data (removes invalid rows, standardizes units/dates, fixes duplicates).
  - Creates `clean_sales` and `clean_purchases` views.
  - Builds KPI views (monthly vendor sales, spend, lead time, margin).
- **qc_notebook.ipynb** → Jupyter Notebook that:
  - Runs Pandas-based quality checks.
  - Validates cleaned data (size conversion, inventory balance, duplicate handling).
  - Confirms consistency between SQL views and raw sources.

---

## 🛠️ Tools & Technologies
- **SQL (MySQL)** → Data cleaning & transformation of large tables (`sales`, `purchases`).
- **Python (Pandas, NumPy)** → Data cleaning & validation of smaller tables (`inventory`, `vendor_invoice`, `purchase_prices`).
- **Jupyter Notebook** → Exploratory Data Analysis (EDA) & validation.
- **Power BI / Tableau (optional)** → Dashboard visualization for vendors, spend, sales, margins.

---

## 🚀 End-to-End Workflow
1. **Data Cleaning**
   - Handled invalid dates, negative/zero values.
   - Standardized units (`L`, `ml`, `oz`, `gal` → mL).
   - Removed duplicate invoices with missing approvals.
   - Unified text case for vendors & brands.

2. **Data Transformation**
   - Created `InventoryId` as a composite product key.
   - Built clean SQL views (`clean_sales`, `clean_purchases`).
   - Joined vendor invoices, purchases, sales for KPIs.

3. **Data Analysis**
   - Top vendors by spend vs sales revenue.
   - Vendors with longest lead time.
   - Profit margins by SKU and vendor.
   - Inventory valuation start vs end of year.

4. **Data Visualization**
   - Designed interactive dashboards (Power BI) for:
     - Spend vs Sales by Vendor.
     - Monthly trend of purchases vs sales.
     - Vendor lead time distribution.
     - Profitability heatmaps.

---

## 🎯 Resume-Ready Highlights
- Built an **end-to-end data pipeline** using **SQL + Python + Power BI**.
- Cleaned and transformed **15M+ rows** of transactional data into usable insights.
- Automated KPI dashboards that track **vendor spend, revenue, lead times, and profitability**.
- Delivered a scalable solution balancing **SQL for heavy tables** and **Pandas for agile checks**.
- Direct business impact: enables procurement team to **renegotiate contracts, cut delays, and maximize margins**.

---

## 📊 Key Business Insights (Sample)
- **Top Vendor** contributed ~18% of total sales revenue.
- **5 Vendors** had negative margins on certain SKUs (loss-making).
- **Average Vendor Lead Time** = 12 days; worst vendor delayed up to 45 days.
- **Inventory Holding** reduced by 7% from start to end of year.

---

## 🔗 How to Run
1. Run `deployment.sql` in MySQL → sets up clean tables & KPI views.
2. Run `qc_notebook.ipynb` in Jupyter → validates the data quality.
3. (Optional) Connect Power BI → build dashboards using SQL views.

---

## 👔 Resume Bullet Example
**"Executed an end-to-end Vendor Performance Analytics project using SQL, Python (Pandas), and Power BI. Cleaned and transformed 15M+ rows of retail data, built KPI dashboards (spend, sales, margins, lead times), and delivered actionable insights for vendor negotiations and inventory optimization."**

---
