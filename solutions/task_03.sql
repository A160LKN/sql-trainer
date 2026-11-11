-- 03. Сколько заказов в каждом статусе
-- GROUP BY собирает строки с одинаковым статусом в группы,
-- COUNT(*) считает, сколько строк в каждой группе
SELECT status, COUNT(*) AS orders_count
FROM orders
GROUP BY status
ORDER BY status;
