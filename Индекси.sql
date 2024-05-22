CREATE INDEX idx_account_type 
ON Accounts (AccountType);

CREATE INDEX idx_account_branch 
ON AccountBranches (AccountID, BranchID);

CREATE INDEX idx_branch_name_prefix 
ON Branches (BranchName(5));





















