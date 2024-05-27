START TRANSACTION;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 1;

INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 'Депозит', 1000, CURDATE());

COMMIT;




















