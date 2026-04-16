-- =========================================
-- DATA VALIDATION LAYER
-- =========================================
-- Purpose:
-- Ensure cleaned data is reliable before analysis
-- =========================================

-- 1. Check for duplicate customers
SELECT 
    email,
    COUNT(*) AS duplicate_count
FROM customers_cleaned
GROUP BY email
HAVING COUNT(*) > 1;


-- 2. Check for NULL values in critical columns
SELECT *
FROM customers_cleaned
WHERE email IS NULL 
   OR customer_id IS NULL;


-- 3. Validate order amounts (no negative values)
SELECT *
FROM orders_cleaned
WHERE amount < 0;


-- 4. Check for orphan records (orders without customers)
SELECT o.*
FROM orders_cleaned o
LEFT JOIN customers_cleaned c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 5. Check date consistency
-- Order date should be after signup date
SELECT o.*, c.signup_date
FROM orders_cleaned o
JOIN customers_cleaned c
ON o.customer_id = c.customer_id
WHERE o.order_date < c.signup_date;


-- 6. Check for future dates (data anomaly)
SELECT *
FROM orders_cleaned
WHERE order_date > CURRENT_DATE;


-- 7. Record count validation
SELECT 
    (SELECT COUNT(*) FROM customers_cleaned) AS customer_count,
    (SELECT COUNT(*) FROM orders_cleaned) AS order_count;
