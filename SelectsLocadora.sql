-----------1----------------------------------
select *
from clientes;

-------------2--------------------------------
select *
from filme;

------------3----------------------------------
select *
from categoria;

------------4-----------------------------------
select*
from clientes
where sexo = 'M' and cidade = 'Sorocaba';

-----------5-----------------------------------
select nome, telefone
from clientes
order by nome;

-----------6-----------------------------------
select count(*) 
from clientes
where sexo = 'F';

------------7-------------------------------------
select*
from filme
order by filme;

------------8-------------------------------------
select*
from filme
where diretor = 'Shawn Levy' and reservada = 'n';

------------9-------------------------------------
select*
from filme
where valor_locacao > 5 and reservada = 's';

------------10-----------------------------------
select distinct filme.diretor
from filme;

--------------11---------------------------------
select count(*)
from filme
where reservada = 's';

--------------12-----------------------------------
select max(valor_locacao) as 'Maior valor de locação cadastrado'
from filme;

---------------13------------------------------------
select filme.filme, filme.diretor, filme.valor_locacao, filme.reservada, categoria.nome_categoria
from filme
inner join categoria on categoria.nome_categoria = 'ação';

---------------14------------------------------------
select filme, diretor, valor_locacao, reservada, nome_categoria
from filme
inner join categoria on nome_categoria = 'ação' or nome_categoria = 'aventura'
where reservada = 's' and valor_locacao < 5;

------------------15-----------------------------------
select nome, filme
from locacoes
inner join clientes on nome = 'Renata Cristina' and clientes.cod_cliente = locacoes.cod_cliente
inner join filme on filme.cod_filme = locacoes.cod_filme;

-----------------16-------------------------------------
select nome
from locacoes
inner join clientes on clientes.cod_cliente = locacoes.cod_cliente
group by nome
having count(locacoes.cod_cliente) > 3;

------------------17---------------------------------------
select nome, sum(valor_locacao)
from locacoes
inner join filme on filme.cod_filme = locacoes.cod_filme
inner join clientes on nome = 'Renata Cristina' and clientes.cod_cliente = locacoes.cod_cliente
group by nome;

-------------------18---------------------------------------
select avg(valor_locacao)
from filme;

-------------------19-----------------------------------------
select min(valor_locacao)
from filme;

--------------------20--------------------------------------------
select nome_categoria, count(filme.cod_categoria)
from categoria
inner join filme on filme.cod_categoria = categoria.cod_categoria
group by nome_categoria;