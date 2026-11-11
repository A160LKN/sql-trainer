SELECT name, registered_at
FROM customers
WHERE registered_at BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY registered_at;
