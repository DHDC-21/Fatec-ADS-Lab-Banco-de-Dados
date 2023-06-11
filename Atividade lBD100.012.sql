/*
 *  Atividade lDB100.0012
 *
 *  Crie uma transação onde se busque livro e aluno pelo
 *  nome e crie o empréstimo. Tente impedir o
 *  empréstimo se o livro já estiver emprestado.
 */


USE biblioteca;

START TRANSACTION;


SELECT codigo INTO @codigoLivro FROM Livro
WHERE nome = 'Nome do Livro' FOR UPDATE;


SELECT ra INTO @raAluno FROM Aluno
WHERE nome = 'Nome do Aluno';


SELECT COUNT(*) INTO @livroEmprestado FROM Emprestimo
WHERE codigoLivro = @codigoLivro AND dataDevolucao IS NULL;


IF @livroEmprestado = 0 THEN
    INSERT INTO Emprestimo (raAluno, codigoLivro, previsaoEntrega, estaAtrasado, dataEmprestimo)
    VALUES (@raAluno, @codigoLivro, '2023-03-15', '0', '2023-03-05 13:00:00');
ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O livro já está emprestado.';
END IF;

COMMIT;
