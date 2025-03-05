-- Задача: Рассчитать накопленную сумму продаж по аптекам
-- Цель: Анализ тенденций продаж по каждой аптеке
-- Вывод: Оценка вклада аптек в общий оборот

SELECT 
    report_date,
    pharmacy_name,
    SUM(price * count) AS daily_sales,
    SUM(SUM(price * count)) OVER (ORDER BY report_date) AS cumulative_sales
FROM pharma_orders
GROUP BY report_date, pharmacy_name
ORDER BY report_date;

-- Используемые функции: SUM(), GROUP BY, ORDER BY, SUM() OVER
