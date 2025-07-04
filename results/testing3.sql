SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.customer_name IS NULL THEN 1 ELSE 0 END) AS num_null_customers,
    SUM(CASE WHEN target_database.sales_orders.customer_id IS NULL THEN 1 ELSE 0 END) AS num_null_target_customers
FROM source_database.raw_orders
LEFT JOIN target_database.sales_orders ON source_database.raw_orders.order_id = target_database.sales_orders.order_id;

SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.order_date IS NULL THEN 1 ELSE 0 END) AS num_null_order_dates,
    SUM(CASE WHEN target_database.sales_orders.order_date IS NULL THEN 1 ELSE 0 END) AS num_null_target_order_dates
FROM source_database.raw_orders
LEFT JOIN target_database.sales_orders ON source_database.raw_orders.order_id = target_database.sales_orders.order_id;

SELECT 
    COUNT(*) AS num_rows,
    SUM(CASE WHEN source_database.raw_orders.customer_id IS NULL THEN 1 ELSE 0 END) AS num_null_source_customer_ids,
    SUM(CASE WHEN target_database.sales_orders.customer_id IS NULL THEN 1 ELSE 0 END) AS num_null_target_customer_ids
FROM source_database.raw_orders
LEFT JOIN target_database.sales_orders ON source_database.raw_orders.order_id = target_database.sales_orders.order_id;