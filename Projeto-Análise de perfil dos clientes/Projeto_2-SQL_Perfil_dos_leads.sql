-- PROJETO - PERFIL DO LEADS

-- Query 1: Gênero dos leads (Alimentar o gráfico de gêneros) e quantidade destes.
-- Colunas: gênero, leads(#)

-- Nota: Tabela ibge_genders contém os generos.
-- O primeiro nome dos leads estar minusculo na tabela acima e maiusculo na tabela customers.
SELECT * FROM temp_tables.ibge_genders limit 5

SELECT
	CASE
		WHEN g.gender = 'male' THEN 'homem'
		WHEN g.gender = 'female' THEN 'mulher'
		END AS "Gênero",
	COUNT(*) AS "leads(#)"

FROM sales.customers AS c
LEFT JOIN temp_tables.ibge_genders AS g
ON LOWER (c.first_name) = LOWER(g.first_name)
GROUP BY g.gender


-- Query 2: Status profissional dos leads. Nota: trazer em português
-- Colunas: status profissional, leads (%). Nota: necessário uma subquerie
select distinct professional_status from sales.customers

SELECT 
	CASE
		WHEN professional_status = 'freelancer' THEN 'freelancer'
		WHEN professional_status = 'retired' THEN 'aposentado'
		WHEN professional_status = 'clt' THEN 'clt'
		WHEN professional_status = 'self_employed' THEN 'autônomo(a)'
		WHEN professional_status = 'other' THEN 'outro'
		WHEN professional_status = 'businessman' THEN 'empresário(a)'
		WHEN professional_status = 'civil_servant' THEN 'funcionário(a) público(a)'
		WHEN professional_status = 'student' THEN 'estudante'
		END AS "Status profissional",
	(COUNT(*)::float)/(select count(*) from sales.customers) AS "Leads (%)"-- total de lead da base

FROM sales.customers
GROUP BY professional_status
ORDER BY "Leads (%)" DESC

-- Query 3: Faixa etária dos leads
-- Colunas: faixa etária, leads (%)
SELECT
	CASE
		WHEN DATEDIFF ('years', birth_date, current_date) < 20 THEN '0-20'
		WHEN DATEDIFF ('years', birth_date, current_date) < 40 THEN '20-40'
		WHEN DATEDIFF ('years', birth_date, current_date) < 60 THEN '40-60'
		WHEN DATEDIFF ('years', birth_date, current_date) < 80 THEN '60-80'
		ELSE '80+' END "faixa etária",
		COUNT(*)::float/(select count(*) from sales.customers) AS "leads (%)"
FROM sales.customers
GROUP BY "faixa etária"
ORDER BY "faixa etária" DESC


-- Query 4: Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem (coluna para ordenar a coluna faixa salarial)
-- Definido as rendas no intevalo de 5k a 5k
SELECT
	CASE
		WHEN income < 5000 THEN '0-5000'
		WHEN income < 10000 THEN '5000-10000'
		WHEN income < 15000 THEN '10000-15000'
		WHEN income < 20000 THEN '15000-20000'
		ELSE '20000+' END "faixa salarial",
		COUNT(*)::float/(select count(*) from sales.customers) AS "leads (%)",
	CASE -- Gerar coluna de ordem para aplicar na coluna faixa salarial
		WHEN income < 5000 THEN 1
		WHEN income < 10000 THEN 2
		WHEN income < 15000 THEN 3
		WHEN income < 20000 THEN 4
		ELSE 5 END "ordem"

FROM sales.customers
GROUP BY "faixa salarial", "ordem"
ORDER BY "ordem" DESC

-- Query 5: Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos (não existe informacao se o carro é novo seminovo)
WITH
	classificacao_veiculos AS (
		SELECT
			f.visit_page_date,
			p.model_year,
			EXTRACT('year' from visit_page_date) - p.model_year::int AS idade_veiculo,
			CASE
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=2 THEN 'novo'
				ELSE 'seminovo'
				END AS "classificação do veículo"
		
		FROM sales.funnel as f
		LEFT JOIN sales.products as p
			ON f.product_id = p.product_id	
	)

SELECT
	"classificação do veículo",
	COUNT(*) AS "veículos visitados (#)"
FROM classificacao_veiculos
GROUP BY "classificação do veículo"


-- Query 6: Idade dos veículos visitados (definir faixa)
-- Colunas: Idade do veículo, veículos visitados (%), ordem
WITH
	faixa_idade_veiculos AS (
			SELECT
			f.visit_page_date,
			p.model_year,
			EXTRACT('year' from visit_page_date) - p.model_year::int as idade_veiculo,
			CASE
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=2 THEN 'até 2 anos'
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=4 THEN 'de 2 à 4 anos'
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=6 THEN 'de 4 à 6 anos'
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=8 THEN 'de 6 à 8 anos'
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=10 THEN 'de 8 à 10 anos'
				ELSE 'acima de 10 anos'
				END AS "idade do veículo",
			CASE
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=2 THEN 1
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=4 THEN 2
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=6 THEN 3
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=8 THEN 4
				WHEN (extract('year' from visit_page_date) - p.model_year::int)<=10 THEN 5
				ELSE 6
				END AS "ordem"

		FROM sales.funnel AS f
		LEFT JOIN sales.products as p
			ON f.product_id = p.product_id	
	)

SELECT
	"idade do veículo",
	COUNT(*)::float/(select count(*) from sales.funnel) AS "veículos visitados (%)",
	ordem
FROM faixa_idade_veiculos
GROUP BY "idade do veículo", ordem
ORDER BY ordem



-- Query 7: Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)

SELECT p.brand, p.model,
	COUNT(*) AS "visitas (#)"
FROM sales.funnel AS f
LEFT JOIN sales.products AS p
ON f.product_id = p.product_id

GROUP BY p.brand, p.model
ORDER BY p.brand, p.model, "visitas (#)" DESC


