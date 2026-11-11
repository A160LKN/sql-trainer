-- 15. Товары дороже средней цены
-- Подзапрос в скобках выполняется первым и возвращает одно число — среднюю цену.
-- Внешний запрос сравнивает с ним цену каждого товара
SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;
