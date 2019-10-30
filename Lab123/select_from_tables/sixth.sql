--6.	Получить данные о клиенте, который имеет максимальный счет.
SELECT ID_CUSTOMER, MAX(balance) as b
FROM (
         SELECT ID_CUSTOMER, SUM(amount) as balance
         FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
                from OPERATION o)
               UNION ALL
               select id_account_receiver, amount_transfer
               from OPERATION o) o
                  JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
                  JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
         GROUP BY ID_CUSTOMER
         ORDER BY balance DESC) T
WHERE balance > 0
GROUP BY ID_CUSTOMER