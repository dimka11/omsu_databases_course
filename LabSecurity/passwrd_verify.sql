CREATE OR REPLACE FUNCTION PASWRD (username VARCHAR2, password VARCHAR2, old_password VARCHAR2)
RETURN BOOLEAN IS
BEGIN
IF regexp_like(password,'^.*[a-z].*$') AND regexp_like(password,'^.*[A-Z].*$') AND regexp_like(password,'^.*[0-9].*$') THEN
RETURN FALSE;
END IF;
RETURN TRUE;
END;