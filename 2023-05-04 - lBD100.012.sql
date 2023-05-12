start transaction;

select codigo into@codLivro from livro
where codigo not in(
select codigo from livro l
inner join emprestimo e on e.codigoLivro = l.codigo,
where dataDevolucao is null
);

commit;