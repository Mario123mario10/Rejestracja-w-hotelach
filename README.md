# BD1_z91
- Anton Basan
- Artur Łukaszewicz
- Mariusz Pakulski

# Projekt o temacie "Rejestracje w hotelach"

Projekt przedstawia bazę danych hotelu, która zawiera informacje dotyczące gości rezerwujących pobyt w hotelu, usług oferowanych przez hotel, dostępności pokoi, standardu pokoi, płatności oraz parkingu. Baza składa się z 12 tabel. 

_Schemat relacyjny bazy danych_

![alt text](ER_model.png?raw=true)

**Baza umożliwia dostęp do informacji:**
-	rezerwacje zaczynające się i kończące w zadanym okresie czasu
-	dane osobowe gości hotelu (imię, nazwisko, dowód osobisty i adres)
-	dostępności konkretnych pokoi w podanym okresie czasu
-	kwota do zapłaty za daną rezerwację z uwzględnieniem klasy standardu

**Założenia bazy:**
-	klienci mogą korzystać z pokoi w wybranym standardzie oraz parkingu
-	płatność dokonywana jest na koniec pobytu w hotelu

**Omówienie tabel**
1.  _Companies_ – tabela zawiera nazwy firm oferujących hotele
2.	_Hotels_ – tabela zawiera infromacje dotyczęce hoteli nazwa, adres oraz przynależność hotelu do firmy
3.	_Rooms_ – tabela zawiera informacje o rodzajach i numerach pokoi
4.	_Classes_ – tabela zawiera informacje standardach i cenie pokoi w danym standardzie
5.	_Contents_ – tabela zawiera informacje o udogodnieniach w ramach określonych klas standardów
6.	_Registrations_ – tabela zawiera daty początku i końca rezerwacji (które mogą być dokonywane z wyprzedzeniem), numer danej rezerwacji, płatność, klasa standardu, parking i hotel, w którym jest dana rezerwacja.
7.	_Payments_ – tabela zawiera informacje o kwocie do zapłaty za pobyt oraz rodzaj płatności
8.	_Payment_Methods_ – tabela zawiera informacje o sposobie płatności 
9.	_Clients_ – tabela zawiera dane osobowe gości rezerwujących swój pobyt w hotelu, rezerwację oraz adres
10.	_Parking_Places_ – tabela zawiera informacje dotyczące miejsca prakingowego sektor, numer miejsca typ i hotel
11.	_Parking_Types_ – tabela zawiera rodzaje miejsc parkingowych
12.	_Adresses_ – tabela zawiera informacje o adresach gości i hoteli miasto, kod pocztowy, ulica numer domu i lokalu

**Omówienie relacji**

_Hotels:_
-	Relacja wiele do jednego do tabeli Addresses za pomocą klucza obcego Address_Id – Różne hotele mogą mieć ten sam adres, ponieważ znane są kurorty, które zawierają wiele hoteli pod tym samym adresem.
-	Relacja wiele do jednego do tabeli Companies za pomocą klucza obcego Companies_Id – Różne hotele mogą być posiadane przez te same firmy.

_Rooms:_
-	Relacja wiele do jednego do tabeli Classes za pomocą klucza obcego Class_Id – Różne pokoje mogą mieć ten sam standard.
-	Relacja wiele do jednego do tabeli Hotels za pomocą klucza obcego Hotel_Id – różne pokoje mogą należeć do tego samego hotelu.

_Classes:_
-   Relacja wiele do jednego do tabeli Contents za pomocą klucza obcego Content_Id – różne standardy mogą mieć te same udogodnienia, ponieważ może zdarzyć się 
sytuacja, że w różnych hotelach oferowane są te same udogodnienia za inną cenę
-	Relacja wiele do jednego do tabeli Hotels za pomocą klucza obcego Hotel_Id – wiele standardów może występować w tym samym hotelu.

_Registrations:_
-	Relacja wiele do jednego do tabeli Payments za pomocą klucza obcego Payment_Id – Wiele rejestracji może być opłacona taką samą kwotą
-	Relacja wiele do jednego do tabeli Classes za pomocą klucza obcego Class_Id – Wiele rejestracji może być na ten sam standard.
-	Relacja wiele do jednego do tabeli Parking_Places za pomocą klucza obcego Parking_Place_Id – Wiele rejestracji może być na to samo miejsce parkingowe, ponieważ może się zdarzyć, że poprzednia osoba wynajmująca to miejsce parkingowe już się wyprowadziła.
-	Relacja wiele do jednego do tabeli Hotels za pomocą klucza obcego Hotel_Id- Wiele rejestracji może się odnosić do tego samego hotelu
-	Relacja wiele do jednego do tabeli Clients za pomocą klucza obcego Client_Id – Różni klienci mogą mieć tę samą rejestrację, ponieważ dokonali rejestracji na kilka osób.

