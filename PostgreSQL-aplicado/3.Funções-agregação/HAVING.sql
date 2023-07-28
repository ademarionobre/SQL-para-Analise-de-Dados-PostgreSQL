-- HAVING ##################################################################
-- Utilizado para filtrar linhas da seleção por uma coluna agrupada

-- EXEMPLOS ########################################################################

-- Exemplo 1: seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
SELECT COUNT(*), state
FROM sales.customers
GROUP BY state
HAVING COUNT(*) >100
-- HAVING COUNT(*) >100 AND <> 'MG' -- Pode-se usar mais filtros sem precisar do Where.

-- RESUMO ##########################################################################
-- (1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
-- (2) A função HAVING também pode filtrar colunas não agregadas