--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
CREATE USER C##NEW_CUSTOMER IDENTIFIED BY ZxcZxc123
DEFAULT TABLESPACE USERS PROFILE C##CUSTOMERS;


CREATE USER C##NEW_OPERATOR IDENTIFIED BY ZxcZxc123
DEFAULT TABLESPACE USERS PROFILE C##OPERATORS;