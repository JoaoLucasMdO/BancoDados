--Exemplo 01

--Tabela 01 do Exemplo 01
create table livros(
livro_id int constraint PK_livroId primary key not null,
titulo varchar(200),
autor varchar(200),
ano_publicado int,
genero varchar(50));

 --Inserts
insert into livros values(1,'não sei',1900,'algum aí',1);
insert into livros values(2,'não sei',1900,'algum aí',2);
insert into livros values(3,'não sei',1900,'algum aí',3);
insert into livros values(4,'não sei',1900,'algum aí',4);
insert into livros values(5,'não sei',1900,'algum aí',5);
insert into livros values(6,'não sei',1900,'algum aí',6);
insert into livros values(7,'não sei',1900,'algum aí',7);
insert into livros values(8,'não sei',1900,'algum aí',8);
insert into livros values(9,'não sei',1900,'algum aí',9);
insert into livros values(10,'não sei',1900,'algum aí',10);

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
insert into emprestimos values(1,'15/03/1578','01/05/2708',1,'Não devolvido');
insert into emprestimos values(2,'15/03/1578','01/05/2708',2,'Não devolvido');
insert into emprestimos values(3,'15/03/1578','01/05/2708',3,'Não devolvido');
insert into emprestimos values(4,'15/03/1578','01/05/2708',4,'Não devolvido');
insert into emprestimos values(5,'15/03/1578','01/05/2708',5,'Não devolvido');
insert into emprestimos values(6,'15/03/1578','01/05/2708',6,'Não devolvido');
insert into emprestimos values(7,'15/03/1578','01/05/2708',7,'Não devolvido');
insert into emprestimos values(8,'15/03/1578','01/05/2708',8,'Não devolvido');
insert into emprestimos values(9,'15/03/1578','01/05/2708',9,'Não devolvido');
insert into emprestimos values(10,'15/03/1578','01/05/2708',10,'Não devolvido');

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
insert into estados values(1,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(2,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(3,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(4,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(5,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(6,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(7,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(8,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(9,'Um estado aí','NN','Alguma região aí', 25);
insert into estados values(10,'Um estado aí','NN','Alguma região aí', 25);

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
insert into cidades values(1,'Alguma cidade aí',1,25,80);
insert into cidades values(2,'Alguma cidade aí',2,25,80);
insert into cidades values(3,'Alguma cidade aí',3,25,80);
insert into cidades values(4,'Alguma cidade aí',4,25,80);
insert into cidades values(5,'Alguma cidade aí',5,25,80);
insert into cidades values(6,'Alguma cidade aí',6,25,80);
insert into cidades values(7,'Alguma cidade aí',7,25,80);
insert into cidades values(8,'Alguma cidade aí',8,25,80);
insert into cidades values(9,'Alguma cidade aí',9,25,80);
insert into cidades values(10,'Alguma cidade aí',10,25,80);

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
insert into diretores values(1,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(2,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(3,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(4,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(5,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(6,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(7,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(8,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(9,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');
insert into diretores values(10,'algm aí', '12/04/1876','algm@algumacoisa.com','9999999999');

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
insert into departamentos values(1,'Algm aí','algm lugar aí',1);
insert into departamentos values(2,'Algm aí','algm lugar aí',2);
insert into departamentos values(3,'Algm aí','algm lugar aí',3);
insert into departamentos values(4,'Algm aí','algm lugar aí',4);
insert into departamentos values(5,'Algm aí','algm lugar aí',5);
insert into departamentos values(6,'Algm aí','algm lugar aí',6);
insert into departamentos values(7,'Algm aí','algm lugar aí',7);
insert into departamentos values(8,'Algm aí','algm lugar aí',8);
insert into departamentos values(9,'Algm aí','algm lugar aí',9);
insert into departamentos values(10,'Algm aí','algm lugar aí',10);

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
insert into times values(1,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(2,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(3,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(4,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(5,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(6,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(7,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(8,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(9,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');
insert into times values(10,'Algum time aí','Alguma cidade aí','12/05/1234','algum tecnico aí');

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
insert into jogadores values(1, 'Algum jogador aí', 'Alguma aí', 19, 1);
insert into jogadores values(2, 'Algum jogador aí', 'Alguma aí', 29, 2);
insert into jogadores values(3, 'Algum jogador aí', 'Alguma aí', 39, 3);
insert into jogadores values(4, 'Algum jogador aí', 'Alguma aí', 49, 4);
insert into jogadores values(5, 'Algum jogador aí', 'Alguma aí', 59, 5);
insert into jogadores values(6, 'Algum jogador aí', 'Alguma aí', 69, 6);
insert into jogadores values(7, 'Algum jogador aí', 'Alguma aí', 79, 7);
insert into jogadores values(8, 'Algum jogador aí', 'Alguma aí', 89, 8);
insert into jogadores values(9, 'Algum jogador aí', 'Alguma aí', 99, 9);
insert into jogadores values(10, 'Algum jogador aí', 'Alguma aí', 119, 10);

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

insert into autores values(1,'josé','05/12/1998','Sei lá', 'algum aí');
insert into autores values(2,'jos','05/12/1998','Sei lá', 'algum aí');
insert into autores values(3,'jsé','05/12/1998','Sei lá', 'algum aí');
insert into autores values(4,'osé','05/12/1998','Sei lá', 'algum aí');
insert into autores values(5,'sé','05/12/1998','Sei lá', 'algum aí');
insert into autores values(6,'jo','05/12/1998','Sei lá', 'algum aí');
insert into autores values(7,'j','05/12/1998','Sei lá', 'algum aí');
insert into autores values(8,'s','05/12/1998','Sei lá', 'algum aí');
insert into autores values(9,'o','05/12/1998','Sei lá', 'algum aí');
insert into autores values(10,'é','05/12/1998','Sei lá', 'algum aí');

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

