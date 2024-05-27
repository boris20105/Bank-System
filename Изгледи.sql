CREATE VIEW AccountSummary AS
SELECT 
  a.AccountID,
  c.FirstName,
  c.LastName,
  a.AccountType,
  a.Balance
FROM 
  Accounts a
JOIN 
  Clients c
ON 
  a.ClientID = c.ClientID;
  
  CREATE VIEW BranchAccounts AS
SELECT 
  b.BranchName,
  a.AccountID,
  a.AccountType,
  a.Balance
FROM 
  Branches b
JOIN 
  AccountBranches ab
ON 
  b.BranchID = ab.BranchID
JOIN 
  Accounts a
ON 
  ab.AccountID = a.AccountID;
  
  CREATE VIEW TransactionHistory AS
SELECT 
  t.TransactionID,
  a.AccountID,
  t.TransactionType,
  t.Amount,
  t.TransactionDate
FROM 
  Transactions t
JOIN 
  Accounts a
ON 
  t.AccountID = a.AccountID;