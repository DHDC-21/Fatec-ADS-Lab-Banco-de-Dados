CREATE SCHEMA biblioteca;
USE biblioteca;

CREATE TABLE Categoria (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE Livro (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    autor VARCHAR(50),
    anoPublicacao INTEGER,
    codigoCategoria INTEGER,
	FOREIGN KEY (codigoCategoria)  REFERENCES Categoria (codigo)
);

CREATE TABLE Aluno (
    nome VARCHAR (50),
    ra VARCHAR(50) PRIMARY KEY,
    curso VARCHAR(50),
    telefone VARCHAR(20),
    rua VARCHAR(100),
    numero VARCHAR(10),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

CREATE TABLE Emprestimo (
    codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
    raAluno VARCHAR(50),
    codigoLivro INTEGER,
    previsaoEntrega DATE,
    estaAtrasado BOOLEAN,
    dataEmprestimo TIMESTAMP,
    dataDevolucao TIMESTAMP,
    FOREIGN KEY (raAluno) REFERENCES Aluno (ra),
	FOREIGN KEY (codigoLivro) REFERENCES Livro (codigo)
);
 
 
 INSERT INTO Aluno (nome, ra, curso, telefone, rua, numero, cidade, estado) VALUES 
	('Sofia Oliveira', '12345678', 'ADS', '(61) 95678-9012', 'Rua das Palmeiras', '123', 'Mogi Mirim', 'SP'), 
	('Lucas Santos', '23456789', 'AMS', '(71) 96789-0123', 'Avenida Brasil', '456', 'Mogi Mirim', 'SP'),
    ('Isabella Silva', '34567890', 'Projetos', '(81) 97890-1234', 'Rua da Esperança', '789', 'Mogi Mirim', 'SP'),
    ('Pedro Souza', '45678901', 'Fabricação', '(91) 98901-2345', 'Avenida dos Ipês', '1010', 'Mogi Mirim', 'SP'),
    ('Mariana Costa', '56789012', 'ADS', '(99) 99012-3456', 'Rua das Acácias', '222', 'Mogi Mirim', 'SP'),
    ('Thiago Alves', '67890123', 'ADS', '(11) 98765-4321', 'Avenida das Rosas', '333', 'Mogi Mirim', 'SP'),
    ('Ana Luiza Fernandes', '78901234', 'AMS', '(21) 91234-5678', 'Rua dos Lírios', '444', 'Mogi Mirim', 'SP'),
    ('Felipe Rocha', '89012345', 'Projetos', '(31) 92345-6789', 'Avenida dos Girassóis', '555', 'Mogi Mirim', 'SP'),
    ('Carolina Lima', '90123456', 'Fabricação', '(41) 93456-7890', 'Rua das Margaridas', '666', 'Mogi Mirim', 'SP'),
    ('Gabriel Ferreira', '01234567', 'ADS', '(51) 94567-8901', 'Avenida das Orquídeas', '777', 'Mogi Mirim', 'SP');
    
INSERT INTO categoria (nome) VALUES 
	('Romance'),
    ('Suspense'),
    ('Ficção Científica'),
    ('Biografia');

INSERT INTO livro (nome, autor, anoPublicacao, codigoCategoria) VALUES 
	('Cem Anos de Solidão', 'Gabriel García Márquez', '1967', '1'),
    ('O Tempo e o Vento', 'Erico Verissimo', '1949', '1'),
    ('O Silêncio dos Inocentes', 'Thomas Harris', '1988', '2'),
    ('O Código Da Vinci', 'Dan Brown', '2003', '2'),
    ('O Iluminado', 'Stephen King', '1977', '2'),
    ('Eu, Robô', 'Isaac Asimov', '1950', '3'),
    ('1984', 'George Orwell', '1949', '3'),
    ('O Guia do Mochileiro das Galáxias', 'Douglas Adams', '1979', '3'),
    ('O Diário de Anne Frank', 'Anne Frank', '1947', '4'),
    ('Ayrton Senna - Uma Lenda a Toda Velocidade', ' Christopher Hilton', '1990', '4');
    
INSERT INTO emprestimo (raAluno, codigoLivro, previsaoEntrega, estaAtrasado, dataEmprestimo, dataDevolucao)VALUES 
	('01234567', '1', '2023-03-15', '1', '2023-03-05 13:00:00', null),
    ('12345678', '2', '2023-03-16', '0', '2023-03-06 13:00:00', '2023-03-10 13:00:00'),
    ('23456789', '3', '2023-03-17', '1', '2023-03-07 13:00:00', null),
    ('34567890', '4', '2023-03-18', '0', '2023-03-08 13:00:00', '2023-03-13 13:00:00'),
    ('45678901', '5', '2023-03-19', '1', '2023-03-09 13:00:00', null),
    ('56789012', '6', '2023-03-20', '0', '2023-03-10 13:00:00', '2023-03-15 13:00:00'),
    ('67890123', '7', '2023-03-21', '1', '2023-03-11 13:00:00', null),
    ('78901234', '8', '2023-03-22', '0', '2023-03-12 13:00:00', '2023-03-18 13:00:00'),
    ('89012345', '9', '2023-03-23', '0', '2023-03-13 13:00:00', null),
    ('90123456', '10', '2023-03-24', '0', '2023-03-14 13:00:00', '2023-03-20 13:00:00');
    
SELECT 
	l.nome AS nomeLivro,
    a.nome AS nomeAluno,
    e.previsaoEntrega AS previsaoEntrega 
FROM Emprestimo e
INNER JOIN Livro l ON l.codigo = e.codigoLivro  
INNER JOIN Aluno a ON a.ra = e.raAluno
WHERE e.dataDevolucao IS NULL;

SELECT 
	l.nome AS nomeLivro,
    a.nome AS nomeAluno,
    a.telefone AS telefone,
    e.previsaoEntrega AS previsaoEntrega 
FROM Emprestimo e
INNER JOIN Livro l ON l.codigo = e.codigoLivro  
INNER JOIN Aluno a ON a.ra = e.raAluno
WHERE e.dataDevolucao IS NULL 
AND e.previsaoEntrega < NOW();
    
SELECT 
	c.nome AS categoria,
	l.nome AS livro
FROM Livro l
INNER JOIN Categoria c ON c.codigo = l.codigoCategoria
ORDER BY c.nome;

SELECT DISTINCT autor FROM Livro;


-- Atividade aula 07
select
	aluno.ra,
	aluno.nome,
    aluno.curso,
    livro.codigo,
    livro.nome,
    livro.autor,
    livro.anoPublicacao
from emprestimo 
inner join aluno on emprestimo.raAluno = aluno.ra
inner join livro on emprestimo.codigoLivro = livro.codigo;


select aluno.nome, livro.nome, categoria.nome
from emprestimo
cross join categoria
left join aluno on emprestimo.raAluno = aluno.ra
inner join livro on emprestimo.codigolivro = livro.codigo
where categoria.nome not in( 'Ficção Ciêntífica');
