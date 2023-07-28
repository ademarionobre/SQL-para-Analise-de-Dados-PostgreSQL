-- COMANDO GROUP BY + ORDER BY######################################################
-- GROUP BY : Utilizado para agrupar registros semelhantes de uma coluna
-- Normalmente utilizado em conjunto com as Funções de agregação
-- ORDER BY: Utilizado para ordernar (ASC ou DESC) por algum critério das colunas

-- EXEMPLOS ########################################################################

-- Exemplo 1: Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
SELECT state, COUNT(*) AS Contagem_Clientes
FROM sales.customers
GROUP BY state
ORDER BY Contagem_Clientes DESC

----------------------------------------------------------------------
-- Exemplo 2: Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 
SELECT state, professional_status, COUNT(*) AS Contagem_Clientes
FROM sales.customers
GROUP BY state, professional_status
ORDER BY state, Contagem_Clientes DESC

-- Outra forma(não recomendada para grandes consultas)
SELECT state, professional_status, COUNT(*) AS Contagem_Clientes
FROM sales.customers
GROUP BY 1, 2
ORDER BY state, Contagem_Clientes DESC

-------------------------------------------------------------------------
-- Exemplo 3: Seleção de valores distintos (Group by pode ser usado como DISTINCT)
-- Selecione os estados distintos na tabela customers utilizando o group by
SELECT DISTINCT state
FROM sales.customers

SELECT state
FROM sales.customers
GROUP BY state

-- RESUMO ##########################################################################
-- (1) Serve para agrupar registros semelhantes de uma coluna 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
-- (ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
-- (4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas