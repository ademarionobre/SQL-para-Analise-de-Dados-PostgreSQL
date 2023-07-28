-- USO DE JOINS ########################################################################

-- Exemplo 1: Identifique qual é o 'status profissional' mais 'frequente' nos clientes 
-- que 'compraram' automóveis no site

-- Pelo diagrama das tabelas, necessário juntar dados da tabela funnel e customers.
 
SELECT c.professional_status, count(f.paid_date) AS pagamentos
FROM sales.funnel AS f
LEFT JOIN sales.customers AS c
ON f.customer_id = c.customer_id
GROUP BY c.professional_status
ORDER BY pagamentos DESC


-- Exemplo 2 Identifique qual é o 'gênero' mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders (Fonte IGBGE)

-- Necessário fazer dois joins, tratar os dados de nomes para que fiquem em iguais no formato minusculo. Comando lower

-- Consultado a tabela
SELECT *
FROM temp_tables.ibge_genders
LIMIT 10

-- Resolução
SELECT genero.gender,
	COUNT(f.paid_date)
FROM sales.funnel AS f
LEFT JOIN sales.customers AS c -- trazer os ID
ON f.customer_id = c.customer_id
LEFT JOIN temp_tables.ibge_genders AS genero -- outro join para cruzar com a tabela nomes e generos do banco temp_table
ON LOWER (c.first_name) = genero.first_name
GROUP BY genero.gender


-- Exemplo 3: Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

-- Consultando tabelas
SELECT * FROM sales.customers LIMIT 10
SELECT * FROM temp_tables.regions LIMIT 10
-- Campo City possuem palavras e letras maiuscula e minisculas, precisa padronizar com Lower

SELECT
	reg.region,
	COUNT(f.visit_page_date) AS visitas
FROM sales.funnel AS f
LEFT JOIN sales.customers AS c
ON f.customer_id = c.customer_id
LEFT JOIN temp_tables.regions AS reg
ON LOWER (c.city) = LOWER (reg.city)
AND c.state = reg.state
GROUP BY reg.region
ORDER BY visitas DESC

-- Região Sudeste mais visitas.
