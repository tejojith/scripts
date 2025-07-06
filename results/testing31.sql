-- Query 1 title (optional if explanation requested)
SELECT order_id, customer_name, customer_email, customer_phone
FROM source_db.raw_orders;

-- Query 2 title (optional if explanation requested)
INSERT INTO target_db.customers (name, email, phone)
SELECT DISTINCT customer_name, customer_email, customer_phone
FROM source_db.raw_orders;

-- Query 3 title (optional if explanation requested)
INSERT INTO target_db.sales_channels (name)
SELECT DISTINCT channel_name FROM source_db.raw_orders;

-- Query 4 title (optional if explanation requested)
INSERT INTO target_db.payment_methods (method_name)
SELECT DISTINCT payment_method FROM source_db.raw_orders;

-- Query 5 title (optional if explanation requested)
INSERT INTO target_db.shipping_methods (method_name)
SELECT DISTINCT shipping_method FROM source_db.raw_orders;

-- Query 6 title (optional if explanation requested)
INSERT INTO target_db.product_categories (name, description)
SELECT DISTINCT category_name, category_description 
FROM source_db.raw_products;

-- Query 7 title (optional if explanation requested)
INSERT INTO target_db.products (name, category_id, price, stock_quantity)
SELECT 
    p.product_id,
    c.category_id,
    p.price,
    0 AS stock_quantity
FROM source_db.raw_orders ro
JOIN target_db.customers c ON ro.customer_email = c.email
JOIN target_db.shipping_methods sm ON ro.shipping_method = sm.method_name
JOIN target_db.payment_methods pm ON ro.payment_method = pm.method_name
JOIN target_db.sales_channels sc ON ro.channel_name = sc.name;

-- Query 8 title (optional if explanation requested)
INSERT INTO target_db.sales_order_items (order_id, product_id, quantity, price)
SELECT 
    so.order_id,
    p.product_id,
    roi.quantity,
    roi.unit_price
FROM source_db.raw_order_items roi
JOIN target_db.products p ON roi.product_sku = p.name
JOIN target_db.sales_orders so ON roi.order_id = so.order_id;

-- Query 9 title (optional if explanation requested)
INSERT INTO target_db.invoices (order_id, invoice_date, total_amount)
SELECT 
    so.order_id,
    ri.invoice_date,
    ri.total_amount
FROM source_db.raw_invoices ri
JOIN target_db.sales_orders so ON ri.order_id = so.order_id;

-- Query 10 title (optional if explanation requested)
INSERT INTO target_db.payments (invoice_id, amount_paid, payment_date)
SELECT 
    i.invoice_id,
    rp.amount_paid,
    rp.payment_date
FROM source_db.raw_payments rp
JOIN target_db.invoices i ON rp.order_id = i.order_id;

-- Query 11 title (optional if explanation requested)
INSERT INTO target_db.product_performance_metrics (product_id, month, revenue, units_sold)
SELECT 
    p.product_id,
    rpm.month,
    rpm.revenue,
    rpm.units_sold
FROM source_db.raw_product_metrics rpm
JOIN target_db.products p ON rpm.sku = p.name;