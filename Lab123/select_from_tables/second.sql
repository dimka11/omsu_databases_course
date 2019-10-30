--2.	Вывести список клиентов, у которых фамилия начина¬ется на С и относящихся к филиалу, расположенному по улице Нефтезаводская.

SELECT DISTINCT FIRST_NAME AS Имя, SECOND_NAME AS Фамилия, MIDDLE_NAME AS Отчество, CUSTOMER.ADDRESS AS Аддресс, DEPARTMENT.ADDRESS
FROM CUSTOMER
         JOIN ACCOUNT ON CUSTOMER.ID = ACCOUNT.ID_CUSTOMER
            JOIN DEPARTMENT ON ACCOUNT.ID_DEPARTMENT = DEPARTMENT.ID
WHERE UPPER(CUSTOMER.SECOND_NAME) LIKE 'С%' AND UPPER(DEPARTMENT.ADDRESS) LIKE 'Н%'