--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
GRANT CREATE ANY TABLE TO C##STUDENT;
REVOKE CREATE ANY TABLE FROM C##STUDENT;
GRANT SELECT, INSERT ON TEST TO C##STUDENT;
REVOKE INSERT ON TEST FROM C##STUDENT;

SELECT grantee, privilege, admin_option
FROM dba_sys_privs
WHERE grantee='C##DIMA';

SELECT grantee, table_name, privilege
FROM dba_tab_privs
WHERE grantee='C##DIMA';




