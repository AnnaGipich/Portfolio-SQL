-- Задача: Найти самых частых клиентов аптек "Горздрав" и "Здравсити"
-- Цель: Определить клиентов с наибольшим числом заказов
-- Вывод: Анализ активности клиентов и их распределения по аптекам

WITH gorzdrav_customers AS (
    SELECT 
        c.customer_id,
        CONCAT(c.last_name, ' ', c.first_name, ' ', c.second_name) AS full_name,
        COUNT(po.order_id) AS total_orders
    FROM pharma_orders po
    JOIN customers c ON po.customer_id = c.customer_id
    WHERE po.pharmacy_name = 'Горздрав'
    GROUP BY c.customer_id, c.last_name, c.first_name, c.second_name
    ORDER BY total_orders DESC
    LIMIT 10
),
zdravsiti_customers AS (
    SELECT 
        c.customer_id,
        CONCAT(c.last_name, ' ', c.first_name, ' ', c.second_name) AS full_name,
        COUNT(po.order_id) AS total_orders
    FROM pharma_orders po
    JOIN customers c ON po.customer_id = c.customer_id
    WHERE po.pharmacy_name = 'Здравсити'
    GROUP BY c.customer_id, c.last_name, c.first_name, c.second_name
    ORDER BY total_orders DESC
    LIMIT 10
)
SELECT 
    'Горздрав' AS pharmacy_name,
    customer_id,
    full_name,
    total_orders
FROM gorzdrav_customers
UNION ALL
SELECT 
    'Здравсити' AS pharmacy_name,
    customer_id,
    full_name,
    total_orders
FROM zdravsiti_customers
ORDER BY pharmacy_name, total_orders DESC;

-- Используемые функции: WITH, JOIN, COUNT(), CONCAT(), ORDER BY, LIMIT, UNION ALL
