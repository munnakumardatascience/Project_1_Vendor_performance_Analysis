
-- =======================================================
-- E-commerce Database Cleaning & KPI Views Deployment SQL
-- =======================================================

-- Step 1: Clean Purchases
DROP VIEW IF EXISTS clean_purchases;
CREATE VIEW clean_purchases AS
SELECT *
FROM purchases
WHERE Quantity > 0
  AND PurchasePrice > 0
  AND PODate IS NOT NULL;

-- Step 2: Clean Sales
DROP VIEW IF EXISTS clean_sales;
CREATE VIEW clean_sales AS
SELECT *
FROM sales
WHERE SalesQuantity > 0
  AND SalesPrice > 0
  AND SalesDate IS NOT NULL;

-- Step 3: Vendor Performance (spend & revenue)
DROP VIEW IF EXISTS vendor_performance;
CREATE VIEW vendor_performance AS
SELECT p.VendorNumber, p.VendorName,
       SUM(p.Dollars) AS total_spend,
       SUM(s.SalesDollars) AS total_revenue,
       (SUM(s.SalesDollars) - SUM(p.Dollars)) AS profit
FROM clean_purchases p
JOIN clean_sales s ON p.Brand = s.Brand AND p.Store = s.Store
GROUP BY p.VendorNumber, p.VendorName;

-- Step 4: Monthly Sales by Vendor
DROP VIEW IF EXISTS vendor_monthly_sales;
CREATE VIEW vendor_monthly_sales AS
SELECT s.VendorNo, s.VendorName,
       DATE_FORMAT(s.SalesDate, '%Y-%m') AS month,
       SUM(s.SalesQuantity) AS total_quantity,
       SUM(s.SalesDollars) AS total_sales
FROM clean_sales s
GROUP BY s.VendorNo, s.VendorName, month;

-- Step 5: Lead Time Calculation
DROP VIEW IF EXISTS vendor_lead_time;
CREATE VIEW vendor_lead_time AS
SELECT VendorNumber, VendorName,
       AVG(DATEDIFF(ReceivingDate, PODate)) AS avg_lead_time
FROM clean_purchases
GROUP BY VendorNumber, VendorName;
