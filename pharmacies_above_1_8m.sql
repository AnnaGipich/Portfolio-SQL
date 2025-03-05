-- Задача: Вывести аптеки с оборотом более 1.8 млн рублей
-- Цель: Определить успешные аптеки с высокой выручкой
-- Вывод: Фокус на развитии наиболее прибыльных точек

SELECT 
    pharmacy_name,
    SUM(price * count) AS total_sales
FROM pharma_orders
GROUP BY pharmacy_name
HAVING SUM(price * count) > 1800000
ORDER BY total_sales DESC;

-- Используемые функции: SUM(), GROUP BY, HAVING, ORDER BY
