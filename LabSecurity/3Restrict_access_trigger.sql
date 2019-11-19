create or replace NONEDITIONABLE TRIGGER SYS.Restrict_user
AFTER LOGON
ON DATABASE
BEGIN
IF USER IN ('C##NEW_OPERATOR') THEN
     IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=american') IN ('SAT', 'SUN', 'TUE') THEN
        RAISE_APPLICATION_ERROR(-20000, 'Can not log in for this user in weekends, today is (' ||
TO_CHAR(SYSDATE, 'DAY') || ') try in another days');
END IF;
END IF;
END;