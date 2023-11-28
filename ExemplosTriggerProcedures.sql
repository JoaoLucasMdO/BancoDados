----------------------------------- Exemplo 01 Trigger Instead -------------------------------------------------
CREATE TRIGGER trg_PreventCategoriaDeletion
ON Categoria
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (SELECT 1 FROM Produto WHERE Produto.CategoriaID IN (SELECT 
DELETED.CategoriaID FROM DELETED))
BEGIN
RAISERROR ('Não é possível excluir categorias associadas a produtos.', 16, 1)
ROLLBACK TRANSACTION
END
ELSE
DELETE FROM Categoria WHERE Categoria.CategoriaID IN (SELECT 
DELETED.CategoriaID FROM DELETED)
END


SELECT * FROM Categoria -- Vamos consultar as Categorias existentes

Delete from Categoria where CategoriaID = 1 /* Vamos tentar apagar uma categoria que tenha produtos											para que a mensagem de erro da trigger seja exibida. */INSERT INTO Categoria (CategoriaID, NomeCategoria) VALUES (13, 'Games') -- Vamos inserir uma nova categoria para o teste de exclusãoDelete from Categoria where CategoriaID = 13 /* Vamos excluir a nova categoria, neste caso a mesma 
											deve ser excluída, já que não tem produtos vinculados. */



----------------------------------- Exemplo 02 Trigger After -------------------------------------------------
CREATE TRIGGER trg_LogPrecoAlterado
ON Produto
AFTER UPDATE
AS
BEGIN
	INSERT INTO LogPreco (ProdutoID, NovoPreco, DataAlteracao)
	SELECT ProdutoID, Preco, GETDATE()
	FROM inserted
END


CREATE TABLE LogPreco (
ProdutoID INT,
NovoPreco decimal(10,2),
DataAlteracao DATE );-- Para que a tabela de log receba um registro vamos atualizar o preço de um produto
UPDATE Produto set Preco = 4100 where Produtoid = 1


----------------------------------- Exemplo 03 Trigger Instead -------------------------------------------------
CREATE TRIGGER trg_LimitePreco
ON Produto
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted WHERE Preco > 10000)
	BEGIN
		RAISERROR ('O preço do produto não pode exceder $10.000.', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
		INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
		SELECT ProdutoID, NomeProduto, CategoriaID, Preco
		FROM inserted
END


Insert Into Produto Values (14,'Ultrabook', 8, 15800);


----------------------------------- Exemplo 04 Procedure -------------------------------------------------

CREATE PROC consulta_produto
AS
SELECT * FROM produto
WHERE nomeproduto like '%a%'


--Para executar a stored procedure
EXEC consulta_produto--Para alterar a Procedure para trazer somente 2 atributos faça:
ALTER PROC consulta_produto
AS
SELECT nomeproduto, preco FROM produto



----------------------------------- Exemplo 05 Procedure -------------------------------------------------

CREATE PROCEDURE InserirNovoProduto
@IDProd INT,
@Nome NVARCHAR(50),
@CategoriaID INT,
@Preco DECIMAL(10,2)
AS
BEGIN
	INSERT INTO Produto (Produtoid, NomeProduto, CategoriaID, Preco)
	VALUES (@IDProd, @Nome, @CategoriaID, @Preco)
END

--Na execução:
EXEC InserirNovoProduto 14, 'SmartWatch', 1, 2200select *from Produto----------------------------------- Exemplo 06 Procedure -------------------------------------------------CREATE PROCEDURE AtualizarPrecoProduto
@ProdutoID INT,
@NovoPreco DECIMAL(10,2)
AS
BEGIN
	UPDATE Produto
	SET Preco = @NovoPreco
	WHERE ProdutoID = @ProdutoID
END

--Na execução:
EXEC AtualizarPrecoProduto 14, 2500    --ou
EXEC AtualizarPrecoProduto @ProdutoID = 14, @NovoPreco = 2500----------------------------------- Exemplo 07 Procedure -------------------------------------------------CREATE PROCEDURE ListarProdutosPorCategoria
@Categoria NVARCHAR(50)
AS
BEGIN
	SELECT ProdutoID, NomeProduto, Preco
	FROM Produto
	WHERE CategoriaID = (SELECT CategoriaID FROM Categoria
	WHERE NomeCategoria = @Categoria)
ENDEXEC ListarProdutosPorCategoria 'Roupas'

----------------------------------- Exemplo 08 Procedure -------------------------------------------------

CREATE PROCEDURE CalcularValorTotalPedido
@PedidoID INT
AS
BEGIN
	SELECT ValorTotal = SUM(Preco)
	FROM Produto
	WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido
	WHERE PedidoID = @PedidoID)
END

EXEC CalcularValorTotalPedido @PedidoId = 8