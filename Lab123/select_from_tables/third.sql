--3.	Создать запрос, в результате которого выводится № сче¬та клиента, имеющего кредит 50000 руб.
SELECT CUSTOMER.FIRST_NAME AS Имя, CUSTOMER.SECOND_NAME AS Имя, A2.ID AS "Номер счета"
FROM CUSTOMER
         JOIN LOAN L ON CUSTOMER.ID = L.ID_CUSTOMER
         JOIN ACCOUNT A2 ON L.ID_ACCOUNT = A2.ID
WHERE L.AMOUNT > 49000