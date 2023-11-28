----------------------------------- Exemplo 01 Trigger Instead -------------------------------------------------
CREATE TRIGGER trg_PreventCategoriaDeletion
ON Categoria
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (SELECT 1 FROM Produto WHERE Produto.CategoriaID IN (SELECT 
DELETED.CategoriaID FROM DELETED))
BEGIN
RAISERROR ('N�o � poss�vel excluir categorias associadas a produtos.', 16, 1)
ROLLBACK TRANSACTION
END
ELSE
DELETE FROM Categoria WHERE Categoria.CategoriaID IN (SELECT 
DELETED.CategoriaID FROM DELETED)
END


SELECT * FROM Categoria -- Vamos consultar as Categorias existentes

Delete from Categoria where CategoriaID = 1 /* Vamos tentar apagar uma categoria que tenha produtos
											deve ser exclu�da, j� que n�o tem produtos vinculados. */



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
DataAlteracao DATE );
UPDATE Produto set Preco = 4100 where Produtoid = 1


----------------------------------- Exemplo 03 Trigger Instead -------------------------------------------------
CREATE TRIGGER trg_LimitePreco
ON Produto
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted WHERE Preco > 10000)
	BEGIN
		RAISERROR ('O pre�o do produto n�o pode exceder $10.000.', 16, 1)
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
EXEC consulta_produto
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

--Na execu��o:
EXEC InserirNovoProduto 14, 'SmartWatch', 1, 2200
@ProdutoID INT,
@NovoPreco DECIMAL(10,2)
AS
BEGIN
	UPDATE Produto
	SET Preco = @NovoPreco
	WHERE ProdutoID = @ProdutoID
END

--Na execu��o:
EXEC AtualizarPrecoProduto 14, 2500    --ou
EXEC AtualizarPrecoProduto @ProdutoID = 14, @NovoPreco = 2500