create or replace function check_if_room_is_avaliable(p_hotel_id number, p_room_class_id number)
return boolean
as
CURSOR cr_reg IS SELECT * FROM registrations;
v_reg_row registrations%ROWTYPE;
v_number_used_rooms number := 0;
v_number_all_rooms number := 0;
v_free_rooms number := 0;
begin

begin
select place_number into v_number_all_rooms from rooms where hotel_id = p_hotel_id and class_id = p_room_class_id;
EXCEPTION
      WHEN NO_DATA_FOUND THEN
        return false;
end;


OPEN cr_reg;
LOOP
EXIT WHEN cr_reg%NOTFOUND;
FETCH cr_reg INTO v_reg_row;
if v_reg_row.hotel_id = p_hotel_id and v_reg_row.class_id = p_room_class_id and v_reg_row.end_date > sysdate 
then
v_number_used_rooms := v_number_used_rooms + 1;
end if;
END LOOP;
if v_number_all_rooms > v_number_used_rooms
then
return true;
end if;
exception
    when NO_DATA_FOUND THEN
    return true;

CLOSE cr_reg;

end;
/



-- is not avaliable
DECLARE

v_hotel_id NUMBER := 102;

v_class NUMBER := 106;

v_is_avaliable boolean;

BEGIN

v_is_avaliable := check_if_room_is_avaliable(v_hotel_id, v_class);

if v_is_avaliable then dbms_output.put_line('Is avaliable.');
else dbms_output.put_line('Is not avaliable.');
end if;

END;
/


--is avaliable
DECLARE

v_hotel_id NUMBER := 101;

v_class NUMBER := 103;

v_is_avaliable boolean;

BEGIN

v_is_avaliable := check_if_room_is_avaliable(v_hotel_id, v_class);

if v_is_avaliable then dbms_output.put_line('Is avaliable.');
else dbms_output.put_line('Is not avaliable.');
end if;

END;
/