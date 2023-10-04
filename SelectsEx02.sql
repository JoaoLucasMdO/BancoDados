---Selects do Exercicío 02-----------------------------------------------------------------------------
--1--
select primeiro_nome, ultimo_nome, salario
from Funcionario
where salario > 2500;

--2--
select primeiro_nome, ultimo_nome, cod_setor
from Funcionario
where nrmatricula = 7;

--3--
select primeiro_nome, ultimo_nome, salario
from Funcionario
where salario <= 1500 or salario >= 3000;

--4--
select primeiro_nome, ultimo_nome, cod_setor, data_admissao
from Funcionario
where year(data_admissao) > 2009 order by data_admissao;

--5--
select*
from Funcionario
where cod_setor = 1 or cod_setor = 3 order by cod_setor;

--6--
select*
from Funcionario
where primeiro_nome like '_a%'

--7--
select*
from Funcionario
where primeiro_nome like '%a%' or primeiro_nome like '%e%';

--8--
select*
from Funcionario
where cod_setor = 2 order by primeiro_nome;

--9--
select*
from Funcionario
where cod_setor in (2 , 5);

--10--
select*
from Funcionario
where cod_setor in (3) and salario > 2300;