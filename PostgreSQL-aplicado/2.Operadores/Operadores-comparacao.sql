-- OPERADORES DE COMPARAPAÇÃO #######################################################
-- utilizados para comparar dois valores retornando TRUE ou FALSE
-- Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção

-- TIPOS ###########################################################################
-- =
-- >
-- <
-- >=
-- <=
-- <> (diferente)

-- EXEMPLOS ########################################################################

-- Exemplo 1: Uso de operadores como flag (marcação na base)
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional CLT. Será usado para equipes de previsão sobre contratos fechados que for CLT
SELECT
    customer_id,
    first_name,
    professional_status,
	(professional_status = 'clt') AS cliente_CLT
FROM sales.customers


-- RESUMO ##########################################################################
-- (1) Servem para comparar dois valores retornando TRUE ou FALSE
-- (2) Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção
-- (3) Utilizados para criar colunas Flag que retornem TRUE ou FALSE
-- (4) Utilize o Guia de comandos para consultar os operadores utilizados no SQL