-- MANIPULAÇÃO DE TABELAS ########################################################################
-- Criação de tabela a partir de uma query, funcão
-- Criação de tabela a partir do zero
-- Deleção de tabelas

-- EXEMPLOS ########################################################################

-- Exemplo 1: Criação de tabela a partir de uma query + função
-- Crie uma tabela chamada customers_age com o id e a idade dos clientes. 
-- Chame-a de temp_tables.customers_age

SELECT
	customer_id,
	DATEDIFF ('years', birth_date, CURRENT_DATE) idade_cliente
	INTO temp_tables.customers_age
FROM sales.customers

SELECT *
FROM temp_tables.customers_age

-- Exemplo 2: Criação de tabela a partir do zero
-- Crie uma tabela com a tradução dos status profissionais dos clientes. 
-- Chame-a de temp_tables.profissoes

-- Consultando tabela professional_status
SELECT DISTINCT professional_status
FROM sales.customers

CREATE TABLE temp_tables.profissoes (
	professional_status VARCHAR,
	status_profissional VARCHAR)

SELECT * FROM temp_tables.profissoes

-- Inserindo dados na tabela
INSERT INTO temp_tables.profissoes
(professional_status, status_profissional)

VALUES
('freelancer', 'independente'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público(a)'),
('student', 'estudante')

SELECT *
FROM temp_tables.profissoes;


-- Exemplo 3: Deleção de tabelas
-- Delete a tabela temp_tables.profissoes

DROP TABLE temp_tables.profissoes;


-- RESUMO ##########################################################################
-- (1) Para criar tabelas a partir de uma query basta escrever a query normalmente e
-- colocar o comando INTO antes do FROM informando o schema e o nome da tabela 
-- a ser criada
-- (2) Para criar tabelas a partir do zero é necessário (a) criar uma tabela vazia 
-- com o comando CREATE TABLE (b) Informar que valores serão inseridos com o comando
-- INSERT INTO seguido do nome das colunas (c) Inserir os valores manualmente em forma 
-- de lista após o comando VALUES
-- (3) Para deletar uma tabela utiliza-se o comando DROP TABLE


