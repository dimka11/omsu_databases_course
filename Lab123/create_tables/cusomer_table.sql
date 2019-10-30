CREATE TABLE customer 
(
  id NUMBER NOT NULL 
, second_name VARCHAR2(50) NOT NULL 
, first_name VARCHAR2(50) NOT NULL 
, middle_name VARCHAR2(50) NOT NULL 
, birthdate DATE NOT NULL 
, passport VARCHAR2(100) NOT NULL
, phone_number VARCHAR2(20) 
, id_discount NUMBER
, address VARCHAR(200) 
, CONSTRAINT customer_pk PRIMARY KEY 
  (
    id 
  )
, CONSTRAINT discount_fk FOREIGN KEY
(
    id_discount
) REFERENCES discount
(
    id
)
);