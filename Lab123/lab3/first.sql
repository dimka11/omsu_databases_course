DECLARE
    a CUSTOMER.FIRST_NAME%TYPE;
    b CUSTOMER.SECOND_NAME%TYPE;
    c CUSTOMER.MIDDLE_NAME%TYPE;
    d CUSTOMER.ADDRESS%TYPE;
    e CUSTOMER.BIRTHDATE%TYPE;
    CURSOR CURS IS
--1.	Выбрать ФИО, адрес клиента, не бравших кредит.
        SELECT DISTINCT FIRST_NAME AS Фамилия, SECOND_NAME AS Имя, MIDDLE_NAME AS Отчество, ADDRESS AS Аддресс, BIRTHDATE AS "Дата рождения"
        FROM CUSTOMER
                 LEFT JOIN LOAN L on CUSTOMER.ID = L.ID_CUSTOMER
        WHERE L.ID_CUSTOMER IS NULL;
BEGIN
    OPEN CURS;
    LOOP
        FETCH CURS INTO a,b,c,d,e;
        DBMS_OUTPUT.enable;
        EXIT WHEN CURS%NOTFOUND;
        DBMS_OUTPUT.put_line('Не брал кредит:  ' || a || ' ' || b || ' ' || c || ' ' || d || ' ' || e);
    END LOOP;
    CLOSE CURS;
END;
/