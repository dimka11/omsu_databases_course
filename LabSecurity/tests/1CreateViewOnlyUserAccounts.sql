SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE
FROM ACCOUNT
         JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
WHERE ACCOUNT.ID_CUSTOMER = 2;

SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, SUM(amount) as balance
FROM ACCOUNT
         JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID,
     ((select id_account_sender as ID_ACC, - amount_transfer as amount
       from OPERATION o)
      UNION ALL
      select id_account_receiver, amount_transfer
      from OPERATION o)
WHERE ACCOUNT.ID_CUSTOMER = 2
GROUP BY ACCOUNT.ID, C2.SECOND_NAME, ACCOUNT.ID, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, ID_ACC;

-- view below
CREATE OR REPLACE VIEW view_accounts AS
    SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE
FROM ACCOUNT
         JOIN CUSTOMER C2 on ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
WHERE ACCOUNT.ID_CUSTOMER = 2
WITH READ ONLY;

-- use view
SELECT
  *
FROM C##DIMA.VIEW_ACCOUNTS;

--

SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, O2.AMOUNT_TRANSFER, O3.AMOUNT_TRANSFER
FROM ACCOUNT
         JOIN CUSTOMER C2 ON ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
                FULL JOIN OPERATION O2 on ACCOUNT.ID = O2.ID_ACCOUNT_RECEIVER
                    FULL JOIN OPERATION O3 on ACCOUNT.ID = O3.ID_ACCOUNT_SENDER
WHERE ACCOUNT.ID_CUSTOMER = 1 AND ACCOUNT.ID = 3;

----------

SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, SUM(O2.AMOUNT_TRANSFER), SUM(O3.AMOUNT_TRANSFER)
FROM ACCOUNT
         JOIN CUSTOMER C2 ON ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
                FULL JOIN OPERATION O2 on ACCOUNT.ID = O2.ID_ACCOUNT_RECEIVER
                    FULL JOIN OPERATION O3 on ACCOUNT.ID = O3.ID_ACCOUNT_SENDER
WHERE ACCOUNT.ID_CUSTOMER = 1 AND ACCOUNT.ID = 3
GROUP BY ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE

----------------

SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, (SUM(O2.AMOUNT_TRANSFER) - SUM(O3.AMOUNT_TRANSFER)) AS ACC_BALANCE
FROM ACCOUNT
         JOIN CUSTOMER C2 ON ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
                FULL JOIN OPERATION O2 on ACCOUNT.ID = O2.ID_ACCOUNT_RECEIVER
                    FULL JOIN OPERATION O3 on ACCOUNT.ID = O3.ID_ACCOUNT_SENDER
WHERE ACCOUNT.ID_CUSTOMER = 1 AND ACCOUNT.ID = 3
GROUP BY ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE


---------------------

SELECT ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE, (SUM(O2.AMOUNT_TRANSFER) - SUM(O3.AMOUNT_TRANSFER)) AS ACC_BALANCE
FROM ACCOUNT
         JOIN CUSTOMER C2 ON ACCOUNT.ID_CUSTOMER = C2.ID
            JOIN DEPARTMENT D2 ON ACCOUNT.ID_DEPARTMENT = D2.ID
                FULL JOIN OPERATION O2 on ACCOUNT.ID = O2.ID_ACCOUNT_RECEIVER
                    FULL JOIN OPERATION O3 on ACCOUNT.ID = O3.ID_ACCOUNT_SENDER
WHERE ACCOUNT.ID_CUSTOMER = 1
GROUP BY ACCOUNT.ID, C2.SECOND_NAME, C2.FIRST_NAME, ACCOUNT.DATE_OPEN, D2.TITLE
