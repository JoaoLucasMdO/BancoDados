--Exemplo 01

--Tabela 01 do Exemplo 01
create table livros(
livro_id int constraint PK_livroId primary key not null,
titulo varchar(200),
autor varchar(200),
ano_publicado int,
genero varchar(50));

 --Inserts
insert into livros values(1,'n�o sei',1900,'algum a�',1);
insert into livros values(2,'n�o sei',1900,'algum a�',2);
insert into livros values(3,'n�o sei',1900,'algum a�',3);
insert into livros values(4,'n�o sei',1900,'algum a�',4);
insert into livros values(5,'n�o sei',1900,'algum a�',5);
insert into livros values(6,'n�o sei',1900,'algum a�',6);
insert into livros values(7,'n�o sei',1900,'algum a�',7);
insert into livros values(8,'n�o sei',1900,'algum a�',8);
insert into livros values(9,'n�o sei',1900,'algum a�',9);
insert into livros values(10,'n�o sei',1900,'algum a�',10);

--Ver os dados da tabela livros
select*
from livros;


--Testar a restri��o da chave estrangeira
insert into livros values(100, 'algm', 2005, 'algm', 400);

--Tabela 02 do Exemplo 01
create table emprestimos(
emprestimo_id int constraint PK_emprestimoId primary key not null,
data_emprestimo date,
data_devolucao date,
livro_id int constraint FK_livroId foreign key references Livros(livro_id),
status varchar(20));

--Inserts
insert into emprestimos values(1,'15/03/1578','01/05/2708',1,'N�o devolvido');
insert into emprestimos values(2,'15/03/1578','01/05/2708',2,'N�o devolvido');
insert into emprestimos values(3,'15/03/1578','01/05/2708',3,'N�o devolvido');
insert into emprestimos values(4,'15/03/1578','01/05/2708',4,'N�o devolvido');
insert into emprestimos values(5,'15/03/1578','01/05/2708',5,'N�o devolvido');
insert into emprestimos values(6,'15/03/1578','01/05/2708',6,'N�o devolvido');
insert into emprestimos values(7,'15/03/1578','01/05/2708',7,'N�o devolvido');
insert into emprestimos values(8,'15/03/1578','01/05/2708',8,'N�o devolvido');
insert into emprestimos values(9,'15/03/1578','01/05/2708',9,'N�o devolvido');
insert into emprestimos values(10,'15/03/1578','01/05/2708',10,'N�o devolvido');

--Ver os dados da tabela emprestimos
select*
from emprestimos;

--Testar a restri��o da chave estrangeira
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
insert into estados values(1,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(2,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(3,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(4,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(5,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(6,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(7,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(8,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(9,'Um estado a�','NN','Alguma regi�o a�', 25);
insert into estados values(10,'Um estado a�','NN','Alguma regi�o a�', 25);

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
insert into cidades values(1,'Alguma cidade a�',1,25,80);
insert into cidades values(2,'Alguma cidade a�',2,25,80);
insert into cidades values(3,'Alguma cidade a�',3,25,80);
insert into cidades values(4,'Alguma cidade a�',4,25,80);
insert into cidades values(5,'Alguma cidade a�',5,25,80);
insert into cidades values(6,'Alguma cidade a�',6,25,80);
insert into cidades values(7,'Alguma cidade a�',7,25,80);
insert into cidades values(8,'Alguma cidade a�',8,25,80);
insert into cidades values(9,'Alguma cidade a�',9,25,80);
insert into cidades values(10,'Alguma cidade a�',10,25,80);

--Ver os dados da tabela cidades
select*
from cidades;

--Testar a restri��o da chave estrangeira
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
insert into diretores values(1,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(2,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(3,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(4,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(5,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(6,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(7,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(8,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(9,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(10,'algm a�', '12/04/1876','algm@algumacoisa.com','9999999999');

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
insert into departamentos values(1,'Algm a�','algm lugar a�',1);
insert into departamentos values(2,'Algm a�','algm lugar a�',2);
insert into departamentos values(3,'Algm a�','algm lugar a�',3);
insert into departamentos values(4,'Algm a�','algm lugar a�',4);
insert into departamentos values(5,'Algm a�','algm lugar a�',5);
insert into departamentos values(6,'Algm a�','algm lugar a�',6);
insert into departamentos values(7,'Algm a�','algm lugar a�',7);
insert into departamentos values(8,'Algm a�','algm lugar a�',8);
insert into departamentos values(9,'Algm a�','algm lugar a�',9);
insert into departamentos values(10,'Algm a�','algm lugar a�',10);

--Ver os dados da tabela departamentos
select*
from departamentos;

--Testar a restri��o da chave estrangeira
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
insert into times values(1,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(2,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(3,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(4,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(5,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(6,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(7,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(8,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(9,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');
insert into times values(10,'Algum time a�','Alguma cidade a�','12/05/1234','algum tecnico a�');

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
insert into jogadores values(1, 'Algum jogador a�', 'Alguma a�', 19, 1);
insert into jogadores values(2, 'Algum jogador a�', 'Alguma a�', 29, 2);
insert into jogadores values(3, 'Algum jogador a�', 'Alguma a�', 39, 3);
insert into jogadores values(4, 'Algum jogador a�', 'Alguma a�', 49, 4);
insert into jogadores values(5, 'Algum jogador a�', 'Alguma a�', 59, 5);
insert into jogadores values(6, 'Algum jogador a�', 'Alguma a�', 69, 6);
insert into jogadores values(7, 'Algum jogador a�', 'Alguma a�', 79, 7);
insert into jogadores values(8, 'Algum jogador a�', 'Alguma a�', 89, 8);
insert into jogadores values(9, 'Algum jogador a�', 'Alguma a�', 99, 9);
insert into jogadores values(10, 'Algum jogador a�', 'Alguma a�', 119, 10);

--Ver os dados da tabela jogadores
select*
from jogadores

--Testar a restri��o da chave estrangeira
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

insert into autores values(1,'jos�','05/12/1998','Sei l�', 'algum a�');
insert into autores values(2,'jos','05/12/1998','Sei l�', 'algum a�');
insert into autores values(3,'js�','05/12/1998','Sei l�', 'algum a�');
insert into autores values(4,'os�','05/12/1998','Sei l�', 'algum a�');
insert into autores values(5,'s�','05/12/1998','Sei l�', 'algum a�');
insert into autores values(6,'jo','05/12/1998','Sei l�', 'algum a�');
insert into autores values(7,'j','05/12/1998','Sei l�', 'algum a�');
insert into autores values(8,'s','05/12/1998','Sei l�', 'algum a�');
insert into autores values(9,'o','05/12/1998','Sei l�', 'algum a�');
insert into autores values(10,'�','05/12/1998','Sei l�', 'algum a�');

--Ver os dados da tabela
select*
from autores

--Tirar o autor Varchar
alter table livros
drop column autor;

--Adicionar o autor Int
alter table livros
add autor_id int;

--Adicionar a restri��o chave estrangeira
alter table livros
add constraint FK_autorId foreign key(autor_id) references autores(autor_id);

--Ver como ta a tabela
select*
from livros;

