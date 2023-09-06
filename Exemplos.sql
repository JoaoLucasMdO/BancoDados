drop database Exemplos;

USE msdb;
create database Exemplos;
use Exemplos;
--Exemplo 01

--Tabela 01 do Exemplo 01
create table livros(
livro_id int constraint PK_livroId primary key not null,
titulo varchar(200),
autor varchar(200),
ano_publicado int,
genero varchar(50));

 --Inserts
insert into livros values(1,'O PEQUENO PRÍNCIPE',1952,'Fábula',1);
insert into livros values(2,'1984',1949,'romance',2);
insert into livros values(3,'A REVOLUÇÃO DOS BICHOS',1945,'Fábula',2);
insert into livros values(4,'ROMEU E JULIETA',1476,'Tragédia',3);
insert into livros values(5,'DOM QUIXOTE DE LA MANCHA',1605,'Romance',4);
insert into livros values(6,'A METAMORFOSE',1915,'Conto',5);
insert into livros values(7,'O ENSAIO SOBRE A CEGUEIRA',1995,'Romance',6);
insert into livros values(8,'A HORA DA ESTRELA',1977,'Romance',7);
insert into livros values(9,'CRIME E CASTIGO',1866,'Romance',8);
insert into livros values(10,'ORGULHO E PRECONCEITO',1813,'Romance',9);

--Ver os dados da tabela livros
select*
from livros;


--Testar a restrição da chave estrangeira
insert into livros values(100, 'algm', 2005, 'algm', 400);

--Tabela 02 do Exemplo 01
create table emprestimos(
emprestimo_id int constraint PK_emprestimoId primary key not null,
data_emprestimo date,
data_devolucao date,
livro_id int constraint FK_livroId foreign key references Livros(livro_id),
status varchar(20));

--Inserts
insert into emprestimos values(1,'2015/07/23','2020/08/10',1,'Devolvido');
insert into emprestimos values(2,'2010/12/20','2011/05/25',2,'Devolvido');
insert into emprestimos values(3,'2022/12/05','2023/02/22',3,'Devolvido');
insert into emprestimos values(4,'2023/03/23','2023/04/20',4,'Devolvido');
insert into emprestimos values(5,'2021/05/15','2021/06/01',5,'Devolvido');
insert into emprestimos values(6,'2016/02/14','2016/05/02',6,'Devolvido');
insert into emprestimos values(7,'2016/05/23','2016/07/01',7,'Devolvido');
insert into emprestimos values(8,'2018/04/11','2018/05/12',8,'Devolvido');
insert into emprestimos values(9,'2020/06/15','2020/07/16',9,'Devolvido');
insert into emprestimos values(10,'2009/05/11','2009/07/13',10,'Devolvido');

--Ver os dados da tabela emprestimos
select*
from emprestimos;

--Testar a restrição da chave estrangeira
insert into emprestimos values(100,'23/05/1998','27/06/2004',400,'funciona?');

--Exemplo 02

--Tabela 01 do exemplo 02
create table estados(
estado_id int constraint PK_estadoId primary key not null,
nome varchar(100),
sigla varchar (2),
regiao varchar(50),
poulacao int);

--Inserts
insert into estados values(1,'São Paulo','SP','Sudeste', 46650000);
insert into estados values(2,'Rio de Janeiro','RJ','Sudeste', 17460000);
insert into estados values(3,'Bahia','BH','Nordeste', 14136417);
insert into estados values(4,'Paraná','PR','Sul', 11443208);
insert into estados values(5,'Rio Grande do Sul','RS','Sul', 10880506);
insert into estados values(6,'Pernambuco','PE','Nordeste', 9058155);
insert into estados values(7,'Ceará','CE','Nordeste', 8791688);
insert into estados values(8,'Minas Gerais','MG','Sudeste', 21410000);
insert into estados values(9,'Pará','PA','Norte',  8116132);
insert into estados values(10,'Santa Catarina','SC','Sul', 7609601);

--Ver os dados da tabela estados
select*
from estados;

--Tabela 02 do exemplo 02
create table cidades(
cidade_id int constraint PK_cidadeId primary key not null,
nome varchar(100),
estado_id int constraint FK_estadoId foreign key references estados(estado_id),
populacao int,
area_km2 decimal(10,2));

