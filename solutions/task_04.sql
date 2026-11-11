-- 04. Покупатели, зарегистрированные в 2026 году
-- BETWEEN включает обе границы. Даты хранятся строками ГГГГ-ММ-ДД,
-- поэтому их можно сравнивать как текст: порядок совпадает с порядком дат
SELECT name, registered_at
FROM customers
WHERE registered_at BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY registered_at;
