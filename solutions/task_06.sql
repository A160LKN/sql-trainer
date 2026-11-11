-- 06. Сумма каждого заказа
-- 1) соединяем позиции заказов с товарами, чтобы узнать цену;
-- 2) для каждой позиции считаем цена × количество;
-- 3) группируем по заказу и складываем через SUM.
-- Заказ без позиций (12) не попадёт: в order_items для него нет строк
SELECT oi.order_id, SUM(p.price * oi.quantity) AS total
FROM order_items AS oi
JOIN products AS p ON p.id = oi.product_id
GROUP BY oi.order_id
ORDER BY oi.order_id;
