CREATE OR REPLACE FUNCTION dd_pwd_fun(username varchar2, password varchar2)
RETURN BOOLEAN IS

PWD_STR VARCHAR2
USER_NAME

BEGIN

PWD_STR = password;
USER_NAME=username;

IF LENGTH(PWD_STR) < 8 THEN
RETURN FALSE;
END IF;

if regexp_like(:PWD_STR, '^.*[a-z].*$') -- this is for small letter from a -z
and regexp_like(:PWD_STR, '^.*[A-Z].*$') -- this is for capital letters
and regexp_like(:PWD_STR, '^.*[0-9].*$') -- this is for numbers