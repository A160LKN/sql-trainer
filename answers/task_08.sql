SELECT p.category, SUM(p.price * oi.quantity) AS revenue
FROM order_items AS oi
JOIN orders AS o   ON o.id = oi.order_id
JOIN products AS p ON p.id = oi.product_id
WHERE o.status IN ('paid', 'delivered')
GROUP BY p.category
ORDER BY revenue DESC;
