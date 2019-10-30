SET SERVEROUTPUT ON 
DECLARE
    a BOOK.AUTOR%TYPE;
    b BOOK.TITLE_OF_BOOK%TYPE;
    c BOOK.DATE_OF_PRINT%TYPE;
    d BOOK.ID_BOOK%TYPE;
    e BOOK.PRICE%TYPE;
CURSOR CURS IS
    SELECT AUTOR   "Autor", 
        TITLE_OF_BOOK   "Title",
        DATE_OF_PRINT    "Date", 
        ID_BOOK     "Id",
        PRICE    "Price"
    FROM BOOK
    WHERE DATE_OF_PRINT BETWEEN TO_DATE('1969','YYYY') AND TO_DATE('1980','YYYY');
BEGIN
    OPEN CURS;
    LOOP
        FETCH CURS INTO a,b,c,d,e;
        DBMS_OUTPUT.enable;
        DBMS_OUTPUT.put_line('КНИГИ НАПЕЧАТАННЫЕ В 70-Х ГОДАХ:'||a||' '||b||' '||c||' '||d||' '||e);
EXIT WHEN CURS%NOTFOUND; 
END LOOP;
CLOSE CURS;
END;
/