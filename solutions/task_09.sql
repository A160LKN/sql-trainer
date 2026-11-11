-- 09. Покупатели без заказов
-- LEFT JOIN оставляет ВСЕХ покупателей, даже если заказов не нашлось:
-- тогда столбцы заказа заполняются NULL.
-- WHERE o.id IS NULL оставляет как раз тех, у кого пары не нашлось.
-- Важно: с NULL сравнивают через IS NULL, а не через = NULL
SELECT c.name
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.id
WHERE o.id IS NULL
ORDER BY c.name;
