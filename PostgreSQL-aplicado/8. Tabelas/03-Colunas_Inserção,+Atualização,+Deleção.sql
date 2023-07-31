-- COLUNAS  ########################################################################
-- Inserção de colunas
-- Alteração de colunas
-- Deleção de colunas

-- EXEMPLOS ########################################################################

-- Exemplo 1: Inserção de Colunas
-- Insira uma coluna na tabela sales.customers com a idade do cliente

ALTER TABLE sales.customers
ADD customer_age INT

SELECT * FROM sales.customers LIMIT 5

UPDATE sales.customers
SET customer_age = DATEDIFF ('years',birth_date, CURRENT_DATE)
WHERE TRUE -- Todas a linhas para serem atualizadas

-- Exemplo 2: Alteração do tipo da coluna
-- Altere o tipo da coluna customer_age de inteiro para varchar
ALTER TABLE sales.customers
ALTER COLUMN customer_age TYPE VARCHAR


-- Exemplo 3 Alteração do nome da coluna
-- Renomeie o nome da coluna "customer_age" para "age"
ALTER TABLE sales.customers
RENAME customer_age TO age

-- Exemplo 4: Deleção de coluna
-- Delete a coluna "age"
ALTER TABLE sales.customers
DROP COLUMN age

-- RESUMO ##########################################################################
-- (1) Para fazer qualquer modificação nas colunas de uma tabela utiliza-se o comando 
-- ALTER TABLE seguido do nome da tabela
-- (2) Para adicionar colunas utiliza-se o comando ADD seguido do nome da coluna e da
-- unidade da nova coluna
-- (3) Para mudar o tipo de unidade de uma coluna utiliza-se o comando ALTER COLUMN 
-- (4) Para renomear uma coluna utiliza-se o comando RENAME COLUMN
-- (5) Para deletar uma coluna utiliza-se o comando DROP COLUMN
