CREATE DATABASE SUBCONSULTA;
go
use SUBCONSULTA;

-- Criação das tabelas
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria NVARCHAR(50)
);

CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50),
    CategoriaID INT,
	Preco decimal(10,2),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    DataPedido DATE,
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Inserção de dados nas tabelas
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Roupas'),
    (3, 'Alimentos');

INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (1, 'Smartphone', 1, 4000),
    (2, 'Camiseta', 2, 50);


INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (1, '2023-01-15', 1),
    (2, '2023-02-20', 2);
  
-- Tabela Categoria
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (4, 'Móveis'),
    (5, 'Livros'),
    (6, 'Jogos'),
    (7, 'Cosméticos'),
    (8, 'Informatica'),
    (9, 'Esportes'),
    (10, 'Brinquedos');

-- Tabela Produto
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (3, 'Sofá', 4, 2000),
    (4, 'Livro de Romance', 5, 40),
    (5, 'Xbox', 6, 2500),
    (6, 'Perfume', 7, 80),
    (7, 'Laptop', 8, 7000),
    (8, 'Bola de Futebol', 9, 20),
    (9, 'Quebra-Cabeça', 10, 120),
    (10, 'Chapéu', 2, 200);

-- Tabela Pedido
INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (3, '2023-03-10', 5),
    (4, '2023-04-05', 2),
    (5, '2023-05-12', 7),
    (6, '2023-06-25', 1),
    (7, '2023-07-03', 10),
    (8, '2023-08-18', 3),
    (9, '2023-09-09', 8),
    (10, '2023-10-22', 4);

	-----------------------Exemplo 01---------------------------------------------------------------
	select nomeProduto, preco
	from Produto
	where preco > all(select preco from produto where nomeProduto = 'Chapéu');

	-----------------------Exemplo 02---------------------------------------------------------------
	select nomeProduto
	from produto
	where preco > all(select preco
					  from produto
					  where CategoriaID = (select CategoriaID from Categoria
										   where NomeCategoria = 'Eletrônicos'));

	-----------------------Exemplo 03---------------------------------------------------------------
	select nomeProduto
	from produto
	where preco < any (select preco 
					   from produto 
					   where CategoriaID = 1 );
	
	-----------------------Exemplo 04---------------------------------------------------------------
	select nomeProduto
	from Produto
	where preco < some (select preco 
						from produto 
						where CategoriaID = 1);

	-----------------------Exemplo 05---------------------------------------------------------------
	select nomeProduto
	from produto
	where exists (select*
				  from pedido
				  where pedido.ProdutoID = Produto.ProdutoID);

	-----------------------Exemplo 06---------------------------------------------------------------
	select nomeProduto
	from produto
	where produtoId in (select produtoId
						from pedido
						where pedidoId in (1,3));

	-----------------------Exemplo 07---------------------------------------------------------------
	select nomeProduto
	from produto
	where CategoriaID = (select CategoriaID
						 from categoria
						 where NomeCategoria = 'Eletrônicos');

	-----------------------Exemplo 08---------------------------------------------------------------
	select nomeProduto
	from produto
	where ProdutoID in (select ProdutoID
						from pedido
						where year (dataPedido) = 2023 and month (dataPedido) = 1);

	-----------------------Exemplo 09---------------------------------------------------------------
	select nomeProduto
	from produto
	where ProdutoID in (Select produtoId 
						from pedido);

	-----------------------Exemplo 10---------------------------------------------------------------
	select nomeCategoria
	from Categoria
	where CategoriaID in (select CategoriaID
						  from produto
						  group by CategoriaID having count(*) >=2);

	-----------------------Exemplo 11---------------------------------------------------------------
	select nomeProduto
	from produto
	where CategoriaID in (select CategoriaID
						  from Categoria
						  where NomeCategoria like 'E%');

	-----------------------Exemplo 12---------------------------------------------------------------
	select nomeCategoria
	from categoria
	where CategoriaID in (select CategoriaID
						  from produto
						  where ProdutoID in (select ProdutoID
											  from pedido
											  where year(DataPedido) = 2023));

	-----------------------Exemplo 13---------------------------------------------------------------
	select nomeProduto
	from produto
	where preco = (select max)

	-----------------------Exemplo 14---------------------------------------------------------------
	select c.NomeCategoria, (select count(*)
	from produto
	where CategoriaID = c.CategoriaId) as NumeroPodutos
	from Categoria c;

	-----------------------Exemplo 15---------------------------------------------------------------
	select nomeCategoria
	from Categoria
	where categoriaID in (select CategoriaID
						  from produto
						  where preco > 1000)
						  union
						  select nomeCategoria
						  from categoria
						  where CategoriaID in (select produto.CategoriaID
												from produto join pedido on produto.ProdutoID = pedido.ProdutoID);

	-----------------------Exemplo 16---------------------------------------------------------------
	select nomeProduto
	from produto
	where preco < 100
	union all
	select nomeProduto
	from produto
	where preco > 100;

	-----------------------Exemplo 17---------------------------------------------------------------
	select nomeCategoria
	from categoria
	where CategoriaID in (select CategoriaID 
						  from produto
						  where preco > 1000)
						  intersect
						  select nomeCategoria
						  from categoria
						  where categoriaId in (select produto.CategoriaID
											    from produto join pedido on produto.ProdutoID = pedido.ProdutoID);

	-----------------------Exemplo 18---------------------------------------------------------------
	select nomeCategoria
	from categoria
	where CategoriaID in (select CategoriaID 
						  from produto
						  where preco > 100)
						  except
						  select nomeCategoria
						  from categoria
						  where categoriaId in (select produto.CategoriaID
											    from produto join pedido on produto.ProdutoID = pedido.ProdutoID);

	-----------------------Exemplo 19---------------------------------------------------------------
