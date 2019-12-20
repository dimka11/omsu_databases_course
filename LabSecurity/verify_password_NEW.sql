
CREATE OR REPLACE FUNCTION VER_FUN (username varchar2, password varchar2, old_password varchar2)
RETURN BOOLEAN IS
BEGIN 
IF LENGTH(password) < 8 THEN
raise_application_error(-20000, 'Password less than 8 characters');
END IF;
IF NOT regexp_like(password, '^.*[a-z].*$|^.*[0-9].*$','c') THEN
raise_application_error(-20000, 'Password should contain at least 1 upper case, at least 1 lower case, at least 1 digit');
END IF;
IF NOT regexp_like(password, '^.*[A-Z].*$|^.*[0-9].*$','c') THEN
raise_application_error(-20000, 'Password should contain at least 1 upper case, at least 1 lower case, at least 1 digit');
END IF;
IF NOT regexp_like(password, '^.*[a-z].*$|^.*[A-Z].*$','c') THEN
raise_application_error(-20000, 'Password should contain at least 1 upper case, at least 1 lower case, at least 1 digit');
END IF;
FOR i IN 1..LENGTH(password)-2 LOOP
IF INSTR(LOWER(username),SUBSTR(LOWER(password),i,3)) > 0 THEN
raise_application_error(-20000, 'Password should doesnt contain consecutive letters of the user name');
END IF;
END LOOP;
RETURN (TRUE);
END;