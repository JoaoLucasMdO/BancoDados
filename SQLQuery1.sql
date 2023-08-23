create table Cliente(
Cod_Cli int constraint Pk_Cliente primary key not null,
Nome_Cli varchar(40) not null,
End_Cli varchar(30) not null,
Bai_Cli varchar(20) not null,
Cid_Cli varchar(20) not null,
Uf_Cli char(3) not null,
Tel_Cli varchar(15) null,
);

create table NotaFiscal(
Num_Nota int constraint PK_NotaFiscal primary key not null,
Cod_Cli int not null,
Serie_Nota varchar (10) not null,
Emissao_Nota smalldatetime null,
Vtot_Nota smallMoney not null,
constraint FK_Cliente foreign key(Cod_Cli) references Cliente(Cod_Cli)
);



create table Cidade(
cod_cidade varchar(2) not null,
nome_cidade varchar(40)
);

create table Empregado(
Nrmatricula_empregado int,
Nome_emprego varchar(50),
data_emissao_empregado datetime,
salario float
);

create table estado(
cod_estado varchar(2) not null,
nome_estado varchar(3)
);

alter table cidade add primary key(cod_cidade);

alter table cidade add cod_estado char(2) not null, teste varchar(1) null;

alter table cidade drop column teste;

alter table cidade alter column cod_estado varchar(2);

alter table cidade drop constraint FK__Cidade__cod_esta__571DF1D5

alter table estado add primary key(cod_estado);

alter table cidade add foreign key(cod_estado) references estado(cod_estado);


insert into Cidade values ('1','Votorantim','1');

insert into estado values ('1','SP');

insert into cidade values('2','Itu','NN');

insert into estado values ('NN','Não');

delete from cidade where cod_cidade like '1';

select cod_cidade, nome_cidade, nome_estado
from Cidade, estado;

drop table Cliente;

drop table Cidade;

drop table estado;

drop table NotaFiscal;




