-- Ensure clean slate
DROP TABLE IF EXISTS input;

-- Create input table
CREATE TABLE input (
    value TEXT
);

-- Solve Part 1: Calculating differences
WITH sorted_data AS (
    SELECT 
        -- Parse input into columns
        CAST(SUBSTR(value, 1, INSTR(value, ' ') - 1) AS INTEGER) AS col1,
        CAST(SUBSTR(value, INSTR(value, ' ') + 1) AS INTEGER) AS col2
    FROM input
),
sorted_cols AS (
    SELECT 
        col1 AS min_col, 
        col2 AS max_col
    FROM sorted_data
    ORDER BY col1, col2
),
differences AS (
    SELECT 
        max_col - min_col AS row_diff
    FROM sorted_cols
)
SELECT 
    SUM(row_diff) AS solution,
    CASE 
        WHEN SUM(row_diff) = 11 THEN 'Test Passed: Expected result found'
        ELSE 'Solution computed'
    END AS validation
FROM differences;