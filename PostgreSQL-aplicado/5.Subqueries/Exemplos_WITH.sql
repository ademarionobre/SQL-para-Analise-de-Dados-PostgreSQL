-- EXEMPLOS WITH ########################################################################

-- Exemplo 1: Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita (false) ou recorrente (true)

WITH primeira_visita AS (
	SELECT customer_id, MIN(visit_page_date) AS visitas
	FROM sales.funnel
	GROUP BY customer_id
	ORDER BY visitas DESC
)

SELECT
	f.visit_page_date,
	(f.visit_page_date <> primeira_visita.visitas) as Lead_recorrente,
	COUNT(*)
FROM sales.funnel AS f
LEFT JOIN primeira_visita
ON f.customer_id = primeira_visita.customer_id
GROUP BY f.visit_page_date, Lead_recorrente
ORDER BY f.visit_page_date DESC, Lead_recorrente


-- Exemplo 2: Análise da diferença de preço (preço versus o preço médio)
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo - tabea discount da sales.funnel)
-- Ver tabela coluna discount
SELECT visit_page_date, discount
FROM sales.funnel
ORDER BY visit_page_date
LIMIT 10

----
WITH preco_medio AS (

	SELECT brand, AVG(price) AS preco_medio_da_marca
	FROM sales.products
	GROUP BY brand
)

SELECT
	fun.visit_id,
	fun.visit_page_date,
	pro.brand,
	(pro.price * (1+fun.discount)) AS preco_final,
	preco_medio.preco_medio_da_marca,
	((pro.price * (1+fun.discount)) - preco_medio.preco_medio_da_marca) AS preco_vs_media

FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
	ON fun.product_id = pro.product_id
LEFT JOIN preco_medio
	ON pro.brand = preco_medio.brand