-- DESAFIO 4 - JOIN ########################################################################

-- Exercício 1: Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT p.brand, count(visit_page_date) AS visitas
FROM sales.funnel AS f
LEFT JOIN sales.products AS p
ON f.product_id = p.product_id
GROUP BY brand
ORDER BY visitas DESC

-- Exercício 2: Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT store_name, count(visit_page_date) AS visitas
FROM sales.funnel AS f
LEFT JOIN sales.stores AS s
ON f.store_id = s.store_id
GROUP BY s.store_id
ORDER BY visitas DESC

-- Exercício 3: Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
-- consultar colunas city e state
select city, state
from temp_tables.regions
limit 10
select city, state
from sales.customers
limit 10

-- Usar lower para deixar textos em minisculos na coluna city
SELECT size, count(*) AS Clientes
FROM sales.customers AS c
LEFT JOIN temp_tables.regions AS reg
ON LOWER (c.city) = LOWER (reg.city)
AND c.state = reg.state
GROUP BY size
ORDER BY Clientes DESC





