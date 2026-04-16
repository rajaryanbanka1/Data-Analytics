-- =========================================
-- STEP 5: FEATURE ENGINEERING
-- =========================================

CREATE TABLE insurance_features AS

SELECT 
    *,
    
    -- BMI category
    CASE 
        WHEN bmi < 18.5 THEN 'underweight'
        WHEN bmi BETWEEN 18.5 AND 25 THEN 'normal'
        WHEN bmi BETWEEN 25 AND 30 THEN 'overweight'
        ELSE 'obese'
    END AS bmi_category,

    -- Risk score (simple heuristic)
    (
        age * 0.3 +
        bmi * 0.2 +
        children * 0.1 +
        CASE WHEN smoker = 'yes' THEN 10 ELSE 0 END
    ) AS risk_score

FROM insurance_cleaned;
