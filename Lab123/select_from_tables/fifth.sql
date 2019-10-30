--5.	Удалить данные о клиенте, у которого на счете 0 руб.

SELECT ID_ACCOUNT, SUM(amount) as balance
FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
       from OPERATION o)
      UNION ALL
      select id_account_receiver, amount_transfer
      from OPERATION o)
GROUP BY id_account
ORDER BY balance DESC;



SELECT O.ID_CUSTOMER, SUM(amount) as balance
FROM ((SELECT ID_ACCOUNT_SENDER as ID_ACCOUNT, - amount_transfer as amount, ID_CUSTOMER
       FROM OPERATION o)
      UNION ALL
      SELECT ID_ACCOUNT_RECEIVER, amount_transfer, ID_CUSTOMER
      FROM OPERATION o) O
GROUP BY ID_CUSTOMER
ORDER BY balance DESC;


SELECT ID_ACCOUNT, ID_CUSTOMER, SUM(amount) as balance
FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
       from OPERATION o)
      UNION ALL
      select id_account_receiver, amount_transfer
      from OPERATION o) o
        JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
            JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
GROUP BY ID_ACCOUNT, ID_CUSTOMER
ORDER BY balance DESC;


SELECT ID_CUSTOMER, SUM(amount) as balance
FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
       from OPERATION o)
      UNION ALL
      select id_account_receiver, amount_transfer
      from OPERATION o) o
        JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
            JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
GROUP BY ID_CUSTOMER
ORDER BY balance DESC;



DELETE(
SELECT ID_CUSTOMER, SUM(amount) as balance
FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
       from OPERATION o)
      UNION ALL
      select id_account_receiver, amount_transfer
      from OPERATION o) o
        JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
            JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
GROUP BY ID_CUSTOMER
ORDER BY balance DESC
    ) T
WHERE T.balance = 0