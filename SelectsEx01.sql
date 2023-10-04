--Selects do Exercicío 01----------------------------------------------------------------
select*
from Setor;

select*
from Funcionario;

select distinct cod_setor
from Funcionario;

select primeiro_nome + ' ' + ultimo_nome  +  ', ' + convert(varchar, cod_setor) as 'Empregado e Setor'
from Funcionario;