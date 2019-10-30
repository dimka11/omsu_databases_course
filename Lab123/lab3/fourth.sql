--CREATE SEQUENCE AVTO START WITH 1120 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER IDENT
BEFORE INSERT ON DEPARTMENT
FOR EACH ROW
DECLARE
BEGIN
SELECT AVTO.NEXTVAL
INTO :NEW.ID
FROM DUAL;
END IDENT;
