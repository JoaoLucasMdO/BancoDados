--1
/*Suponha que você deseje criar uma view que mostre todos os produtos com preços superiores a
1000.A consulta para criar essa view seria assim:*/
CREATE VIEW ProdutosCaros AS
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco > 1000;

/*Agora, sempre que você precisar consultar os produtos caros, pode simplesmente fazer uma consulta
à view ProdutosCaros, em vez de escrever a consulta complexa a cada vez.*/
select * from ProdutosCaros;

--2
/*Criaremos uma VIEW que mostre os produtos mais caros em cada categoria, estamos usando
uma subconsulta no WHERE para encontrar o produto com o preço máximo em cada
categoria. A subconsulta compara o CategoriaID da tabela Categoria com o CategoriaID da
tabela Produto para garantir que estamos encontrando o produto mais caro na categoria
correta.*/CREATE VIEW ProdutosMaisCarosPorCategoria AS
SELECT Categoria.NomeCategoria, Produto.NomeProduto, Produto.Preco
FROM Categoria
INNER JOIN Produto ON Categoria.CategoriaID = Produto.CategoriaID
WHERE Produto.Preco = ( SELECT MAX(Preco) FROM Produto AS P
WHERE P.CategoriaID = Categoria.CategoriaID);SELECT * FROM ProdutosMaisCarosPorCategoria;--3/*Neste exemplo, vamos declarar uma variável chamada @MinPreco para armazenar o preço
mínimo de produtos em uma categoria específica. A variável será definida usando o comando
SET e depois usada em uma consulta.*/DECLARE @MinPreco DECIMAL(10, 2); -- Declaração da variável
SET @MinPreco = 50; -- Definição do valor da variável

-- Consulta usando a variável
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco >= @MinPreco;

--4
/*Vamos declarar uma variável chamada @TotalPedidos para armazenar o número total de
pedidos em nossa tabela de pedidos. A variável será definida usando o comando SELECT com
uma consulta que calcula o total de pedidos.*/

DECLARE @TotalPedidos INT; -- Declaração da variável

-- Definição do valor da variável usando SELECT
SELECT @TotalPedidos = COUNT(*)
FROM Pedido;

-- Exibindo o valor da variável
PRINT 'O total de pedidos é: ' + CAST(@TotalPedidos AS NVARCHAR(10));

--5
/*Neste exemplo, vamos declarar uma variável chamada @MediaPreco para calcular a média de
preços de produtos em uma categoria específica e, em seguida, usá-la em uma consulta.*/
DECLARE @MediaPreco DECIMAL(10, 2); -- Declaração da variável
SET @MediaPreco = (
SELECT AVG(Preco)
FROM Produto
WHERE CategoriaID = 1
);

-- Exibindo o valor da variável
PRINT 'A média de preço na categoria de Eletrônicos é: ' + CAST(@MediaPreco AS
NVARCHAR(10));

--6
/*Neste exemplo, vamos declarar uma variável chamada @ProdutoMaisCaro para armazenar o
nome do produto mais caro na tabela de produtos.*/

DECLARE @ProdutoMaisCaro NVARCHAR(50); -- Declaração da variável

-- Definição do valor da variável usando SELECT
SELECT TOP 1 @ProdutoMaisCaro = NomeProduto
FROM Produto
ORDER BY Preco DESC;
-- Exibindo o valor da variável
PRINT 'O produto mais caro é: ' + @ProdutoMaisCaro;


--7
/*Suponha que você tenha uma tabela chamada "Produtos" com muitos registros e deseja
ver apenas os 10 produtos mais caros. Você pode usar o comando TOP da seguinte
maneira:*/
SELECT TOP 10 NomeProduto, Preco
FROM Produto
ORDER BY Preco DESC;
