-- FUNÇÕES DE AGREGAÇÃO  ############################################################
-- Utilizadas para executar operações aritmética nos registros de uma coluna 

-- TIPOS DE FUNÇÕES AGREGADAS ######################################################
-- COUNT()
-- SUM()
-- MIN()
-- MAX()
-- AVG()

-- EXEMPLOS ########################################################################

-- COUNT() CONTAGEM -------------------------------------------------------------------------

-- Exemplo 1: Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
SELECT COUNT(*)
FROM sales.funnel

-- Exemplo 2: Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 
SELECT COUNT (paid_date) -- não conta os dados nulos da coluna
FROM sales.funnel


-- Exemplo 3: Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
SELECT COUNT (DISTINCT product_id)
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31'

--------------------------------------------------------------------
-- Exemplo 4: Calcule o preço mínimo, máximo e médio dos productos da tabela products
SELECT MIN(price), MAX(price), AVG(price)
FROM sales.products

-- Exemplo 5: Informe qual é o *veículo* mais *caro* da tabela products. Usando subquerie
SELECT MAX(price)
FROM sales.products -- Aqui retornar somente maior valor

SELECT *
FROM sales.products
WHERE price = (SELECT MAX(price)
				FROM sales.products)

-- RESUMO ##########################################################################
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos