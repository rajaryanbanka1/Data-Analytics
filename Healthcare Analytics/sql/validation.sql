-- =========================================
-- STEP 4: DATA VALIDATION
-- =========================================

-- Check NULL values
SELECT 
    COUNT(*) FILTER (WHERE bmi IS NULL) AS null_bmi,
    COUNT(*) FILTER (WHERE charges IS NULL) AS null_charges
FROM insurance_cleaned;

-- Check duplicates
SELECT age, sex, bmi, COUNT(*)
FROM insurance_cleaned
GROUP BY age, sex, bmi
HAVING COUNT(*) > 1;

-- Check unrealistic BMI
SELECT *
FROM insurance_cleaned
WHERE bmi > 50;
