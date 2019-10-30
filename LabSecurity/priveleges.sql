--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.

GRANT SELECT, INSERT ON C##DIMA.DEPARTMENT TO C##NEW_OFFICIAL;
GRANT SELECT, INSERT ON C##DIMA.ACCOUNT TO C##NEW_OFFICIAL;
GRANT SELECT, INSERT ON C##DIMA.LOAN TO C##NEW_OFFICIAL;


SELECT grantee, privilege, admin_option
FROM dba_sys_privs
WHERE grantee='C##NEW_CUSTOMER';

SELECT grantee, table_name, privilege
FROM dba_tab_privs
WHERE grantee='C##NEW_CUSTOMER';




