--1.Создайте пользователей и роли с разным рангом доступа.
--2.Создайте профиль с использованием функции верификации.
--3. Ролям назначить  объектные и системные привилегии.
--4. Назначить роли пользователям.
CREATE ROLE METODIST;
CREATE ROLE STUD_DATA;
CREATE ROLE KURS_RAB;

GRANT STUD_DATA,  KURS_RAB TO METODIST;

GRANT SELECT, INSERT, UPDATE ON STUDENT_DATA TO STUD_DATA;
GRANT SELECT, INSERT, UPDATE ON KURS_RABOTA TO KURS_RAB;

GRANT METODIST TO C##Second;
GRANT METODIST TO методист1;
GRANT METODIST TO методист3;


