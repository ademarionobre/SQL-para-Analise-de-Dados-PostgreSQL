-- Atualizando e deletando os dados

select * from disciplinas

-- atualizando nome de disciplina
update disciplinas set nome = 'economia'
where id_disciplina = 8

-- deletando disciplina
delete from disciplinas
where id_disciplina = 9

-- sempre usar o where para limitar a acao, por meio de filtro.