-- Inserindo valores nas tabelas

select * from disciplinas

insert into disciplinas values
(1, 'portugues', 'literatura e gramatica'),
(2, 'matematica', 'algebra e geometrtia'),
(3, 'fisica', 'cinematica e dinamica');

--Importar dados do csv
copy disciplinas(id_disciplina, nome, ementa)
from 'E:\CURSOS\Curso SQL e NoSQL\postgreSQL\disciplinas.csv'
delimiter ',' --indicar o separador dos dados
csv header --descartar o cabeçalho

insert into disciplinas values
(8, 'economias', 'econometria'),
(9, 'mecatronica', 'programacao e robotica');