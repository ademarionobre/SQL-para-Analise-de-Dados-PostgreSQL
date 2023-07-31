-- LINHAS ########################################################################
-- Inserção de linhas
-- Atualização de linhas
-- Deleção de linhas

-- EXEMPLOS ########################################################################

-- Exemplo 1: Inserção de linhas
-- Insira os status 'desempregado(a)' e 'estagiário(a)' na temp_table.profissoes

-- Criar tabela tables.profissoes
CREATE TABLE temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
);

INSERT INTO temp_tables.profissoes
(professional_status, status_profissional)

VALUES
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público(a)'),
('student', 'estudante')

-- Adicionando mais linhas nas colunas

INSERT INTO temp_tables.profissoes
(professional_status, status_profissional)

VALUES
('unemployed', 'desempregado'),
('trainee','estagiário' )

SELECT *
FROM temp_tables.profissoes
LIMIT 10

-- Exemplo 2: Atualização de linhas
-- Corrija a tradução de 'estagiário(a)' de 'trainee' para 'intern' , estagiário para estagiario(a)
UPDATE temp_tables.profissoes
SET professional_status = 'intern'
WHERE status_profissional = 'estagiário'

UPDATE temp_tables.profissoes
SET status_profissional = 'estagiario(a)'
WHERE professional_status = 'intern'

select * from temp_tables.profissoes

-- Exemplo 3: Deleção de linhas
-- Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)'

DELETE FROM temp_tables.profissoes
WHERE status_profissional = 'desempregado' OR
status_profissional = 'estagiario(a)'

select * from temp_tables.profissoes

-- RESUMO ##########################################################################
-- (1) Para inserir linhas em uma tabela é necessário (a) Informar que valores serão 
-- inseridos com o comando INSERT INTO seguido do nome da tabela e nome das colunas 
-- (b) Inserir os valores manualmente em forma de lista após o comando VALUES
-- (2) Para atualizar as linhas de uma tabela é necessário (a) Informar qual tabela
-- será atualizada com o comando UPDATE (b) Informar qual o novo valor com o comando SET 
-- (c) Delimitar qual linha será modificada utilizando o filtro WHERE
-- (3) Para deletar linhas de uma tabela é necessário (a) Informar de qual tabela as
-- linhas serão deletadas com o comando DELETE FROM (b) Delimitar qual linha será 
-- deletada utilizando o filtro WHERE
