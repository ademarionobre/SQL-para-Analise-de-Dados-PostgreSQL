![image](https://github.com/ademarionobre/SQL-para-Analise-de-Dados-PostgreSQL/assets/92057489/ef58220a-0526-423c-b6a5-f62037671532)
# PostgreSQL: Introdução prática ao serviço

O excesso de informações geradas e gerenciadas pelas empresas nunca foi tão grande, e só aumenta com o passar do tempo.
Lidar com essa enxurrada exige tecnologia, inteligência e ferramentas. Para isso, bancos de dados objeto-relacionais viabilizam a organização e a qualidade das informações do seu negócio.
Estamos na era digital e isso reforça a importância de se manter atualizado com as tendências de Big Data e Big Query.

## O que é PostgreSQL?
O PostgreSQL é um sistema de gerenciamento de banco de dados objeto-relacional (SGBDOR), desenvolvido como projeto de código aberto com mais de 30 anos de desenvolvimento ativo sob licença do TLP (The PostgreSQL License). 
Dessa forma, o PostgreSQL tem um forte reputação de confiabilidade, robustez, recursos e desempenho, principalmente pela dedicação da comunidade de código aberto por trás do software.
O PostgreSQL suporta cargas de trabalho consideráveis e consegue processar grandes volumes de informações.  

### Algumas características desse SGBDOR são:

1. Consultas complexas.
2. Software robusto e de alta qualidade com código de manutenção e bem comentado.
3. Chaves estrangeiras.
4. Integridade transacional.
5. Controle de concorrência multi-versão.
6. Suporte ao modelo híbrido objeto relacional.
7. Facilidade de acesso.
8. Linguagem procedural em várias linguagens para procedimentos armazenados.
9. Indexação por texto.  
    
Além disso, o PostgreSQL utiliza e estende a linguagem SQL (Structured Query Language), a linguagem de instruções utilizadas para conversar com banco de dados relacionais, podendo ser executado em todos os principais sistemas operacionais.  

### Alguns recursos deste SGBD são:

- Tipos de Dados
- Primitivos: Integer, Numeric, String, Boolean
- Estruturada: Date/Time, Array, Range, UUID
- Documento: JSON/JSONB, XML, Key-value (Hstore)
- Geometria: Ponto, Linha, Círculo, Polígono
- Customizações: Tipos compostos e personalizados  
### Integridade de Dados
- UNIQUE, NOT NULL
- Chaves Primárias
- Chaves Estrangeiras
- Restrições de Exclusão
- Bloqueios explícitos, bloqueios consultivos  
### Simultaneidade, Performance
- Indexação
- Transações, Transações Aninhadas
- Controle de Simultaneidade de várias Versões
- Paralelização de Consultas
- Particionamento de Tabela
- Todos os níveis de isolamento de transação definidos no padrão SQL
- Compilação just-in-time de expressões
### Confiabilidade, Recuperação de Desastres
- Log de gravação antecipada
- Replicação: Assíncrona, Síncrona, Lógica
- Recuperação Pontual, Reservas Ativas
- Tablespaces  
### Segurança
- Autenticação
- Sistema de Controle de Acesso Robusto
- Segurança em Nível de Coluna e Linha
- Autenticação Multifator com Certificados  
### Extensibilidade
- Funções e Procedimentos Armazenados
- Linguagens Procedurais  
### Internacionalização, Pesquisa de Texto
- Suporte para conjunto de caracteres internacionais
- Case-insensitive
- Pesquisa de Texto Completo  

Quando PostgreSQL é baixado e instalado junto vem um utilitário importante: o **psql**.

## PSQL para gerenciar o PostgreSQL  
Psql é um utilitário utilizado para administrar e gerenciar o PostgreSQL. É um cliente terminal que permite digitar comandos SQL ou meta-comandos, permitindo enviar instruções ao Postgres.  
Outra característica é que  podemos efetuar conexões remotas e também usá-lo como uma ferramenta de script.  
No Windows, para acessá-lo, abra o Prompt de Comando (CMD) e digite:
``` psql --U postgres ```  

Para efetuar conexões remotas:  
```psql -h hostname -p 5432 -d dbname -U username -W```  
Vale enfatizar que, na configuração de acesso ao postgres, não utilize uma senha fraca, como normalmente usam “postgres”. Desse jeito, isso tornará o sistema vulnerável a ataques de crackers.

O usuário postgres é um superusuário padrão do PostgreSQL, similar ao usuário root do MySQL. Quando você rodar o comando, será pedida a senha e você deverá digitar a senha que foi configurada.

Se tudo ocorreu bem, nenhum erro foi gerado e já está com acesso. Agora, podemos rodar comandos para se comunicar com o PostgreSQL, utilizando meta-comandos ou SQL puro. Inclusive, vamos falar um pouquinho sobre estes últimos.

## Meta-comandos
Um meta-comando é um comando para cliente psql, já que o SQL é enviado para o servidor de banco de dados.  
Todas as linhas que começam com contrabarra ( \ ), ou barra invertida, como o primeiro caractere não vazio são presumidos como meta-comandos. O próprio psql processa esse comando, tornando-o mais útil para administração e scripts.  
## Alguns meta-comandos e para que servem:  

\a – se o formato de saída da tabela atual não estiver alinhado, ele será alterado para alinhado. Se não estiver desalinhado, é definido como desalinhado.  
\q – informa ao cliente para sair do banco de dados.  
\cd – altera o diretório de trabalho atual. Sem argumento, muda para diretório home do usuário atual.  
\C – define o título de qualquer tabela sendo impressa como resultado de uma consulta ou remove a definição de qualquer título.  
\connect – estabelece uma nova conexão com o servidor PostgreSQL.  
\copy – esta é uma operação que executa um comando SQL COPY, mas em vez de o servidor ler ou gravar o arquivo especificado, o psql lê ou grava o arquivo e roteia os dados entre o servidor e o sistema de arquivos local.  
\copyright – mostra os direitos autorais e os termos de distribuição do PostgreSQL.  
\d – para cada relação ou tipo composto correspondente ao padrão, mostra todas colunas, seus tipos, o espaço de tabela (se não o padrão) e quaisquer atributos especiais, como NOT NULL ou padrões.  
\da – lista funções agregadas, junto com seu tipo de retorno e os tipos de dados nos quais operam. Se o padrão for especificado, apenas agregados cujos nomes correspondem ao padrão são mostrados.  
\db – lista os tablespaces.  
\dc – lista conversões entre codificações de conjunto de caracteres.  
\dC – lista os tipos de conversões.  
\dd – mostra as descrições de objetos de restrição de tipo, classe de operador, família de operadores, regras e gatilho.  
\dD – lista os domínios.  
\ddp – lista as configurações de privilégios de acesso padrão.  
\df – lista funções, juntamente com seus tipos de dados de resultado, tipo de dados de argumento e tipos de função.  
\dl – alias para \lo_list, que mostra uma lista de objetos grandes.  
\dn – lista os esquemas (namespaces).  
\do – lista os operadores com seus operandos e tipos de resultado.  
\dp – listas tabelas, visualizações e sequências com seus privilégios de acesso associados.  
\du – lista funções do banco de dados.  
\echo – imprime os argumentos avaliados na saída padrão, separados por espaços e seguidos por uma nova linha.  
\encoding – define a codificação do conjunto de caracteres do cliente. Sem um argumento, esse comando mostra a codificação atual.  
\f – define o separador de campo para saída de consulta não alinhada. O padrão é barra vertical (|). É equivalente a \pset fieldsep.  
\g – envia o buffer de consulta atual ao servidor para execução.  
\help – fornece ajuda de sintaxe no comando SQL especificado. Se o comando não for especificado, o psql listará todos os comandos para os quais a ajuda de sintaxe está disponível.  
\i – lê a entrada do arquivo filename e o executa como se tivesse sido digitado no teclado.  
\r – reinicia (limpa) o buffer de consulta.  
\s – imprime o histórico da linha de comando do psql para filename.  
\set – define o nome da variável psql para o valor ou, se mais de um valor for fornecido, para concatenação de todos eles.  
\t – alterna a exibição de cabeçalhos de nome de coluna de saída e rodapé de contagem de linha.  
\z – lista tabelas, visualizações e sequências com seus privilégios de acessos associados.  

A definição completa de todos os meta-comandos, além de todos os aspectos oficiais relacionados ao postegres, pode ser encontrado na documentação oficial do PostgreSQL: https://www.postgresql.org/files/documentation/pdf/13/postgresql-13-US.pdf

## SQL e PostgreSQL  
SQL é um acrônimo para Structured Query Language (Linguagem de Consulta Estruturada). E o seu nome sugere exatamente o que ela faz:  
É uma linguagem de consulta declarativa utilizada por programadores e/ou administradores de banco de dados para comunicar-se com os bancos de dados relacionais através de instruções competentes a sua estrutura.  

Você pode usá-la no psql também.  

## Criando uma base de dados:
```
CREATE DATABASE <<NOME_DO_SEU_BANCO_DE_DADOS>>
Criando uma tabela/relação na base de dados:

CREATE TABLE <<NOME_DA_TABELA>> (

/* DEFINIÇÃO DOS CAMPOS DA TABLE */

);
Inserindo dados na tabela

INSERT INTO <<NOME_DA_TABELA>> VALUE (

/*VALORES SEQUENCIALMENTE DE ACORDO COM A TABELA SEPARADOS POR VÍRGULA*/

);
Projetando conjunto de resultados

SELECT <<LISTA_DE_SELEÇÃO>> FROM <<NOME_DA_TABELA>>;
```
## Aplicação rotineiramente **pgAdmin**.  

### pgAdmin e PostgreSQL  
O pgAdmin é uma aplicação cliente com interface gráfica de usuário (GUI)  que envia e recebe em SQL para o postgres. Um cliente pgAdmin pode acessar muitos servidores postgres e um servidor postgreSQL pode ser acessado por muitos clientes pgAdmin simultaneamente.  
Neste link podemos encontrar mais informações sobre o pgAdmin, algumas suas funcionalidades atuais: https://www.pgadmin.org/.  
No sistema operacional Windows, depois do postgresql instalado, você pode encontrá-lo digitando na barra de pesquisa no menu iniciar.  
![image](https://github.com/ademarionobre/SQL-para-Analise-de-Dados-PostgreSQL/assets/92057489/9077a087-a00c-4f62-89f8-a90bd8f9d425)

Ao executá-lo, um servidor Web será iniciado na sua máquina e poderá ser acessado pelo seu navegador padrão. Abaixo uma imagem da interface.
![image](https://github.com/ademarionobre/SQL-para-Analise-de-Dados-PostgreSQL/assets/92057489/c1389002-5a78-437b-9377-9c1af579ea14)

## Conexão de uma aplicação ao PostgreSQL  
A conexão de uma aplicação a um banco de dados depende de como cada linguagem de programação ou framework realiza, variando em maneiras diferentes de se fazer isso, e com PostgreSQL não é diferente. Por exemplo, no caso do Java, a conexão pode ser feita utilizando o JDBC. Em Python, podemos utilizar a interface pyPostgreSQL.  

**Python**  
Depois que o pyPostgreSQL estiver instalado, podemos codificar a conexão da seguinte forma:  
```
import postgresql  
db = postgresql.open( user = ‘username’, database = ‘database_name’, port = 5432, password = ‘password’ )
````
Existem várias formas de realizar essa conexão para várias linguagens de frameworks que lidam com o banco de dados, principalmente os relacionais.  

# Conclusão
PostgreSQL é versátil e prático. Existem diveras tecnologias com o mesmo objetivo de sistemas gerenciadores de dados, mas eles seguem o mesmo padrão de funcionalidade.  

É isso!

Fonte de referência: Farid Londono
