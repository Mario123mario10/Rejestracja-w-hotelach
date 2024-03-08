--ADDRESSES
INSERT INTO addresses (id, city, street, house_number, local_number, postal_code)
VALUES (100, 'Warszawa', 'Ludwika Wary?skiego', 12, 203, '00-631');
INSERT INTO addresses (id, city, street, house_number, local_number, postal_code)
VALUES (101, 'Warszawa', 'Zielona', 46, 3, '00-341');
INSERT INTO addresses (id, city, street, house_number, local_number, postal_code)
VALUES (102, 'Gda?sk', 'Zimna', 64, 93, '34-334');
INSERT INTO addresses (id, city, street, house_number, local_number, postal_code)
VALUES (103, 'Kraków', 'Abrahama', 13, 2, '02-323');
INSERT INTO addresses (id, city, street, house_number, local_number, postal_code)
VALUES (104, '?ód?', 'Fabryczna', 69, 43, '69-420');

commit;

--COMPANIES
INSERT INTO companies (id, name)
VALUES (100, 'Microsoft');
INSERT INTO companies (id, name)
VALUES (101, 'Google');
INSERT INTO companies (id, name)
VALUES (102, 'Apple');
INSERT INTO companies (id, name)
VALUES (103, 'CD-ProjektRed');

commit;

--CONTENTS
INSERT INTO contents (id, tv, toilet, kitchenette)
VALUES (100, 0, 1, 0);
INSERT INTO contents (id, tv, toilet, kitchenette)
VALUES (101, 1, 1, 0);
INSERT INTO contents (id, tv, toilet, kitchenette)
VALUES (102, 0, 1, 1);
INSERT INTO contents (id, tv, toilet, kitchenette)
VALUES (103, 1, 1, 1);

commit;

--HOTELS
INSERT INTO hotels (id, name, address_id, company_id)
VALUES (100, 'DS Riviera', 100, 100);
INSERT INTO hotels (id, name, address_id, company_id)
VALUES (101, 'Novotel', 101, 101);
INSERT INTO hotels (id, name, address_id, company_id)
VALUES (102, 'Starotel', 102, 101);
INSERT INTO hotels (id, name, address_id, company_id)
VALUES (103, 'Prestige', 103, 102);
INSERT INTO hotels (id, name, address_id, company_id)
VALUES (104, 'Fabryka', 104, 103);

commit;

--PARKING TYPES
INSERT INTO parking_types (id, name)
VALUES (100, 'Naziemny');
INSERT INTO parking_types (id, name)
VALUES (101, 'Podziemny');
INSERT INTO parking_types (id, name)
VALUES (102, 'VIP');

commit;

--PARKING_PLACES
INSERT INTO parking_places (id, sector, place_number, parking_type_id, hotel_id)
VALUES (100, '6B', 43, 100, 100);
INSERT INTO parking_places (id, sector, place_number, parking_type_id, hotel_id)
VALUES (101, '3A', 234, 101, 100);
INSERT INTO parking_places (id, sector, place_number, parking_type_id, hotel_id)
VALUES (102, '9D', 87, 100, 101);
INSERT INTO parking_places (id, sector, place_number, parking_type_id, hotel_id)
VALUES (103, '6V', 34, 102, 103);

commit;

--PAYMENT_METHODS
INSERT INTO payment_methods (id, name)
VALUES (100, 'Gotówka');
INSERT INTO payment_methods (id, name)
VALUES (101, 'Karta platnicza');
INSERT INTO payment_methods (id, name)
VALUES (102, 'BLIK');

commit;

--PAYMENTS
INSERT INTO payments (id, amount, payment_method_id)
VALUES (100, 230, 100);
INSERT INTO payments (id, amount, payment_method_id)
VALUES (101, 420, 102);
INSERT INTO payments (id, amount, payment_method_id)
VALUES (102, 69, 101);
INSERT INTO payments (id, amount, payment_method_id)
VALUES (103, 500, 100);
INSERT INTO payments (id, amount, payment_method_id)
VALUES (104, 232, 101);

commit;

--CLASSES (requires contents and hotels)
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (100, 65, 100, 100);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (101, 100, 101, 100);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (102, 200, 102, 100);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (103, 150, 101, 101);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (104, 300, 103, 101);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (105, 299, 103, 102);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (106, 95, 101, 103);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (107, 195, 102, 104);
INSERT INTO classes (id, price, content_id, hotel_id)
VALUES (108, 350, 103, 104);

commit;

--REGISTRATIONS
INSERT INTO registrations (id, start_date, end_date, payment_id, class_id, parking_place_id, hotel_id)
VALUES (100, '02-FEB-2000', '10-FEB-2000', 100, 100, 101, 100);
INSERT INTO registrations (id, start_date, end_date, payment_id, class_id, parking_place_id, hotel_id)
VALUES (101, '01-JAN-2010', '23-JAN-2011', 101, 101, 101, 101);
INSERT INTO registrations (id, start_date, end_date, payment_id, class_id, parking_place_id, hotel_id)
VALUES (102, '31-JAN-2016', '13-JUL-2016', 102, 103, 103, 102);
INSERT INTO registrations (id, start_date, end_date, payment_id, class_id, parking_place_id, hotel_id)
VALUES (103, '31-JAN-2016', '13-JUL-2016', 103, 105, 100, 102);
INSERT INTO registrations (id, start_date, end_date, payment_id, class_id, parking_place_id, hotel_id)
VALUES (104, '31-JAN-2016', '13-JUL-2016', 104, 105, 102, 104);

commit;

--ROOMS
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (100, 23, 101, 100);
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (101, 69, 100, 100);
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (102, 53, 103, 101);
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (103, 420, 105, 102);
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (104, 44, 106, 103);
INSERT INTO rooms (id, place_number, class_id, hotel_id)
VALUES (105, 78, 108, 104);

commit;

--CLIENTS
INSERT INTO clients (id, first_name, last_name, document_number, address_id, registration_id)
VALUES (100, 'Anton', 'Basan', '28343ZZ', 100, 100);
INSERT INTO clients (id, first_name, last_name, document_number, address_id, registration_id)
VALUES (101, 'Filip', 'Szyszko', '283W3FF', 102, 101);
INSERT INTO clients (id, first_name, last_name, document_number, address_id, registration_id)
VALUES (102, 'Mateusz', 'Czarnecki', 'R8543EZ', 103, 102);
INSERT INTO clients (id, first_name, last_name, document_number, address_id, registration_id)
VALUES (103, 'Sebastian', 'Bie?czycki', '5334DDZ', 100, 103);
INSERT INTO clients (id, first_name, last_name, document_number, address_id, registration_id)
VALUES (104, 'Patrick', 'Bateman', '5353GG', 104, 104);

commit;






