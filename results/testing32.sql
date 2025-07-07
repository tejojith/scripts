-- Validate raw_orders table data
SELECT COUNT(*) AS num_rows, 
       SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_ids, 
       SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS null_customer_names, 
       SUM(CASE WHEN customer_email IS NULL THEN 1 ELSE 0 END) AS null_customer_emails
FROM source_db.raw_orders;