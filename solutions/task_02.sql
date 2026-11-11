-- 02. Товары дороже 50 000 тенге
SELECT name, price
FROM products
WHERE price > 50000
ORDER BY price DESC;       -- DESC — по убыванию, от самого дорогого
