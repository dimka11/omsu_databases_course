DECLARE
    a     CUSTOMER.FIRST_NAME%TYPE;
    b     CUSTOMER.SECOND_NAME%TYPE;
    c     CUSTOMER.MIDDLE_NAME%TYPE;
    d     CUSTOMER.ADDRESS%TYPE;
    e     DEPARTMENT.ADDRESS%TYPE;
    CURSOR CURS
        (SNAME CUSTOMER.SECOND_NAME %TYPE, DNAME DEPARTMENT.ADDRESS %TYPE)
        IS
--2.	Вывести список клиентов, у которых фамилия начина¬ется на С и относящихся к филиалу, расположенному по улице Нефтезаводская.

SELECT DISTINCT FIRST_NAME AS Имя, SECOND_NAME AS Фамилия, MIDDLE_NAME AS Отчество, CUSTOMER.ADDRESS AS Аддресс, DEPARTMENT.ADDRESS
FROM CUSTOMER
         JOIN ACCOUNT ON CUSTOMER.ID = ACCOUNT.ID_CUSTOMER
            JOIN DEPARTMENT ON ACCOUNT.ID_DEPARTMENT = DEPARTMENT.ID
WHERE UPPER(CUSTOMER.SECOND_NAME) LIKE SNAME||'%' AND UPPER(DEPARTMENT.ADDRESS) LIKE DNAME||'%';
BEGIN
    OPEN CURS('С', 'Н');
    LOOP
        FETCH CURS INTO a,b,c,d,e;
        DBMS_OUTPUT.enable;
        EXIT WHEN CURS%NOTFOUND;
        DBMS_OUTPUT.put_line('Клиент  :' || a || ' ' || b || ' ' || c || ' ' || d || ' ' || e);
    END LOOP;
    CLOSE CURS;
END;
/