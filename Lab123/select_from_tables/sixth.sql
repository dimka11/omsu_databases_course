--6.  Получить данные о клиенте, который имеет максимальный счет.
SELECT * FROM (
SELECT DISTINCT
FIRST_VALUE(ID_CUSTOMER) OVER (ORDER BY b DESC) AS idc,
FIRST_VALUE(b) OVER (ORDER BY b DESC) AS blnc
FROM (
SELECT ID_CUSTOMER, MAX(balance) as b
FROM (
         SELECT ID_CUSTOMER, SUM(amount) as balance
         FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
                from OPERATION o )
               UNION ALL
               select id_account_receiver, amount_transfer
               from OPERATION o) o
                  JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
                  JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
         GROUP BY ID_CUSTOMER
         ORDER BY balance DESC) T
GROUP BY ID_CUSTOMER)
)
JOIN CUSTOMER ON idc = CUSTOMER.ID;


-- without first_value

SELECT *
FROM (
SELECT ID_CUSTOMER, MAX(balance) as b
FROM (
         SELECT ID_CUSTOMER, SUM(amount) as balance
         FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
                from OPERATION o )
               UNION ALL
               select id_account_receiver, amount_transfer
               from OPERATION o) o
                  JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
                  JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
         GROUP BY ID_CUSTOMER
         ORDER BY balance DESC) T
GROUP BY ID_CUSTOMER
)
JOIN CUSTOMER C1 ON ID_CUSTOMER = C1.ID
WHERE b = (
SELECT Max(b)
FROM
(
SELECT MAX(balance) as b
FROM (
         SELECT SUM(amount) as balance
         FROM ((select id_account_sender as ID_ACCOUNT, - amount_transfer as amount
                from OPERATION o)
               UNION ALL
               select id_account_receiver, amount_transfer
               from OPERATION o) o
                  JOIN ACCOUNT ON o.ID_ACCOUNT = ACCOUNT.ID
                  JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
         GROUP BY ID_CUSTOMER
         ORDER BY balance DESC) T
)
);



















-- partial
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