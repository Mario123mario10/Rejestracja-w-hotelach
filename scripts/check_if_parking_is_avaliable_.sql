create or replace function check_if_parking_is_avaliable(p_hotel_id number, p_parking_id number)
return boolean
as
v_number_used_places number := 0;
v_number_all_places number := 0;
v_reg_park_row registrations%ROWTYPE;
CURSOR cr_reg_park IS SELECT * FROM registrations;
begin

begin

select place_number into v_number_all_places from parking_places where p_parking_id = id;
exception
    when NO_DATA_FOUND then
        return false;
        
end;

OPEN cr_reg_park;
LOOP
EXIT WHEN cr_reg_park%NOTFOUND;
FETCH cr_reg_park INTO v_reg_park_row;
if v_reg_park_row.hotel_id = p_hotel_id and p_parking_id = v_reg_park_row.parking_place_id and  v_reg_park_row.end_date > sysdate
then
v_number_used_places := v_number_used_places + 1;
end if;
END LOOP;

if v_number_all_places > v_number_used_places
then
return true;
else
return false;
end if;
exception
    when NO_DATA_FOUND then
        return true;

CLOSE cr_reg_park;

end;
/

--is avaliable
DECLARE

v_hotel_id NUMBER := 100;

v_parking_type_id NUMBER := 100;

v_is_avaliable boolean;

BEGIN

v_is_avaliable := check_if_parking_is_avaliable(v_hotel_id, v_parking_type_id);

if v_is_avaliable then dbms_output.put_line('Is avaliable.');
else dbms_output.put_line('Is not avaliable.');
end if;

END;
/

--is not avaliable
DECLARE

v_hotel_id NUMBER := 100;

v_parking_type_id NUMBER := 105;

v_is_avaliable boolean;

BEGIN

v_is_avaliable := check_if_parking_is_avaliable(v_hotel_id, v_parking_type_id);

if v_is_avaliable then dbms_output.put_line('Is avaliable.');
else dbms_output.put_line('Is not avaliable.');
end if;

END;
/