--Inserts
insert into cidades values(1,'São Paulo',1,25,80);
insert into cidades values(2,'Paraty',2,25,80);
insert into cidades values(3,'Salvador',3,25,80);
insert into cidades values(4,'Curitiba',4,25,80);
insert into cidades values(5,'Porto Alegre',5,25,80);
insert into cidades values(6,'Recife',6,25,80);
insert into cidades values(7,'Fortaleza',7,25,80);
insert into cidades values(8,'Belo Horizonte',8,25,80);
insert into cidades values(9,'Acará',9,25,80);
insert into cidades values(10,'Florianópolis',10,25,80);

--Ver os dados da tabela cidades
select*
from cidades;

--Testar a restrição da chave estrangeira
insert into cidades values (100,'algm',400,3,16);

--Exemplo 03

--Tabela 01 do Exemplo 03
create table diretores(
diretor_id int constraint PK_diretorId primary key not null,
nome varchar(100),
data_nascimento date,
email varchar(150),
telefone varchar(20));

--Inserts
insert into diretores values(1,'José', '12/04/1976','José@gmail.com','9958473627');
insert into diretores values(2,'Rodrigo', '12/04/1986','Rodrigo@gmail.com','9938274625');
insert into diretores values(3,'Bernardo', '12/04/1966','Bernardo@gmail.com','1928374650');
insert into diretores values(4,'Pedro', '12/04/2001','Pedro@gmail.com','9583256701');
insert into diretores values(5,'João', '12/04/1996','João@gmail.com','1533489582');
insert into diretores values(6,'Ronaldo', '12/04/1966','Ronaldo@gmail.com','1428954671');
insert into diretores values(7,'Ronald', '12/04/1979','Ronald@gmail.com','1027584929');
insert into diretores values(8,'Wellington', '12/04/1989','Wellington@gmail.com','2930167584');
insert into diretores values(9,'William', '12/04/1975','William@gmail.com','1027384956');
insert into diretores values(10,'Bruno', '12/04/1980','Bruno@gmail.com','1846372890');

--Ver os dados da tabela diretores
select*
from diretores;

--Tabela 02 do Exemplo 03
create table departamentos(
departamento_id int constraint PK_departamentoId primary key not null,
nome varchar(200),
localizacao varchar(150),
diretor_id int constraint FK_diretorId foreign key references diretores(diretor_id));

--Inserts
insert into departamentos values(1,'Departamento 01','São Paulo',1);
insert into departamentos values(2,'Departamento 02','Paraty',2);
insert into departamentos values(3,'Departamento 03','Salvador',3);
insert into departamentos values(4,'Departamento 04','Curitiba',4);
insert into departamentos values(5,'Departamento 05','Porto Alegre',5);
insert into departamentos values(6,'Departamento 06','Recife',6);
insert into departamentos values(7,'Departamento 07','Fortaleza',7);
insert into departamentos values(8,'Departamento 08','Belo Horizonte',8);
insert into departamentos values(9,'Departamento 09','Acará',9);
insert into departamentos values(10,'Departamento 10','Florianópolis',10);

--Ver os dados da tabela departamentos
select*
from departamentos;

--Testar a restrição da chave estrangeira
insert into departamentos values(200,'algm','algm lugar',400);

--Exemplo 04

--Tabela 01 do Exemplo 04
create table times(
time_id int constraint PK_timeId primary key not null,
nome varchar(200),
cidade varchar(100),
fundacao date,
tecnico varchar(150));

--Inserts
insert into times values(1,'Napoli','Nápoles','1926/08/01','Rudi Garcia');
insert into times values(2,'Al-Ahly','Cairo','1907/04/24','Marcel Koller');
insert into times values(3,'Independiente dell Valle','Sangolquí','1958/03/01','Ramírez');
insert into times values(4,'Porto','Porto','1893/09/28','Paulo Fonseca');
insert into times values(5,'Liverpool','Liverpool','1892/03/14','Jürgen Klopp');
insert into times values(6,'Benfica','Lisboa','1933/03/23','Roger Schmidt');
insert into times values(7,'Palmeiras','São Paulo','1914/08/26','Abel Ferreira');
insert into times values(8,'Manchester City','Manchester','1894/04/16','Josep Guardiola');
insert into times values(9,'Real Madrid','Madrid','1902/03/06','Carlo Ancelotti');
insert into times values(10,'Flamengo','Rio de Janeiro','1895/11/17','Paulo Sousa');

