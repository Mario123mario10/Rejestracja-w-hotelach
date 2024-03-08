create or replace PROCEDURE register_client(p_first_name varchar2, p_last_name varchar2, 
    p_document_number varchar2, p_address_id clients.address_id%type, p_hotel_name varchar2,
    p_room_class_id classes.id%type, p_end_date registrations.end_date%type, p_parking_type_name varchar2,
    p_payment_method_name varchar2)
as
v_hotel_id hotels.id%type;
v_client_id clients.id%type;
v_registration_id registrations.id%type;
v_payments_id payments.id%type;
v_room_avaliable boolean;
v_parking_avaliable boolean;
v_payment_method_id payment_methods.id%type;
v_money_to_pay number;
v_price_for_day classes.price%type;
v_parking_id parking_places.id%type;
v_hotel_name hotels.name%type;
v_dif_of_days number;
begin
    begin
    select id into v_hotel_id from hotels where name = p_hotel_name;
    exception
        when NO_DATA_FOUND then
            dbms_output.put_line('There is no hotel with name: '||p_hotel_name);
    end;
    
    
    begin
    select id into v_parking_id from parking_places where parking_type_id = (select id from parking_types where name = p_parking_type_name) and hotel_id = v_hotel_id;
    exception
    when NO_DATA_FOUND then
            dbms_output.put_line('There is no type of parking place with name: '||p_parking_type_name);
    end;
        

    v_room_avaliable := check_if_room_is_avaliable(v_hotel_id, p_room_class_id);

    v_parking_avaliable := check_if_parking_is_avaliable(v_hotel_id, v_parking_id);

    if v_room_avaliable
    then
    SELECT Registrations_seq.nextval INTO v_registration_id FROM DUAL;

    SELECT Clients_seq.nextval INTO v_client_id FROM DUAL;

    select payments_seq.nextval into v_payments_id from dual;

    begin
    select id into v_payment_method_id from payment_methods where name = p_payment_method_name;
    exception
        when NO_DATA_FOUND then
            dbms_output.put_line('There is no type of payment with name: '||p_parking_type_name);
    end;
    
    begin
    select price into v_price_for_day from classes where id = p_room_class_id;
    exception
        when NO_DATA_FOUND then
            dbms_output.put_line('There is no class with id: '||p_room_class_id);
    end;

    
    select p_end_date - sysdate into v_dif_of_days from dual;
    
    v_money_to_pay := ( v_dif_of_days + 1) * v_price_for_day;
    
    insert into payments values(v_payments_id, v_money_to_pay, v_payment_method_id);
    
    if v_parking_avaliable
    then
    insert into registrations values(v_registration_id, sysdate, p_end_date, v_payments_id, p_room_class_id, v_parking_id, v_hotel_id);
    else raise VALUE_ERROR;
    dbms_output.put_line('Invalid parking place error');
    end if;

    if v_dif_of_days > 0 then
    insert into clients values(v_client_id, p_first_name, p_last_name, p_document_number, p_address_id, v_registration_id);
    else
    dbms_output.put_line('Invalid date error.');
    end if;

    else
    dbms_output.put_line('No room in hotel '|| p_hotel_name || ' with class id ' || p_room_class_id ||'.');
    end if;

end;
/


--No room in hotel Novotel with class id 104.
begin
register_client('Artur', 'Kossakowski', 'ABC1234', 100, 'Novotel', 104, to_date('23/01/29', 'yy/mm/dd'), 'Naziemny', 'BLIK'); 
end;
/

--Invalid date error.
begin
register_client('Artur', 'Kossakowski', 'ABC1234', 100, 'Novotel', 103, to_date('23/01/26', 'yy/mm/dd'), 'Naziemny', 'BLIK'); 
end;
/

--There is no type of parking place with name: VIP
--ORA-06502: PL/SQL: błąd liczby lub wartości raised
begin
register_client('Artur', 'Kossakowski', 'ABC1234', 100, 'Novotel', 103, to_date('23/01/29', 'yy/mm/dd'), 'VIP', 'BLIK'); 
end;
/


--Succes
begin
register_client('Artur', 'Kossakowski', 'ABC1234', 100, 'Novotel', 103, to_date('23/01/29', 'yy/mm/dd'), 'Naziemny', 'BLIK'); 
end;
/
rollback;
