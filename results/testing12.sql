SELECT 
    c.customer_id,
    c.email,
    c.phone,
    sc.channel_id,
    pm.payment_method_id,
    sm.shipping_method_id,
    so.order_date,
    so.status,
    so.total_amount,
    soi.product_id,
    soi.quantity,
    soi.price,
    i.invoice_date,
    i.total_amount,
    ppm.revenue,
    ppm.units_sold
FROM target_database.customers c
JOIN target_database.sales_channels sc ON c.channel_id = sc.channel_id
JOIN target_database.payment_methods pm ON c.payment_method_id = pm.payment_method_id
JOIN target_database.shipping_methods sm ON c.shipping_method_id = sm.shipping_method_id
JOIN target_database.sales_orders so ON c.customer_id = so.customer_id
JOIN target_database.sales_