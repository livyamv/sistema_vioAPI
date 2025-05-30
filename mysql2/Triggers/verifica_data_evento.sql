delimiter //
create trigger  verifica_data_evento
before insert on ingresso_compra
for each row
begin
    declare data_evento datetime;

    -- Buscar data do evento 
    select e.data_hora into data_evento
    from ingresso i join evento e on i.fk_id_evento = e.id_evento
    where i.id_ingresso = new.fk_id_ingresso;

    -- Verificar se o evento já ocorreu
    if date(data_evento) < curdate()then
        signal sqlstate '45000'
        set message_text = 'Não é possível comprar ingresso para eventos passados!';
        end if;
end;//
delimiter ;
--------------------------------------------------------------------------------------
insert into ingresso_compra (fk_id_compra, fk_id_ingresso) values(1,3);

insert into evento (nome, data_hora, local, descricao, fk_id_organizador)
values ('Festival Urbano', '2025-05-30 22:00:00', 'Ribeirão Preto', 'Festival de trap', 1);


insert into ingresso (preco, tipo, fk_id_evento) values (200,'vip', 4),(130,'pista', 4);

--------------------------------------------------------------------------------------
