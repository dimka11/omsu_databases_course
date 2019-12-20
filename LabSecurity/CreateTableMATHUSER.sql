-- auto-generated definition
create table MATHUSER
(
    ID        NUMBER       not null
        constraint MATHUSER_PK
            primary key,
    USER_NAME VARCHAR2(50) not null,
    ID_USER   NUMBER       not null
)
/


INSERT INTO C##DIMA.MATHUSER (ID, USER_NAME, ID_USER) VALUES (1, 'C##DIMA', 1);
INSERT INTO C##DIMA.MATHUSER (ID, USER_NAME, ID_USER) VALUES (2, 'C##NEW_OPERATOR', 2);
INSERT INTO C##DIMA.MATHUSER (ID, USER_NAME, ID_USER) VALUES (3, 'C##NEW_OFFICIAL', 3);


-- auto-generated definition
create table TABLE_VIEW_ACCOUNT
(
    ID          NUMBER,
    SECOND_NAME VARCHAR2(250),
    FIRST_NAME  VARCHAR2(250),
    DATE_OPEN   DATE,
    TITLE       VARCHAR2(250)
)
/
