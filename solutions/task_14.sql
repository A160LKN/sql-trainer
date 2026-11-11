-- 14. Товары с некорректной ценой
-- В реальной базе такое запрещают ограничением CHECK (price > 0)
SELECT name, price
FROM products
WHERE price <= 0
ORDER BY name;
