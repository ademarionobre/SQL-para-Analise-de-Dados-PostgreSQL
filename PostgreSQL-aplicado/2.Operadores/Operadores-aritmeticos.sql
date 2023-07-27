-- OPERADORES ######################################################################
-- Utilizados para executar operações matemáticas
-- Muito utilizados para criar colunas calculadas

-- TIPOS ###########################################################################
-- +
-- -
-- *
-- /
-- ^
-- %
-- || --> Pipe de concatenar, não é um operador aritmético.


-- EXEMPLOS ########################################################################

-- Exemplo 1: Criação de coluna calculada
-- Equipe de marketing que fazer campanha segmentada com base na idade dos clientes.
-- Criar uma coluna contendo a idade do cliente da tabela sales.customers

-- Verificar colunas da base
SELECT *
FROM sales.customers
LIMIT 10

SELECT 
	first_name AS Nome_cliente,
	email,
	birth_date,
	(current_date - birth_date)/365 AS "Idade do cliente"
FROM sales.customers
-- usamos funcao current_date para data de hoje. A diferenca vem em dias, necessario /365
-- para converter dias em anos inteiros.


-- Exemplo 2: Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers
SELECT 
	first_name AS Nome_cliente,
	email,
	birth_date,
	(current_date - birth_date)/365 AS "Idade do cliente"
FROM sales.customers
ORDER BY "Idade do cliente"
LIMIT 10


-- Exemplo 3: Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
SELECT 
	first_name || ' ' || last_name AS "Nome completo"
FROM sales.customers
LIMIT 10


-- RESUMO ##########################################################################
-- (1) Servem para executar operações matemáticas
-- (2) Muito utilizado para criar colunas calculadas
-- (3) Alias (pseudônimos/apelidos) são muito utilizados para dar nome as colunas calculadas.
-- (4) Para criar apelidos que contém espaços no nome são utilizadas aspas duplas ""
-- (5) No caso de strings o operador de adição (||) irá concatenar (juntar) as strings
-- (6) Utilize o Guia de comandos para consultar os operadores utilizados no SQL
