-- DESAFIO 5 - SUBQUERIE ########################################################################

-- Exercício 1: Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

-- Com with gerar tabela com registros de contagem de clientes para servir de base de visitas
WITH numero_visitas AS (
	SELECT
	customer_id, COUNT(*) AS n_visitas
	FROM sales.customers
	GROUP BY customer_id
)

SELECT
c.*, -- todos os campos da sales.customers
n_visitas

FROM sales.customers AS c
LEFT JOIN numero_visitas AS nv
ON c.customer_id = nv.customer_id
