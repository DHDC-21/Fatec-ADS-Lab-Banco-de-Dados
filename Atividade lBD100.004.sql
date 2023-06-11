CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE livros (
Código INTEGER NOT NULL AUTO_INCREMENT,
Nome VARCHAR(50) NOT NULL,
AnoPublicação INTEGER NOT NULL,
Categoria VARCHAR(50) NOT NULL,
ISBN VARCHAR(13) NOT NULL,
País VARCHAR(50) NOT NULL,
PRIMARY KEY (Código)
);

INSERT INTO livros (Nome,AnoPublicação,Categoria,ISBN,País)
VALUES ('Teste1',2000,'Romance','1234567891011','EUA'),
('Teste2',1777,'Ação','1234567891012','Brasil'),
('Teste3',1999,'auto-ajuda','1234567891013','Brasil'),
('Teste4',1889,'auto-ajuda','1234567891014','EUA'),
('Teste5',2010,'auto-ajuda','1234567891015','Brasil'),
('Teste6',1630,'Ação','1234567891016','Brasil'),
('Teste7',1932,'Romance','1234567891017','Brasil'),
('Teste8',1239,'Romance','1234567891018','Brasil'),
('Teste9',1994,'auto-ajuda','1234567891019','Brasil'),
('Teste10',1883,'Romance','1234567891020','Brasil'),
('Teste11',2022,'auto-ajuda','1234567891021','Brasil'),
('Teste12',1843,'Romance','1234567891022','Brasil'),
('Teste13',2014,'Romance','1234567891023','EUA'),
('Teste14',1948,'auto-ajuda','1234567891024','EUA'),
('Teste15',2011,'Romance','1234567891025','Brasil'),
('Teste16',1933,'Terror','1234567891026','Brasil'),
('Teste17',1998,'Romance','1234567891027','EUA'),
('Teste18',1930,'Ação','1234567891028','Brasil'),
('Teste19',1333,'Terror','1234567891029','EUA');

SELECT * FROM livros;

UPDATE livros 
SET categoria = 'Clássicos'
WHERE AnoPublicação < 1800;

DELETE FROM livros
WHERE categoria = 'auto-ajuda';

SELECT * FROM livros
WHERE categoria = 'Romance' AND País = 'Brasil';