--Ver os dados da tabela times
select*
from times

--Tabela 02 do Exemplo 04
create table jogadores(
jogador_id int constraint PK_jogadorId primary key not null,
nome varchar(100),
posicao varchar(50),
idade int,
time_id int constraint FK_timeId foreign key references times(time_id));

--Inserts
insert into jogadores values(1, 'Mário Rui', 'Lateral-esquerdo', 32, 1);
insert into jogadores values(2, 'El Shenawy', 'Goleiro', 34, 2);
insert into jogadores values(3, 'Ramírez', 'Goleiro', 22, 3);
insert into jogadores values(4, 'Pepe', 'Zagueiro', 40, 4);
insert into jogadores values(5, 'Van Dijk, Virgil', 'Zagueiro', 32, 5);
insert into jogadores values(6, 'Di Maria, Ángel', 'Meio-Campista', 35, 6);
insert into jogadores values(7, 'Weverton', 'Goleiro', 34, 7);
insert into jogadores values(8, 'Carson, Scott', 'Goleiro', 38, 8);
insert into jogadores values(9, 'Dani Carvajal', 'Lateral-Direito', 31, 9);
insert into jogadores values(10, 'Luiz, David', 'Zagueiro', 36, 10);

--Ver os dados da tabela jogadores
select*
from jogadores

--Testar a restrição da chave estrangeira
insert into jogadores values (100,'algm','algm lugar', 19, 400);

--Exemplo 05

--Tabela 01 do Exemplo 05
create table autores(
autor_id int constraint PK_autorId primary key not null,
nome varchar(100),
data_nasc date,
nacionalidade varchar(50),
genero varchar(50));

--Inserts

insert into autores values(1,'ANTOINE DE SAINT-EXUPÉRY','1900/06/29','França', 'Fábula');
insert into autores values(2,'GEORGE ORWELL','1903/06/25','índia', 'Pessimismo');
insert into autores values(3,'WILLIAM SHAKESPEARE','1564/04/23','Inglaterra', 'Comédia, Tragédia');
insert into autores values(4,'MIGUEL DE CERVANTES','1547/09/29','Espanha', 'Realismo');
insert into autores values(5,'FRANZ KAFKA','1883/07/03','Alemanha', 'Conto');
insert into autores values(6,'JOSÉ SARAMAGO','1992/11/16','Portugal', 'Prosa');
insert into autores values(7,'CLARICE LISPECTOR','1920/12/10','Ucrânia', 'Intimista');
insert into autores values(8,'FIÓDOR DOSTOIÉVSKI','1821/11/11','Rússia', 'Realismo');
insert into autores values(9,'JANE AUSTEN','1775/12/16','Inglaterra', 'Romantismo');
insert into autores values(10,'JOANNE KATHLEEN ROWLING','1965/07/31','Ingaterra', 'Literatura fantástica');

--Ver os dados da tabela
select*
from autores

--Tirar o autor Varchar
alter table livros
drop column autor;

--Adicionar o autor Int
alter table livros
add autor_id int;

--Adicionar a restrição chave estrangeira
alter table livros
add constraint FK_autorId foreign key(autor_id) references autores(autor_id);

--Ver como ta a tabela
select*
from livros;


--Teste

create table Tbl_Clientes(
codigo int identity(1,1) primary key,
nome varchar(100),
uf varchar(2)
);

insert into Tbl_Clientes(nome,uf) values('Nicholas','RS');
insert into Tbl_Clientes(nome,uf) values('Ricardo','RJ');
insert into Tbl_Clientes(nome,uf) values('João','SP');

select*
from Tbl_Clientes;

--Mostra o número do último registro da tabela
select IDENT_CURRENT('Tbl_Clientes');

--Mostra o número do último registro da tabela com o nome da coluna sendo Ultimo_Registro
select IDENT_CURRENT('Tbl_Clientes') as Ultimo_Registro;