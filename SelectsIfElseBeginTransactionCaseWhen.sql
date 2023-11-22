---------------- Exemplo 01 Commit ----------------------------------
begin transaction;

-- Aumenta os preços de todos os produtos em 10%
update produto
set Preco = Preco * 1.1;

-- Confirma a transação
commit;

------------------ Exemplo 02 Commit ------------------------------------
BEGIN TRANSACTION;

-- Insere novas categorias
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES (11, 'Decoração'),(12, 'Automóveis');

-- Insere novos produtos nas novas categorias
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES (11, 'Vaso Decorativo', 11, 30),(12, 'Pneu de Carro', 12, 100);

-- Confirma a transação
COMMIT;

------------------ Exemplo 03 Rollback ----------------------------------
BEGIN TRANSACTION;

-- Inserindo dados incorretos
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES (11, 'Produto Errado', 100, 9999);

-- Detectou um erro, então desfaz as operações
ROLLBACK;

------------------ Exemplo 04 Rollback e Commit ----------------------------------
BEGIN TRANSACTION;

-- Atualização com erro
UPDATE Produto SET CategoriaID = 100 WHERE ProdutoID = 3;
IF @@ERROR = 0
COMMIT
ELSE
ROLLBACK; -- Detectou um erro, então desfaz as operações
PRINT 'Atualização na Tabela Produto foi Cancelada';

----------------- Exemplo 05 Case ------------------------------------
SELECT NomeProduto, Preco,
CASE
WHEN Preco < 100 THEN 'Barato'
WHEN Preco >= 100 AND Preco < 1000 THEN 'Médio'
ELSE 'Caro'
END AS CategoriaPreco
FROM Produto;----------------- Exemplo 06 Case ----------------------------------------SELECT NomeProduto, CategoriaID, Preco,
CASE CategoriaID
WHEN 1 THEN floor(Preco * 0.9) -- Categoria Eletrônicos (10% de desconto)
WHEN 2 THEN floor(Preco * 0.95) -- Categoria Roupas (5% de desconto)
ELSE Preco
END AS PrecoComDesconto
FROM Produto;

----------------- Exemplo 07 Case ----------------------------------------
SELECT PedidoID, DataPedido,
CASE
WHEN DataPedido < '2023-06-01' THEN 'Antigo'
ELSE 'Novo'
END AS StatusPedido
FROM Pedido;

----------------- Exemplo 08 If, Else ----------------------------------------
DECLARE @CategoriaDesejada INT = 1; -- Categoria desejada
IF @CategoriaDesejada = 1
BEGIN
  INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
  VALUES (13, 'Tablet', @CategoriaDesejada, 1500);
END

----------------- Exemplo 09 If, Else ----------------------------------------
DECLARE @CategoriaID INT = 1; -- Categoria desejada
DECLARE @NomeCategoria NVARCHAR(50);
IF EXISTS (SELECT * FROM Categoria WHERE CategoriaID = @CategoriaID)
BEGIN
SELECT @NomeCategoria = NomeCategoria FROM Categoria WHERE 
CategoriaID = @CategoriaID;
PRINT 'Nome da Categoria: ' + @NomeCategoria;
END
ELSE
BEGIN
PRINT 'Categoria não encontrada.';
END

----------------- Exemplo 10 If, Else ----------------------------------------
DECLARE @Counter INT
SET @Counter = 1
WHILE @Counter <= 10
BEGIN
UPDATE Produto
SET Preco = Preco + 100
WHERE ProdutoID = @Counter
SET @Counter = @Counter + 1
END

----------------- Exemplo 11 If, Else ----------------------------------------
DECLARE @Counter2 INT
SET @Counter2 = 1
WHILE @Counter2 <= (SELECT COUNT(*) FROM Produto)
BEGIN
DECLARE @PrecoAtual DECIMAL(10, 2)
SELECT @PrecoAtual = Preco FROM Produto WHERE ProdutoID = @Counter2 --Seleciona o preço do Produto
IF @PrecoAtual > 1000 --Caso o valor do produto seja maior do 1000
BEGIN
UPDATE Produto
SET Preco = Preco * 1.1 --Aumenta em 10%
WHERE ProdutoID = @Counter2
END
SET @Counter2 = @Counter2 + 1
END
