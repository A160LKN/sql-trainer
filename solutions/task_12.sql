-- 12. Заказы с несуществующим покупателем
-- Та же идея, что в задаче 09, только наоборот: берём все заказы
-- и ищем те, для которых покупатель не нашёлся.
-- В реальной базе это предотвращает внешний ключ (FOREIGN KEY), здесь он не задан
SELECT o.id
FROM orders AS o
LEFT JOIN customers AS c ON c.id = o.customer_id
WHERE c.id IS NULL
ORDER BY o.id;
