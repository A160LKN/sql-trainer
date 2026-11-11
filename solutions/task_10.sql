-- 10. Количество заказов по городам, без отменённых
-- <> означает «не равно». Сортировка по двум столбцам:
-- сначала по количеству, а при равенстве — по городу
SELECT c.city, COUNT(o.id) AS orders_count
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
WHERE o.status <> 'cancelled'
GROUP BY c.city
ORDER BY orders_count DESC, c.city;
