/*
 * Atividade lBD100.006
 *
 * No banco criado para a atividade da biblioteca
 * Crie uma variável chamada muito atrasado que tenha
 * o valor de 5 dias atrás
 * Monte uma query para obter os livros atrasados
 * Crie uma busca condicionalonde quem está com
 * mais de 5 dias atrasado retorne como
 * "Muito Atrasado", quem está a menos de 5 dias de atraso
 * retorne como "Atrasado" e quem está no prazo
 * retorne "No prazo". Pode se usar uma data fixa.
*/

USE biblioteca;


SET @muito_atrasado = DATE_SUB(CURDATE(), INTERVAL 5 DAY);


SELECT l.nome AS nome_livro, a.nome AS nome_aluno, e.data_devolucao, 
CASE 
   WHEN e.data_devolucao < @muito_atrasado THEN 'Muito Atrasado'
   WHEN e.data_devolucao < CURDATE() THEN 'Atrasado'
   ELSE 'No prazo'
END AS situacao
FROM emprestimos e
INNER JOIN livros l ON e.livro_id = l.id
INNER JOIN alunos a ON e.aluno_id = a.id;

