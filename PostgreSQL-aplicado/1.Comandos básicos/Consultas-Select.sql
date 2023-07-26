-- COMANDO SELECT
-- Usado para selecionar colunas de tabelas
-- Exercício

-- Demanda 1: Seleção de uma coluna de uma tabela
-- Liste os 'e-mails' dos 'clientes' da tabela 'sales.customers'

SELECT email
FROM sales.customers

-- Demanda 2: Seleção de mais de uma coluna de uma tabela
-- Liste os emails e nomes dos clientes da tabela sales.customers
SELECT email, first_name, last_name
FROM sales.customers

-- Demanda 3: Seleção de TODAS as colunas de uma tabela
-- Liste todos as informações dos clientes da tabela sales.customers
-- Limitando os 100 primeiros registros.
SELECT *
FROM sales.customers
LIMIT 100

-- RESUMO ***********************************************************************
-- (1) Comando SELECT usado para selecionar colunas de tabelas
-- (2) Quando selecionar mais de uma coluna, elas devem ser separadas por vírgula 
-- sem conter vírgula antes do comando FROM
-- (3) Pode-se utilizar o asterisco (*) para selecionar todas as colunas da tabela

