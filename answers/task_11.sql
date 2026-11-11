SELECT email, COUNT(*) AS customers_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
