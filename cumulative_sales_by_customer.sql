-- Задача: Рассчитать накопленную сумму продаж по каждому клиенту
-- Цель: Выявить долю ключевых клиентов в общем обороте
-- Вывод: Анализ влияния клиентов на выручку (принцип Парето)

WITH customer_orders AS (
    SELECT 
        c.customer_id,
        CONCAT(c.last_name, ' ', c.first_name, ' ', c.second_name) AS full_name,
        SUM(po.price * po.count) AS total_orders
    FROM pharma_orders po
    JOIN customers c ON po.customer_id = c.customer_id
    GROUP BY c.customer_id, c.last_name, c.first_name, c.second_name
),
cumulative_totals AS (
    SELECT 
        customer_id,
        full_name,
        total_orders,
        SUM(total_orders) OVER (ORDER BY total_orders DESC) AS cumulative_sales
    FROM customer_orders
)
SELECT 
    customer_id,
    full_name,
    total_orders,
    cumulative_sales
FROM cumulative_totals
ORDER BY total_orders DESC;

-- Используемые функции: WITH, JOIN, SUM(), CONCAT(), SUM() OVER (ORDER BY)
