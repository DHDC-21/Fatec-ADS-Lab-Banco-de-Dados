/*
	Fatec Arthur de Asevedo
    Analise e Desenvolvimento de Sistemas
    
    Atividade lBD100.013 - Douglas Henrique
    
    Crie uma  visão que liste os livros
    emprestados em cada curso.
    
    Crie uma busca com subquery retornado o curso de
    ADS e use para filtrar um query na visão.
*/

## Cursos: ADS, AMS, Projetos, Fabricação
Create view emprestimoADS as
select *
from aluno a
where a.curso = 'ADS';

Create view emprestimoAMS as
select *
from aluno a
where a.curso = 'AMS';

Create view emprestimoProjetos as
select *
from aluno a
where a.curso = 'Projetos';

Create view emprestimoFabricacao as
select *
from aluno a
where a.curso = 'Fabricação';

select *
from aluno a
where a.curso = (
	select *
    from aluno a
    where a.curso = 'ADS'
);