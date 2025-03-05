-- Задача: Определить количество уникальных клиентов в аптеках
-- Цель: Оценить популярность аптек среди покупателей
-- Вывод: Информация о притоке клиентов и их распределении

SELECT 
    po.pharmacy_name,
    COUNT(DISTINCT c.customer_id) AS unique_customers
FROM pharma_orders po
JOIN customers c ON po.customer_id = c.customer_id
GROUP BY po.pharmacy_name
ORDER BY unique_customers DESC;

-- Используемые функции: COUNT(DISTINCT), GROUP BY, JOIN, ORDER BY
