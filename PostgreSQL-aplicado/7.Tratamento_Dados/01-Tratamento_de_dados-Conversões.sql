-- TRATAMENTO DE DADOS -------------------------------------------------------------
-- TIPOS DE CONVERSÃO ##############################################################

-- Operador ::
-- CAST

-- EXEMPLOS ########################################################################

-- Exemplo 1: Conversão de TEXTO em DATA
-- Corrija a query abaixo utilizando o operador ::
SELECT '2021-10-01' - '2021-02-01'

SELECT '2021-10-01'::date - '2021-02-01'::date
-- resultado retorna em dias
--Caso precisa-se tranformar toda uma coluna em data:
select nome_coluna::date
from nome_tabela



-- Exemplo 2: Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::
select '100' - '10'

SELECT '100'::numeric - '10'::numeric


-- Exemplo 3: Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::
select replace(112122,'1','A')

SELECT REPLACE (112122::TEXT,'1','A')


-- Exemplo 4: Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST
select '2021-10-01' - '2021-02-01'

SELECT CAST('2021-10-01' AS DATE) - CAST('2021-02-01' AS DATE)

-- RESUMO ##########################################################################
-- (1) O operador :: e o CAST() são funções utilizadas para converter um dado para 
-- a unidade desejada. 
-- (2) O operador :: é mais "clean", porém, em algumas ocasiões não funciona, sendo
-- necessário utilizar a função CAST()
-- (3) Use o Guia de comandos para consultar a lista de unidades mais utilizadas
