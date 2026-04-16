-- =========================================
-- STEP 3: DATA CLEANING
-- =========================================

CREATE TABLE insurance_cleaned AS

SELECT 
    age,

    -- Normalize gender values
    LOWER(TRIM(sex)) AS sex,

    -- Handle BMI anomalies
    CASE 
        WHEN bmi < 10 OR bmi > 60 THEN NULL
        ELSE bmi
    END AS bmi,

    children,

    -- Normalize smoker field
    CASE 
        WHEN LOWER(smoker) IN ('yes', 'y') THEN 'yes'
        ELSE 'no'
    END AS smoker,

    LOWER(region) AS region,

    -- Ensure no negative charges
    CASE 
        WHEN charges < 0 THEN NULL
        ELSE charges
    END AS charges

FROM insurance_raw;
