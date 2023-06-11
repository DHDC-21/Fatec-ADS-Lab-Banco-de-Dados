/*
 *  Atividade lBD100.013
 *
 *  Crie uma visão que liste os livros
 *  emprestados em cada curso.
 *  Crie uma busca com subquery retornado o curso de
 *  ADS e use ela para filtrar um query na visão.
 */


USE biblioteca;

CREATE VIEW livros_emprestados_por_curso AS
SELECT
  c.nome AS curso,
  l.nome_livro AS livro,
  l.autor AS autor,
  e.data_emprestimo AS data_emprestimo,
  e.data_devolucao AS data_devolucao
FROM
  livros l
  JOIN emprestimos e ON l.id_livro = e.id_livro
  JOIN alunos a ON e.RA = a.RA
  JOIN cursos c ON a.curso = c.nome
WHERE
  e.devolvido = 0;

SELECT *
FROM livros_emprestados_por_curso
WHERE curso = (
  SELECT nome
  FROM cursos
  WHERE nome = 'ADS'
);
