-- Задача: Топ-3 лекарства по объему продаж
-- Цель: Определить наиболее продаваемые лекарства
-- Вывод: Оптимизация запасов и маркетинга для топ-препаратов

SELECT 
    drug,
    SUM(price * count) AS total_sales
FROM pharma_orders
GROUP BY drug
ORDER BY total_sales DESC
LIMIT 3;

-- Используемые функции: SUM(), GROUP BY, ORDER BY, LIMIT
