--Selects-------------------------------------------------------------------------------
select*
from empregado;

select*
from cidade;

select distinct codEstado
from cidade;

select codEstado,nomeCidade
from cidade;

select 'Código do Cliente', cod_cliente,'Nome do Cliente', nome_cliente
from cliente;

select cod_cliente as 'Código do Cliente', nome_cliente as 'Nome do Cliente'
from cliente;

select nome, salario, salario+300 aumento_salario
from empregado;

select 'Funcionario: ' +nome+ ' | Salário:' + convert(varchar, salario), salario, nome
from empregado;

select num_pedido, cod_produto, quantidade
from item_pedido
where quantidade = 45;

select nrmatricula, primeiro_nome, ultimo_nome, cod_setor
from Funcionario
where cod_setor = 1;

select primeiro_nome, salario
from Funcionario
where salario < 2500;

select primeiro_nome, salario
from Funcionario
where salario > 2500;

--Betweens----------------------------------------------------
select primeiro_nome, salario
from Funcionario
where salario between 1500 and 2000;

select primeiro_nome, salario
from Funcionario
where salario not between 1500 and 2000;

select cod_produto, descricao
from produto
where Valor_unitario between 0.32 and 2.00;

--Cadeias de caracteres-------------------------------------------------------------------

select primeiro_nome, salario, cod_setor
from Funcionario
where primeiro_nome like '%M%';

select primeiro_nome, salario, cod_setor
from Funcionario
where primeiro_nome like '%M%';

select cod_produto, descricao, unidade
from produto
where unidade like 'K%';

select primeiro_nome, ultimo_nome
from Funcionario
where ultimo_nome like 'Oliv%';

select primeiro_nome, ultimo_nome
from Funcionario
where ultimo_nome like '%Silva';

select primeiro_nome, ultimo_nome
from Funcionario
where ultimo_nome like '%liv%';

select primeiro_nome, ultimo_nome
from Funcionario
where primeiro_nome like 'J___';

select primeiro_nome, ultimo_nome
from Funcionario
where primeiro_nome like '____o';

--In e not In --------------------------------------------------------------------------

select nome_vendedor
from vendedor
where faixa_comissao in ('A', 'B');

select primeiro_nome, salario, cod_setor
from Funcionario
where cod_setor in ('1', '2', '4');

select primeiro_nome, salario, cod_setor
from Funcionario
where cod_setor not in ('1', '2', '4');

select*
from cliente
where IE is null;

select*
from cliente
where IE is not null;

select primeiro_nome, salario, cod_setor
from Funcionario
where email is null;

select primeiro_nome, salario, cod_setor
from Funcionario
where email is not null;


--And e Or-------------------------------------------------------------------------------

select nrmatricula, ultimo_nome, salario
from Funcionario
where salario > 1000 and nrmatricula >= 3

select*
from Funcionario
where salario > 2500 or cod_setor = 1;

select descricao
from produto
where unidade = 'M' and Valor_unitario = 1.05;

select descricao
from produto
where unidade = 'UN' and Valor_unitario = 4;

--Order by----------------------------------------------------------------------------------
select nome_vendedor, salario_fixo
from vendedor
order by nome_vendedor;

select nome_vendedor, salario_fixo
from vendedor
order by nome_vendedor desc;

select*
from Funcionario
where cod_setor not in (4, 5)
order by cod_setor;

select*
from Funcionario
where cod_setor not in (4, 5)
order by cod_setor desc;

select*
from Funcionario
where cod_setor not in (4, 5)
order by cod_setor, primeiro_nome;

------Exemplos Novos----------------------------------------------------------------------
select GETDATE();

select DATEADD(DAY, 3, GETDATE());

select DATENAME(month, GETDATE());

select convert(char, GETDATE(), 103);

select DATENAME(MONTH, DATEADD(MONTH,3,GETDATE()));