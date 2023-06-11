/*
 *  Atividade lBD100.016
 *
 *      Crie um trigger onde quando um empréstimo é devolvido
 *      atualize o campo “Está Atrasado?”, com a situação do empréstimo.
 */

USE biblioteca

DELIMITER $$
CREATE TRIGGER devolucao
AFTER UPDATE ON emprestimo
FOR EACH ROW
BEGIN
    IF NEW.dataDevolucao IS NOT NULL AND NEW.dataDevolucao > NEW.previsaoEntrega THEN
        SET NEW.estaAtrasado = 1;
    ELSE
        SET NEW.estaAtrasado = 0;
    END IF;
END;
$$ DELIMITER ;
