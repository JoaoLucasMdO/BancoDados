 ----------Creates Exemplo Insert com Select 01 ----------------------------------------------------------

 create table Pessoa(
 id_pessoa integer primary key,
 nome varchar(20),
 cpf varchar(14)
 );

 create table PessoaFisica(
 id_pessoa integer primary key,
 nome varchar(20),
 cpf varchar(14)
 );

 ------------Inserts Exemplo Insert com Select 01-------------------------------------------------------------

 insert into pessoa values(1, 'Pedro Cabral','12345678991');

 insert into PessoaFisica 
 select id_pessoa, nome, cpf 
 from pessoa;

 select*
 from pessoafisica;