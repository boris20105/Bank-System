-- Before Insert Trigger
DELIMITER //
CREATE TRIGGER BeforeTransactionInsert
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
  IF NEW.Amount <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Сумата трябва да бъде положителна';
  END IF;

  IF NEW.TransactionType = 'Теглене' THEN
    IF (SELECT Balance FROM Accounts WHERE AccountID = NEW.AccountID) < NEW.Amount THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недостатъчен баланс за теглене';
    END IF;
  END IF;
END;
//
DELIMITER ;

-- After Insert Trigger
DELIMITER //
CREATE TRIGGER AfterTransactionInsert
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  IF NEW.TransactionType = 'Депозит' THEN
    UPDATE Accounts
    SET Balance = Balance + NEW.Amount
    WHERE AccountID = NEW.AccountID;
  ELSEIF NEW.TransactionType = 'Теглене' THEN
    UPDATE Accounts
    SET Balance = Balance - NEW.Amount
    WHERE AccountID = NEW.AccountID;
  END IF;
END;
//
DELIMITER ;

-- Before Update Trigger
DELIMITER //
CREATE TRIGGER BeforeAccountUpdate
BEFORE UPDATE ON Accounts
FOR EACH ROW
BEGIN
  IF NEW.Balance < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Балансът не може да бъде отрицателен';
  END IF;
END;
//
DELIMITER ;

-- After Update Trigger
DELIMITER //
CREATE TRIGGER AfterAccountUpdate
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
  INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
  VALUES (NEW.AccountID, 'Актуализация на баланс', NEW.Balance - OLD.Balance, CURDATE());
END;
//
DELIMITER ;



















