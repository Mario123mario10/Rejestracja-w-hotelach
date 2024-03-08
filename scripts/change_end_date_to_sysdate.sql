create or replace PROCEDURE change_end_date_to_sysdate(p_client_id clients.id%type)
as
v_end_date registrations.end_date%type;
v_registration_id registrations.id%type;
begin

    select end_date, id into v_end_date, v_registration_id from registrations where id = (select max(registration_id) from clients where id = p_client_id);
    if sysdate < v_end_date
    then
    update registrations set end_date = sysdate where id = v_registration_id;
    end if;


end;
/
--setting end_date of 'Artur kossakowski' to sysdate
begin
change_end_date_to_sysdate(25);
end;