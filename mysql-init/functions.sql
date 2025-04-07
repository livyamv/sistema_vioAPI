delimiter $$
-- criação da função
create function calcula_idade(datanascimento date)
returns int
deterministic
no SQL
begin
declare idade int;
set idade = timestampdiff(year,datanascimento, curdate());
return idade;
end; $$
delimiter ;
--------------------------------------------------------------------------
-- verifica se a função especificada foi criada
show create function calcula_idade;
--------------------------------------------------------------------------
select name, calcula_idade(data_nascimento) as idade
from usuario;
--------------------------------------------------------------------------
delimiter $$
create function status_sistema()
returns varchar(50)
no SQL
begin
return 'Sistema operando normalmente';
end; $$
delimiter ;
--------------------------------------------------------------------------
select status_sistema();
--------------------------------------------------------------------------
delimiter $$
create function total_compras_usuario(id_usuario int)
returns int
reads sql data
begin
declare total int;
select count(*) into total
from compra
where id_usuario = compra.fk_id_usuario;
return total;
end; $$
delimiter ;
--------------------------------------------------------------------------
select total_compras_usuario(1)as 'total_compras';
--------------------------------------------------------------------------
-- tabela para testar a clausla madifies sql data
create table log_evento(
    id_log int auto_increment primary key,
    mensagem varchar(255),
    data_log datetime default current_timestamp);

delimiter $$
create function registrar_log_evento(texto varchar(255))
returns varchar(255)
deterministic
modifies sql data
begin
insert into log_evento(mensagem)
values (texto);
return 'log inserido com sucesso';
end; $$
delimiter ;
--------------------------------------------------------------------------
show create function registrar_log_evento;
--------------------------------------------------------------------------
drop function registrar_log_evento;
--------------------------------------------------------------------------
show variables like 'log_bin_trust_function_creators';
--------------------------------------------------------------------------
set global log_bin_trust_function_creators = 1;
--------------------------------------------------------------------------
select registrar_log_evento('teste');
--------------------------------------------------------------------------
delimiter $$
create function mensagem_de_boas_vindas(nome_usuario varchar (100))
returns varchar(255)
deterministic
contains sql
begin
declare msg varchar(255);
set msg= concat('Olá,', nome_usuario, '.Seja Bem-Vindo(a) ao sistema VIO.');
return msg;
end; $$
delimiter ;
--------------------------------------------------------------------------