-- =========================================
-- STEP 1: CREATE RAW TABLE
-- =========================================

CREATE TABLE insurance_raw (
    age INT,
    sex VARCHAR(10),
    bmi FLOAT,
    children INT,
    smoker VARCHAR(10),
    region VARCHAR(20),
    charges FLOAT
);
