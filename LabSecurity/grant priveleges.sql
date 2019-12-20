--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.

GRANT EXECUTE ON C##DIMA.deleteIfNoCreditOrBalanceIsNull TO C##NEW_OPERATOR;
GRANT EXECUTE ON C##DIMA.VIEW_ACCOUNTS_ONLY TO C##NEW_CUSTOMER;
GRANT SELECT ON C##DIMA.TABLE_VIEW_ACCOUNT TO C##NEW_CUSTOMER;





