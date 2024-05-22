CREATE ROLE DBAdmin;

GRANT ALL PRIVILEGES ON banksystem TO DBAdmin;

CREATE USER 'AdminUser' IDENTIFIED BY 'password123';
GRANT DBAdmin TO 'AdminUser';

CREATE ROLE TableUser;

GRANT SELECT, INSERT, UPDATE ON Accounts TO TableUser;

CREATE USER 'AccountManager' IDENTIFIED BY 'pass456';
GRANT TableUser TO 'AccountManager';

CREATE ROLE ColumnUser;

GRANT SELECT(FirstName, LastName), UPDATE(Address) ON Clients TO ColumnUser;

CREATE USER 'ClientSupport' IDENTIFIED BY 'pass789';
GRANT ColumnUser TO 'ClientSupport';









