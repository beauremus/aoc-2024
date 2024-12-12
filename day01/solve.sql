-- Solve Part 1: Calculating differences
WITH sorted_data AS (
    SELECT 
        -- Parse input into columns
        CAST(SUBSTR(value, 1, INSTR(value, '   ') - 1) AS INTEGER) AS col1,
        CAST(SUBSTR(value, INSTR(value, '   ') + 1) AS INTEGER) AS col2
    FROM input
),
sorted_col1 AS (
    SELECT 
        col1, 
        ROW_NUMBER() OVER (ORDER BY col1) AS rn
    FROM sorted_data
),
sorted_col2 AS (
    SELECT 
        col2, 
        ROW_NUMBER() OVER (ORDER BY col2) AS rn
    FROM sorted_data
),
differences AS (
    SELECT 
        sorted_col1.col1,
        sorted_col2.col2,
        ABS(sorted_col2.col2 - sorted_col1.col1) AS difference
    FROM sorted_col1
    JOIN sorted_col2 ON sorted_col1.rn = sorted_col2.rn
)
SELECT 
    SUM(difference) AS solution,
    CASE 
        WHEN SUM(difference) = 11 THEN 'Test Passed: Expected result found'
        ELSE 'Solution computed'
    END AS validation
FROM differences;
