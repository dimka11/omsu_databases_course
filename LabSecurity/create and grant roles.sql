--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
CREATE ROLE C##LIMITED;
CREATE ROLE C##UNLIMITED;

GRANT C##LIMITED TO C##NEW_CUSTOMER;
GRANT C##UNLIMITED TO C##NEW_OPERATOR;

GRANT SELECT, INSERT ON C##DIMA.OPERATION TO C##LIMITED ;
GRANT SELECT, INSERT, UPDATE ON C##DIMA.DEPARTMENT TO C##UNLIMITED;

