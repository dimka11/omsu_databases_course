CREATE TABLE department 
(
  id NUMBER NOT NULL 
, title VARCHAR2(100) 
, address VARCHAR2(100) NOT NULL
, city VARCHAR2(50) 
, CONSTRAINT department_pk PRIMARY KEY 
  (
    id 
  )
  ENABLE 
);