_Payments:_
-	Relacja wiele do jednego do tabeli Payment_Methods za pomocą klucza obcego Payment_Method_Id – Wiele płatności może mieć tą samą metodę płatności

_Clients:_
-	Relacja wiele do jednego do tabeli Addresses za pomocą klucza obcego Address_Id – Wiele klientów może mieć ten sam adres zamieszkania, ponieważ ci klienci mogą mieszkać w tym samym miejscu.

_Parking_Places:_
-   Relacja wiele do jednego do tabeli Parking_Types za pomocą klucza obcego Parking_Type_Id – Wiele miejsc parkingowych może być tego samego rodzaju np.zadaszony, w garażu itd.
-	Relacja wiele do jednego do tabeli Parking_Types za pomocą klucza obcego Parking_Type_Id – Wiele miejsc parkingowych może być tego samego rodzaju np.zadaszony, w garażu itd.

**Skrypty ładujące i testujące**

Dla wypełnienia bazy danych został utworzony skrypt ładujący `data_insert.sql`, zawierający przykładowe dane. Żeby sprawdzić działanie bazy danych zostały utworzone skrypty testujące `test_quries.sql`.

Przy napisaniu szkryptów testujących zostały użyte różne typy złączeń, grupowanie i filtrowanie danych. Po uruchomieniu każdego z poleceń otrzymaliśmy oczekiwany poprawny wynik.


**Procedury, funkcje, kursory**

Funkcja `check_if_room_is_avaliable`, plik `check_if_room_is_avaliable.sql`:
-   funkcja sprawdza obecność wolnego pokoju danej klasy w wybranym hotelu
-   argumentami wywołania są id hotelu oraz klasa
-   zwraca fałsz albo prawdę zależnie od obecności wolnego pokoju
-   został wzięty pod uwagę przypadek, kiedy wszystkie pokoje są zajęte oraz przypadek, kiedy w danym hotelu nie ma pokoju danej klasy
-w danej funkcji został użyty kursor jawny `cr_reg` wczytujacy dane z tabeli `registrations`

Funkcja `check_if_parking_is_avaliable`, plik `check_if_parking_is_avaliable.sql`:
-   funkcja sprawdza obecność wolnego miejsca parkingowego w wybranym hotelu
-   argumentami wywołania są id hotelu oraz id miejsca parkingowego
-   zwraca fałsz albo prawdę zależnie od obecności wolnego miejsca parkingowego
-   został wzięty pod uwagę przypadek, kiedy wszystkie miejsca parkingowe są zajęte oraz przypadek, kiedy w danym hotelu nie ma miejsc parkingowych o wybranym typie
-   w danej funkcji został użyty kursor jawny cr_reg_park wczytujący dane z tabeli `registrations`

Procedura `register_client`, plik `register_client.sql`:
-   funkcja rejestruje klienta do wybranego hotelu, uwzględniając nazwę hotelu, klasę pokoju, datę wykwaterowania, typ miejsca parkingowego oraz metodę płatności
-   argumentami wywołania są imię klienta, nazwisko klienta, nr dokumentu tozsamości, adres klienta, nazwa hotelu, klasa pokoju, data wykwaterowania, nazwa typu miejsca parkingowego oraz nazwa typu metody płatności
-   zostały uwzględnione przypadki, kiedy podano złą nazwę hotelu, złą nazwę metody płatności, złą datę wykwaterowania się. Zostały wykorzystane funkcje `check_if_room_is_avaliable` oraz `check_if_parking_is_avaliable` do sprawdzenia poprawności danych.

Procedura `change_end_date_to_sysdate`, plik `change_end_date_to_sysdate.sql`:
-   zmienia datę wykwaterowania się na datę dzisiejszą. Odpowiada wczesnemu wykwaterowaniu się klienta.
-   argumentem wywołania jest id klienta
-   jest sprawdzana poprawność danych wejściowych
-   wartość end_date zostaje zmieniona w tabeli `registrations`

**W każdym z plików znajdują się skrypty testujące!**

