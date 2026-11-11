-- 07. Топ-3 покупателя по сумме доставленных заказов
-- Цепочка из четырёх таблиц: покупатель → его заказы → позиции → товары.
-- WHERE фильтрует строки ДО группировки: берём только delivered.
-- Группируем по c.id, а не только по имени: у двух людей может быть одинаковое имя.
-- LIMIT 3 оставляет первые три строки после сортировки
SELECT c.name, SUM(p.price * oi.quantity) AS total
FROM customers AS c
JOIN orders AS o       ON o.customer_id = c.id
JOIN order_items AS oi ON oi.order_id = o.id
JOIN products AS p     ON p.id = oi.product_id
WHERE o.status = 'delivered'
GROUP BY c.id, c.name
ORDER BY total DESC
LIMIT 3;
