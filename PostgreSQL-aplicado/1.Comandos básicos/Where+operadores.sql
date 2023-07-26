-- COMANDO WHERE ##################################################################
-- Usado para filtrar linhas de acordo com uma condição


-- SINTAXE #########################################################################
-- select coluna_1, coluna_2, coluna_3
-- from schema_1.tabela_1
--  where condição_x=true

-- EXEMPLOS ########################################################################

-- Exemplo1: Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- Primeiro verificar o tipo de dados na coluna estado(state)
SELECT DISTINCT state
FROM sales.customers

SELECT email, state
FROM sales.customers
WHERE state = 'SC'

-- Exemplo 2: Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
SELECT email, state
FROM sales.customers
WHERE state = 'SC' or state = 'MS'

-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos (esse perfil de idade compra mais)

-- Conferir formato da data de nascimento (birth_date)
SELECT DISTINCT birth_date
FROM sales.customers
LIMIT 1
-- FOMATO YYYY-MM-DD

SELECT email, state, birth_date
FROM sales.customers
WHERE (state = 'SC' or state = 'MS') and birth_date < '1993-12-31' 
-- possível fazer com data sem os traços, birth_date < '19931231'

-- RESUMO ##########################################################################
-- (1) Comando WHERE utilizado para FILTRAR linhas de acordo com uma condição
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings
-- (3) string = sequência de caracteres = texto
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD'