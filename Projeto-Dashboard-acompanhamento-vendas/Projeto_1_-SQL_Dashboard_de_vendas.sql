-- CONSULTAS PROJETO DASHBOARD DE VENDAS

-- Query 1: Receita, leads, conversão e ticket médio mês a mês
-- Colunas: mês, leads (#), vendas (#), receita (k, R$), conversão (%), ticket médio (k, R$)

-- Gerando consultas para obter colunas não explicitas nas tabelas. -- Visitas Leads e Mês

WITH leads AS (
			SELECT
				DATE_TRUNC('month', visit_page_date)::DATE AS visit_page_month,
				COUNT(*) AS visit_page_count
			FROM sales.funnel
			GROUP BY visit_page_month
			ORDER BY visit_page_month),

-- Criar vendas e receita
	pagamentos AS(
			SELECT
				DATE_TRUNC('month', f.paid_date)::date AS paid_month,
				COUNT(f.paid_date) AS paid_count,
				SUM(p.price * (1+f.discount)) AS receita

			FROM sales.funnel AS f
			LEFT JOIN sales.products AS p
			ON f.product_id = p.product_id
			WHERE f.paid_date IS NOT NULL -- Trazer dados preenchidas para somar valores registrados na receita
			GROUP BY paid_month
			ORDER BY paid_month)

-- Colunas conversão(%) e ticket médio -- A ideia é dividir paid_count pelo visit_page_count. Necessário juntar as queries.
SELECT
	l.visit_page_month AS "mês",
	l.visit_page_count AS "leads",
	pg.paid_count AS "vendas",
	(pg.receita/1000) AS "receita (k, R$)", -- Converter receita por mil
	(pg.paid_count::float/l.visit_page_count::float) AS "conversão(%)", -- Coluna conversao. Aplicando float para numero ficar decimal
	(pg.receita/pg.paid_count/1000) AS "ticket médio (k, R$)" -- Tiket = receita / numero de vendas. Unidade milhares.
FROM leads AS l
LEFT JOIN pagamentos AS pg
ON l.visit_page_month = paid_month


-- Query 2: Estados que mais venderam
-- Colunas: país, estado, vendas (#)

SELECT
	'Brazil' AS país, -- Gerando uma coluna país (conteúdo Brazil) para orientar quando for exportar para o excel e gerar localização no map.
	c.state AS estado,
	COUNT(f.paid_date) AS "vendas (#)"

FROM sales.funnel AS F
LEFT JOIN sales.customers AS C
	ON f.customer_id = c.customer_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY país, estado
ORDER BY "vendas (#)" DESC

-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)
SELECT
	p.brand AS marca,
	COUNT(f.paid_date) AS "vendas (#)"

FROM sales.funnel AS f
LEFT JOIN sales.products AS p
	ON f.product_id = p.product_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY marca
ORDER BY "vendas (#)" DESC


-- (Query 4) Lojas que mais venderam (5 TOP)
-- Colunas: loja, vendas (#)
SELECT
	s.store_name AS loja,
	COUNT(f.paid_date) AS "vendas (#)"

FROM sales.funnel AS f
LEFT JOIN sales.stores AS s
	ON f.store_id = s.store_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY loja
ORDER BY "vendas (#)" DESC
LIMIT 5

-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)
SELECT
	EXTRACT('dow' FROM visit_page_date) AS dia_semana,
	CASE 
		WHEN EXTRACT('dow' FROM visit_page_date)=0 THEN 'domingo'
		WHEN EXTRACT('dow' from visit_page_date)=1 THEN 'segunda'
		WHEN EXTRACT('dow' from visit_page_date)=2 THEN 'terça'
		WHEN EXTRACT('dow' from visit_page_date)=3 THEN 'quarta'
		WHEN EXTRACT('dow' from visit_page_date)=4 THEN 'quinta'
		WHEN EXTRACT('dow' from visit_page_date)=5 THEN 'sexta'
		WHEN EXTRACT('dow' from visit_page_date)=6 THEN 'sábado'
		ELSE NULL END AS "dia da semana",
	COUNT(*) AS "visitas (#)"

FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY dia_semana
ORDER BY dia_semana
