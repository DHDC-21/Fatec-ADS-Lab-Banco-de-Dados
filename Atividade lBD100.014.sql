/*
 * Atividade lBD100.014
 *
 * Modifique a função do exemplo anterior para saber
 * quantos livros o aluno já emprestou.
 * Crie uma outra função que retorne o nome do aluno
 * que mais emprestou livros
 */


USE biblioteca;

DELIMITER $$
CREATE FUNCTION quantidadeLivrosEmprestados(RAAluno INT)
RETURNS INT
BEGIN
  DECLARE qtd INT;
  
  SELECT COUNT(*) INTO qtd
  FROM emprestimos
  WHERE RA = RAAluno;
  
  RETURN qtd;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION alunoMaisEmprestouLivros()
RETURNS VARCHAR(100)
BEGIN
    DECLARE aluno_nome VARCHAR(100);
    
    SELECT a.nome INTO aluno_nome
    FROM (
        SELECT RA, COUNT(*) AS qtd_emprestimos
        FROM emprestimos
        GROUP BY RA
        ORDER BY qtd_emprestimos DESC
        LIMIT 1
    ) AS max_emprestimos
    INNER JOIN alunos a ON max_emprestimos.RA = a.RA;
    
    RETURN aluno_nome;
END$$
DELIMITER ;
