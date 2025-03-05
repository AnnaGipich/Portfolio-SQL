-- Задача: Определить топ-10 лучших клиентов по объему заказов
-- Цель: Выделить ключевых клиентов, приносящих наибольшую выручку
-- Вывод: Возможность применения программ лояльности

WITH customer_totals AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(po.price * po.count) AS total_orders,
        ROW_NUMBER() OVER (ORDER BY SUM(po.price * po.count) DESC) AS rank
    FROM pharma_orders po
    JOIN customers c ON po.customer_id = c.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_orders,
    rank
FROM customer_totals
WHERE rank <= 10
ORDER BY rank;

-- Используемые функции: WITH, JOIN, SUM(), ROW_NUMBER, ORDER BY, LIMIT
