-- SUBQUERIES ##################################################################
-- Utilizado para consultar dados de outras consultas.

-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT

-- EXEMPLOS ########################################################################

-- Exemplo 1: Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products
SELECT *
FROM sales.products
WHERE price = (SELECT MIN(price)
			   FROM sales.products)

-- Exemplo 2: Subquery com WITH (Mais recomendado)
-- Calcule a idade média dos clientes por status profissional
WITH tabela_idade AS (
SELECT
	professional_status,
	(CURRENT_DATE - birth_date)/365 as idade
FROM sales.customers
)

SELECT
	professional_status,
	AVG(idade) AS idade_media
FROM tabela_idade
GROUP BY professional_status

-- Exemplo 3: Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional
SELECT
	professional_status,
	AVG(idade) AS idade_media
FROM (
		SELECT
			professional_status,
			(CURRENT_DATE - birth_date)/365 AS idade
		FROM sales.customers
	 ) AS tabela_idade
GROUP BY professional_status


-- Exemplo 4: Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento
SELECT 
	f.visit_id,
	f.visit_page_date,
	s.store_name,
	(
	SELECT COUNT(*)
	FROM sales.funnel as f1
	WHERE f1.visit_page_date <= f.visit_page_date
	AND f1.store_id = f.store_id
	LIMIT 100) AS visitas_acumuladas
FROM sales.funnel as f
LEFT JOIN sales.stores as s
ON f.store_id = s.store_id
ORDER BY s.store_name, f.visit_page_date
LIMIT 10
-- Conculta pesada, pois faz linha a linha, aplicando o limit 100 para ver o resultado do codigo



-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
-- apenas um único valor
-- (3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
-- dificulta a legibilidade da query.