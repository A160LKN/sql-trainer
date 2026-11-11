-- 11. Дубли email
-- HAVING — это WHERE для групп: фильтрует ПОСЛЕ группировки.
-- WHERE COUNT(*) > 1 написать нельзя: на этапе WHERE групп ещё нет.
-- Частый вопрос на собеседовании: «Чем WHERE отличается от HAVING?»
SELECT email, COUNT(*) AS customers_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
