/*
 *  Atividade lBD100.015
 *
 *  Crie uma procedure ou função que, ao digitar o
 *  nome de um livro, retorne concatenados quais
 *  alunos emprestaram aquele livro
 */


USE biblioteca;

DELIMITER $$
CREATE PROCEDURE alunosQueEmprestaramLivro(IN livro_nome VARCHAR(100))
BEGIN
    DECLARE alunos_list VARCHAR(1000) DEFAULT '';
    
    SELECT GROUP_CONCAT(a.nome SEPARATOR ', ') INTO alunos_list
    FROM alunos a
    INNER JOIN emprestimos e ON a.RA = e.RA
    INNER JOIN livros l ON e.id_livro = l.id_livro
    WHERE l.nome_livro = livro_nome;
    
    IF alunos_list IS NULL THEN
        SELECT CONCAT('Nenhum aluno emprestou o livro "', livro_nome, '".') AS resultado;
    ELSE
        SELECT CONCAT('Alunos que emprestaram o livro "', livro_nome, '": ', alunos_list) AS resultado;
    END IF;
END$$
DELIMITER ;





