--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
CREATE OR REPLACE FUNCTION SYS.password_verify
(username VARCHAR2, password VARCHAR2, old_password VARCHAR2)
RETURN BOOLEAN IS
BEGIN
    IF length(password) < 8 THEN
        raise_application_error(-2000, 'password less than 12 characters');
    END IF;
    RETURN(TRUE);
END;
/