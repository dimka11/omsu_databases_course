CREATE OR REPLACE PROCEDURE VIEW_ACCOUNTS_ONLY IS
    a ACCOUNT.ID%TYPE;
    b CUSTOMER.SECOND_NAME%TYPE;
    c CUSTOMER.FIRST_NAME%TYPE;
    d ACCOUNT.DATE_OPEN%TYPE;
    e DEPARTMENT.TITLE%TYPE;
    CURSOR SEL_CURSOR IS
        SELECT ACCOUNT.ID,
               C2.SECOND_NAME,
               C2.FIRST_NAME,
               ACCOUNT.DATE_OPEN,
               D2.TITLE

        FROM ACCOUNT
                 JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
                 JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
        WHERE ACCOUNT.ID_CUSTOMER = (SELECT ID_USER
                                     FROM MATHUSER
                                     WHERE USER_NAME = (SELECT USER FROM DUAL));
BEGIN

    -- print records
     OPEN SEL_CURSOR;
    LOOP
        FETCH SEL_CURSOR INTO a,b,c,d,e;
        DBMS_OUTPUT.enable;
        EXIT WHEN SEL_CURSOR%NOTFOUND;
        DBMS_OUTPUT.put_line('счет:  ' || a || ' ' || b || ' ' || c || ' ' || d || ' ' || e);
    END LOOP;
    CLOSE SEL_CURSOR;


    -- insert records to another table

    INSERT INTO TABLE_VIEW_ACCOUNT (ID, SECOND_NAME, FIRST_NAME, DATE_OPEN, TITLE)
    SELECT ACCOUNT.ID,
           C2.SECOND_NAME,
           C2.FIRST_NAME,
           ACCOUNT.DATE_OPEN,
           D2.TITLE
               INTERVAL

    FROM ACCOUNT
             JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
             JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
    WHERE ACCOUNT.ID_CUSTOMER = (SELECT ID_USER
                                 FROM MATHUSER
                                 WHERE USER_NAME = (SELECT USER FROM DUAL));
    COMMIT;

    ----------------

END;
/