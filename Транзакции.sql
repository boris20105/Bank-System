START TRANSACTION;

UPDATE Accounts
SET Balance = Balance + 100
WHERE AccountID = 1;

INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
VALUES (1, 'Депозит', 100, CURDATE());

COMMIT;




















