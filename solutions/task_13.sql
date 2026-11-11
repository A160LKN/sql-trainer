-- 13. Заказы без товаров
SELECT o.id
FROM orders AS o
LEFT JOIN order_items AS oi ON oi.order_id = o.id
WHERE oi.order_id IS NULL
ORDER BY o.id;
