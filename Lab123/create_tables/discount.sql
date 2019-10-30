CREATE TABLE discount 
(
  id NUMBER NOT NULL 
, title VARCHAR2(50) NOT NULL 
, amount NUMBER DEFAULT 1 NOT NULL 
, CONSTRAINT discount_pk PRIMARY KEY 
  (
    id 
  )
  ENABLE 
);
