--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
CREATE PROFILE C##OPERATOR LIMIT
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LIFE_TIME 60
PASSWORD_REUSE_TIME 1800
PASSWORD_REUSE_MAX  1/1440
PASSWORD_GRACE_TIME 10
PASSWORD_VERIFY_FUNCTION password_verify;