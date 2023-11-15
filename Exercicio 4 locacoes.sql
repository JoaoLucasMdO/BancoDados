-------------------------------------1---------------------------------------------
select filme.FILME, filme.cod_filme, count(*) as 'Quantidade de vezes alugado' 
from LOCACOES
inner join CLIENTES on clientes.cod_cliente = locacoes.cod_cliente
inner join filme on filme.cod_filme = locacoes.cod_filme
group by filme.FILME, filme.COD_FILME

-------------------------------------2---------------------------------------------
select filme.filme, locacoes.DATA_DEVOLUCAO
from LOCACOES
inner join CLIENTES on CLIENTES.NOME = 'Edson Martin Feitosa' and CLIENTES.COD_CLIENTE = LOCACOES.COD_CLIENTE
inner join CATEGORIA on NOME_CATEGORIA = 'ação'
inner join filme on FILME.DIRETOR = 'Richard Donner' and filme.COD_FILME = LOCACOES.COD_FILME

-------------------------------------3---------------------------------------------
select filme.FILME, valor_locacao, (valor_locacao * 10/100) as 'Valor de desconto', 
(VALOR_LOCACAO -(valor_locacao * 10/100)) as 'Valor final'
from FILME


