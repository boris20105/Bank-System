CREATE TABLE Clients (
  ClientID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Address VARCHAR(100)
);

INSERT INTO Clients (ClientID, FirstName, LastName, DateOfBirth, Address)
VALUES 
(1, 'Иван', 'Иванов', '1980-01-15', 'София, ул. Независимост 1'),
(2, 'Мария', 'Георгиева', '1992-03-25', 'София, ул. Свобода 2'),
(3, 'Петър', 'Петров', '1975-07-10', 'Пловдив, ул. Васил Левски 3');



CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  ClientID INT,
  AccountType VARCHAR(20),
  Balance DECIMAL(10, 2),
  FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Accounts (AccountID, ClientID, AccountType, Balance)
VALUES 
(1, 1, 'Спестовна', 1000.50),
(2, 2, 'Текуща', 500.75),
(3, 3, 'Спестовна', 1500.00);

CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  AccountID INT,
  TransactionType VARCHAR(20),
  Amount DECIMAL(10, 2),
  TransactionDate DATE,
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
VALUES 
(1, 1, 'Депозит', 500.00, '2023-05-01'),
(2, 2, 'Теглене', 200.00, '2023-05-02'),
(3, 3, 'Депозит', 300.00, '2023-05-03');

CREATE TABLE Branches (
  BranchID INT PRIMARY KEY,
  BranchName VARCHAR(50),
  Location VARCHAR(100)
);

INSERT INTO Branches (BranchID, BranchName, Location)
VALUES 
(1, 'Централен', 'София, ул. Независимост 1'),
(2, 'Клон Пловдив', 'Пловдив, ул. Васил Левски 3'),
(3, 'Клон Варна', 'Варна, ул. Тракия 4');

CREATE TABLE AccountBranches (
  AccountID INT,
  BranchID INT,
  PRIMARY KEY (AccountID, BranchID),
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
  FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

INSERT INTO AccountBranches (AccountID, BranchID)
VALUES 
(1, 1),
(2, 1),
(3, 2);