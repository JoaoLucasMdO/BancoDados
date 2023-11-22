create database bdfatura;
use bdfatura;

create table cliente
(codcliente  int not null
,nome  varchar(50)
,area  varchar(3)
,telefone varchar(30)
,saldo   money);

alter table cliente add constraint pk_cliente primary key (codcliente);

create table fatura
(nrfatura  int not null
,datafatura date
,codcliente int);

alter table fatura add constraint pk_fatura primary key (nrfatura);
alter table fatura add constraint Fk_fatura_cli foreign key(codcliente) references cliente (codcliente);

create table fornecedor
(codforn  int not null
,telefone varchar(20)
,nomeforn varchar(50));

alter table fornecedor add constraint pk_fornecedor primary key (codforn);

create table produto
(codproduto  varchar(10) not null
,descricao varchar(50)
,preco money
,desconto money
,codforn int
,saldo int);

alter table produto add constraint pk_produto primary key (codproduto);
alter table produto add constraint fk_produto_forn foreign key(codforn) references fornecedor (codforn);

create table itens_fatura
(nrfatura int not null
,codproduto varchar(10) not null
,qtde int
,valor money);
alter table itens_fatura add constraint pk_itens_fatura primary key (nrfatura, codproduto);
alter table itens_fatura add constraint fk_itens_produto foreign key(codproduto) references produto (codproduto);
alter table itens_fatura add constraint fk_itens_fatura foreign key(nrfatura) references fatura (nrfatura);