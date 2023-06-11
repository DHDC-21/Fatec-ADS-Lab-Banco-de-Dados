/*
Fatec Arthur de Azevedo
Analise e Desenvolvimento de Sistemas (5º Semestre)
Douglas Henrique Dionysio Costa

Atvividade Aula 05

Para o texto abaixo, modele e crie o banco de dados conforme a especificação, depois crie as buscas 
pedidas.

A biblioteca da Fatec precisa de um sistema novo para manter o cadastro dos livros e dos alunos que 
emprestam eles. É importante que se salve dos livros o nome do livro e do autor, o ano de publicação e a 
sua categoria, que precisa ter salvo o nome da categoria e possuir um código único. 

Dos alunos é importante ter o nome, seu RA, curso, telefone e endereço. Quando o aluno emprestar um 
livro se precisa saber qual o dia que o livro foi emprestado e quando ele será devolvido, se o aluno não 
devolver deverá ser marcado um campo que indique que está atrasado.

É preciso saber quais os livros que estão emprestados nesse momento, se possível com a data que ele 
será devolvido e o aluno que o emprestou, além disso, precisa-se de uma lista com todos os empréstimos 
que estão atrasados, com o nome e o telefone do aluno para que se possa cobrá-lo. Também seria bom 
saber quais são os livros de cada categoria e quais os autores que possuem livros na biblioteca
*/

create schema dhdc_aula05;
use dhdc_aula05;

create table Aluno(
	ra varchar(12) primary key not null,
    nome varchar(45) not null,
    curso varchar(45) not null,
    telefone varchar(12),
    endereco varchar(45) not null);

create table Acervo(
	id int not null primary key auto_increment unique,
    titulo varchar(45) not null,
    autor varchar(45) not null,
    ano year not null,
    categoria varchar(45) );
    
create table Emprestimo(
	cod int not null primary key auto_increment,
    dt_emprestimo date not null,
    dt_devolucao date not null,
    aluno_ra varchar(12) not null,
    livro_id int not null,
    estatus int not null);
    
ALTER TABLE `dhdc_aula05`.`emprestimo` 
ADD INDEX `fk_aluno_idx` (`aluno_ra` ASC) VISIBLE,
ADD INDEX `fk_livro_idx` (`livro_id` ASC) VISIBLE;
;
ALTER TABLE `dhdc_aula05`.`emprestimo` 
ADD CONSTRAINT `fk_aluno`
  FOREIGN KEY (`aluno_ra`)
  REFERENCES `dhdc_aula05`.`aluno` (`ra`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_livro`
  FOREIGN KEY (`livro_id`)
  REFERENCES `dhdc_aula05`.`acervo` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

insert into Aluno (ra, nome, curso, telefone, endereco)
values
	(12312312312,'Douglas','Fabricacao Mecanica','19912345678','Mogi Mirim-SP'),
    (23423423423,'Henrique','Mecatronica Industrial','19923456780','Mogi Mirim-SP'),
    (34534534534,'Dionysio','Projetos Mecanicos','19934567800','Mogi Mirim-SP'),
    (45645645645,'Costa','Gestao Emopresarial','19945678000','Mogi Mirim-SP');
    
insert into Acervo (titulo,autor,ano,categoria)
values
	('Engenhraria de Software Moderna', 'Presman', '1985', 'TI'),
    ('Fisica Classica Aplicada', 'Rodrigo', '2020', 'Ciencias'),
    ('Engenharia Eletrica Moderna', 'Fernando', '2018', 'Ciencias'),
    ('Administracao Avancada', 'Jose', '1989', 'Administracao'),
    ('Programacao em Python', 'Marcus', '2023', 'TI'),
    ('Libras para Ouvintes', 'Ana', '2022', 'Linguagens');
    
insert into emprestimo (dt_emprestimo, dt_devolucao, aluno_ra, livro_id,estatus)
values
	("2023-03-08","2023-03-15",'45645645645',4,1),
    ("2023-03-08","2023-03-15",'34534534534',5,1),
    ("2023-03-22","2023-03-29",'12312312312',1,0),
    ("2023-03-08","2023-03-15",'23423423423',3,1);

/* select com todos os livros emprestados*/
select
	emprestimo.cod, 
    emprestimo.aluno_ra, 
    aluno.nome, 
    emprestimo.dt_devolucao, 
    emprestimo.livro_id, 
    acervo.titulo,
    emprestimo.estatus

from emprestimo, aluno, acervo
where emprestimo.aluno_ra = aluno.ra and emprestimo.livro_id = acervo.id and emprestimo.estatus = 1;

/* select com os livros em atraso */
select
	emprestimo.cod, 
    emprestimo.aluno_ra, 
    aluno.nome, 
    emprestimo.dt_devolucao, 
    emprestimo.livro_id, 
    acervo.titulo,
    emprestimo.estatus
from emprestimo, aluno, acervo
where emprestimo.aluno_ra = aluno.ra and emprestimo.livro_id = acervo.id and emprestimo.estatus = 1 and current_date() > emprestimo.dt_devolucao;

