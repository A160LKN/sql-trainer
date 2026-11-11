SELECT oi.order_id, SUM(p.price * oi.quantity) AS total
FROM order_items AS oi
JOIN products AS p ON p.id = oi.product_id
GROUP BY oi.order_id
ORDER BY oi.order_id;
