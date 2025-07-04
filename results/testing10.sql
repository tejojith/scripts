SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.customer_email IS NULL THEN 1 ELSE 0 END) AS num_null_emails,
    SUM(CASE WHEN target_database.customers.email IS NULL THEN 1 ELSE 0 END) AS num_null_target_emails
FROM source_database.raw_orders
LEFT JOIN target_database.customers ON source_database.raw_orders.customer_email = target_database.customers.email;

SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.order_id IS NULL THEN 1 ELSE 0 END) AS num_null_order_ids,
    SUM(CASE WHEN target_database.sales_orders.order_id IS NULL THEN 1 ELSE 0 END) AS num_null_target_order_ids
FROM source_database.raw_orders
LEFT JOIN target_database.sales_orders ON source_database.raw_orders.order_id = target_database.sales_orders.order_id;

SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.customer_email IS NULL THEN 1 ELSE 0 END) AS num_null_emails,
    SUM(CASE WHEN target_database.customers.email IS NULL THEN 1 ELSE 0 END) AS num_null_target_emails
FROM source_database.raw_orders
LEFT JOIN target_database.customers ON source_database.raw_orders.customer_email = target_database.customers.email;

SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.customer_email IS NULL THEN 1 ELSE 0 END) AS num_null_emails,
    SUM(CASE WHEN target_database.customers.email IS NULL THEN 1 ELSE 0 END) AS num_null_target_emails
FROM source_database.raw_orders
LEFT JOIN target_database.customers ON COALESCE(source_database.raw_orders.customer_email, '') = COALESCE(target_database.customers.email, '');