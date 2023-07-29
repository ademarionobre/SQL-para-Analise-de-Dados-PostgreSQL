-- TRATAMENTO DE DATAS E HOTAS######################################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- Subtração - (DATEDIFF não existe no PostgreeSQL)

-- EXEMPLOS ########################################################################

-- Exemplo 1: Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)

select current_date + 10 -- Por padrão soma os dias
SELECT CURRENT_DATE + INTERVAL '10 weeks' -- Resultado traz campos de horas
SELECT (CURRENT_DATE + INTERVAL '10 weeks')::date -- resultado sem hora
SELECT (CURRENT_DATE + INTERVAL '10 months')::date -- resultado sem hora
SELECT (CURRENT_DATE + INTERVAL '10 hours')


-- Exemplo 2: Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

-- Consulta abaixo calcula dia a dia
select visit_page_date, count(*)
from sales.funnel
group by visit_page_date
order by visit_page_date desc
-->
SELECT visit_page_date,
		DATE_TRUNC('month', visit_page_date)::date AS vistas_mes
FROM sales.funnel
limit 10 -- A consulta mostra as datas condensadas em meses. Necessário contar e agrupar.
-->
SELECT DATE_TRUNC('month', visit_page_date)::date AS visitas_mes, COUNT(*)
FROM sales.funnel
GROUP BY visitas_mes
ORDER BY visitas_mes DESC


-- Exemplo 3: Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site

-- Entendendo o comando
select
	'2022-01-30'::date,
	EXTRACT('dow' FROM '2022-01-30'::date)
-- Sigla dow = Day Of Week, dia da semana, que começa com 0 (domingo)
select
	current_date,
	EXTRACT('dow' FROM current_date) -- verifica o dia corrente

-- Resolução
SELECT EXTRACT ('DOW' FROM visit_page_date) AS Dia_semana,
	--TO_CHAR ("Dia da semana", 'Day') AS Dia,
	COUNT(*)
FROM sales.funnel
GROUP BY Dia_semana
ORDER BY Dia_semana DESC

-- Exemplo 4: Diferença entre datas com operador de subtração (-)
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.

SELECT (CURRENT_DATE - '2018-06-01')
SELECT (CURRENT_DATE - '2018-06-01')/7
SELECT (CURRENT_DATE - '2018-06-01')/30
SELECT (CURRENT_DATE - '2018-06-01')/365



-- RESUMO --------------------------------------------------------------------------
-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL
