----------------------------- 1 -------------------------------------
select nrfatura, datafatura, cliente.codcliente, nome
from fatura
inner join cliente on cliente.codcliente = fatura.codcliente
order by nome;

----------------------------- 2 -------------------------------------
select codproduto, descricao, preco, nomeforn, saldo
from produto
inner join fornecedor on fornecedor.codforn = produto.codforn
order by descricao;

----------------------------- 3 -------------------------------------
select fatura.nrfatura, (qtde * valor) as 'Valor Total'
from fatura
inner join itens_fatura on itens_fatura.nrfatura = fatura.nrfatura;

----------------------------- 4 -------------------------------------
select nomeforn, count(produto.codproduto) as 'Quantidade de Produtos'
from fornecedor
inner join produto on produto.codforn = fornecedor.codforn
group by nomeforn;

----------------------------- 5 -------------------------------------
select fatura.nrfatura, count(qtde) as 'Quantidade'
from fatura
inner join itens_fatura on fatura.nrfatura = itens_fatura.nrfatura
group by fatura.nrfatura;

----------------------------- 6 -------------------------------------
select nome, sum(preco) as 'Valor Total'
from cliente
inner join fatura on fatura.codcliente = cliente.codcliente
inner join itens_fatura on itens_fatura.nrfatura = fatura.nrfatura
inner join produto on produto.codproduto = itens_fatura.codproduto
group by nome;

----------------------------- 7 -------------------------------------
select area, count(area) as 'Quantidade de clientes por area'
from cliente
group by area;

----------------------------- 8 -------------------------------------
select fornecedor.codforn, count(produto.codproduto) as 'Quantidade de Produtos'
from fornecedor
inner join produto on produto.codforn = fornecedor.codforn
group by fornecedor.codforn;

----------------------------- 9 -------------------------------------
select floor(avg(preco)) as 'Média'
from fatura
inner join itens_fatura on itens_fatura.nrfatura = fatura.nrfatura
inner join produto on itens_fatura.codproduto = produto.codproduto

----------------------------- 10 -------------------------------------
select fatura.nrfatura
from fatura
inner join itens_fatura on itens_fatura.qtde > 2
group by fatura.nrfatura;
