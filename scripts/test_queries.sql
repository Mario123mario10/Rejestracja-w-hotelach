--clients payed with BLIK
SELECT c.* FROM clients c
    JOIN registrations r ON(c.registration_id = r.id)
    JOIN payments p ON(r.payment_id = p.id)
    JOIN payment_methods pm ON(p.payment_method_id = pm.id)
WHERE pm.name = 'BLIK';

--amount of rooms with tv in all hotels
SELECT COUNT(r.id) AS rooms_with_tv, h.name AS hotel 
FROM rooms r
    LEFT JOIN classes cl ON(r.class_id = cl.id)
    LEFT JOIN contents cn ON(cl.content_id = cn.id)
    LEFT JOIN hotels h ON(cl.hotel_id = h.id)
WHERE cn.tv = 1
GROUP BY h.name;

--company with most hotels
SELECT COUNT(h.id) AS hotels_count, c.name 
FROM hotels h
    RIGHT JOIN companies c ON(h.company_id = c.id)
GROUP BY c.name
FETCH FIRST 1 ROW ONLY;

--parking places and their types in hotels of Warsaw
SELECT h.name AS hotel, pp.id, pp.sector, pp.place_number, pt.name AS parking_type 
FROM parking_places pp
    JOIN parking_types pt ON(pp.parking_type_id = pt.id)
    JOIN hotels h ON(pp.hotel_id = h.id)
    JOIN addresses a ON(h.address_id = a.id)
WHERE a.city = 'Warszawa';

--check clients payments
SELECT 'Paid' AS status, cl.price - p.amount as rest, c.first_name, c.last_name 
FROM registrations r 
    JOIN payments p ON(r.payment_id = p.id)
    JOIN classes cl ON(r.class_id = cl.id)
    JOIN clients c ON(c.registration_id = r.id)
WHERE cl.price - p.amount >= 0
UNION ALL
SELECT 'Unpaid' AS status, p.amount - cl.price as rest, c.first_name, c.last_name 
FROM registrations r 
    JOIN payments p ON(r.payment_id = p.id)
    JOIN classes cl ON(r.class_id = cl.id)
    JOIN clients c ON(c.registration_id = r.id)
WHERE cl.price - p.amount < 0;






