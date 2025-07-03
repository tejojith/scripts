
    -- Example validation script
    SELECT COUNT(*) as total_records,
           COUNT(CASE WHEN column1 IS NULL THEN 1 END) as null_values
    FROM your_table;
    