use BDTeste;

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
nome_estado varchar(30)
);

alter table cidade add primary key(cod_cidade);

alter table cidade add cod_estado char(2) not null, teste varchar(1) null;

alter table cidade drop column teste;

alter table cidade alter column cod_estado varchar(2);

alter table cidade drop constraint FK__Cidade__cod_esta__571DF1D5

alter table estado add primary key(cod_estado);

alter table cidade add foreign key(cod_estado) references estado(cod_estado);

--Cidades
insert into Cidade values ('1','Votorantim','SP');

insert into cidade values('2','Itu','NN');

insert into Cidade values ('3','Ribeirão Preto','SP');

insert into Cidade values ('4','Ubatuba','SP');

insert into Cidade values ('5','Santos','SP');

insert into Cidade values ('6','Acrelândia','AC');

insert into Cidade values ('7','Macapá','AP');

insert into Cidade values ('8','Salvador','BA');

insert into Cidade values ('9','São Luís','MA');

insert into Cidade values ('10','Belo Horizonte','MG');

insert into Cidade values ('11','Maricá','RJ');

insert into Cidade values ('12','Novo Alegre','TO');

insert into Cidade values ('13','Itapira','SP');

--Estados
insert into estado values ('NN','Não Cadasstrado');

insert into estado values ('SP','São Paulo');

insert into estado values ('AC','Acre');

insert into estado values ('AP','Amapá');

insert into estado values ('BA','Bahia');

insert into estado values ('MA','Maranhão');

insert into estado values ('MG','Minas Gerais');

insert into estado values ('RJ','Rio de Janeiro');

insert into estado values ('TO','Tocantins');

insert into estado values ('SE','Sergipe');

insert into estado values ('ES','Espírito Santo');

insert into estado values ('GO','Goiás');


update Cidade set cod_estado = 'SP' where cod_estado = 'NN'


delete from cidade where nome_cidade = 'Itapira';

select*
from Cidade where cod_estado = 'SP';

select*
from Cidade

drop table Cliente;

drop table Cidade;

drop table estado;

drop table NotaFiscal;




