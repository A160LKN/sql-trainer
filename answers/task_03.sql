SELECT status, COUNT(*) AS orders_count
FROM orders
GROUP BY status
ORDER BY status;
