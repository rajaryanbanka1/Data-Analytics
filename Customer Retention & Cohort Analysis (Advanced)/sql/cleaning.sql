-- 1. Remove duplicate customers based on email
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM customers
    WHERE email IS NOT NULL
    GROUP BY email
);

-- 2. Remove customers with NULL email
DELETE FROM customers
WHERE email IS NULL;

-- 3. Fix missing signup_date
UPDATE customers
SET signup_date = '2023-01-10'
WHERE signup_date IS NULL;

-- 4. Replace NULL order amount with 0
UPDATE orders
SET amount = 0
WHERE amount IS NULL;
