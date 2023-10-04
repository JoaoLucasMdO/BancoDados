select funcionario.primeiro_nome, funcionario.salario, setor.nome_setor
from Funcionario, Setor
where Funcionario.cod_setor = setor.cod_setor;

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f, Setor s
where f.cod_setor = s.cod_setor;

select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
inner join Setor s on f.cod_setor = s.cod_setor;

select c.nome_cliente, p.num_pedido
from cliente c
inner join pedido p on c.Cod_cliente = p.cod_cliente;

select c.nome_cliente, p.num_pedido
from cliente c
left outer join pedido p on c.Cod_cliente = p.cod_cliente;

Select c.nome_cliente, p.num_pedido
from cliente c
Left outer join pedido p on c.cod_cliente = p.cod_cliente
Where P.cod_cliente is null;

Insert into Setor (nome_setor) values ('Marketing');

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Right outer join Setor s on f.cod_setor = s.cod_setor;

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Right outer join Setor s on f.cod_setor = s.cod_setor
Where f.Cod_setor is null;

Select c.nome_cliente, p.num_pedido
from cliente c
Full outer join pedido p on c.cod_cliente = p.cod_cliente;

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Full outer join Setor s on f.cod_setor = s.cod_setor;

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
full outer join Setor s on f.cod_setor = s.cod_setor
Where f.Cod_setor is null or s.Cod_setor is null;

Select c.nome_cliente, p.num_pedido
from cliente c
Full outer join pedido p on c.cod_cliente = p.cod_cliente
Where c.Cod_cliente is null or p.cod_cliente is null;

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Cross join Setor s 
Order by f.primeiro_nome;

Select c.nome_cliente, p.num_pedido
from cliente c
Cross join pedido p
Order by c.Nome_cliente;

SELECT min(salario_fixo) AS 'MENOR SALARIO', max(salario_fixo) AS 
'MAIOR SALARIO'
FROM vendedor;

SELECT SUM (quantidade) AS 'QUANTIDADE'
FROM item_pedido
WHERE cod_produto = 3;

select avg(salario_fixo) as 'Media_Salario'
from vendedor;

select count(*) from vendedor
where salario_fixo > 2500.00;

select num_pedido, total_produtos = count(*)
from item_pedido
group by num_pedido;

select num_pedido, total_produtos = count(*)
from item_pedido
where quantidade > 5
group by num_pedido
having count(*) > 1;

update produto
set Valor_unitario = 4.00
where descricao = 'Alface';

select*
from produto
where descricao = 'Alface';

update produto
set valor_unitario = Valor_unitario * 1.025
where Valor_unitario < (select avg(Valor_unitario) 
from produto
where Unidade = 'KG');

select*
from produto
where Unidade = 'KG';

delete from vendedor
where faixa_comissao is null;

select *
from vendedor
where faixa_comissao is null;

DELETE FROM pedido 
FROM produto P, item_pedido I
WHERE I.num_pedido = pedido.num_pedido AND
P.cod_produto = I.cod_produto AND
valor_unitario < 0.20