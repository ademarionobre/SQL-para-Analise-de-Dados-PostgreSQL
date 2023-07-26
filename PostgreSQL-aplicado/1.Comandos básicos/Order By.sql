-- COMANDO ORDER BY#################################################################
-- Usado para ordenar a seleção de acordo com uma regra definida pelo usuário

-- SINTAXE #########################################################################
''' select coluna_1, coluna_2, coluna_3
	from schema_1.tabela_1
	where condição_x=true
	order by coluna_1 '''

-- EXEMPLOS ########################################################################

-- Exemplo 1: Ordenação de valores numéricos
-- Liste produtos da tabela products na ordem crescente com base no preço
SELECT *
FROM sales.products
LIMIT 10

SELECT *
FROM sales.products
ORDER BY price
-- ORDER BY price DESC; deixando em ordem descrecente

-- Exemplo 2: Ordenação de texto
-- Liste os estados distintos da tabela customers na ordem crescente
SELECT DISTINCT state
FROM sales.customers
ORDER BY state

-- RESUMO ##########################################################################
-- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida
-- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem 
-- decrescente usar o comando DESC
-- (3) No caso de strings a ordenação seguirá a ordem alfabetica
