-- Example index to improve query performance on large datasets

CREATE INDEX idx_customer_date 
ON transactions(customer_id, order_date);

-- Why?
-- Speeds up:
-- 1. Window functions partitioned by customer_id
-- 2. Date-based filtering
-- 3. Join operations
