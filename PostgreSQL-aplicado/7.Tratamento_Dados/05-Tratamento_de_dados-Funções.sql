-- FUNÇÕES #################################################################
-- Utilizado para criar comandos personalizados de scripts usados recorrentemente.

-- EXEMPLOS ########################################################################

-- Exemplo 1: Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses, anos

select (current_date - '2018-06-01')
select (current_date - '2018-06-01')/7
select (current_date - '2018-06-01')/30
select (current_date - '2018-06-01')/365

-- Criando a função
CREATE FUNCTION DATEDIFF(unidade VARCHAR, data_inicial DATE, data_final DATE)
RETURNS INTEGER
LANGUAGE SQL

AS

$$
SELECT
		CASE
			WHEN unidade IN ('d', 'day', 'days') THEN (data_final - data_inicial)
			WHEN unidade IN ('w', 'week', 'weeks') THEN (data_final - data_inicial)/7
			WHEN unidade IN ('m', 'month', 'months') THEN (data_final - data_inicial)/30
			WHEN unidade IN ('y', 'year', 'years') THEN (data_final - data_inicial)/365
			END AS diferenca
$$
--
SELECT DATEDIFF ('day', '2022-02-02', CURRENT_DATE)
SELECT DATEDIFF ('week', '2022-02-02', CURRENT_DATE)
SELECT DATEDIFF ('month', '2022-02-02', CURRENT_DATE)
SELECT DATEDIFF ('year', '2022-02-02', CURRENT_DATE)


-- Exemplo 2: Delete a função DATEDIFF criada no exercício anterior
DROP FUNCTION DATEDIFF



-- RESUMO ##########################################################################
-- (1) Para criar funções, utiliza-se o comando CREATE FUNCTION
-- (2) Para que o comando funcione é obrigatório informar (a) quais as unidades dos 
-- INPUTS (b) quais as unidades dos OUTPUTS e (c) em qual linguagem a função será escrita
-- (3) O script da função deve estar delimitado por $$
-- (4) Para deletar uma função utiliza-se o comando DROP FUNCTION

