-- Flexible input handling
CREATE TABLE input (
    value TEXT
);

-- Example solution with test validation
WITH processed_data AS (
    SELECT 
        CAST(value AS INTEGER) AS numeric_value
    FROM input
),
solution AS (
    SELECT 
        SUM(numeric_value) AS result
    FROM processed_data
)
SELECT 
    result,
    CASE 
        -- Test input validation (adjust expected value)
        WHEN result = 42 THEN 'Test Passed: Expected result found'
        ELSE 'Solution computed'
    END AS validation
FROM solution;
