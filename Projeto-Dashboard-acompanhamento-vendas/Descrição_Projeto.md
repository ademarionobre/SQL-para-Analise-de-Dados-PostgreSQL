# Projeto: Dashboard de acompanhamentos de vendas

## Objetivo
### Criar um dashboard de vendas com os principais indicadores de desempenho e com os principais driver dos resultados do mês
![image](https://github.com/ademarionobre/SQL-para-Analise-de-Dados-PostgreSQL/assets/92057489/4b39d1ca-e038-40e2-9c4a-71fa2d67678b)
Questões requeridas
- Mostrar gráfico de receita no tempo
- Gráfico de leads e conversão no tempo
- Mapa com os estados que mais venderam
- Registros de visitas

Cliente utilizad MS Excel portanto as queries geradas irão alimentar planilha para gerar os gráficos

-- (Query 1) Receita, leads, conversão e ticket médio mês a mês
-- Colunas: mês, leads (#), vendas (#), receita (k, R$), conversão (%), ticket médio (k, R$)


-- (Query 2) Estados que mais venderam
-- Colunas: país, estado, vendas (#)


-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)


-- (Query 4) Lojas que mais venderam
-- Colunas: loja, vendas (#)


-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)
