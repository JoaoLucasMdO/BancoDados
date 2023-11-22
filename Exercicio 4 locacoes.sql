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

-------------------------------------4---------------------------------------------
SELECT DISTINCT F.FILME
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
WHERE CLI.CIDADE = 'Votorantim';

-------------------------------------5---------------------------------------------
SELECT F.FILME
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE CONVERT(DATE, L.DATA_RETIRADA) = CONVERT(DATE, GETDATE());

-------------------------------------6---------------------------------------------
SELECT SUM(F.VALOR_LOCACAO) AS LUCRO
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE F.FILME = 'A vida é bela';

-------------------------------------7---------------------------------------------
SELECT F.DIRETOR, COUNT(*) AS QUANTIDADE_SAIDAS
FROM FILME F
JOIN LOCACOES L ON F.COD_FILME = L.COD_FILME
GROUP BY F.DIRETOR;

-------------------------------------8---------------------------------------------
SELECT DISTINCT C.NOME_CATEGORIA
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
WHERE CLI.NOME = 'Maria Chiquinha';

-------------------------------------9---------------------------------------------
SELECT CLI.NOME, CLI.TELEFONE
FROM LOCACOES L
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE F.FILME = 'Constantine';

-------------------------------------10---------------------------------------------
SELECT NOME_CATEGORIA
FROM CATEGORIA
WHERE COD_CATEGORIA NOT IN (SELECT DISTINCT COD_CATEGORIA FROM FILME);