-- =========================================
-- STEP 2: LOAD DATA INTO STAGING
-- =========================================

-- This assumes CSV load via COPY (PostgreSQL)

COPY insurance_raw
FROM 'data/raw/insurance.csv'
DELIMITER ','
CSV HEADER;
