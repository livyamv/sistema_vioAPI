DELIMITER //

CREATE PROCEDURE registrar_compra(
    IN p_id_usuario INT,
    IN p_id_ingresso INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_id_compra INT;

    INSERT INTO compra (data_compra, fk_id_usuario)
    VALUES (NOW(), p_id_usuario);

    SET v_id_compra = LAST_INSERT_ID(); 

    INSERT INTO ingresso_compra (fk_id_compra, fk_id_ingresso, quantidade)
    VALUES (v_id_compra, p_id_ingresso, p_quantidade);
END //

DELIMITER ;
--------------------------------------------------------------------------
delimiter //
create procedure total_ingresso_usuario(
    in p_id_usuario int,
    out p_total_ingressos int
)
begin
set p_total_ingressos = 0;

select coalesce (sum(ic.quantidade),0)
into p_total_ingressos
from ingresso_compra ic
join compra c on ic.fk_id_compra = c.id_compra
where c.fk_id_usuario = p_id_usuario;
end; //

delimiter ;
--------------------------------------------------------------------------
show procedure status where db = 'vio_livia';
--------------------------------------------------------------------------
set @total=0;
--------------------------------------------------------------------------
call total_ingresso_usuario (2,@total);
--------------------------------------------------------------------------
delimiter //
create procedure registrar_presenca(
    in p_id_compra int,
    in p_id_evento int
)
begin
insert into presenca(data_hora_checkin, fk_id_evento, fk_id_compra)
values(now(), p_id_evento, p_id_compra);
end //

delimiter ;
--------------------------------------------------------------------------
call registrar_presenca(1, 3); 