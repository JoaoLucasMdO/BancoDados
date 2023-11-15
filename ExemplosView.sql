--1
/*Suponha que voc� deseje criar uma view que mostre todos os produtos com pre�os superiores a
1000.A consulta para criar essa view seria assim:*/
CREATE VIEW ProdutosCaros AS
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco > 1000;

/*Agora, sempre que voc� precisar consultar os produtos caros, pode simplesmente fazer uma consulta
� view ProdutosCaros, em vez de escrever a consulta complexa a cada vez.*/
select * from ProdutosCaros;

--2
/*Criaremos uma VIEW que mostre os produtos mais caros em cada categoria, estamos usando
uma subconsulta no WHERE para encontrar o produto com o pre�o m�ximo em cada
categoria. A subconsulta compara o CategoriaID da tabela Categoria com o CategoriaID da
tabela Produto para garantir que estamos encontrando o produto mais caro na categoria
correta.*/CREATE VIEW ProdutosMaisCarosPorCategoria AS
SELECT Categoria.NomeCategoria, Produto.NomeProduto, Produto.Preco
FROM Categoria
INNER JOIN Produto ON Categoria.CategoriaID = Produto.CategoriaID
WHERE Produto.Preco = ( SELECT MAX(Preco) FROM Produto AS P
WHERE P.CategoriaID = Categoria.CategoriaID);SELECT * FROM ProdutosMaisCarosPorCategoria;--3/*Neste exemplo, vamos declarar uma vari�vel chamada @MinPreco para armazenar o pre�o
m�nimo de produtos em uma categoria espec�fica. A vari�vel ser� definida usando o comando
SET e depois usada em uma consulta.*/DECLARE @MinPreco DECIMAL(10, 2); -- Declara��o da vari�vel
SET @MinPreco = 50; -- Defini��o do valor da vari�vel

-- Consulta usando a vari�vel
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco >= @MinPreco;

--4
/*Vamos declarar uma vari�vel chamada @TotalPedidos para armazenar o n�mero total de
pedidos em nossa tabela de pedidos. A vari�vel ser� definida usando o comando SELECT com
uma consulta que calcula o total de pedidos.*/

DECLARE @TotalPedidos INT; -- Declara��o da vari�vel

-- Defini��o do valor da vari�vel usando SELECT
SELECT @TotalPedidos = COUNT(*)
FROM Pedido;

-- Exibindo o valor da vari�vel
PRINT 'O total de pedidos �: ' + CAST(@TotalPedidos AS NVARCHAR(10));

--5
/*Neste exemplo, vamos declarar uma vari�vel chamada @MediaPreco para calcular a m�dia de
pre�os de produtos em uma categoria espec�fica e, em seguida, us�-la em uma consulta.*/
DECLARE @MediaPreco DECIMAL(10, 2); -- Declara��o da vari�vel
SET @MediaPreco = (
SELECT AVG(Preco)
FROM Produto
WHERE CategoriaID = 1
);

-- Exibindo o valor da vari�vel
PRINT 'A m�dia de pre�o na categoria de Eletr�nicos �: ' + CAST(@MediaPreco AS
NVARCHAR(10));

--6
/*Neste exemplo, vamos declarar uma vari�vel chamada @ProdutoMaisCaro para armazenar o
nome do produto mais caro na tabela de produtos.*/

DECLARE @ProdutoMaisCaro NVARCHAR(50); -- Declara��o da vari�vel

-- Defini��o do valor da vari�vel usando SELECT
SELECT TOP 1 @ProdutoMaisCaro = NomeProduto
FROM Produto
ORDER BY Preco DESC;
-- Exibindo o valor da vari�vel
PRINT 'O produto mais caro �: ' + @ProdutoMaisCaro;


--7
/*Suponha que voc� tenha uma tabela chamada "Produtos" com muitos registros e deseja
ver apenas os 10 produtos mais caros. Voc� pode usar o comando TOP da seguinte
maneira:*/
SELECT TOP 10 NomeProduto, Preco
FROM Produto
ORDER BY Preco DESC;
