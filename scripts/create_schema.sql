--CREATE DATABASE [Hotel_reservation];
 
ALTER SESSION SET CURRENT_SCHEMA = Hotel_reservation;
 

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Addresses(
	Id Number(10)  NOT NULL,
	City Nvarchar2(50) NOT NULL,
	Postal_Code Nvarchar2(50) NOT NULL,
	House_Number Number(10) NOT NULL,
	Local_Number Number(10) NOT NULL,
	Street Nvarchar2(250) NOT NULL,
 CONSTRAINT PK_Addresses PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Addresses_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Addresses_seq_tr
 BEFORE INSERT ON Addresses FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Addresses_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Classes(
	Id Number(10)  NOT NULL,
	Price Number(5, 2) NOT NULL,
	Content_id Number(10) NOT NULL,
	Hotel_Id Number(10) NOT NULL,
 CONSTRAINT PK_Classes PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Classes_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Classes_seq_tr
 BEFORE INSERT ON Classes FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Classes_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Clients(
	Id Number(10)  NOT NULL,
	First_Name Nvarchar2(50) NOT NULL,
	Last_Name Nvarchar2(50) NOT NULL,
	Document_Number Nvarchar2(50) NOT NULL,
	Address_Id Number(10) NOT NULL,
	Registration_Id Number(10) NOT NULL,
 CONSTRAINT PK_Clients PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Clients_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Clients_seq_tr
 BEFORE INSERT ON Clients FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Clients_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Companies(
	Id Number(10)  NOT NULL,
	Name Nvarchar2(50) NOT NULL,
 CONSTRAINT PK_Companies PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Companies_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Companies_seq_tr
 BEFORE INSERT ON Companies FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Companies_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Contents(
	Id Number(10)  NOT NULL,
	Tv Number(1) NOT NULL,
	Toilet Number(1) NOT NULL,
	Kitchenette Number(1) NOT NULL,
 CONSTRAINT PK_Contents PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Contents_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Contents_seq_tr
 BEFORE INSERT ON Contents FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Contents_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Hotels(
	Id Number(10)  NOT NULL,
	Name Nvarchar2(50) NOT NULL,
	Address_Id Number(10) NOT NULL,
	Company_Id Number(10) NOT NULL,
 CONSTRAINT PK_Hotels PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Hotels_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Hotels_seq_tr
 BEFORE INSERT ON Hotels FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Hotels_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Parking_Places(
	Id Number(10)  NOT NULL,
	Sector Nvarchar2(3) NOT NULL,
	Place_Number Number(10) NOT NULL,
	Parking_Type_Id Number(10) NOT NULL,
	Hotel_Id Number(10) NOT NULL,
 CONSTRAINT PK_Parking_Places PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Parking_Places_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Parking_Places_seq_tr
 BEFORE INSERT ON Parking_Places FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Parking_Places_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Parking_Types(
	Id Number(10)  NOT NULL,
	Name Nvarchar2(50) NOT NULL,
 CONSTRAINT PK_Parking_Types PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Parking_Types_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Parking_Types_seq_tr
 BEFORE INSERT ON Parking_Types FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Parking_Types_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Payment_Methods(
	Id Number(10)  NOT NULL,
	Name Nvarchar2(50) NOT NULL,
 CONSTRAINT PK_Payment_Methods PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Payment_Methods_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Payment_Methods_seq_tr
 BEFORE INSERT ON Payment_Methods FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Payment_Methods_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Payments(
	Id Number(10) NOT NULL,
	Amount Number(18, 2) NOT NULL,
	Payment_Method_Id Number(10) NOT NULL,
 CONSTRAINT PK_Payments PRIMARY KEY
(
	Id
)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Registrations(
	Id Number(10)  NOT NULL,
	Start_Date date NOT NULL,
	End_Date date NOT NULL,
	Payment_Id Number(10) NOT NULL,
	Class_Id Number(10) NOT NULL,
	Parking_Place_Id Number(10) NOT NULL,
	Hotel_Id Number(10) NOT NULL,
 CONSTRAINT PK_Registrations PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Registrations_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Registrations_seq_tr
 BEFORE INSERT ON Registrations FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Registrations_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Rooms(
	Id Number(10)  NOT NULL,
	Place_number Number(10) NOT NULL,
	Class_Id Number(10) NOT NULL,
	Hotel_Id Number(10) NOT NULL,
 CONSTRAINT PK_Rooms PRIMARY KEY
(
	Id
)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Rooms_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Rooms_seq_tr
 BEFORE INSERT ON Rooms FOR EACH ROW
 WHEN (NEW.Id IS NULL)
BEGIN
 SELECT Rooms_seq.NEXTVAL INTO :NEW.Id FROM DUAL;
END;
/

ALTER TABLE Hotels  ADD CONSTRAINT FK_Hotels_Companies FOREIGN KEY(Company_Id)
REFERENCES Companies (Id);
 
--ALTER TABLE Hotels CHECK CONSTRAINT FK_Hotels_Companies;
 

ALTER TABLE Hotels  ADD CONSTRAINT FK_Hotels_Addresses FOREIGN KEY(Address_Id)
REFERENCES Addresses (Id);
 
--ALTER TABLE Hotels CHECK CONSTRAINT FK_Hotels_Addresses;
 

ALTER TABLE Rooms  ADD CONSTRAINT FK_Rooms_Classes FOREIGN KEY(Class_Id)
REFERENCES Classes (Id);
 
--ALTER TABLE Rooms CHECK CONSTRAINT FK_Rooms_Classes;
 

ALTER TABLE Rooms  ADD CONSTRAINT FK_Rooms_Hotels FOREIGN KEY(Hotel_Id)
REFERENCES Hotels (Id);
 
--ALTER TABLE Rooms CHECK CONSTRAINT FK_Rooms_Hotels;
 

ALTER TABLE Classes  ADD CONSTRAINT FK_Classes_Contents FOREIGN KEY(Content_Id)
REFERENCES Contents (Id);
 
--ALTER TABLE Classes CHECK CONSTRAINT FK_Classes_Contents;
 

ALTER TABLE Classes  ADD CONSTRAINT FK_Classes_Hotels FOREIGN KEY(Hotel_Id)
REFERENCES Hotels (Id);
 
--ALTER TABLE Classes CHECK CONSTRAINT FK_Classes_Hotels;
 

ALTER TABLE Parking_Places  ADD CONSTRAINT FK_Parkings_Hotels FOREIGN KEY(Hotel_Id)
REFERENCES Hotels (Id);
 
--ALTER TABLE Parking_Places CHECK CONSTRAINT FK_Parkings_Hotels;
 

ALTER TABLE Parking_Places  ADD CONSTRAINT FK_Parking_Types FOREIGN KEY(Parking_Type_Id)
REFERENCES Parking_Types (Id);
 
--ALTER TABLE Parking_Places CHECK CONSTRAINT FK_Parking_Types;
 

ALTER TABLE Payments  ADD CONSTRAINT FK_Payments_Methods FOREIGN KEY(Payment_Method_Id)
REFERENCES Payment_Methods (Id);
 
--ALTER TABLE Payments CHECK CONSTRAINT FK_Payments_Methods;
 

ALTER TABLE Clients  ADD CONSTRAINT FK_Clients_Registrations FOREIGN KEY(Registration_Id)
REFERENCES Registrations (Id);
 
--ALTER TABLE Clients CHECK CONSTRAINT FK_Clients_Registrations;
 

ALTER TABLE Clients  ADD CONSTRAINT FK_Clients_Addresses FOREIGN KEY(Address_Id)
REFERENCES Addresses (Id);
 
--ALTER TABLE Clients CHECK CONSTRAINT FK_Clients_Addresses;
 

ALTER TABLE Registrations  ADD CONSTRAINT FK_Registrations_Payments FOREIGN KEY(Payment_Id)
REFERENCES Payments (Id);
 
--ALTER TABLE Registrations CHECK CONSTRAINT FK_Registrations_Payments;
 

ALTER TABLE Registrations  ADD CONSTRAINT FK_Registrations_Classes FOREIGN KEY(Class_Id)
REFERENCES Classes (Id);
 
--ALTER TABLE Registrations CHECK CONSTRAINT FK_Registrations_Classes;
 

ALTER TABLE Registrations  ADD CONSTRAINT FK_Registrations_Parkings FOREIGN KEY(Parking_Place_Id)
REFERENCES Parking_Places (Id);
 
--ALTER TABLE Registrations CHECK CONSTRAINT FK_Registrations_Parkings;
 

ALTER TABLE Registrations  ADD CONSTRAINT FK_Registrations_Hotels FOREIGN KEY(Hotel_Id)
REFERENCES Hotels (Id);
 
--ALTER TABLE Registrations CHECK CONSTRAINT FK_Registrations_Hotels;
 

