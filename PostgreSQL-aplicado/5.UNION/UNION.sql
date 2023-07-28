-- UNION / UNION ALL ###############################################################
-- UNION: Remove linhas duplicadas ao unir tabelas (Confere os dados)
-- UNION ALL: Não remover linhas duplicadas ao unir tabelas

-- SINTAXE #########################################################################
select coluna_1, coluna_2
from schema_1.tabela_1

union / union all

select coluna_3, coluna_4 
from schema_2.tabela_2


-- EXEMPLOS ########################################################################

-- Exemplo 1: União simples de duas tabelas
-- Una a tabela sales.products com a nova tabela temp_tables.products_2
-- Conferindo conteúdo
SELECT * FROM sales.products
SELECT * FROM temp_tables.products_2

-- Por se tratar da nova tabela ter apenas marcas novas, basta aplicar um UNION ALL
SELECT * FROM sales.products
UNION ALL
SELECT * FROM temp_tables.products_2