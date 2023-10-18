select DATENAME(MONTH, GETDATE());

select datepart(mm, getdate());
select datepart(MONTH, GETDATE());

select MONTH(getdate());

select YEAR(GETDATE());

select datediff(dd, getdate(), getdate()+366);

select datediff(yy, getdate(), getdate()+720);

select dateadd(yy, 1, getdate());

select DATENAME(MONTH,(dateadd(month,3,getdate())));

select ISDATE('27-02-2023');

select ISDATE('30-02-2023');

select convert(char, getdate(), 103);

select convert(char, getdate(), 113);

select round(123.34567, 3);

select round(123.34567, 2);

select round(123.34567, 1);

select round(123.34567, 0);

select round(123.34567, -1);

select round(123.34567, -2);

select floor(123.45);

select power(4,2);

select power(2,2);

select ascii('a'),ascii('aMANDA');

select char(97), char(65);

select charindex('Mundo', 'Ola Mundo Bonito');

select charindex('Mundo', 'Ola Mundo Bonito', 3);

select charindex('Mundo', 'Ola Mundo Bonito', 6);

select replace('abcdefghicde', 'cde', 'xxx');

select replace(primeiro_nome, 'C', 'Z') from Funcionario;

select stuff('abcdef', 2, 3, '_ijklmn_');

select left('abcdefgh', 5);

select right('abcdefgh', 5);

select replicate('ABC ', 3);

SELECT substring('ABCDEFGHIJ', 2,3);

select len('ABCD');

select len('ABCD   ');

select reverse('ABCD');

select lower('AbCD');

select lower(primeiro_nome) from Funcionario;

select upper('AbCD');

select upper(primeiro_nome) from Funcionario;

select '_' + ltrim(' AbCD ') + '_';